From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [RFC v2 1/2] dt-bindings: mipi-dsi: Add info about peripherals with non-DSI control bus
Date: Thu, 18 Jan 2018 10:23:54 +0530
Message-ID: <20180118045355.8858-2-architt@codeaurora.org>
References: <20171205103356.9917-1-architt@codeaurora.org>
 <20180118045355.8858-1-architt@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180118045355.8858-1-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: tomi.valkeinen-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, philippe.cornu-qxv4g6HH51o@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a section that describes dt-bindings for peripherals that support
MIPI DSI, but have a different bus as the primary control bus, or no
control bus at all. Add an example for a peripheral with a non-DSI
control bus.

Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
v2:
- Mentioned what to do if peripheral has no control bus
- Drop unit-address and #*-cells where applicable.

 .../devicetree/bindings/display/mipi-dsi-bus.txt   | 71 +++++++++++++++++++---
 1 file changed, 64 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt b/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
index 973c27273772..94fb72cb916f 100644
--- a/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
+++ b/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
@@ -16,7 +16,7 @@ The following assumes that only a single peripheral is connected to a DSI
 host. Experience shows that this is true for the large majority of setups.
 
 DSI host
---------
+========
 
 In addition to the standard properties and those defined by the parent bus of
 a DSI host, the following properties apply to a node representing a DSI host.
@@ -30,11 +30,16 @@ Required properties:
   different value here. See below.
 
 DSI peripheral
---------------
+==============
 
-Peripherals are represented as child nodes of the DSI host's node. Properties
-described here apply to all DSI peripherals, but individual bindings may want
-to define additional, device-specific properties.
+Peripherals with DSI as control bus, or no control bus
+------------------------------------------------------
+
+Peripherals with the DSI bus as the primary control bus, or peripherals with
+no control bus but use the DSI bus to transmit pixel data are represented
+as child nodes of the DSI host's node. Properties described here apply to all
+DSI peripherals, but individual bindings may want to define additional,
+device-specific properties.
 
 Required properties:
 - reg: The virtual channel number of a DSI peripheral. Must be in the range
@@ -49,9 +54,25 @@ case two alternative representations can be chosen:
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
 
@@ -67,6 +88,7 @@ Example
 		...
 	};
 
+2)
 	dsi-host {
 		...
 
@@ -82,6 +104,7 @@ Example
 		...
 	};
 
+3)
 	dsi-host {
 		...
 
@@ -96,3 +119,37 @@ Example
 
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
+				...
+
+				port {
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
+			...
+
+			port {
+				host_mipi_out: endpoint {
+					remote-endpoint = <&bridge_mipi_in>;
+				};
+			};
+		};
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
