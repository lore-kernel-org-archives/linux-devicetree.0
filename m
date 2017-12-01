From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 02/12] ARM: dts: imx51-zii-rdu1: Add the unit addresses in
 sysled
Date: Fri,  1 Dec 2017 17:24:35 -0200
Message-ID: <1512156285-18451-2-git-send-email-festevam@gmail.com>
References: <1512156285-18451-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1512156285-18451-1-git-send-email-festevam@gmail.com>
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
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam@nxp.com>

As described at Documentation/devicetree/bindings/mfd/mc13xxx.txt the
reg property is mandatory, so add the corresponding unit address in
order to fix the following build warnings with W=1:

arch/arm/boot/dts/imx51-zii-rdu1.dtb: Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
arch/arm/boot/dts/imx51-zii-rdu1.dtb: Warning (unit_address_vs_reg): Node /soc/aips@70000000/spba@70000000/ecspi@70010000/pmic@0/leds/sysled0 has a reg or ranges property, but no unit name
arch/arm/boot/dts/imx51-zii-rdu1.dtb: Warning (unit_address_vs_reg): Node /soc/aips@70000000/spba@70000000/ecspi@70010000/pmic@0/leds/sysled1 has a reg or ranges property, but no unit name

Cc: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 arch/arm/boot/dts/imx51-zii-rdu1.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx51-zii-rdu1.dts b/arch/arm/boot/dts/imx51-zii-rdu1.dts
index f9fdb7c..70fdcdd 100644
--- a/arch/arm/boot/dts/imx51-zii-rdu1.dts
+++ b/arch/arm/boot/dts/imx51-zii-rdu1.dts
@@ -428,13 +428,13 @@
 			#size-cells = <0>;
 			led-control = <0x0 0x0 0x3f83f8 0x0>;
 
-			sysled0 {
+			sysled0@3 {
 				reg = <3>;
 				label = "system:green:status";
 				linux,default-trigger = "default-on";
 			};
 
-			sysled1 {
+			sysled1@4 {
 				reg = <4>;
 				label = "system:green:act";
 				linux,default-trigger = "heartbeat";
-- 
2.7.4
