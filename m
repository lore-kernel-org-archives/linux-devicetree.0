Return-Path: <SRS0=/nfp=IQ=redhat.com=hdegoede@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] Input: of_touchscreen / generic bindings - Add support for touchscreen-min-x|y
Date: Tue, 29 May 2018 13:52:38 +0200
Message-Id: <20180529115238.12965-1-hdegoede@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, robh@kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org, linux-input@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Some touchscreens, depending on the firmware and/or the digitizer report
coordinates which never reach 0 along one or both of their axis.

This has been seen for example on the Silead touchscreens on a Onda V891w
and a Point of View mobii TAB-P800w(v2.0).

This commit adds support for touchscreen-min-x and touchscreen-min-y
device-properties which can be set to communicate the actual start
coordinates (rather then 0,0) to userspace.

When set this fixes e.g. not being able to click things in the GNOME3
top-bar on the 2 example tablets.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../input/touchscreen/touchscreen.txt         |  6 ++--
 drivers/input/touchscreen/of_touchscreen.c    | 36 ++++++++++++++-----
 2 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
index 537643e86f61..8aff9551259f 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
@@ -1,10 +1,12 @@
 General Touchscreen Properties:
 
 Optional properties for Touchscreens:
+ - touchscreen-min-x		: minimum x coordinate reported (0 if not set)
+ - touchscreen-min-y		: minimum y coordinate reported (0 if not set)
  - touchscreen-size-x		: horizontal resolution of touchscreen
-				  (in pixels)
+				  (maximum x coordinate reported + 1)
  - touchscreen-size-y		: vertical resolution of touchscreen
-				  (in pixels)
+				  (maximum y coordinate reported + 1)
  - touchscreen-max-pressure	: maximum reported pressure (arbitrary range
 				  dependent on the controller)
  - touchscreen-fuzz-x		: horizontal noise value of the absolute input
diff --git a/drivers/input/touchscreen/of_touchscreen.c b/drivers/input/touchscreen/of_touchscreen.c
index 9642f103b726..6d241d45e312 100644
--- a/drivers/input/touchscreen/of_touchscreen.c
+++ b/drivers/input/touchscreen/of_touchscreen.c
@@ -35,7 +35,7 @@ static bool touchscreen_get_prop_u32(struct device *dev,
 
 static void touchscreen_set_params(struct input_dev *dev,
 				   unsigned long axis,
-				   int max, int fuzz)
+				   int min, int max, int fuzz)
 {
 	struct input_absinfo *absinfo;
 
@@ -47,6 +47,7 @@ static void touchscreen_set_params(struct input_dev *dev,
 	}
 
 	absinfo = &dev->absinfo[axis];
+	absinfo->minimum = min;
 	absinfo->maximum = max;
 	absinfo->fuzz = fuzz;
 }
@@ -68,8 +69,9 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 				  struct touchscreen_properties *prop)
 {
 	struct device *dev = input->dev.parent;
+	struct input_absinfo *absinfo;
 	unsigned int axis;
-	unsigned int maximum, fuzz;
+	unsigned int minimum, maximum, fuzz;
 	bool data_present;
 
 	input_alloc_absinfo(input);
@@ -77,7 +79,10 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 		return;
 
 	axis = multitouch ? ABS_MT_POSITION_X : ABS_X;
-	data_present = touchscreen_get_prop_u32(dev, "touchscreen-size-x",
+	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
+						input_abs_get_min(input, axis),
+						&minimum) |
+		       touchscreen_get_prop_u32(dev, "touchscreen-size-x",
 						input_abs_get_max(input,
 								  axis) + 1,
 						&maximum) |
@@ -85,10 +90,13 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 						input_abs_get_fuzz(input, axis),
 						&fuzz);
 	if (data_present)
-		touchscreen_set_params(input, axis, maximum - 1, fuzz);
+		touchscreen_set_params(input, axis, minimum, maximum - 1, fuzz);
 
 	axis = multitouch ? ABS_MT_POSITION_Y : ABS_Y;
-	data_present = touchscreen_get_prop_u32(dev, "touchscreen-size-y",
+	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
+						input_abs_get_min(input, axis),
+						&minimum) |
+		       touchscreen_get_prop_u32(dev, "touchscreen-size-y",
 						input_abs_get_max(input,
 								  axis) + 1,
 						&maximum) |
@@ -96,7 +104,7 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 						input_abs_get_fuzz(input, axis),
 						&fuzz);
 	if (data_present)
-		touchscreen_set_params(input, axis, maximum - 1, fuzz);
+		touchscreen_set_params(input, axis, minimum, maximum - 1, fuzz);
 
 	axis = multitouch ? ABS_MT_PRESSURE : ABS_PRESSURE;
 	data_present = touchscreen_get_prop_u32(dev,
@@ -108,7 +116,7 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 						input_abs_get_fuzz(input, axis),
 						&fuzz);
 	if (data_present)
-		touchscreen_set_params(input, axis, maximum, fuzz);
+		touchscreen_set_params(input, axis, 0, maximum, fuzz);
 
 	if (!prop)
 		return;
@@ -117,13 +125,25 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 
 	prop->max_x = input_abs_get_max(input, axis);
 	prop->max_y = input_abs_get_max(input, axis + 1);
+
 	prop->invert_x =
 		device_property_read_bool(dev, "touchscreen-inverted-x");
+	if (prop->invert_x) {
+		absinfo = &input->absinfo[axis];
+		absinfo->maximum -= absinfo->minimum;
+		absinfo->minimum = 0;
+	}
+
 	prop->invert_y =
 		device_property_read_bool(dev, "touchscreen-inverted-y");
+	if (prop->invert_y) {
+		absinfo = &input->absinfo[axis + 1];
+		absinfo->maximum -= absinfo->minimum;
+		absinfo->minimum = 0;
+	}
+
 	prop->swap_x_y =
 		device_property_read_bool(dev, "touchscreen-swapped-x-y");
-
 	if (prop->swap_x_y)
 		swap(input->absinfo[axis], input->absinfo[axis + 1]);
 }
-- 
2.17.0
