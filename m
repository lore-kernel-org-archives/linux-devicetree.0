From: Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/2] dt-bindings: display: imx: entry for LAUSCR
Date: Mon, 27 Feb 2017 11:56:42 +0100
Message-ID: <1488193030-13064-2-git-send-email-martin@kaiser.cx>
References: <1488193030-13064-1-git-send-email-martin@kaiser.cx>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1488193030-13064-1-git-send-email-martin@kaiser.cx>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-fbdev@vger.kernel.org
Cc: Martin Kaiser <martin@kaiser.cx>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Allow setting the LCDC AUS Mode Control Register from the device tree.
This setting is optional, the register is available only on imx21 and
compatible chipsets.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
index 7a5c0e2..bd5077f 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
@@ -13,6 +13,8 @@ Required nodes:
 	Additional, the display node has to define properties:
 	- bits-per-pixel: Bits per pixel
 	- fsl,pcr: LCDC PCR value
+	A display node may optionally define
+	- fsl,lauscr: LCDC AUS Mode Control Register value (only for imx21)
 
 Optional properties:
 - lcd-supply: Regulator for LCD supply voltage.
-- 
2.1.4
