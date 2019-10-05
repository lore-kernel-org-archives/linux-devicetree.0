From: Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 1/2] dt-bindings: display: imx: fix native-mode setting
Date: Sat,  5 Oct 2019 15:09:20 +0200
Message-ID: <20191005130921.12874-2-martin@kaiser.cx>
References: <20190918193853.25689-1-martin@kaiser.cx>
 <20191005130921.12874-1-martin@kaiser.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191005130921.12874-1-martin@kaiser.cx>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Alexander Shiyan <shc_work@mail.ru>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
List-Id: devicetree@vger.kernel.org

Move the native-mode setting inside the display-timing node. Outside of
display-timing, it is ignored.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
changes in v2
 move parts of the commit message into the cover letter

 Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
index e5a8b363d829..f4df9e83bcd2 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
@@ -38,10 +38,10 @@ Example:
 
 	display0: display0 {
 		model = "Primeview-PD050VL1";
-		native-mode = <&timing_disp0>;
 		bits-per-pixel = <16>;
 		fsl,pcr = <0xf0c88080>;	/* non-standard but required */
 		display-timings {
+			native-mode = <&timing_disp0>;
 			timing_disp0: 640x480 {
 				hactive = <640>;
 				vactive = <480>;
-- 
2.11.0
