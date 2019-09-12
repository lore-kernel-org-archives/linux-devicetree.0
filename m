Return-Path: <SRS0=mp1p=XH=jmondi.org=jacopo@kernel.org>
From: Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v3 01/11] dt-bindings: video-interfaces: Document 'location' property
Date: Thu, 12 Sep 2019 22:10:45 +0200
Message-Id: <20190912201055.13964-2-jacopo@jmondi.org>
In-Reply-To: <20190912201055.13964-1-jacopo@jmondi.org>
References: <20190912201055.13964-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, tfiga@google.com, pavel@ucw.cz, Rob Herring <robh+dt@kernel.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>, "open list:MEDIA INPUT INFRASTRUCTURE V4L/DVB" <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add the 'location' device property, used to specify a device mounting
position. The property is particularly meaningful for mobile devices
with a well defined usage orientation.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../devicetree/bindings/media/video-interfaces.txt    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index f884ada0bffc..e71b90a29d7a 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -89,6 +89,17 @@ Optional properties
   but a number of degrees counter clockwise. Typical values are 0 and 180
   (upside down).

+- location: The device, typically an image sensor or a flash LED, mounting
+  location expressed as a position relative to the usage orientation of the
+  system where the device is installed on.
+  Possible values are:
+  0 - Front. The device is mounted on the front facing side of the system For
+  mobile devices such as smartphones, tablets and laptops the front side is the
+  user facing side.
+  1 - Back. The device is mounted on the back side of the system, which is
+  defined as the opposite side of the front facing one.
+  2 - External. The device is not attached directly to the system, or is
+  attached in a way that allows it to move freely.

 Optional endpoint properties
 ----------------------------
--
2.23.0
