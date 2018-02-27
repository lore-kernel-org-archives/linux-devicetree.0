From: shyam saini <mayhs11saini@gmail.com>
Subject: [PATCH] ARM: dts: imx6dl-icore-rqs: Fix invalid PHY address
 assignment for ethernet
Date: Tue, 27 Feb 2018 21:29:03 +0530
Message-ID: <1519747143-3036-1-git-send-email-mayhs11saini@gmail.com>
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
Cc: devicetree@vger.kernel.org, Shyam Saini <shyam@amarulasolutions.com>, robh+dt@kernel.org, jagan@amarulasolutions.com, kernel@pengutronix.de, fabio.estevam@nxp.com, michael@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Shyam Saini <shyam@amarulasolutions.com>

Add "reg" property for ethernet to fix this issue.

Errors in boot logs:
mdio_bus 2188000.ethernet-1:
/soc/aips-bus@02100000/ethernet@02188000/mdio/ethernet-phy
has invalid PHY address

mdio_bus 2188000.ethernet-1: scan phy ethernet-phy at address 0
mdio_bus 2188000.ethernet-1: scan phy ethernet-phy at address 1
mdio_bus 2188000.ethernet-1: scan phy ethernet-phy at address 2
mdio_bus 2188000.ethernet-1: scan phy ethernet-phy at address 3

Reported-by: Shyam Saini <shyam@amarulasolutions.com>
Suggested-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Shyam Saini <shyam@amarulasolutions.com>
---
 arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi b/arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi
index 49daa2b7892d..acc3b11fba2a 100644
--- a/arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi
@@ -200,7 +200,11 @@
 	status = "okay";
 
 	mdio {
-		eth_phy: ethernet-phy {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy: ethernet-phy@0 {
+			reg = <0x0>;
 			rxc-skew-ps = <1140>;
 			txc-skew-ps = <1140>;
 			txen-skew-ps = <600>;
-- 
2.7.4
