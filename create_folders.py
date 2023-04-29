import os
import sys

def create_directories(dirname, path):
    # Verify that the specified path exists
    if not os.path.exists(path):
        print("The specified path does not exist.")
        sys.exit(1)
    
    # Create the main directory
    full_path = os.path.join(path, dirname)
    os.mkdir(full_path)
    
    # Create the subdirectories
    subdirs = ['data', 'domain', 'presentation']
    for subdir in subdirs:
        os.mkdir(os.path.join(full_path, subdir))
        
    data_subdirs = ['datasource', 'models', 'repositories']
    for subdir in data_subdirs:
        os.mkdir(os.path.join(full_path, 'data', subdir))
        
    domain_subdirs = ['entities', 'repositories', 'usecases']
    for subdir in domain_subdirs:
        os.mkdir(os.path.join(full_path, 'domain', subdir))
        
    presentation_subdirs = ['cubit', 'screen', 'widget']
    for subdir in presentation_subdirs:
        os.mkdir(os.path.join(full_path, 'presentation', subdir))
    
    # Print the absolute path of the location where the directories were created
    print(os.path.abspath(full_path))


if __name__ == "__main__":
    # Parse command line arguments
    if len(sys.argv) != 3:
        print("Usage: python script.py <dirname> <path>")
        sys.exit(1)
    
    dirname = sys.argv[1]
    path = sys.argv[2]
    
    # Call the create_directories function
    create_directories(dirname, path)
