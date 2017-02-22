From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/3] media: dt-bindings: vpif: extend the example with an output port
Date: Wed, 22 Feb 2017 14:43:46 +0100
Message-ID: <1487771027-7763-3-git-send-email-bgolaszewski@baylibre.com>
References: <1487771027-7763-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487771027-7763-1-git-send-email-bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This makes the example more or less correspond with the da850-evm
hardware setup.

Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/media/ti,da850-vpif.txt    | 40 +++++++++++++++++-----
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/ti,da850-vpif.txt b/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
index 9c7510b..df7182a 100644
--- a/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
+++ b/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
@@ -16,8 +16,10 @@ Required properties:
 Video Capture:
 
 VPIF has a 16-bit parallel bus input, supporting 2 8-bit channels or a
-single 16-bit channel.  It should contain at least one port child node
-with child 'endpoint' node. Please refer to the bindings defined in
+single 16-bit channel. It should contain one or two port child nodes
+with child 'endpoint' node. If there are two ports then port@0 must
+describe the input and port@1 output channels. Please refer to the
+bindings defined in
 Documentation/devicetree/bindings/media/video-interfaces.txt.
 
 Example using 2 8-bit input channels, one of which is connected to an
@@ -28,19 +30,26 @@ I2C-connected TVP5147 decoder:
 		reg = <0x217000 0x1000>;
 		interrupts = <92>;
 
-		port {
-			vpif_ch0: endpoint@0 {
+		port@0 {
+			vpif_input_ch0: endpoint@0 {
 				reg = <0>;
 				bus-width = <8>;
-				remote-endpoint = <&composite>;
+				remote-endpoint = <&composite_in>;
 			};
 
-			vpif_ch1: endpoint@1 {
+			vpif_input_ch1: endpoint@1 {
 				reg = <1>;
 				bus-width = <8>;
 				data-shift = <8>;
 			};
 		};
+
+		port@1 {
+			vpif_output_ch0: endpoint {
+				bus-width = <8>;
+				remote-endpoint = <&composite_out>;
+			};
+		};
 	};
 
 [ ... ]
@@ -53,13 +62,28 @@ I2C-connected TVP5147 decoder:
 		status = "okay";
 
 		port {
-			composite: endpoint {
+			composite_in: endpoint {
 				hsync-active = <1>;
 				vsync-active = <1>;
 				pclk-sample = <0>;
 
 				/* VPIF channel 0 (lower 8-bits) */
-				remote-endpoint = <&vpif_ch0>;
+				remote-endpoint = <&vpif_input_ch0>;
+				bus-width = <8>;
+			};
+		};
+	};
+
+	adv7343@2a {
+		compatible = "adi,adv7343";
+		reg = <0x2a>;
+
+		port {
+			composite_out: endpoint {
+				adi,dac-enable = <1 1 1>;
+				adi,sd-dac-enable = <1>;
+
+				remote-endpoint = <&vpif_output_ch0>;
 				bus-width = <8>;
 			};
 		};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
