#/bin/sh

# Generated protobuf/gRPC stubs
echo "Generating stubs from protobuf..."
SRC=../grpc-experiments-messages/proto
DST=lib/src/generated
if [ ! -d $DST ]; then
  mkdir -p $DST
fi

protoc --dart_out=grpc:lib/src/generated -I$SRC \
	$SRC/*.proto
