From: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/5 v4] drm: Add DT bindings documentation for ARC PGU display controller
Date: Thu, 24 Mar 2016 19:48:33 +0300
Message-ID: <1458838116-24954-3-git-send-email-abrodkin@synopsys.com>
References: <1458838116-24954-1-git-send-email-abrodkin@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458838116-24954-1-git-send-email-abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This add DT bindings documentation for ARC PGU display controller.

Signed-off-by: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
---

Changes v3 -> v4: (addressing Rob's comments)
 * Removed "encoder-slave" from required properties
 * Removed "0x" from node names

Changes v2 -> v3:
 * Reverted back to initial larger version of example
   with minor fixes (thanks Rob for spotting those).

Changes v1 -> v2:
 * Removed everything except PGU node itself.

 .../devicetree/bindings/display/snps,arcpgu.txt    | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/snps,arcpgu.txt

diff --git a/Documentation/devicetree/bindings/display/snps,arcpgu.txt b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
new file mode 100644
index 0000000..b126577
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
@@ -0,0 +1,71 @@
+ARC PGU
+
+This is a display controller found on several development boards produced
+by Synopsys. The ARC PGU is an RGB streamer that reads the data from a
+framebuffer and sends it to a single digital encoder (usually HDMI).
+
+Required properties:
+  - compatible: "snps,arcpgu"
+  - reg: Physical base address and length of the controller's registers.
+  - clocks: A list of phandle + clock-specifier pairs, one for each
+    entry in 'clock-names'.
+  - clock-names: A list of clock names. For ARC PGU it should contain:
+      - "pxlclk" for the clock feeding the output PLL of the controller.
+
+Required sub-nodes:
+  - port: The PGU connection to an encoder chip.
+
+Example:
+
+/ {
+	...
+
+	pgu@XXXXXXXX {
+		compatible = "snps,arcpgu";
+		reg = <0xXXXXXXXX 0x400>;
+		clocks = <&clock_node>;
+		clock-names = "pxlclk";
+		encoder-slave = <&encoder_node>;
+
+		port {
+			pgu_output: endpoint {
+				remote-endpoint = <&hdmi_enc_input>;
+			};
+		};
+	};
+
+	/* HDMI encoder on I2C bus */
+	i2c@XXXXXXXX {
+		compatible = "...";
+
+		encoder_node:hdmi@XX{
+			compatible="...";
+
+			ports {
+				port@0 {
+					reg = <0>;
+					hdmi_enc_input:endpoint {
+						remote-endpoint = <&pgu_output>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					hdmi_enc_output:endpoint {
+						remote-endpoint = <&hdmi_connector_in>;
+					};
+				};
+			};
+		};
+	}
+
+	hdmi0: connector {
+		compatible = "hdmi-connector";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_enc_output>;
+			};
+		};
+	};
+};
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
