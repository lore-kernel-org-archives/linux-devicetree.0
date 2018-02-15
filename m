From: Kieran Bingham <kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 7/8] arm64: dts: renesas: r8a77995-draak: Add HDMI Out through ADV7511
Date: Thu, 15 Feb 2018 08:38:22 +0000
Message-ID: <1518683903-10681-8-git-send-email-kbingham@kernel.org>
References: <1518683903-10681-1-git-send-email-kbingham@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518683903-10681-1-git-send-email-kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, geert-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

Provide a device node for the ADV7511 as found on the Draak D3 platform.

The ADV7511 is connected to the DU through a parallel mux chip, and is
configurable in hardware whether it is connected to LVDS0 or LVDS1.

Connect through to LVDS0 as a default implementation.

Signed-off-by: Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 668e246dfc5d..df0c7773cb7d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -27,6 +27,17 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7511_out>;
+			};
+		};
+	};
+
 	vga {
 		compatible = "vga-connector";
 
@@ -124,6 +135,39 @@
 		reg = <0x50>;
 		pagesize = <8>;
 	};
+
+	hdmi@39 {
+		compatible = "adi,adv7511w";
+		reg = <0x39>, <0x3f>, <0x38>, <0x3c>;
+		reg-names = "main", "edid", "packet", "cec";
+		interrupt-parent = <&gpio1>;
+		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+
+		adi,input-depth = <8>;
+		adi,input-colorspace = "rgb";
+		adi,input-clock = "1x";
+		adi,input-style = <1>;
+		adi,input-justification = "evenly";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7511_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7511_out: endpoint {
+					remote-endpoint = <&hdmi_con_out>;
+				};
+			};
+		};
+	};
 };
 
 &i2c1 {
@@ -146,6 +190,18 @@
 	};
 };
 
+&lvds0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&adv7511_in>;
+			};
+		};
+	};
+};
+
 &ehci0 {
 	status = "okay";
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
