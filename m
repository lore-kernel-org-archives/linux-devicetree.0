From: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH V4] dts/imx6q-b850v3: Use megachips-stdpxxxx-ge-b850v3-fw bridges (LVDS-DP++)
Date: Tue, 14 Mar 2017 10:23:02 +0100
Message-ID: <20170314092302.7317-1-peter.senna@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, jslaby-AlSwsSmVLrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, martin.donnelly-JJi787mZWgc@public.gmane.org, martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, tred
List-Id: devicetree@vger.kernel.org

Configures the megachips-stdpxxxx-ge-b850v3-fw bridges on the GE
B850v3 dts file.

Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Martin Donnelly <martin.donnelly-JJi787mZWgc@public.gmane.org>
Cc: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
Subject was [PATCH V4 4/4] ...
But patches 1, 2, and 3 are already upstream and were not resent.

Changes from V3:
 - Newline fixes
 - Removed 'status = "okay";' from '&mux2_i2c2'
 - Sorted device nodes in order of unit address

Unchanged since V1.
 arch/arm/boot/dts/imx6q-b850v3.dts | 66 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-b850v3.dts b/arch/arm/boot/dts/imx6q-b850v3.dts
index d78514c..ef67b47 100644
--- a/arch/arm/boot/dts/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/imx6q-b850v3.dts
@@ -72,6 +72,14 @@
 		fsl,data-mapping = "spwg";
 		fsl,data-width = <24>;
 		status = "okay";
+
+		port@4 {
+			reg = <4>;
+
+			lvds0_out: endpoint {
+				remote-endpoint = <&stdp4028_in>;
+			};
+		};
 	};
 };
 
@@ -142,3 +150,61 @@
 		reg = <0x4a>;
 	};
 };
+
+&mux2_i2c2 {
+	clock-frequency = <100000>;
+
+	stdp2690@72 {
+		compatible = "megachips,stdp2690-ge-b850v3-fw";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x72>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				stdp2690_in: endpoint {
+					remote-endpoint = <&stdp4028_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				stdp2690_out: endpoint {
+					/* Connector for external display */
+				};
+			};
+		};
+	};
+
+	stdp4028@73 {
+		compatible = "megachips,stdp4028-ge-b850v3-fw";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x73>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				stdp4028_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				stdp4028_out: endpoint {
+					remote-endpoint = <&stdp2690_in>;
+				};
+			};
+		};
+	};
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
