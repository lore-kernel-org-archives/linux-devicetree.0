From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] dt-bindings: imx-gpcv2: Fix the unit address
Date: Sat, 16 Dec 2017 16:03:02 -0200
Message-ID: <1513447382-4269-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

In the provided example the unit address does not match the 'reg' value,
as IMX7_POWER_DOMAIN_PCIE_PHY is defined as 1.

Fix the unit address and avoid using defines in reg as per Rob
Herring's recommendation.

Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
Changes since v1:
- Avoid using defines as per Rob's recommendation

 Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt b/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt
index 02f45c6..9acce75 100644
--- a/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt
+++ b/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt
@@ -44,10 +44,10 @@ Example:
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			pgc_pcie_phy: power-domain@3 {
+			pgc_pcie_phy: power-domain@1 {
 				#power-domain-cells = <0>;
 
-				reg = <IMX7_POWER_DOMAIN_PCIE_PHY>;
+				reg = <1>;
 				power-supply = <&reg_1p0d>;
 			};
 		};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
