From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 3/6] dt-bindings: display: Add bindings for SGD GKTW70SDAE4SE Panel
Date: Fri,  1 Dec 2017 10:03:41 +0100
Message-ID: <1512119024-521-4-git-send-email-narmstrong@baylibre.com>
References: <1512119024-521-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512119024-521-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The GKTW70SDAE4SE is an LVDS display panel.
Their bindings are modelled on the the LVDS panel bindings.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 .../bindings/display/panel/sgd,gktw70sdae4se.txt   | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.txt

diff --git a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.txt b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.txt
new file mode 100644
index 0000000..d06644b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.txt
@@ -0,0 +1,41 @@
+Solomon Goldentek Display GKTW70SDAE4SE LVDS Display Panel
+==========================================================
+
+The GKTW70SDAE4SE is a 7" WVGA TFT-LCD display panel.
+
+These DT bindings follow the LVDS panel bindings defined in panel-lvds.txt
+with the following device-specific properties.
+
+Required properties:
+
+- compatible: Shall contain "sgd,gktw70sdae4se" and "panel-lvds", in that order.
+
+Example
+-------
+
+panel {
+	compatible = "sgd,gktw70sdae4se", "panel-lvds";
+
+	width-mm = <153>;
+	height-mm = <86>;
+
+	data-mapping = "jeida-18";
+
+	panel-timing {
+		clock-frequency = <32000000>;
+		hactive = <800>;
+		vactive = <480>;
+		hback-porch = <39>;
+		hfront-porch = <39>;
+		vback-porch = <29>;
+		vfront-porch = <13>;
+		hsync-len = <47>;
+		vsync-len = <2>;
+	};
+
+	port {
+		panel_in: endpoint {
+			remote-endpoint = <&lvds_encoder>;
+		};
+	};
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
