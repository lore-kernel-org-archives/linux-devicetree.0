From: Christina Quast <cquast@hanoverdisplays.com>
Subject: [PATCH v2] dt-bindings: pinctrl: imx7d: Fix PAD_CTL_DSE_X*
Date: Wed, 13 Mar 2019 15:20:40 +0100
Message-ID: <20190313142040.26694-1-cquast@hanoverdisplays.com>
Reply-To: VI1PR04MB42227AA158BA1FCBF314AA27807B0@VI1PR04MB4222.eurprd04.prod.outlook.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org, stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Christina Quast <cquast@hanoverdisplays.com>
List-Id: devicetree@vger.kernel.org

In the iMX7d datasheet, the PAD_CTL_DSE_X* values are different from
the documentation.

Changes since v2:
* Changed patch title to 'dt-bindings: pinctrl: imx7d:'

Signed-off-by: Christina Quast <cquast@hanoverdisplays.com>
---
 .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
index 6666277c3acb..8ac1d0851a0f 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
@@ -48,9 +48,9 @@ PAD_CTL_HYS                     (1 << 3)
 PAD_CTL_SRE_SLOW                (1 << 2)
 PAD_CTL_SRE_FAST                (0 << 2)
 PAD_CTL_DSE_X1                  (0 << 0)
-PAD_CTL_DSE_X2                  (1 << 0)
-PAD_CTL_DSE_X3                  (2 << 0)
-PAD_CTL_DSE_X4                  (3 << 0)
+PAD_CTL_DSE_X4                  (1 << 0)
+PAD_CTL_DSE_X2                  (2 << 0)
+PAD_CTL_DSE_X6                  (3 << 0)
 
 Examples:
 While iomuxc-lpsr is intended to be used by dedicated peripherals to take
-- 
2.20.1
