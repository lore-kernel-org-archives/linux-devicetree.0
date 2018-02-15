From: Kieran Bingham <kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/8] arm64: dts: renesas: r8a77995: add DU support
Date: Thu, 15 Feb 2018 08:38:19 +0000
Message-ID: <1518683903-10681-5-git-send-email-kbingham@kernel.org>
References: <1518683903-10681-1-git-send-email-kbingham@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518683903-10681-1-git-send-email-kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, geert-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

Define the generic r8a77995 part of the DU device node.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 35 +++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 0db242114bc5..a57d5fecf79c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -748,6 +748,41 @@
 			resets = <&cpg 602>;
 			iommus = <&ipmmu_vi0 9>;
 		};
+
+		du: display@feb00000 {
+			compatible = "renesas,du-r8a77995";
+			reg = <0 0xfeb00000 0 0x80000>;
+			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 724>,
+				 <&cpg CPG_MOD 723>;
+			clock-names = "du.0", "du.1";
+			vsps = <&vspd0 0 &vspd1 0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_rgb: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					du_out_lvds0: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					du_out_lvds1: endpoint {
+					};
+				};
+			};
+		};
 	};
 
 	timer {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
