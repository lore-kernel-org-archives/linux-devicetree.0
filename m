From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: [PATCH] powerpc/44x/fsp2: correct dtb reg property for /sdhci@020c0000
Date: Sat, 15 Jul 2017 10:03:02 +0100
Message-ID: <20170715090302.23105-1-ijc@hellion.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Ivan Mikhaylov <ivan-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Building the split device-tree tree[0] highlighted that upstream commit
9eec6cb142bd ("powerpc/44x/fsp2: Add device tree for FSP2 board") introduced
this warning when building the device tree:

$ make CROSS_COMPILE=powerpc-linux-gnu- ARCH=powerpc fsp2.dtb
  CHK     scripts/mod/devicetable-offsets.h
  DTC     arch/powerpc/boot/fsp2.dtb
arch/powerpc/boot/fsp2.dtb: Warning (reg_format): "reg" property in /sdhci@020c0000 has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)

This commit adds the second adress cell as zeroes to resolve the warning. Note:
I have no access to or information about this platform so this is purely a
guess as to the fix. An alternative would be to adjust #address-cells, but
whether that is correct or not depends on the platform.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git/

Signed-off-by: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Ivan Mikhaylov <ivan-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/powerpc/boot/dts/fsp2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/fsp2.dts b/arch/powerpc/boot/dts/fsp2.dts
index 475953ada707..ab6d2346527f 100644
--- a/arch/powerpc/boot/dts/fsp2.dts
+++ b/arch/powerpc/boot/dts/fsp2.dts
@@ -362,7 +362,7 @@
 	mmc0: sdhci@020c0000 {
 		compatible	= "st,sdhci-stih407", "st,sdhci";
 		status		= "disabled";
-		reg		= <0x020c0000 0x20000>;
+		reg		= <0x00000000 0x020c0000 0x20000>;
 		reg-names	= "mmc";
 		interrupt-parent = <&UIC1_3>;
 		interrupts	= <21 0x4 22 0x4>;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
