/*
		com.roytanck.wpcumulus.Tag
		Copyright 2008: Roy Tanck 
		
		This file is part of WP-Cumulus.

    WP-Cumulus is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Foobar is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with WP-Cumulus.  If not, see <http://www.gnu.org/licenses/>.
*/

package com.roytanck.wpcumulus
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.display.Graphics;
	import flash.geom.ColorTransform;
	
	public class Tag extends Sprite {
		
		//private var _tf:TextField;
		private var _back:Sprite;
		private var _node:XML;
		private var _cx:Number;
		private var _cy:Number;
		private var _cz:Number;
		private var _color:Number;
		private var _hicolor:Number;
		private var _active:Boolean;
		private var _tf:TextField;
		
		public function Tag( node:XML, color:Number, hicolor:Number ){
			_node = node;
			_color = color;
			_hicolor = hicolor;
			_active = false;
			//this.blendMode = BlendMode.LIGHTEN;
			// create the text field
			_tf = new TextField();
			_tf.autoSize = TextFieldAutoSize.LEFT;
			_tf.selectable = false;
			// set styles
			var format:TextFormat = new TextFormat();
			format.font = "Arial";
			format.bold = true;
			format.color = color; //0xffffff;
			format.size = 2 * getNumberFromString( node["@style"] );
			_tf.defaultTextFormat = format;
			_tf.embedFonts = true;
			// set text
			_tf.text = node;
			addChild(_tf);
			// scale and add
			_tf.x = -this.width / 2;
			_tf.y = -this.height / 2;
			// create the back
			_back = new Sprite();
			_back.graphics.beginFill( _hicolor, 0 );
			_back.graphics.lineStyle( 0, _hicolor );
			_back.graphics.drawRect( 0, 0, _tf.textWidth+20, _tf.textHeight+5 );
			_back.graphics.endFill();
			addChildAt( _back, 0 );
			_back.x = -( _tf.textWidth/2 ) - 10;
			_back.y = -( _tf.textHeight/2 ) - 2;
			_back.visible = false;
			// events
			this.buttonMode = true;
			addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
		}
		
		private function mouseOverHandler( e:MouseEvent ):void {
			_back.visible = true;
			//this.transform.colorTransform.color = _hicolor;
			_tf.textColor = _hicolor;
			_active = true;
		}
		
		private function mouseOutHandler( e:MouseEvent ):void {
			_back.visible = false;
			//this.transform.colorTransform.color = _color;// = new ColorTransform( 1,1,1,1,0,0,0,0 );
			_tf.textColor = _color;
			_active = false;
		}
		
		private function mouseUpHandler( e:MouseEvent ):void {
			var request:URLRequest = new URLRequest( _node["@href"] );
			navigateToURL(request,"_self");
		}

		private function getNumberFromString( s:String ):Number {
			//return( Number( s.match( /(\d|\.|\,)/g ).join("") ) );
			return( Number( s.match( /(\d|\.|\,)/g ).join("").split(",").join(".") ) );
		}
		
		// setters and getters
		public function set cx( n:Number ){ _cx = n }
		public function get cx():Number { return _cx; }
		public function set cy( n:Number ){ _cy = n }
		public function get cy():Number { return _cy; }
		public function set cz( n:Number ){ _cz = n }
		public function get cz():Number { return _cz; }
		public function get active():Boolean { return _active; }

	}

}
