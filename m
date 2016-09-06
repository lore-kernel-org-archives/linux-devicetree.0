From: Meng Yi <meng.yi@nxp.com>
Subject: [PATCH RESEND] ARM: dts: ls1021a: Add of_graph dt nodes to describe the panel
Date: Tue, 6 Sep 2016 17:45:34 +0800
Message-ID: <1473155134-36896-1-git-send-email-meng.yi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, shawnguo@kernel.org, stefan@agner.ch
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Meng Yi <meng.yi@nxp.com>
List-Id: devicetree@vger.kernel.org

add of_graph dt nodes to describe the panel, and removed
"fsl,panel" property

Signed-off-by: Meng Yi <meng.yi@nxp.com>
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
