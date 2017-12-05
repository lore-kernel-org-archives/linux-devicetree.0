From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [RFC 2/2] dt-bindings: mipi-dsi: Add dual-channel DSI related info
Date: Tue,  5 Dec 2017 16:03:56 +0530
Message-ID: <20171205103356.9917-3-architt@codeaurora.org>
References: <20171205103356.9917-1-architt@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171205103356.9917-1-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: tomi.valkeinen-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, philippe.cornu-qxv4g6HH51o@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add binding info for peripherals that support dual-channel DSI. Add
corresponding optional bindings for DSI host controllers that may
be configured in this mode.

Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 .../devicetree/bindings/display/mipi-dsi-bus.txt   | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt b/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
index 77a7cec15f5b..f556aaafdf22 100644
--- a/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
+++ b/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
@@ -29,6 +29,12 @@ Required properties:
 - #size-cells: Should be 0. There are cases where it makes sense to use a
   different value here. See below.
 
+Optional properties:
+- clock-master: A DSI host controller may be used in conjunction with another DSI
+  host to drive the same peripheral. Hardware supporting such a configuration
+  generally requires the data on both the busses to be driven by the same clock.
+  The DSI host instance controlling this clock should contain this property.
+
 DSI peripheral
 ==============
 
@@ -61,6 +67,17 @@ primary control bus, but are also connected to a DSI bus (mostly for the data
 path). Connections between such peripherals and a DSI host can be represented
 using the graph bindings [1], [2].
 
+Peripherals that support dual channel DSI
+-----------------------------------------
+
+Peripherals with higher bandwidth requirements can be connected to 2 DSI
+busses. Each DSI bus/channel drives some portion of the pixel data (generally
+left/right half of each line of the display, or even/odd lines of the display).
+The graph bindings should be used to represent the multiple DSI busses that are
+connected to this peripheral. Each DSI host's output endpoint can be linked to
+an input endpoint of the DSI peripheral.
+
+
 [1] Documentation/devicetree/bindings/graph.txt
 [2] Documentation/devicetree/bindings/media/video-interfaces.txt
 
@@ -70,6 +87,8 @@ Examples
   with different virtual channel configurations.
 - (4) is an example of a peripheral on a I2C control bus connected with to
   a DSI host using of-graph bindings.
+- (5) is an example of 2 DSI hosts driving a dual-channel DSI peripheral,
+  which uses I2C as its primary control bus.
 
 1)
 	dsi-host {
@@ -157,3 +176,61 @@ Examples
 			};
 		};
 	};
+
+5)
+	i2c-host {
+		dsi-bridge@35 {
+			compatible = "...";
+			reg = <0x35>;
+
+			ports {
+				...
+
+				port@0 {
+					dsi0_in: endpoint {
+						remote-endpoint = <&dsi0_out>;
+					};
+				};
+
+				port@1 {
+					dsi1_in: endpoint {
+						remote-endpoint = <&dsi1_out>;
+					};
+				};
+			};
+		};
+	};
+
+	dsi0-host {
+		...
+
+		/*
+		 * this DSI instance drives the clock for both the host
+		 * controllers
+		 */
+		clock-master;
+
+		ports {
+			...
+
+			port@0 {
+				dsi0_out: endpoint {
+					remote-endpoint = <&dsi0_in>;
+				};
+			};
+		};
+	};
+
+	dsi1-host {
+		...
+
+		ports {
+			...
+
+			port@0 {
+				dsi1_out: endpoint {
+					remote-endpoint = <&dsi1_in>;
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
