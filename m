From: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] powerpc/dts/virtex440: declare address/size-cells for phy device
Date: Mon, 25 Nov 2013 09:42:26 +0000
Message-ID: <1385372547-21324-1-git-send-email-ian.campbell@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Gernot Vormayr <gvormayr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This fixes a warning:

  DTC     arch/powerpc/boot/virtex440-ml507.dtb
Warning (reg_format): "reg" property in /plb@0/xps-ll-temac@81c00000/ethernet@81c00000/phy@7 has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Warning (avoid_default_addr_size): Relying on default #address-cells value for /plb@0/xps-ll-temac@81c00000/ethernet@81c00000/phy@7
Warning (avoid_default_addr_size): Relying on default #size-cells value for /plb@0/xps-ll-temac@81c00000/ethernet@81c00000/phy@7

Signed-off-by: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: Gernot Vormayr <gvormayr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
No reply since June. http://patchwork.ozlabs.org/patch/248235/
---
 arch/powerpc/boot/dts/virtex440-ml507.dts |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/boot/dts/virtex440-ml507.dts b/arch/powerpc/boot/dts/virtex440-ml507.dts
index fc7073b..391a4e2 100644
--- a/arch/powerpc/boot/dts/virtex440-ml507.dts
+++ b/arch/powerpc/boot/dts/virtex440-ml507.dts
@@ -257,6 +257,8 @@
 			#size-cells = <1>;
 			compatible = "xlnx,compound";
 			ethernet@81c00000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				compatible = "xlnx,xps-ll-temac-1.01.b";
 				device_type = "network";
 				interrupt-parent = <&xps_intc_0>;
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
