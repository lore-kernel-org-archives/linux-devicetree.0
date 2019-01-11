From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH RESEND v1 1/4] dt-bindings: fsl: scu: add fallback compatible
 string for clock
Date: Fri, 11 Jan 2019 11:55:56 +0000
Message-ID: <1547207400-28307-2-git-send-email-aisheng.dong@nxp.com>
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
Let's add a "fsl,scu-clk" fallback compatible string to allow other
SoCs to reuse the common part.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index 27784b6..5ec6dca 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -70,7 +70,9 @@ Clock bindings based on SCU Message Protocol
 This binding uses the common clock binding[1].
 
 Required properties:
-- compatible:		Should be "fsl,imx8qxp-clock".
+- compatible:		Should be one of:
+			  "fsl,imx8qxp-clock"
+			followed by "fsl,scu-clk"
 - #clock-cells:		Should be 1. Contains the Clock ID value.
 - clocks:		List of clock specifiers, must contain an entry for
 			each required entry in clock-names
@@ -137,7 +139,7 @@ firmware {
 			  &lsio_mu1 1 3>;
 
 		clk: clk {
-			compatible = "fsl,imx8qxp-clk";
+			compatible = "fsl,imx8qxp-clk", "fsl,scu-clk";
 			#clock-cells = <1>;
 		};
 
-- 
2.7.4
