From: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] ARM: dts: imx7s-warp: PMIC swbst boot-on/always-on
Date: Sat,  2 Mar 2019 23:32:29 +0100
Message-ID: <1551565949-13843-1-git-send-email-pjtexier@koncepto.io>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pierre-Jean Texier <pjtexier@koncepto.io>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

PMIC swbst regulator is used for the MikroBUS socket (pin +5V).

We have to set the regulator to "boot-on" and "always-on"
to output a voltage of 5V on this socket.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 arch/arm/boot/dts/imx7s-warp.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s-warp.dts b/arch/arm/boot/dts/imx7s-warp.dts
index 23431fa..b1e9562 100644
--- a/arch/arm/boot/dts/imx7s-warp.dts
+++ b/arch/arm/boot/dts/imx7s-warp.dts
@@ -121,6 +121,8 @@
 			swbst_reg: swbst {
 				regulator-min-microvolt = <5000000>;
 				regulator-max-microvolt = <5150000>;
+				regulator-boot-on;
+				regulator-always-on;
 			};
 
 			snvs_reg: vsnvs {
-- 
2.7.4
