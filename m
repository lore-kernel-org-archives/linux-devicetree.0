Return-Path: <SRS0=/Rvy=IZ=redhat.com=hdegoede@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 1/2] Input: touchscreen DT binding - add touchscreen-min-x and -min-y properties
Date: Thu,  7 Jun 2018 12:07:13 +0200
Message-Id: <20180607100714.9119-1-hdegoede@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Some touchscreens, depending on the firmware and/or the digitizer report
coordinates which never reach 0 along one or both of their axis.

This has been seen for example on the Silead touchscreens on a Onda V891w
and a Point of View mobii TAB-P800w(v2.0).

This commits documents 2 new touchscreen properties for communicating
the minimum reported values to the OS: touchscreen-min-x and -min-y.

This commit also drop the (in pixels) comment from the documentation
of the touchscreen-size-x and touchscreen-size-y properties. This comment
suggests that there is a relation between the range of reported
coordinates and the display resolution, which is only true for some
devices. The (in pixels) comment is replaced with "(maximum x coordinate
reported + 1)" to mirror the language describing the new touchscreen-min-x
and -min-y properties.

Cc: robh@kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Split out from the patch implementing support for the properties
-Describe the changes to the touchscreen-size-x / -size-y description in
 the commit message
---
 .../devicetree/bindings/input/touchscreen/touchscreen.txt   | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

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
-- 
2.17.1
