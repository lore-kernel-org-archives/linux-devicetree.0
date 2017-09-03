From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v7 13/18] dt: bindings: Add a binding for flash devices associated to a sensor
Date: Sun,  3 Sep 2017 20:49:53 +0300
Message-ID: <20170903174958.27058-14-sakari.ailus@linux.intel.com>
References: <20170903174958.27058-1-sakari.ailus@linux.intel.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170903174958.27058-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: niklas.soderlund@ragnatech.se, robh@kernel.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, pavel@ucw.cz, sre@kernel.org
List-Id: devicetree@vger.kernel.org

Camera flash drivers (and LEDs) are separate from the sensor devices in
DT. In order to make an association between the two, provide the
association information to the software.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/video-interfaces.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index 852041a7480c..fee73cf2a714 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -67,6 +67,14 @@ are required in a relevant parent node:
 		    identifier, should be 1.
  - #size-cells    : should be zero.
 
+
+Optional properties
+-------------------
+
+- flash: An array of phandles referring to the flash LED, a sub-node
+  of the LED driver device node.
+
+
 Optional endpoint properties
 ----------------------------
 
-- 
2.11.0
