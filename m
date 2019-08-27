Return-Path: <SRS0=Pkj0=WX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:39317 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfH0JW3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 27 Aug 2019 05:22:29 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v2 01/10] media: dt-bindings: Document 'location' property
Date: Tue, 27 Aug 2019 11:23:27 +0200
Message-Id: <20190827092339.8858-2-jacopo@jmondi.org>
In-Reply-To: <20190827092339.8858-1-jacopo@jmondi.org>
References: <20190827092339.8858-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, tfiga@google.com, Rob Herring <robh+dt@kernel.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>, "open list:MEDIA INPUT INFRASTRUCTURE" <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

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
2.23.0
