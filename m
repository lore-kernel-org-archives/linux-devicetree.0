From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: lpc32xx: add device node for IRAM on-chip memory
Date: Fri,  8 Jul 2016 01:46:41 +0300
Message-ID: <1467931601-25067-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The change adds a new device node with description of generic SRAM
on-chip memory found on NXP LPC32xx SoC series and connected to AHB
matrix slave port 3.

Note that NXP LPC3220 SoC has 128KiB of SRAM memory, the other
LPC3230, LPC3240 and LPC3250 SoCs all have 256KiB SRAM space,
in the shared DTSI file this change specifies 128KiB SRAM size.

Also it's worth to mention that the SRAM area contains of 64KiB banks,
2 banks on LPC3220 and 4 banks on the other SoCs from the series, and
all SRAM banks but the first one have independent power controls,
the description of this feature will be added with the introduction of
power domains for the SoC series.

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Hi Arnd, Olof, Kevin,

please consider to include this NXP LPC32xx DT change directly to
ARM tree for v4.8.

The SRAM device node will be utilized to store PM resume code
and to store MAC buffers.

 arch/arm/boot/dts/lpc32xx.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index e295e1e..b5841fa 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -51,9 +51,19 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "simple-bus";
-		ranges = <0x20000000 0x20000000 0x30000000>,
+		ranges = <0x00000000 0x00000000 0x10000000>,
+			 <0x20000000 0x20000000 0x30000000>,
 			 <0xe0000000 0xe0000000 0x04000000>;
 
+		iram: sram@08000000 {
+			compatible = "mmio-sram";
+			reg = <0x08000000 0x20000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x00000000 0x08000000 0x20000>;
+		};
+
 		/*
 		 * Enable either SLC or MLC
 		 */
-- 
2.8.0.rc3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
