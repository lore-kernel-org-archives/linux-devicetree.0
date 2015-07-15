From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2] ARM: dts: vf-colibri: define stdout-path property
Date: Wed, 15 Jul 2015 16:50:17 +0200
Message-ID: <1436971817-28523-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.guo@linaro.org, kernel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Define Vybrid's UART0, connected to the Colibri pinout UART_A, as
standard output.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/vf-colibri-eval-v3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
index 77e1a45..2ce6fe5 100644
--- a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
@@ -9,7 +9,7 @@
 
 / {
 	chosen {
-		bootargs = "console=ttyLP0,115200";
+		stdout-path = "serial0:115200n8";
 	};
 
 	clk16m: clk16m {
-- 
2.4.5
