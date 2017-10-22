From: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] openrisc: dts: or1ksim: Add stdout-path
Date: Sun, 22 Oct 2017 11:23:53 +0900
Message-ID: <20171022022353.27464-1-shorne@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Openrisc <openrisc-cunTk1MwBs9a3B2Vnqf2dGD2FQJk+8+b@public.gmane.org>, Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

During reviews of the OpenRISC SMP patch series it was suggested to add
stdout-path to the SMP dts file.  Add stdout-path to our other dts files
to be a good example.

Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Signed-off-by: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Changes since v1
 - Complete rewrite with input from Geert

 arch/openrisc/boot/dts/or1ksim.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/openrisc/boot/dts/or1ksim.dts b/arch/openrisc/boot/dts/or1ksim.dts
index 5d4f9027afaf..8f41bd8c9f84 100644
--- a/arch/openrisc/boot/dts/or1ksim.dts
+++ b/arch/openrisc/boot/dts/or1ksim.dts
@@ -5,8 +5,13 @@
 	#size-cells = <1>;
 	interrupt-parent = <&pic>;
 
+	aliases {
+		uart0 = &serial0;
+	};
+
 	chosen {
-		bootargs = "console=uart,mmio,0x90000000,115200";
+		bootargs = "earlycon";
+		stdout-path = "uart0:115200";
 	};
 
 	memory@0 {
-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
