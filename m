From: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v2 1/2] drm/fsl-dcu: update the panel dt binding document
Date: Wed, 29 Jun 2016 16:17:57 +0800
Message-ID: <1467188278-10978-1-git-send-email-meng.yi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: stefan-XLVq0VzYD2Y@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

dropped the old "fsl,panel" property, using the of_graph dt
binding syntax

Signed-off-by: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
---
Changes in V2:
-drop the unit address of port
---
 Documentation/devicetree/bindings/display/fsl,dcu.txt | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,dcu.txt b/Documentation/devicetree/bindings/display/fsl,dcu.txt
index ae55cde..c96ec1f 100644
--- a/Documentation/devicetree/bindings/display/fsl,dcu.txt
+++ b/Documentation/devicetree/bindings/display/fsl,dcu.txt
@@ -12,7 +12,7 @@ Required properties:
 - clock-names:		Should be "dcu" and "pix"
 			See ../clocks/clock-bindings.txt for details.
 - big-endian		Boolean property, LS1021A DCU registers are big-endian.
-- fsl,panel:		The phandle to panel node.
+- port			Video port for the panel output
 
 Optional properties:
 - fsl,tcon:		The phandle to the timing controller node.
@@ -24,6 +24,11 @@ dcu: dcu@2ce0000 {
 	clocks = <&platform_clk 0>, <&platform_clk 0>;
 	clock-names = "dcu", "pix";
 	big-endian;
-	fsl,panel = <&panel>;
 	fsl,tcon = <&tcon>;
+
+	port: port {
+		dcu_out: endpoint {
+			remote-endpoint = <&panel_out>;
+		};
+	};
 };
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
