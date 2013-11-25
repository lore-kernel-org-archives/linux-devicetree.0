From: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] powerpc/4xx: Fix warning in kilauea.dtb
Date: Mon, 25 Nov 2013 09:40:37 +0000
Message-ID: <1385372437-20958-1-git-send-email-ian.campbell@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Rupjyoti Sarmah <rsarmah-qTEPVZfXA3Y@public.gmane.org>, Tirumala R Marri <tmarri-qTEPVZfXA3Y@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently I see:
  DTC     arch/powerpc/boot/kilauea.dtb
Warning (reg_format): "reg" property in /plb/ppc4xx-msi@C10000000 has invalid length (12 bytes) (#address-cells == 1, #size-cells == 1)

It appears that unlike the other platforms handled by 3fb7933850fa
"powerpc/4xx: Adding PCIe MSI support" this platform does not use address-cells=2.

Signed-off-by: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Acked-by: Josh Boyer <jwboyer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rupjyoti Sarmah <rsarmah-qTEPVZfXA3Y@public.gmane.org>
Cc: Tirumala R Marri <tmarri-qTEPVZfXA3Y@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:OPEN FIRMWARE AND...)
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
Resending, this hasn't been picked up since June
http://patchwork.ozlabs.org/patch/248234/
---
 arch/powerpc/boot/dts/kilauea.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/kilauea.dts b/arch/powerpc/boot/dts/kilauea.dts
index 1613d6e..5ba7f01 100644
--- a/arch/powerpc/boot/dts/kilauea.dts
+++ b/arch/powerpc/boot/dts/kilauea.dts
@@ -406,7 +406,7 @@
 
 		MSI: ppc4xx-msi@C10000000 {
 			compatible = "amcc,ppc4xx-msi", "ppc4xx-msi";
-			reg = < 0x0 0xEF620000 0x100>;
+			reg = <0xEF620000 0x100>;
 			sdr-base = <0x4B0>;
 			msi-data = <0x00000000>;
 			msi-mask = <0x44440000>;
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
