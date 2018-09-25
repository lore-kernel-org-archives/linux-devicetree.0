From: Damian Kos <dkos@cadence.com>
Subject: [PATCH v5 4/5] dt-bindings: drm/bridge: Document Cadence MHDP bridge bindings
Date: Tue, 25 Sep 2018 10:13:34 +0100
Message-ID: <1537866837-4408-5-git-send-email-dkos@cadence.com>
References: <1537866837-4408-1-git-send-email-dkos@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537866837-4408-1-git-send-email-dkos@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Quentin Schulz <quentin.schulz@free-electrons.com>, Damian Kos <dkos@cadence.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: pgaj@cadence.com, ltyrala@cadence.com, rafalc@cadence.com, jartur@cadence.com, piotrs@cadence.com, quentin.schulz@bootlin.com, jbergsagel@ti.com
List-Id: devicetree@vger.kernel.org

From: Quentin Schulz <quentin.schulz@free-electrons.com>

Document the bindings used for the Cadence MHDP DPI/DP bridge.

Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
Signed-off-by: Damian Kos <dkos@cadence.com>
---
 .../bindings/display/bridge/cdns,mhdp.txt     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.txt b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.txt
new file mode 100644
index 000000000000..f8334c520b98
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.txt
@@ -0,0 +1,43 @@
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
