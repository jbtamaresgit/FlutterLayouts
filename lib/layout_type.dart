enum LayoutType{
  rowColumn,
  gridView,
  listView,
  stackView
}

String layoutName(LayoutType layoutType){
  switch(layoutType){
    case LayoutType.rowColumn:
      return 'Row & Column';
    case LayoutType.gridView:
      return 'Grid';
    case LayoutType.listView:
      return 'List';
    case LayoutType.stackView:
      return 'Stack';
    default:
      return '';

  }
}