From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RESEND PATCH v5 3/6] dt-bindings: display: Add bindings for SGD
 GKTW70SDAE4SE Panel
Date: Mon,  4 Dec 2017 10:21:07 +0100
Message-ID: <1512379270-27436-4-git-send-email-narmstrong@baylibre.com>
References: <1512379270-27436-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1512379270-27436-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

The GKTW70SDAE4SE is an LVDS display panel.
Their bindings are modelled on the the LVDS panel bindings.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
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
