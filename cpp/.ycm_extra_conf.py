import os
import ycm_core

# Directory where compile_commands.json is located.
compilation_database_folder = os.path.dirname(os.path.abspath(__file__))

# Extra flags to provide to clang, such as include paths.
extra_flags = ['-isystem', '/usr/include/c++/11/']
#extra_flags = []

def DirectoryOfThisScript():
    return os.path.dirname(os.path.abspath(__file__))

def MakeRelativePathsInFlagsAbsolute(flags, working_directory):
    if not working_directory:
        return list(flags)
    new_flags = []
    make_next_absolute = False
    path_flags = ['-isystem', '-I', '-iquote', '--sysroot=']
    for flag in flags:
        new_flag = flag

        if make_next_absolute:
            make_next_absolute = False
            if not flag.startswith('/'):
                new_flag = os.path.join(working_directory, flag)

        for path_flag in path_flags:
            if flag == path_flag:
                make_next_absolute = True
                break

            if flag.startswith(path_flag):
                path = flag[len(path_flag):]
                new_flag = path_flag + os.path.join(working_directory, path)
                break

        if new_flag:
            new_flags.append(new_flag)
    return new_flags

def FlagsForFile(filename):
    if compilation_database_folder:
        database = ycm_core.CompilationDatabase(compilation_database_folder)
        if database:
            compilation_info = database.GetCompilationInfoForFile(filename)
            if compilation_info.compiler_flags_:
                final_flags = MakeRelativePathsInFlagsAbsolute(
                    compilation_info.compiler_flags_,
                    compilation_info.compiler_working_dir_
                )
                final_flags = final_flags + extra_flags
                return {
                    'flags': final_flags,
                    'do_cache': True
                }

    return {
        'flags': extra_flags,  # Only extra flags, as no fallback is needed.
        'do_cache': True
    }

