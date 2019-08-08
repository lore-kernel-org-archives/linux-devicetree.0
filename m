From: Hui Song <hui.song_1@nxp.com>
Subject: [PATCH v1 1/3] gpio: mpc8xxx: add ls1088a platform gpio node DT binding description
Date: Thu,  8 Aug 2019 18:16:26 +0800
Message-ID: <20190808101628.36782-1-hui.song_1@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Song Hui <hui.song_1@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Song Hui <hui.song_1@nxp.com>

ls1088a and ls1028a platform share common gpio node.

Signed-off-by: Song Hui <hui.song_1@nxp.com>
---
 Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
index baf95d9..cd28e93 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
@@ -4,7 +4,7 @@ Required properties:
 - compatible : Should be "fsl,<soc>-gpio"
   The following <soc>s are known to be supported:
 	mpc5121, mpc5125, mpc8349, mpc8572, mpc8610, pq3, qoriq,
-	ls1021a, ls1043a, ls2080a, ls1028a.
+	ls1021a, ls1043a, ls2080a, ls1028a, ls1088a.
 - reg : Address and length of the register set for the device
 - interrupts : Should be the port interrupt shared by all 32 pins.
 - #gpio-cells : Should be two.  The first cell is the pin number and
@@ -39,10 +39,10 @@ gpio0: gpio@2300000 {
 };
 
 
-Example of gpio-controller node for a ls1028a SoC:
+Example of gpio-controller node for a ls1028a/ls1088a SoC:
 
 gpio1: gpio@2300000 {
-	compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";
+	compatible = "fsl,ls1028a-gpio", "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
 	reg = <0x0 0x2300000 0x0 0x10000>;
 	interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 	gpio-controller;
-- 
2.9.5
