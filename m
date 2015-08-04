Return-Path: <linux-arm-kernel-bounces+robherring2=gmail.com@lists.infradead.org>
From: Anson Huang <b20788@freescale.com>
Subject: [PATCH 1/3] ARM: dts: imx6ul: add sram support for i.mx6ul
Date: Wed, 5 Aug 2015 01:48:35 +0800
Message-ID: <1438710517-6515-1-git-send-email-b20788@freescale.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+robherring2=gmail.com@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: shawnguo@kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Add SRAM support for i.MX6UL, it has 128KB ocram
starting from 0x900000.

Signed-off-by: Anson Huang <b20788@freescale.com>
---
 arch/arm/boot/dts/imx6ul.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index b6c6c31..227ba6e 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -133,6 +133,11 @@
 			status = "disabled";
 		};
 
+		ocram: sram@00900000 {
+			compatible = "mmio-sram";
+			reg = <0x00900000 0x20000>;
+		};
+
 		aips1: aips-bus@02000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
-- 
1.9.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
