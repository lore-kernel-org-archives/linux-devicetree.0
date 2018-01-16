From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v3 4/4] ARM: dts: bcm2837-rpi-3-b: add GPIO expander
Date: Tue, 16 Jan 2018 14:45:10 +0200
Message-ID: <8ba2147dc08bb50a65b49ca2142f7710e1635d20.1516105893.git.baruch@tkos.co.il>
References: <cover.1516105893.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.1516105893.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
To: Dave Stevenson <dave.stevenson@raspberrypi.org>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, linux-gpio@vger.kernel.org, Michael Zoran <mzoran@crowfest.net>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Add a description of the RPi3 GPIO expander that the VC4 firmware controls.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v3:
  * List GPIO names one per line.

v2:
  * Move GPIO expander node out of the soc container
  * Rename compatible string
  * Add gpio-line-names property
---
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
index b44b3b5af00d..8cd93425ffe3 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
@@ -23,6 +23,22 @@
 			gpios = <&gpio 47 0>;
 		};
 	};
+
+	expgpio: gpio-expander {
+		compatible = "raspberrypi,firmware-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+		firmware = <&firmware>;
+		gpio-line-names = "BT_ON",
+				  "WL_ON",
+				  "STATUS_LED",
+				  "LAN_RUN",
+				  "HPD_N",
+				  "CAM_GPIO0",
+				  "CAM_GPIO1",
+				  "PWR_LOW_N";
+		status = "okay";
+	};
 };
 
 /* uart0 communicates with the BT module */
-- 
2.15.1

