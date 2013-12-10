From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v1 1/1] powerpc/512x: dts: remove misplaced IRQ spec from 'soc' node (5125)
Date: Tue, 10 Dec 2013 10:51:08 +0100
Message-ID: <1386669068-2477-1-git-send-email-gsi@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Cc: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

the 'soc' node in the MPC5125 "tower" board .dts has an '#interrupt-cells'
property although this node is not an interrupt controller

remove this erroneously placed property because starting with v3.13-rc1
lookup and resolution of 'interrupts' specs for peripherals gets misled
(tries to use the 'soc' as the interrupt parent which fails), emits
'no irq domain found' WARN() messages and breaks the boot process

[ best viewed with 'git diff -U5' to have DT node names in the context ]

Cc: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>

---

note that this is not a resend of the previous MPC5121 fix, but instead
is a fix for MPC5125 along the same lines of the MPC5121 fix
---
 arch/powerpc/boot/dts/mpc5125twr.dts |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/mpc5125twr.dts b/arch/powerpc/boot/dts/mpc5125twr.dts
index 4177b62240c2..0a0fe92216ae 100644
--- a/arch/powerpc/boot/dts/mpc5125twr.dts
+++ b/arch/powerpc/boot/dts/mpc5125twr.dts
@@ -58,7 +58,6 @@
 		compatible = "fsl,mpc5121-immr";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		#interrupt-cells = <2>;
 		ranges = <0x0 0x80000000 0x400000>;
 		reg = <0x80000000 0x400000>;
 		bus-frequency = <66000000>;	// 66 MHz ips bus
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
