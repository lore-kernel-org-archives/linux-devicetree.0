Return-Path: <SRS0=TXGq=PL=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 4/5] dt-bindings: Input: edt-ft5x06 - add offset bindings for ft5726
Date: Thu,  3 Jan 2019 20:23:26 +0100
Message-Id: <20190103192327.6170-5-m.felsch@pengutronix.de>
In-Reply-To: <20190103192327.6170-1-m.felsch@pengutronix.de>
References: <20190103192327.6170-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-input@vger.kernel.org, hdegoede@redhat.com, simon.budig@kernelconcepts.de
List-ID: <devicetree@vger.kernel.org>

The evervision,ev-ft5726 devices has a more advanced offset support,
since they support setting the offset for the x and y position.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
index 179e434f5619..870b8c5cce9b 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
@@ -44,6 +44,15 @@ Optional properties:
 
  - offset:      allows setting the edge compensation in the range from
                 0 to 31.
+
+ - offset-x:    Same as offset, but applies only to the horizontal position.
+                Range from 0 to 80, only supported by evervision,ev-ft5726
+                devices.
+
+ - offset-y:    Same as offset, but applies only to the vertical position.
+                Range from 0 to 80, only supported by evervision,ev-ft5726
+                devices.
+
  - touchscreen-size-x	   : See touchscreen.txt
  - touchscreen-size-y	   : See touchscreen.txt
  - touchscreen-fuzz-x      : See touchscreen.txt
-- 
2.19.1
