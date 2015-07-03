From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] ARM: dts: vf-colibri: define stdout-path property
Date: Fri,  3 Jul 2015 10:06:39 +0200
Message-ID: <1435910799-11706-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.guo@linaro.org, kernel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Define Vybrid's UART0, connected to the Colibri pinout UART_A, as
standard output.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/vf-colibri-eval-v3.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
index 2cbe663..cb199ae 100644
--- a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
@@ -10,6 +10,7 @@
 / {
 	chosen {
 		bootargs = "console=ttyLP0,115200";
+		stdout-path = "serial0:115200n8";
 	};
 
 	clk16m: clk16m {
-- 
2.4.4
