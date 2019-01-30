From: Damian Kos <dkos@cadence.com>
Subject: [PATCH v7 3/4] dt-bindings: drm/bridge: Document Cadence MHDP bridge bindings
Date: Wed, 30 Jan 2019 11:03:20 +0000
Message-ID: <1548846209-16406-4-git-send-email-dkos@cadence.com>
References: <1548846209-16406-1-git-send-email-dkos@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548846209-16406-1-git-send-email-dkos@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: dkos@cadence.com, rafalc@cadence.com, piotrs@cadence.com, quentin.schulz@bootlin.com, jbergsagel@ti.com, Quentin Schulz <quentin.schulz@free-electrons.com>
List-Id: devicetree@vger.kernel.org

From: Quentin Schulz <quentin.schulz@free-electrons.com>

Document the bindings used for the Cadence MHDP DPI/DP bridge.

Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
Signed-off-by: Damian Kos <dkos@cadence.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/bridge/cdns,mhdp.txt     | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.txt b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.txt
new file mode 100644
index 000000000000..df2a00163ccf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.txt
@@ -0,0 +1,47 @@
+Cadence MHDP bridge
+==========================
+
+The Cadence MHDP bridge is a DPI to DP bridge.
+
+Required properties:
+- compatible: should be "cdns,mhdp8546",
+- reg: physical base address and length of the controller's registers,
+- clocks: DP bridge clock, it's used by the IP to know how to translate
+	a number of clock cycles into a time (which is used to comply
+	with DP standard timings and delays),
+- phys: see the Documentation/devicetree/bindings/phy/phy-cadence-dp.txt
+- phy-names: must be "dpphy"
+
+Required subnodes:
+- ports: Ports as described in Documentation/devictree/bindings/graph.txt
+	Port 0 - input port representing the DP bridge input
+	Port 1 - output port representing the DP bridge output
+
+Example:
+
+	mhdp: dp-bridge@f0fb000000 {
+		compatible = "cdns,mhdp8546";
+		reg = <0xf0 0xfb000000 0x0 0x1000000>;
+		clocks = <&mhdp_clock>;
+		phys = <&dp_phy>;
+		phy-names = "dpphy";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dp_bridge_input: endpoint {
+					remote-endpoint = <&xxx_dpi_output>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dp_bridge_output: endpoint {
+					remote-endpoint = <&xxx_dp_connector_input>;
+				};
+			};
+		};
+	};
-- 
2.17.1
