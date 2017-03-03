From: Ken Lin <yungching0725@gmail.com>
Subject: [PATCH] ARM: dts: imx6q-bx50v3/imx6q-b450v3/imx6q-b650v3: fix at25
 spi-clk frequency issue
Date: Sat,  4 Mar 2017 05:20:32 +0800
Message-ID: <20170303212032.31725-1-yungching0725@gmail.com>
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
To: shawnguo@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, inux@armlinux.org.uk, robh+dt@kernel.org, akshay.bhat@timesys.com, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-arm-kernel@lists.infradead.org, peter.stretz@advantech.com
List-Id: devicetree@vger.kernel.org

Change the maxium spi clock frequency from 20MHz to 10MHz to meet the operation voltage range requirement recommended in AT25 datasheet

Signed-off-by: Ken Lin <yungching0725@gmail.com>
---
 arch/arm/boot/dts/imx6q-bx50v3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
index f99e6efda3e2..614c40e5f772 100644
--- a/arch/arm/boot/dts/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
@@ -103,7 +103,7 @@
 
 	m25_eeprom: m25p80@0 {
 		compatible = "atmel,at25";
-		spi-max-frequency = <20000000>;
+		spi-max-frequency = <10000000>;
 		size = <0x8000>;
 		pagesize = <64>;
 		reg = <0>;
-- 
2.11.0
