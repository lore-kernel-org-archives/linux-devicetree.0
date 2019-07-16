From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v2 02/15] arm64: dts: imx8qxp: move scu pd node before scu
 clock node
Date: Tue, 16 Jul 2019 23:14:36 +0800
Message-ID: <1563290089-11085-3-git-send-email-aisheng.dong@nxp.com>
References: <1563290089-11085-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1563290089-11085-1-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, dongas86@gmail.com, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, Mark Rutland <mark.rutland@arm.com>, shawnguo@kernel.org
List-Id: devicetree@vger.kernel.org

SCU clock depends on SCU Power domain. So let's move scu pd node
before scu clock to make it probe earlier.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
 v2: new patch
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index af6d720..6177fad 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -138,6 +138,11 @@
 			  &lsio_mu1 1 3
 			  &lsio_mu1 3 3>;
 
+		pd: imx8qx-pd {
+			compatible = "fsl,imx8qxp-scu-pd", "fsl,scu-pd";
+			#power-domain-cells = <1>;
+		};
+
 		clk: clock-controller {
 			compatible = "fsl,imx8qxp-clk";
 			#clock-cells = <1>;
@@ -155,11 +160,6 @@
 			#size-cells = <1>;
 		};
 
-		pd: imx8qx-pd {
-			compatible = "fsl,imx8qxp-scu-pd", "fsl,scu-pd";
-			#power-domain-cells = <1>;
-		};
-
 		rtc: rtc {
 			compatible = "fsl,imx8qxp-sc-rtc";
 		};
-- 
2.7.4
