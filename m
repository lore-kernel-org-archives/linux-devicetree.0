From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv5][ 4/5] ARM: dts: i.MX35: Add display support.
Date: Fri,  8 Nov 2013 14:01:32 +0100
Message-ID: <1383915693-9422-4-git-send-email-denis@eukrea.com>
References: <1383915693-9422-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383915693-9422-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

A pinctrl node for the IPU was also added.

Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
---
ChangeLog v4->v5:
- Added Grant Likely and Shawn Guo in the Cc list.
- Adapted to the new non-dma ipu bindings.
- Adapted to the use of imx35-pingrp.h
- The pinctrl ipu node addition was moved in this commit.

ChangeLog v3->v4:
- Splitted the imx35.dtsi display support (new patch).
---
 arch/arm/boot/dts/imx35.dtsi |   13 +++++++++++++
 arch/arm/mach-imx/imx35-dt.c |    7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/imx35.dtsi b/arch/arm/boot/dts/imx35.dts=
i
index 1cf520a..287bf6b 100644
--- a/arch/arm/boot/dts/imx35.dtsi
+++ b/arch/arm/boot/dts/imx35.dtsi
@@ -175,6 +175,12 @@
 					};
 				};
=20
+				ipu {
+					pinctrl_ipu_disp0: ipudisp0grp {
+						fsl,pins =3D <MX35_IPU_PINGRP1>;
+					};
+				};
+
 				uart1 {
 					pinctrl_uart1_1: uart1grp-1 {
 						fsl,pins =3D <MX35_UART1_PINGRP1>;
@@ -266,6 +272,13 @@
 				status =3D "disabled";
 			};
=20
+			ipu: ipu@53fc0000 {
+				compatible =3D "fsl,imx35-ipu";
+				reg =3D <0x53fc0000 0x4000>;
+				clocks =3D <&clks 55>;
+				status =3D "disabled";
+			};
+
 			audmux: audmux@53fc4000 {
 				compatible =3D "fsl,imx35-audmux", "fsl,imx31-audmux";
 				reg =3D <0x53fc4000 0x4000>;
diff --git a/arch/arm/mach-imx/imx35-dt.c b/arch/arm/mach-imx/imx35-dt.=
c
index e3def45..6438f292 100644
--- a/arch/arm/mach-imx/imx35-dt.c
+++ b/arch/arm/mach-imx/imx35-dt.c
@@ -16,14 +16,21 @@
 #include <asm/mach/time.h>
 #include <asm/hardware/cache-l2x0.h>
 #include "common.h"
+#include "devices-imx35.h"
 #include "mx35.h"
=20
 static void __init imx35_dt_init(void)
 {
+	struct device_node *np;
 	mxc_arch_reset_init_dt();
=20
 	of_platform_populate(NULL, of_default_bus_match_table,
 			     NULL, NULL);
+
+	/* We don't want to export the IPU as DT bindings. */
+	np =3D of_find_compatible_node(NULL, NULL, "fsl,imx35-ipu");
+	if (of_device_is_available(np))
+		imx35_add_ipu_core();
 }
=20
 static void __init imx35_timer_init(void)
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
