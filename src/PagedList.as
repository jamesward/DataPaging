/**
 * Created by IntelliJ IDEA.
 * User: jamesw
 * Date: Oct 9, 2010
 * Time: 3:49:34 AM
 * To change this template use File | Settings | File Templates.
 */
package
{
import flash.events.EventDispatcher;

import flash.utils.Dictionary;

import mx.collections.ArrayList;
import mx.collections.IList;
import mx.collections.ListCollectionView;
import mx.collections.errors.ItemPendingError;
import mx.events.CollectionEvent;

[Event(name="collectionChange", type="mx.events.CollectionEvent")]

public class PagedList extends EventDispatcher implements IList
{
  private var _length:int;

  private var _list:ArrayList;

  private var fetchedItems:Dictionary;

  public function PagedList()
  {
    fetchedItems = new Dictionary();
  }

  private function handleCollectionChangeEvent(event:CollectionEvent):void {
    dispatchEvent(event);
  }

  public function get length():int {
    return _length;
  }

  public function set length(_length:int):void {
    this._length = _length;

    _list = new ArrayList(new Array(_length));
    _list.addEventListener(CollectionEvent.COLLECTION_CHANGE, handleCollectionChangeEvent, false, 0, true);
  }

  public function addItem(item:Object):void {
    _list.addItem(item);
  }

  public function addItemAt(item:Object, index:int):void {
    _list.addItemAt(item, index);
  }

  public function getItemAt(index:int, prefetch:int = 0):Object {

    if (fetchedItems[index] == undefined)
    {
      throw new ItemPendingError("itemPending");
    }

    return _list.getItemAt(index, prefetch);
  }

  public function getItemIndex(item:Object):int {
    return _list.getItemIndex(item);
  }

  public function itemUpdated(item:Object, property:Object = null, oldValue:Object = null, newValue:Object = null):void {
    _list.itemUpdated(item, property, oldValue, newValue);
  }

  public function removeAll():void {
    _list.removeAll();
  }

  public function removeItemAt(index:int):Object {
    return _list.removeItemAt(index);
  }

  public function setItemAt(item:Object, index:int):Object {
    fetchedItems[index] = true;
    return _list.setItemAt(item, index);
  }

  public function toArray():Array {
    return _list.toArray();
  }
}
}