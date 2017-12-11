From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?=
        <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/4] arm: dts: sun8i: a83t: Add registers needed for MCPM
Date: Mon, 11 Dec 2017 08:49:59 +0100
Message-ID: <20171211075001.6100-3-mylene.josserand@free-electrons.com>
References: <20171211075001.6100-1-mylene.josserand@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211075001.6100-1-mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add 3 registers needed for MCPM (ie SMP): prcm, cpucfg and r_cpucfg.
prcm and cpucfg are identical with sun9i-a80. The only difference
is the r_cpucfg that does not exist on sun9i.

Signed-off-by: Mylène Josserand <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index a384b766f3dc..eeb2e7d0d6dc 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -323,6 +323,16 @@
 			#reset-cells = <1>;
 		};
 
+		cpucfg@01700000 {
+			compatible = "allwinner,sun9i-a80-cpucfg";
+			reg = <0x01700000 0x100>;
+		};
+
+		r_cpucfg@1f01c00 {
+			compatible = "allwinner,sun8i-a83t-r-cpucfg";
+			reg = <0x1f01c00 0x100>;
+		};
+
 		pio: pinctrl@1c20800 {
 			compatible = "allwinner,sun8i-a83t-pinctrl";
 			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
@@ -493,6 +503,11 @@
 			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		prcm@1f01400 {
+			compatible = "allwinner,sun9i-a80-prcm";
+			reg = <0x1f01400 0x200>;
+		};
+
 		r_ccu: clock@1f01400 {
 			compatible = "allwinner,sun8i-a83t-r-ccu";
 			reg = <0x01f01400 0x400>;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
