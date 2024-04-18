#/bin/sh

# Generated protobuf/gRPC stubs
sh ./generate_stubs.sh

# Build Linux executable
# Artifacts can be found in ./build/linux/x64/{debug,release}/client
flutter build linux

# Build Web app
# flutter build web

