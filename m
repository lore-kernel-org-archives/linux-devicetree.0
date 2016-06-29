From: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v2 2/2] drm/fsl-dcu: update panel syntax to of_graph dt binding
Date: Wed, 29 Jun 2016 16:17:58 +0800
Message-ID: <1467188278-10978-2-git-send-email-meng.yi@nxp.com>
References: <1467188278-10978-1-git-send-email-meng.yi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467188278-10978-1-git-send-email-meng.yi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: stefan-XLVq0VzYD2Y@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

add of_graph dt binding for panel, and "fsl,panel" property
is deprecated

Signed-off-by: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
---
Changes in V2:
-dropp the unit address of port
---
 arch/arm/boot/dts/ls1021a-twr.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ls1021a-twr.dts b/arch/arm/boot/dts/ls1021a-twr.dts
index 75ecaed..cbd92c8 100644
--- a/arch/arm/boot/dts/ls1021a-twr.dts
+++ b/arch/arm/boot/dts/ls1021a-twr.dts
@@ -108,12 +108,22 @@
 
 	panel: panel {
 		compatible = "nec,nl4827hc19-05b";
+		port {
+			panel_out: endpoint {
+				remote-endpoint = <&dcu_out>;
+			};
+		};
 	};
 };
 
 &dcu {
-	fsl,panel = <&panel>;
 	status = "okay";
+
+	port: port {
+		dcu_out: endpoint {
+			remote-endpoint = <&panel_out>;
+		};
+	};
 };
 
 &dspi1 {
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
