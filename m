From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 PART-RESEND 2/2] ARM: dts: berlin: add 2nd clock for BG2Q sdhci0 and sdhci1
Date: Mon, 16 Nov 2015 18:56:35 +0800
Message-ID: <1447671395-8023-3-git-send-email-jszhang@marvell.com>
References: <1447671395-8023-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447671395-8023-1-git-send-email-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the optional 2nd clock for BG2Q's sdhci0 and sdhci1. This would let the
clock be disabled during runtime pm, so saves power a bit.

Signed-off-by: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/berlin2q.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
index 145dd33..3920310 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -118,7 +118,8 @@
 		sdhci0: sdhci@ab0000 {
 			compatible = "mrvl,pxav3-mmc";
 			reg = <0xab0000 0x200>;
-			clocks = <&chip_clk CLKID_SDIO1XIN>;
+			clocks = <&chip_clk CLKID_SDIO1XIN>, <&chip_clk CLKID_SDIO>;
+			clock-names = "io", "core";
 			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
@@ -126,7 +127,8 @@
 		sdhci1: sdhci@ab0800 {
 			compatible = "mrvl,pxav3-mmc";
 			reg = <0xab0800 0x200>;
-			clocks = <&chip_clk CLKID_SDIO1XIN>;
+			clocks = <&chip_clk CLKID_SDIO1XIN>, <&chip_clk CLKID_SDIO>;
+			clock-names = "io", "core";
 			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
