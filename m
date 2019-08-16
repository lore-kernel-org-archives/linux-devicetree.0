From: Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 1/6] media: dt-bindings: Document 'location' property
Date: Fri, 16 Aug 2019 16:18:17 +0200
Message-ID: <20190816141822.7582-2-jacopo@jmondi.org>
References: <20190816141822.7582-1-jacopo@jmondi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190816141822.7582-1-jacopo@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>, "open list:MEDIA INPUT INFRASTRUCTURE
        V4L/DVB" <linux-media@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the 'location' device property, used to specify the camera device
mounting position. The property is particularly meaningful for mobile
devices with a well defined usage orientation.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../devicetree/bindings/media/video-interfaces.txt     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index f884ada0bffc..865f4142f432 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -89,6 +89,16 @@ Optional properties
   but a number of degrees counter clockwise. Typical values are 0 and 180
   (upside down).

+- location: The camera sensor mounting location, expressed as a position
+  relative to the usage orientation of the device the sensor is installed on.
+  Possible values are:
+  0 - Front. The image sensor is mounted on the front facing side of the device.
+  For mobile devices such as smartphones, tablets and laptops the front side is
+  the user facing side of the device.
+  1 - Back. The image sensor is mounted on the back side of the device, which is
+  defined as the opposite side of the front facing one.
+  2 - External. The image sensor is connected to the device by extension cables,
+  and can be freely moved, regardless of the device position.

 Optional endpoint properties
 ----------------------------
--
2.22.0
