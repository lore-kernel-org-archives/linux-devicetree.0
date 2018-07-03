From: Damian Kos <dkos@cadence.com>
Subject: [PATCH 10/12] dt-bindings: drm/bridge: Document Cadence MHDP bridge bindings
Date: Tue, 3 Jul 2018 11:02:21 +0100
Message-ID: <1530612152-27555-11-git-send-email-dkos@cadence.com>
References: <1530612152-27555-1-git-send-email-dkos@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530612152-27555-1-git-send-email-dkos@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Damian Kos <dkos@cadence.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: ltyrala@cadence.com, pgaj@cadence.com, stelford@cadence.com
List-Id: devicetree@vger.kernel.org

Document the bindings used for the Cadence MHDP DPI/DP bridge.

Signed-off-by: Damian Kos <dkos@cadence.com>
---
 .../bindings/display/bridge/cdns,mhdp.txt          |   39 ++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.txt b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.txt
new file mode 100644
index 0000000..d872e26
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.txt
@@ -0,0 +1,39 @@
+Cadence MHDP bridge
+==========================
+
+The Cadence MHDP bridge is a DPI to DP bridge.
+
+Required properties:
+ - compatible: should be "cdns,mhdp",
+ - reg: physical base address and length of the controller's registers,
+ - clocks: DP bridge clock, it's used by the IP to know how to translate
+	   a number of clock cycles into a time (which is used to comply
+	   with DP standard timings and delays),
+ - clock-names: must be "clk",
+
+Required subnodes:
+ - ports: Ports as described in Documentation/devictree/bindings/graph.txt
+   Currently contains a single input port at address 0 representing the DPI
+   input.
+   Port 0 should be connected to a DPI encoder output.
+
+Example:
+
+	mhdp: mhdp@0xf0fb000000 {
+		compatible = "cdns,mhdp";
+		reg = <0xf0 0xfb000000 0x0 0x1000000>;
+		clocks = <&mhdp_clock>;
+		clock-names = "clk";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				mhdp0_dpi_input: endpoint {
+					remote-endpoint = <&xxx_dpi_output>;
+				};
+			};
+		};
+	};
-- 
1.7.1
