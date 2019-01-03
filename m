Return-Path: <SRS0=TXGq=PL=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 1/5] dt-bindings: Input: edt-ft5x06 - add support for FT5726
Date: Thu,  3 Jan 2019 20:23:23 +0100
Message-Id: <20190103192327.6170-2-m.felsch@pengutronix.de>
In-Reply-To: <20190103192327.6170-1-m.felsch@pengutronix.de>
References: <20190103192327.6170-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-input@vger.kernel.org, hdegoede@redhat.com, simon.budig@kernelconcepts.de
List-ID: <devicetree@vger.kernel.org>

The FT5726 controller has up to 72 channels, 42 Tx-channels and 30
Rx-channels. The recommended touchpoint size is less equal 11.6".

This adds the support for the FT5726 controller flashed with the
Evervision firmware.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
index da2dc5d6c98b..179e434f5619 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
@@ -1,11 +1,12 @@
 FocalTech EDT-FT5x06 Polytouch driver
 =====================================
 
-There are 3 variants of the chip for various touch panel sizes
+There are 5 variants of the chip for various touch panel sizes
 FT5206GE1  2.8" .. 3.8"
 FT5306DE4  4.3" .. 7"
 FT5406EE8  7"   .. 8.9"
 FT5506EEG  7"   .. 8.9"
+FT5726NEI  5.7” .. 11.6"
 
 The software interface is identical for all those chips, so that
 currently there is no need for the driver to distinguish between the
@@ -19,6 +20,7 @@ Required properties:
            or:  "edt,edt-ft5306"
            or:  "edt,edt-ft5406"
            or:  "edt,edt-ft5506"
+           or:  "evervision,ev-ft5726"
            or:  "focaltech,ft6236"
 
  - reg:         I2C slave address of the chip (0x38)
-- 
2.19.1
