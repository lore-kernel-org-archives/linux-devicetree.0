From: Adrian Alonso <aalonso@freescale.com>
Subject: [PATCH 2/4][v2] ARM: dts: imx: imx7d add iomuxc lpsr register base
 address
Date: Mon, 6 Jul 2015 17:59:04 -0500
Message-ID: <1436223546-6333-2-git-send-email-aalonso@freescale.com>
References: <1436223546-6333-1-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1436223546-6333-1-git-send-email-aalonso@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com
Cc: devicetree@vger.kernel.org, Frank.Li@freescale.com, nitin.garg@freescale.com, Anson.Huang@freescale.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org, yibin.gong@freescale.com
List-Id: devicetree@vger.kernel.org

* Add iomuxc lpsr register base address to extend
  pinctrl-imx driver to support the iomux settings for pins
  that support LPSR operation mode.

Signed-off-by: Adrian Alonso <aalonso@freescale.com>
---
 arch/arm/boot/dts/imx7d.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index c42cf8d..294a6c6 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -253,7 +253,7 @@
 
 			iomuxc: iomuxc@30330000 {
 				compatible = "fsl,imx7d-iomuxc";
-				reg = <0x30330000 0x10000>;
+				reg = <0x30330000 0x10000>, <0x302c0000 0x10000>;
 			};
 
 			gpr: iomuxc-gpr@30340000 {
-- 
2.1.4
