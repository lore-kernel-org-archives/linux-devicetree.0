From: Marco Franchi <marco.franchi@nxp.com>
Subject: [PATCH v2] dt-bindings: fsl-imx-drm: Remove incorrect "@di0" usage
Date: Mon, 2 Oct 2017 10:45:30 -0300
Message-ID: <1506951930-4881-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de
Cc: robh+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, festevam@gmail.com, marcofrk@gmail.com, Marco Franchi <marco.franchi@nxp.com>
List-Id: devicetree@vger.kernel.org

Improve the binding example by removing the '@di0' notation, which
fixes the following build warning:

Warning (unit_address_vs_reg): Node /display@di0 has a unit name, but 
no reg property

Signed-off-by: Marco Franchi <marco.franchi@nxp.com>
---
Change since v1:
-change 'display-di0' to 'disp0'.
 Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
index f798547..5bf77f6 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
+++ b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
@@ -129,7 +129,7 @@ Optional properties:
 
 example:
 
-display@di0 {
+disp0 {
 	compatible = "fsl,imx-parallel-display";
 	edid = [edid-data];
 	interface-pix-fmt = "rgb24";
-- 
2.7.4
