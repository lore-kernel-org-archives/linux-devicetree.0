From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v4 5/5] ARM: dts: bcm2837-rpi-3-b: add GPIO expander
Date: Wed,  7 Feb 2018 20:35:26 +0200
Message-ID: <421acc09173c10ba2723672357149bc3021856ad.1517923836.git.baruch@tkos.co.il>
References: <cover.1517923836.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.1517923836.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Dave Stevenson <dave.stevenson@raspberrypi.org>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Michael Zoran <mzoran@crowfest.net>, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Baruch Siach <baruch@tkos.co.il>
List-Id: devicetree@vger.kernel.org

Add a description of the RPi3 GPIO expander that the VC4 firmware controls.

Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v4:
  * Move the gpio node under the firmware node
  * Rename the gpio node to plain 'gpio'
  * Add Stefan's ack

v3:
  * List GPIO names one per line.

v2:
  * Move GPIO expander node out of the soc container
  * Rename compatible string
  * Add gpio-line-names property
---
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
index 3e4ed7c5b0b3..aab904231580 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
@@ -25,6 +25,24 @@
 	};
 };
 
+&firmware {
+	expgpio: gpio {
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
+};
+
 /* uart0 communicates with the BT module */
 &uart0 {
 	pinctrl-names = "default";
-- 
2.15.1

