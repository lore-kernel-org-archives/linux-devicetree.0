From: Archit Taneja <architt@codeaurora.org>
Subject: [RFC 1/2] dt-bindings: mipi-dsi: Add info about peripherals with non-DSI control bus
Date: Tue,  5 Dec 2017 16:03:55 +0530
Message-ID: <20171205103356.9917-2-architt@codeaurora.org>
References: <20171205103356.9917-1-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20171205103356.9917-1-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robh+dt@kernel.org
Cc: tomi.valkeinen@ti.com, eric@anholt.net, philippe.cornu@st.com, laurent.pinchart@ideasonboard.com, thierry.reding@gmail.com, nickey.yang@rock-chips.com, dri-devel@lists.freedesktop.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, seanpaul@chromium.org, briannorris@chromium.org, maxime.ripard@free-electrons.com, boris.brezillon@free-electrons.com, a.hajda@samsung.com, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add a section that describes dt-bindings for peripherals that support
MIPI DSI, but have a different bus as the primary control bus. Add an
example for such peripherals.

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 .../devicetree/bindings/display/mipi-dsi-bus.txt   | 75 ++++++++++++++++++++--
 1 file changed, 68 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt b/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
index 973c27273772..77a7cec15f5b 100644
--- a/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
+++ b/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
@@ -16,7 +16,7 @@ The following assumes that only a single peripheral is connected to a DSI
 host. Experience shows that this is true for the large majority of setups.
 
 DSI host
---------
+========
 
 In addition to the standard properties and those defined by the parent bus of
 a DSI host, the following properties apply to a node representing a DSI host.
@@ -30,11 +30,15 @@ Required properties:
   different value here. See below.
 
 DSI peripheral
---------------
+==============
 
-Peripherals are represented as child nodes of the DSI host's node. Properties
-described here apply to all DSI peripherals, but individual bindings may want
-to define additional, device-specific properties.
+Peripherals with DSI as control bus
+------------------------------------
+
+Peripherals with the DSI bus as the primary control path are represented as
+child nodes of the DSI host's node. Properties described here apply to all DSI
+peripherals, but individual bindings may want to define additional,
+device-specific properties.
 
 Required properties:
 - reg: The virtual channel number of a DSI peripheral. Must be in the range
@@ -49,9 +53,25 @@ case two alternative representations can be chosen:
   property is the number of the first virtual channel and the second cell is
   the number of consecutive virtual channels.
 
-Example
--------
+Peripherals with a different control bus
+----------------------------------------
+
+There are peripherals that have I2C/SPI (or some other non-DSI bus) as the
+primary control bus, but are also connected to a DSI bus (mostly for the data
+path). Connections between such peripherals and a DSI host can be represented
+using the graph bindings [1], [2].
+
+[1] Documentation/devicetree/bindings/graph.txt
+[2] Documentation/devicetree/bindings/media/video-interfaces.txt
 
+Examples
+========
+- (1), (2) and (3) are examples of a DSI host and peripheral on the DSI bus
+  with different virtual channel configurations.
+- (4) is an example of a peripheral on a I2C control bus connected with to
+  a DSI host using of-graph bindings.
+
+1)
 	dsi-host {
 		...
 
@@ -67,6 +87,7 @@ Example
 		...
 	};
 
+2)
 	dsi-host {
 		...
 
@@ -82,6 +103,7 @@ Example
 		...
 	};
 
+3)
 	dsi-host {
 		...
 
@@ -96,3 +118,42 @@ Example
 
 		...
 	};
+
+4)
+	i2c-host {
+		...
+
+		dsi-bridge@35 {
+			compatible = "...";
+			reg = <0x35>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				...
+
+				port@0 {
+					bridge_mipi_in: endpoint {
+						remote-endpoint = <&host_mipi_out>;
+					};
+				};
+			};
+		};
+	};
+
+	dsi-host {
+		...
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			...
+
+			port@0 {
+				host_mipi_out: endpoint {
+					remote-endpoint = <&bridge_mipi_in>;
+				};
+			};
+		};
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
