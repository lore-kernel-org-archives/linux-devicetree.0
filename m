From: <linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Subject: [PATCH] ARM: dts: imx53-qsb-common: fix FEC pinmux config
Date: Wed, 25 Jan 2017 06:25:48 +0100
Message-ID: <20170125052548.27402-1-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, sbabic-ynQEQJNshbs@public.gmane.org, Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>

The pinmux configuration in device tree was different from manual
muxing in <u-boot>/board/freescale/mx53loco/mx53loco.c
All pins were configured as NO_PAD_CTL(1 << 31), which was fine as the
bootloader already did the correct pinmuxing for us.
But recently u-boot is migrating to reuse device tree files from the
kernel tree, so it seems to be better to have the correct pinmuxing in
our files, too.

Signed-off-by: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/imx53-qsb-common.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/imx53-qsb-common.dtsi b/arch/arm/boot/dts/imx53-qsb-common.dtsi
index c05e7cfd0cbc..40b3e31935d0 100644
--- a/arch/arm/boot/dts/imx53-qsb-common.dtsi
+++ b/arch/arm/boot/dts/imx53-qsb-common.dtsi
@@ -215,16 +215,16 @@
 
 		pinctrl_fec: fecgrp {
 			fsl,pins = <
-				MX53_PAD_FEC_MDC__FEC_MDC		0x80000000
-				MX53_PAD_FEC_MDIO__FEC_MDIO		0x80000000
-				MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x80000000
-				MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x80000000
-				MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x80000000
-				MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x80000000
-				MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x80000000
-				MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
-				MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x80000000
-				MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x80000000
+				MX53_PAD_FEC_MDC__FEC_MDC		0x4
+				MX53_PAD_FEC_MDIO__FEC_MDIO		0x1fc
+				MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x180
+				MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x180
+				MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x180
+				MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x180
+				MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x180
+				MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x4
+				MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x4
+				MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x4
 			>;
 		};
 
-- 
2.11.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
