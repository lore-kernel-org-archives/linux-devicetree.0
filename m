From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [RFC 3/3] dt: bindings: Add a binding for referencing EEPROM from camera sensors
Date: Tue,  2 May 2017 13:25:49 +0300
Message-ID: <1493720749-31509-4-git-send-email-sakari.ailus@linux.intel.com>
References: <1493720749-31509-1-git-send-email-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493720749-31509-1-git-send-email-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: pavel-+ZI9xUNit7I@public.gmane.org
List-Id: devicetree@vger.kernel.org

Many camera sensor devices contain EEPROM chips that describe the
properties of a given unit --- the data is specific to a given unit can
thus is not stored e.g. in user space or the driver.

Some sensors embed the EEPROM chip and it can be accessed through the
sensor's I²C interface. This property is to be used for devices where the
EEPROM chip is accessed through a different I²C address than the sensor.

The intent is to later provide this information to the user space.

Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 Documentation/devicetree/bindings/media/video-interfaces.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index e52aefc..9bd2005 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -80,6 +80,9 @@ Optional properties
 - lens-focus: A phandle to the node of the lens. Only valid for device
   nodes that are related to an image sensor.
 
+- eeprom: A phandle to the node of the related EEPROM. Only valid for
+  device nodes that are related to an image sensor.
+
 
 Optional endpoint properties
 ----------------------------
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
