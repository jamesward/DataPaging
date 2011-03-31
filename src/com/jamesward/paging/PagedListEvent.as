package com.jamesward.paging
{
	import flash.events.Event;
	
	public class PagedListEvent extends Event
	{
		public static const PAGE_NEEDED:String = "pageNeeded";
		
		public var pagePositionStart:uint;
		public var pagePositionEnd:uint;
		
		public function PagedListEvent(type:String, pagePositionStart:uint, pagePositionEnd:uint)
		{
			super(type, false, false);
			this.pagePositionStart = pagePositionStart;
			this.pagePositionEnd = pagePositionEnd;
		}
	}
}