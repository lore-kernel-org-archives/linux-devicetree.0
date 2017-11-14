From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 1/3] dt-bindings: display/ti: Add optional property to set memory bandwidth limit
Date: Tue, 14 Nov 2017 14:47:53 +0200
Message-ID: <20171114124755.14277-2-peter.ujfalusi@ti.com>
References: <20171114124755.14277-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171114124755.14277-1-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

max-memory-bandwidth can be used to specify the maximum bandwidth dispc
can use when reading display data from main memory.

In some SoC (am437x for example) we have memory bandwidth limitation
which causes underflow in the display subsystem.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
---
 Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt  | 5 +++++
 Documentation/devicetree/bindings/display/ti/ti,omap2-dss.txt | 4 ++++
 Documentation/devicetree/bindings/display/ti/ti,omap3-dss.txt | 4 ++++
 Documentation/devicetree/bindings/display/ti/ti,omap4-dss.txt | 4 ++++
 Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt | 4 ++++
 5 files changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt
index c30f9ec189ed..91279f1060fe 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt
+++ b/Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt
@@ -47,6 +47,11 @@ Required properties:
 - clocks: handle to fclk
 - clock-names: "fck"
 
+Optional properties:
+- max-memory-bandwidth: Input memory (from main memory to dispc) bandwidth limit
+			in bytes per second
+
+
 HDMI
 ----
 
diff --git a/Documentation/devicetree/bindings/display/ti/ti,omap2-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,omap2-dss.txt
index afcd5a86c6a4..ee867c4d1152 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,omap2-dss.txt
+++ b/Documentation/devicetree/bindings/display/ti/ti,omap2-dss.txt
@@ -28,6 +28,10 @@ Required properties:
 - ti,hwmods: "dss_dispc"
 - interrupts: the DISPC interrupt
 
+Optional properties:
+- max-memory-bandwidth: Input memory (from main memory to dispc) bandwidth limit
+			in bytes per second
+
 
 RFBI
 ----
diff --git a/Documentation/devicetree/bindings/display/ti/ti,omap3-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,omap3-dss.txt
index dc66e1447c31..cd02516a40b6 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,omap3-dss.txt
+++ b/Documentation/devicetree/bindings/display/ti/ti,omap3-dss.txt
@@ -37,6 +37,10 @@ Required properties:
 - clocks: handle to fclk
 - clock-names: "fck"
 
+Optional properties:
+- max-memory-bandwidth: Input memory (from main memory to dispc) bandwidth limit
+			in bytes per second
+
 
 RFBI
 ----
diff --git a/Documentation/devicetree/bindings/display/ti/ti,omap4-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,omap4-dss.txt
index bc624db8888d..0f85f6b3a5a8 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,omap4-dss.txt
+++ b/Documentation/devicetree/bindings/display/ti/ti,omap4-dss.txt
@@ -36,6 +36,10 @@ Required properties:
 - clocks: handle to fclk
 - clock-names: "fck"
 
+Optional properties:
+- max-memory-bandwidth: Input memory (from main memory to dispc) bandwidth limit
+			in bytes per second
+
 
 RFBI
 ----
diff --git a/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
index 118a486c47bb..20861218649f 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
+++ b/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
@@ -36,6 +36,10 @@ Required properties:
 - clocks: handle to fclk
 - clock-names: "fck"
 
+Optional properties:
+- max-memory-bandwidth: Input memory (from main memory to dispc) bandwidth limit
+			in bytes per second
+
 
 RFBI
 ----
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
