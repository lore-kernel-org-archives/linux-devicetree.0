From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH 2/4] dt-bindings: clock: imx-lpcg: add support to parse clocks
 from device tree
Date: Thu, 21 Feb 2019 18:03:47 +0000
Message-ID: <1550771836-10014-3-git-send-email-aisheng.dong@nxp.com>
References: <1550771836-10014-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550771836-10014-1-git-send-email-aisheng.dong@nxp.com>
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
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

MX8QM and MX8QXP LPCG Clocks are mostly the same except they may reside
in different subsystems across CPUs and also vary a bit on the availability.

Same as SCU clock, we want to move the clock definition into device tree
which can fully decouple the dependency of Clock ID definition from device
tree. And no frequent changes required in clock driver any more to handle
the difference.

We can use the existence of clock nodes in device tree to address the
device and clock availability differences across different SoCs.

Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
index 965cfa4..a317844 100644
--- a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
+++ b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
@@ -11,6 +11,20 @@ enabled by these control bits, it might still not be running based
 on the base resource.
 
 Required properties:
+- compatible:		Should be one of:
+			  "fsl,imx8qxp-lpcg"
+			  "fsl,imx8qm-lpcg" followed by "fsl,imx8qxp-lpcg".
+- reg:			Address and length of the register set.
+- #clock-cells:		Should be 1. One LPCG supports multiple clocks.
+- clocks:		Input parent clocks phandle array for each clock.
+- bit-offset:		An integer array indicating the bit offset for each clock.
+- hw-autogate:		Boolean array indicating whether supports HW autogate for
+			each clock.
+- clock-output-names:	Shall be the corresponding names of the outputs.
+			NOTE this property must be specified in the same order
+			as the clock bit-offset and hw-autogate property.
+
+Legacy binding (DEPRECATED):
 - compatible:	Should be one of:
 		  "fsl,imx8qxp-lpcg-adma",
 		  "fsl,imx8qxp-lpcg-conn",
-- 
2.7.4
