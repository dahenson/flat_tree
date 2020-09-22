# FlatTree for Vala

A collection of functions to map a binary tree to an array.

## Usage

You can represent a binary tree in a flat array using the following structure:
```
      3
    /   \
  1       5
 / \     / \
0   2   4   6  ...
```
Where the numbers represent the index of an array or list. This library collects
the functions necessary to calculate and maintain the structure of a flat list
representing a binary tree.

## Building

```
meson build --prefix=/usr
ninja -C build
```

## Testing
After building you can run the tests:
```
ninja -C build test
```

## Documentation
You can also build the documentation with valadoc:
```
ninja -C build valadoc
```
Then point your browser to `PROJECT_DIR/build/valadoc/index.html`

## Installing
```
sudo ninja -C build install
```
