From: Adrian Alonso <aalonso@freescale.com>
Subject: [PATCH 2/4] ARM: dts: imx: imx7d add iomuxc lpsr register base address
Date: Fri, 19 Jun 2015 14:59:08 -0500
Message-ID: <1434743950-7771-2-git-send-email-aalonso@freescale.com>
References: <1434743950-7771-1-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1434743950-7771-1-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Anson.Huang@freescale.com, Frank.Li@freescale.com, yibin.gong@freescale.com, nitin.garg@freescale.com
List-Id: devicetree@vger.kernel.org

* Add iomuxc lpsr register base address to extend
  pinctrl-imx driver to support the iomux settings for pins
  that support LPSR operation mode.

Signed-off-by: Adrian Alonso <aalonso@freescale.com>
---
 arch/arm/boot/dts/imx7d.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index c42cf8d..294a6c6 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -253,7 +253,7 @@
 
 			iomuxc: iomuxc@30330000 {
 				compatible = "fsl,imx7d-iomuxc";
-				reg = <0x30330000 0x10000>;
+				reg = <0x30330000 0x10000>, <0x302c0000 0x10000>;
 			};
 
 			gpr: iomuxc-gpr@30340000 {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
