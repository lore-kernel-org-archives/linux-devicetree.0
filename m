From: Hui Song <hui.song_1@nxp.com>
Subject: [PATCH v1] gpio: mpc8xxx: Add new platforms GPIO DT node description
Date: Mon,  5 Aug 2019 15:10:24 +0800
Message-ID: <20190805071024.7992-1-hui.song_1@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Song Hui <hui.song_1@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Song Hui <hui.song_1@nxp.com>

Update the NXP GPIO node dt-binding file for QorIQ and
Layerscape platforms, and add one more example with
ls1028a GPIO node.

Signed-off-by: Song Hui <hui.song_1@nxp.com>
---
 Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
index 69d4616..fbe6d75 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
@@ -28,7 +28,7 @@ gpio0: gpio@1100 {
 Example of gpio-controller node for a ls2080a SoC:
 
 gpio0: gpio@2300000 {
-	compatible = "fsl,ls2080a-gpio", "fsl,qoriq-gpio";
+	compatible = "fsl,ls1028a-gpio","fsl,ls2080a-gpio", "fsl,qoriq-gpio";
 	reg = <0x0 0x2300000 0x0 0x10000>;
 	interrupts = <0 36 0x4>; /* Level high type */
 	gpio-controller;
-- 
2.9.5
