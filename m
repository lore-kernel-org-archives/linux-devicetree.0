From: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 2/3] ARM: dts: imx6: change gpt per clk to gpt_3m on i.mx6qdl and i.mx6sx
Date: Wed, 3 Sep 2014 15:36:44 +0800
Message-ID: <1409729805-9741-3-git-send-email-b20788@freescale.com>
References: <1409729805-9741-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409729805-9741-1-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Original gpt per clk parent is from ipg_per clk which
may be scaled when system enter low bus mode, as ipg
clk will be lower in low bus mode, to keep system clk
NOT drift, select gpt per clk parent from OSC which
is at fixed freq always.

Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl.dtsi |    2 +-
 arch/arm/boot/dts/imx6sx.dtsi  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 70d7207..ccd6c1b 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -401,7 +401,7 @@
 				reg = <0x02098000 0x4000>;
 				interrupts = <0 55 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6QDL_CLK_GPT_IPG>,
-					 <&clks IMX6QDL_CLK_GPT_IPG_PER>;
+					 <&clks IMX6QDL_CLK_GPT_3M>;
 				clock-names = "ipg", "per";
 			};
 
diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 63d9d82..b5d8252 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -421,7 +421,7 @@
 				reg = <0x02098000 0x4000>;
 				interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SX_CLK_GPT_BUS>,
-					 <&clks IMX6SX_CLK_GPT_SERIAL>;
+					 <&clks IMX6SX_CLK_GPT_3M>;
 				clock-names = "ipg", "per";
 			};
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
