From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: [PATCH 2/4] ARM: at91/dt: sama5d3 xplained: add mmc0 vqmmc entry
Date: Mon, 27 Apr 2015 15:19:11 +0200
Message-ID: <1430140753-19998-2-git-send-email-ludovic.desroches@atmel.com>
References: <1430140753-19998-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430140753-19998-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@atmel.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, plagnioj@jcrosoft.com, ben.dooks@codethink.co.uk, Ludovic Desroches <ludovic.desroches@atmel.com>
List-Id: devicetree@vger.kernel.org

From: Ben Dooks <ben.dooks@codethink.co.uk>

The SAM5D3 Xplained device tree is missing the vqmmc node which is
tied to 3.3V on the board. Add this to avoid the kernel warning that
there is no vqmmc node.

atmel_mci f0000000.mmc: No vqmmc regulator found

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 arch/arm/boot/dts/at91-sama5d3_xplained.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/at91-sama5d3_xplained.dts b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
index af8b263..61922b3 100644
--- a/arch/arm/boot/dts/at91-sama5d3_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
@@ -35,6 +35,7 @@
 		apb {
 			mmc0: mmc@f0000000 {
 				pinctrl-0 = <&pinctrl_mmc0_clk_cmd_dat0 &pinctrl_mmc0_dat1_3 &pinctrl_mmc0_dat4_7 &pinctrl_mmc0_cd>;
+				vqmmc-supply = <&vcc_3v3_reg>;
 				status = "okay";
 				slot@0 {
 					reg = <0>;
-- 
2.2.0
