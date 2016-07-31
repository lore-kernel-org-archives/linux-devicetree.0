From: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH V3 3/5] Documentation/devicetree/bindings: b850v3_lvds_dp
Date: Sun, 31 Jul 2016 21:55:36 +0200
Message-ID: <cd3180af2c0f35b4a36624124f4d564cd1f35dec.1469993472.git.peter.senna@collabora.com>
References: <1464626385-19253-1-git-send-email-peter.senna@collabora.com>
 <cover.1469993472.git.peter.senna@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1469993472.git.peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
In-Reply-To: <cover.1469993472.git.peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
References: <cover.1469993472.git.peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, andrey.gusakov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Devicetree bindings documentation for the GE B850v3 LVDS/DP++
display bridge.

Cc: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
Unchanged from V2.

Changes from V1:
 - Replaced '_' by '-' in node names or compatible strings
 - Added missing @73 to the example

 .../devicetree/bindings/ge/b850v3-lvds-dp.txt      | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt

diff --git a/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt b/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
new file mode 100644
index 0000000..f05c3e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
@@ -0,0 +1,37 @@
+Driver for GE B850v3 LVDS/DP++ display bridge
+
+Required properties:
+  - compatible : should be "ge,b850v3-lvds-dp".
+  - reg : should contain the address used to ack the interrupts.
+  - interrupt-parent : phandle of the interrupt controller that services
+    interrupts to the device
+  - interrupts : one interrupt should be described here, as in
+    <0 IRQ_TYPE_LEVEL_HIGH>.
+  - edid-reg : should contain the address used to read edid information
+  - port : should describe the video signal connection between the host
+    and the bridge.
+
+Example:
+
+&mux2_i2c2 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	b850v3-lvds-dp-bridge@73  {
+		compatible = "ge,b850v3-lvds-dp";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg = <0x73>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+		edid-reg = <0x72>;
+
+		port {
+			b850v3_dp_bridge_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+};
-- 
2.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
