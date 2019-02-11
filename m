Return-Path: <SRS0=0E4C=QS=sigxcpu.org=agx@kernel.org>
Date: Mon, 11 Feb 2019 11:43:50 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: [PATCH] dt-bindings: input: Refer to touchscreen.txt for goodix ts
Message-ID: <20190211104350.GA1330@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, Bastien Nocera <hadess@hadess.net>
List-ID: <devicetree@vger.kernel.org>

Refer to touchscreen.txt for generic touch properties. This avoids
duplication and we're using the generic code to parse these in the
driver. While at that add touchscreen-size-{x,y} which are respected by
the driver as well.

Signed-off-by: Guido G�nther <agx@sigxcpu.org>
---
 .../bindings/input/touchscreen/goodix.txt           | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.txt b/Documentation/devicetree/bindings/input/touchscreen/goodix.txt
index f7e95c52f3c7..bc7796b98a00 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.txt
@@ -18,11 +18,14 @@ Optional properties:
  - irq-gpios		: GPIO pin used for IRQ. The driver uses the
 			  interrupt gpio pin as output to reset the device.
  - reset-gpios		: GPIO pin used for reset
-
- - touchscreen-inverted-x  : X axis is inverted (boolean)
- - touchscreen-inverted-y  : Y axis is inverted (boolean)
- - touchscreen-swapped-x-y : X and Y axis are swapped (boolean)
-                             (swapping is done after inverting the axis)
+ - touchscreen-inverted-x
+ - touchscreen-inverted-y
+ - touchscreen-size-x
+ - touchscreen-size-y
+ - touchscreen-swapped-x-y
+
+The touchscreen-* properties are documented in
+Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
 
 Example:
 
-- 
2.20.1
