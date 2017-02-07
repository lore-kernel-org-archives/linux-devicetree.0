From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 03/10] media: dt-bindings: vpif: extend the example with an output port
Date: Tue,  7 Feb 2017 17:41:16 +0100
Message-ID: <1486485683-11427-4-git-send-email-bgolaszewski@baylibre.com>
References: <1486485683-11427-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1486485683-11427-1-git-send-email-bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lad Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This makes the example more or less correspond with the da850-evm
hardware setup.

Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/media/ti,da850-vpif.txt    | 35 ++++++++++++++++++----
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/ti,da850-vpif.txt b/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
index 9c7510b..543f6f3 100644
--- a/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
+++ b/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
@@ -28,19 +28,27 @@ I2C-connected TVP5147 decoder:
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
+			vpif_output_ch0: endpoint@0 {
+				reg = <0>;
+				bus-width = <8>;
+				remote-endpoint = <&composite_out>;
+			};
+		};
 	};
 
 [ ... ]
@@ -53,13 +61,28 @@ I2C-connected TVP5147 decoder:
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
