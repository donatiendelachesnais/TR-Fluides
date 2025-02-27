import re
import logging
import math
import subprocess
import gmsh

# Angle of rotation in degrees
theta = 15
# Convert theta to radians
theta = math.radians(theta)

# Configure logging
logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')


## Calcul des coordonnées des axes du repère
def rotate_around_z(coords, theta):
    
    # Rotation matrix around z-axis
    rotation_matrix = [
        [math.cos(theta), -math.sin(theta), 0],
        [math.sin(theta), math.cos(theta), 0],
        [0, 0, 1]
    ]
    
    # Apply rotation
    rotated_coords = []
    for coord in coords:
        x, y, z = coord
        x_new = rotation_matrix[0][0] * x + rotation_matrix[0][1] * y
        y_new = rotation_matrix[1][0] * x + rotation_matrix[1][1] * y
        z_new = z  # z-coordinate remains the same
        rotated_coords.append((x_new, y_new, z_new))
    
    return rotated_coords

# Original coordinates
coords = [(1, 0, 0), (0, 1, 0), (0, 0, 1)]

# Conversion des coordonnées en chaine de caractères
def coords_to_string(coords):
    return ' '.join(f'{x:.3f} {y:.3f} {z:.3f}' for x, y, z in coords)


## Modification du fichier GeometresE.mtc
def modify_axe_values(file_path, new_value):
    logging.debug(f"Opening file: {file_path}")
    with open(file_path, 'r') as file:
        lines = file.readlines()

    logging.debug("File read successfully. Processing lines...")
    with open(file_path, 'w') as file:
        for line in lines:
            if 'DefinitionP5=' in line:
                index = lines.index(line)
                logging.debug(f"'DefinitionP5=' found at line {index}")
                if index + 7 < len(lines):
                    logging.debug(f"Modifying line {index + 7}")
                    logging.debug(f"Original line: {lines[index + 7].strip()}")
                    logging.debug(f"Nouvelles coordonnées de l'axe: {new_value}")
                    lines[index + 7] = re.sub(r'Axe= [\d\.\- ]+', f'Axe= {new_value}', lines[index + 7])
                    logging.debug(f"Modified line: {lines[index + 7].strip()}")
            file.write(line)
    logging.debug("File written successfully.")

## Modification du fichier VitesseRotation.mtc
def modify_theta(file_path, new_value):
    new_value = f'{new_value:.3f}'
    logging.debug(f"Opening file: {file_path}")
    with open(file_path, 'r') as file:
        lines = file.readlines()

    logging.debug("File read successfully. Processing lines...")
    with open(file_path, 'w') as file:
        for line in lines:
            if 'Nom= theta' in line:
                index = lines.index(line)
                logging.debug(f"'Nom= theta' found at line {index}")
                if index + 1 < len(lines):
                    logging.debug(f"Modifying line {index + 1}")
                    logging.debug(f"Original line: {lines[index + 1].strip()}")
                    logging.debug(f"Nouvelle valeur de theta: {new_value}")
                    lines[index + 1] = re.sub(r'ValeurItem 1 [\d\.\- ]+', f'ValeurItem 1 {new_value}', lines[index + 1])
                    logging.debug(f"Modified line: {lines[index + 1].strip()}")
            file.write(line)
    logging.debug("File written successfully.")


## Modification des fichiers .geo
def modify_geo(file_path, new_value):
    logging.debug(f"Opening file: {file_path}")
    with open(file_path, 'r') as file:
        lines = file.readlines()

    logging.debug("File read successfully. Processing geo lines...")
    with open(file_path, 'w') as file:
        for line in lines:
            if 'theta=' in line:
                index = lines.index(line)
                logging.debug(f"'theta=' found at line {index}")
                logging.debug(f"Modifying line {index}")
                logging.debug(f"Original line: {line.strip()}")
                logging.debug(f"Nouvelle valeur de theta: {new_value}")
                line = re.sub(r'theta=[\d\.\- ]+;', f'theta={new_value};', line)
                logging.debug(f"Modified line: {line.strip()}")
            file.write(line)
    logging.debug("File written successfully.")

## Mesh des fichiers .geo
def mesh_geo_file(geo_file, dimension=3):
    logging.debug(f"Meshing file: {geo_file}")
    gmsh.initialize()
    gmsh.open(geo_file)
    gmsh.model.mesh.generate(dimension)
    meshed_file = geo_file.replace(".geo", ".msh")
    gmsh.write(meshed_file)
    gmsh.finalize()
    subprocess.run(["python", "gmsh4mtc.py", meshed_file])
    logging.debug(f"Meshing completed for file: {geo_file}")
    return meshed_file




# Conversion des coordonnées en chaine de caractères pour le fichier DragLift.mtc
def select_coords_to_string(vecteur, coords):
    index = {'x': 0, 'y': 1, 'z': 2}[vecteur]
    return ' '.join(f'{coord[index]:.3f}' for coord in coords)

## Modification du fichier DragLift.mtc
def modify_DragLift(file_path, new_value):
    logging.debug(f"Opening file: {file_path}")
    with open(file_path, 'r') as file:
        lines = file.readlines()

    logging.debug("File read successfully. Processing DragLift lines...")
    with open(file_path, 'w') as file:
        for index, line in enumerate(lines):
            match = re.search(r'Nom= e(\w)Vecteur', line)
            if match:
                char_value = match.group(1)
                logging.debug(f"Found 'Nom= e{char_value}Vecteur' at line {index}")                    
                logging.debug(f"Nouvelles coordonnées de l'axe: {new_value}")
                line = re.sub(r'Data= ValeurItem 3 [\d\.\- ]+', f'Data= ValeurItem 3 {select_coords_to_string(char_value,new_value)}', line)
            file.write(line)
    logging.debug("File written successfully.")





if __name__ == "__main__":
    Geometre_file_path = './Geometrie/GeometresE.mtc'
    geo_file_path1 = './CFDBench.geo'
    geo_file_path2 = './Cylindre.geo'
    DL_file_path = './DragLift/DragLift.mtc'
    VR_file_path = './Solveur/VitesseRotation.mtc'
    
    # Rotate coordinates
    rotated_coords = rotate_around_z(coords, theta)
    print(f"Rotated coordinates: {coords_to_string(rotated_coords)}")

    new_value = coords_to_string(rotated_coords)
    modify_axe_values(Geometre_file_path, new_value)
    modify_theta(VR_file_path, theta)
    modify_geo(geo_file_path1, theta)
    modify_geo(geo_file_path2, theta)
    modify_DragLift(DL_file_path, rotated_coords)             # A priori, Badalamenti calcule les forces dans le référentiel du vent apparent (cf. Garett)

    # Mesh and convert the .geo files
    # mesh_geo_file(geo_file_path1)
    # mesh_geo_file(geo_file_path2)