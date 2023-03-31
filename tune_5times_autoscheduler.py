import os
import shutil

# The command to run
command = 'python3 tune_autoscheduler.py --network all --target "cuda -model=2080ti"'

# Run the command 5 times
for i in range(1, 6):
    print(f'Run number: {i}')
    
    # Run the command
    os.system(command)
    
    # Check if tmp_logs exists
    if os.path.exists('tmp_logs'):
        # Create the digit folder
        digit_folder = f'./tmp_logs/{i}'
        if not os.path.exists(digit_folder):
            os.makedirs(digit_folder)

        # Move the autoscheduler folder
        src = 'tmp_logs/autoscheduler'
        dst = f'tmp_logs/{i}/autoscheduler'
        if os.path.exists(src):
            shutil.move(src, dst)
        else:
            print(f'Warning: {src} not found.')
    else:
        print('Warning: tmp_logs not found.')
