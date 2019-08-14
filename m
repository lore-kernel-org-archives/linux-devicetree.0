From: Jacopo Mondi <jacopo@jmondi.org>
Subject: [RFC 1/5] media: dt-bindings: Document 'location' property
Date: Wed, 14 Aug 2019 22:28:11 +0200
Message-ID: <20190814202815.32491-2-jacopo@jmondi.org>
References: <20190814202815.32491-1-jacopo@jmondi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814202815.32491-1-jacopo@jmondi.org>
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
 Documentation/devicetree/bindings/media/video-interfaces.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index f884ada0bffc..819077b2649c 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -89,6 +89,10 @@ Optional properties
   but a number of degrees counter clockwise. Typical values are 0 and 180
   (upside down).

+- location: The camera device mounting position, relative to the device
+  usage orientation. Possible values are:
+  0 - Front camera. The image sensor is mounted on the front side of the device.
+  1 - Back camera. The image sensor is mounted on the back side of the device.

 Optional endpoint properties
 ----------------------------
--
2.22.0
