Return-Path: <SRS0=mp1p=XH=jmondi.org=jacopo@kernel.org>
From: Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v3 03/11] dt-bindings: video-interfaces: Expand rotation description
Date: Thu, 12 Sep 2019 22:10:47 +0200
Message-Id: <20190912201055.13964-4-jacopo@jmondi.org>
In-Reply-To: <20190912201055.13964-1-jacopo@jmondi.org>
References: <20190912201055.13964-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, tfiga@google.com, pavel@ucw.cz, Rob Herring <robh+dt@kernel.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>, "open list:MEDIA INPUT INFRASTRUCTURE V4L/DVB" <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Expand the 'rotation' property description to define the direction and
orientation of the axis around which the device mounting rotation is
expressed.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../devicetree/bindings/media/video-interfaces.txt        | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index e71b90a29d7a..8ab51e0bb63e 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -85,9 +85,11 @@ Optional properties

 - lens-focus: A phandle to the node of the focus lens controller.

-- rotation: The device, typically an image sensor, is not mounted upright,
-  but a number of degrees counter clockwise. Typical values are 0 and 180
-  (upside down).
+- rotation: The device, typically an image sensor, mounting rotation expressed
+  as counterclockwise rotation degrees along the axis perpendicular to
+  the device mounting surface directed away from it. Typical values are
+  0 degrees for upright mounted devices and 180 degrees for devices mounted
+  upside down.

 - location: The device, typically an image sensor or a flash LED, mounting
   location expressed as a position relative to the usage orientation of the
--
2.23.0
