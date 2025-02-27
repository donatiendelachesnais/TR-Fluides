import gmsh
import subprocess

# Define the path to the .geo file
domain_geo_file = "CFDBench.geo"
object_geo_file = "Cylindre.geo"

# Function to mesh the .geo file using gmsh library
def mesh_geo_file_with_gmsh(geo_file):
    gmsh.initialize()
    gmsh.open(geo_file)
    gmsh.model.mesh.generate(3)
    meshed_file = geo_file.replace(".geo", ".msh")
    gmsh.write(meshed_file)
    gmsh.finalize()
    return meshed_file

if __name__ == "__main__":
    # Mesh the .geo file using gmsh library
    meshed_domain = mesh_geo_file_with_gmsh(domain_geo_file)
    meshed_object = mesh_geo_file_with_gmsh(object_geo_file)

    # Run the gmsh4mtc.py script with the meshed file
    subprocess.run(["python", "gmsh4mtc.py", meshed_domain])
    subprocess.run(["python", "gmsh4mtc.py", meshed_object])
