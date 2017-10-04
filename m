From: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] arm: dts: gr-peach: Reduce extal_clk resolution
Date: Wed,  4 Oct 2017 17:40:57 +0200
Message-ID: <1507131657-6414-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The system clock described by extal_clk is reported to have a frequency
of 13.333 Mhz and is correctly described by gr-peach device tree.

However, when enabling a RIIC device the following error is reported by
drivers/i2c/busses/i2c-riic.c

"invalid parent clk (33332500). Must be 33325000Hz"

As RIIC devices have a clock source obtained by dividing by 12 the
system clock, the resulting value is not accepted by the driver
(which clearly states not to support any frequency except the reported
33325000Hz one).

Hence, reduce the system clock accuracy to a value which makes
frequencies obtained through division accepted by RIIC driver.

Please note that other r7s72100 boards, such as Genmai, report the same
"reduced accuracy" frequency, even if their external clock sources are
effectively 13.333Mhz as gr-peach one.

Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/r7s72100-gr-peach.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r7s72100-gr-peach.dts b/arch/arm/boot/dts/r7s72100-gr-peach.dts
index a1c5e88..20309ac 100644
--- a/arch/arm/boot/dts/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/r7s72100-gr-peach.dts
@@ -71,7 +71,7 @@
 };

 &extal_clk {
-	clock-frequency = <13333000>;
+	clock-frequency = <13330000>;
 };

 &usb_x1_clk {
--
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
