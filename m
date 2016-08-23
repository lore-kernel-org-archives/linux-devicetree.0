From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH] ARM: dts: imx6ul: set GINT to enable IOMUXC irq
Date: Wed, 24 Aug 2016 00:18:21 +0800
Message-ID: <1471969101-12455-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, linux@armlinux.org.uk, robh+dt@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org
List-Id: devicetree@vger.kernel.org

Add "fsl,imx6q-iomuxc-gpr" for IOMUXC-GPR to enable
IOMUXC irq which is required for ERR007265 software
workaround.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6ul.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 33b95d7..acc9486 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -644,7 +644,8 @@
 			};
 
 			gpr: iomuxc-gpr@020e4000 {
-				compatible = "fsl,imx6ul-iomuxc-gpr", "syscon";
+				compatible = "fsl,imx6ul-iomuxc-gpr",
+					     "fsl,imx6q-iomuxc-gpr", "syscon";
 				reg = <0x020e4000 0x4000>;
 			};
 
-- 
1.9.1
