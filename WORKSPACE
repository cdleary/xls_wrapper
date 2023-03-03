workspace(name = "xls_wrapper")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "com_grail_bazel_toolchain",
    sha256 = "dd03374af7885d255eb735b9065a32463a1154d9de6eb47261a49c8acc1cd497",
    strip_prefix = "bazel-toolchain-0.6.3",
    urls = [
        "https://github.com/grailbio/bazel-toolchain/archive/0.6.3.zip",
    ],
)

load("@com_grail_bazel_toolchain//toolchain:deps.bzl", "bazel_toolchain_dependencies")

bazel_toolchain_dependencies()

load("@com_grail_bazel_toolchain//toolchain:rules.bzl", "llvm_toolchain")

llvm_toolchain(
    name = "llvm_toolchain",
    llvm_version = "13.0.0",
)

load("@llvm_toolchain//:toolchains.bzl", "llvm_register_toolchains")

llvm_register_toolchains()

http_archive(
    name = "com_google_xls",
    strip_prefix = "xls-3dcb8823fd4fb12456dea2734971955f0094117c",
    sha256 = "fc1f46142699af85e8188748cbe44817b88eed5f5178ba16968b1262d4a2ba20",
    urls = [
        "https://github.com/google/xls/archive/3dcb8823fd4fb12456dea2734971955f0094117c.zip",
    ],
)

load("@com_google_xls//dependency_support:load_external.bzl", "load_external_repositories")

load_external_repositories()

# We have to configure Python before gRPC tries to configure it a different
# way.
load("@pybind11_bazel//:python_configure.bzl", "python_configure")
python_configure(name = "local_config_python", python_version="3")

# gRPC deps should be loaded before initializing other repos. Otherwise, various
# errors occur during repo loading and initialization.
load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

grpc_deps()

load("@com_google_xls//dependency_support:initialize_external.bzl", "initialize_external_repositories")

initialize_external_repositories()

# Loading the extra deps must be called after initialize_eternal_repositories or
# the call to pip_install fails.
load("@com_github_grpc_grpc//bazel:grpc_extra_deps.bzl", "grpc_extra_deps")

grpc_extra_deps()

