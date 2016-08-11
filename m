From: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] ARM: dts: ls1021a: Add of_graph dt nodes to describe the panel
Date: Thu, 11 Aug 2016 17:15:20 +0800
Message-ID: <1470906920-2845-1-git-send-email-meng.yi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

add of_graph dt nodes to describe the panel, and removed
"fsl,panel" property

Signed-off-by: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/ls1021a-twr.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ls1021a-twr.dts b/arch/arm/boot/dts/ls1021a-twr.dts
index 75ecaed..a8b148a 100644
--- a/arch/arm/boot/dts/ls1021a-twr.dts
+++ b/arch/arm/boot/dts/ls1021a-twr.dts
@@ -108,12 +108,23 @@
 
 	panel: panel {
 		compatible = "nec,nl4827hc19-05b";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dcu_out>;
+			};
+		};
 	};
 };
 
 &dcu {
-	fsl,panel = <&panel>;
 	status = "okay";
+
+	port {
+		dcu_out: endpoint {
+			remote-endpoint = <&panel_in>;
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
