{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 69.0, 69.0, 781.0, 636.0 ],
		"bglocked" : 0,
		"defrect" : [ 69.0, 69.0, 781.0, 636.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend /multislider1",
					"numoutlets" : 1,
					"id" : "obj-9",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"patching_rect" : [ 20.0, 374.0, 122.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "multislider",
					"numoutlets" : 2,
					"id" : "obj-166",
					"outlettype" : [ "", "" ],
					"size" : 128,
					"patching_rect" : [ 113.0, 10.0, 530.0, 333.0 ],
					"setstyle" : 1,
					"numinlets" : 1,
					"signed" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "listfunnel",
					"numoutlets" : 1,
					"id" : "obj-6",
					"outlettype" : [ "list" ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"patching_rect" : [ 18.0, 341.0, 58.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpsend 127.0.0.1 5321",
					"numoutlets" : 0,
					"id" : "obj-3",
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"patching_rect" : [ 23.0, 408.0, 140.0, 20.0 ],
					"numinlets" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-166", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
