From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 2/4] ARM: dts: berlin: add 2nd clock for BG2Q sdhci0 and sdhci1
Date: Tue, 20 Oct 2015 19:16:45 +0800
Message-ID: <1445339807-2351-3-git-send-email-jszhang@marvell.com>
References: <1445339807-2351-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445339807-2351-1-git-send-email-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the optional 2nd clock for BG2Q's sdhci0 and sdhci1. This would let the
clock be disabled during runtime pm, so saves power a bit.

Signed-off-by: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/berlin2q.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
index 2cb07fa..71b5d5e 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -102,7 +102,8 @@
 		sdhci0: sdhci@ab0000 {
 			compatible = "mrvl,pxav3-mmc";
 			reg = <0xab0000 0x200>;
-			clocks = <&chip_clk CLKID_SDIO1XIN>;
+			clocks = <&chip_clk CLKID_SDIO1XIN>, <&chip_clk CLKID_SDIO>;
+			clock-names = "io", "core";
 			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
@@ -110,7 +111,8 @@
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
2.6.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
