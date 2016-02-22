From: Sergei Ianovich <ynvich@gmail.com>
Subject: [PATCH v1] arm: pxa: fix DT node name for PXA27X usb
Date: Mon, 22 Feb 2016 14:08:17 +0300
Message-ID: <1456139297-5854-1-git-send-email-ynvich@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Sergei Ianovich <ynvich@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:PXA2xx/PXA3xx
	SUPPORT" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Without this patch I am getting an error:
---8<---
[   15.709742] ohci-pxa27x: OHCI PXA27x/PXA3x driver
[   15.737150] pxa27x-ohci: probe of 4c000000.ohci failed with error -2
---8<---

The error is generated in drivers/usb/host/ohci-pxa27x.c at line 441:
---8<---
441:	usb_clk = devm_clk_get(&pdev->dev, NULL);
442:	if (IS_ERR(usb_clk))
443:		return PTR_ERR(usb_clk);
---8<---

The error is caused by different names for the same DT node in pxa2xx.dtsi
and pxa27x.dtsi.

Signed-off-by: Sergei Ianovich <ynvich@gmail.com>
CC: Robert Jarzmik <robert.jarzmik@free.fr>
---
 arch/arm/boot/dts/pxa27x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index 7f68a1e..3016a73 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -26,7 +26,7 @@
 			clocks = <&clks CLK_NONE>;
 		};
 
-		pxa27x_ohci: usb@4c000000 {
+		usb0: ohci@4c000000 {
 			compatible = "marvell,pxa-ohci";
 			reg = <0x4c000000 0x10000>;
 			interrupts = <3>;
-- 
2.6.3
