From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH] ARM: dts: imx6: RDU2: fix eGalax touchscreen node
Date: Mon,  5 Nov 2018 18:31:56 +0100
Message-ID: <20181105173156.3519-1-l.stach@pengutronix.de>
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
To: Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org

Use the correct compatible for the new protocol used by the firmware
on the touch controller, the GPIO wakeup isn't used in that case.
Also eGalax touch needs axis swapping, just as with the RMI4 touch.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi b/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
index 7fff3717cf7c..315d0e7615f3 100644
--- a/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
@@ -609,13 +609,14 @@
 	};
 
 	touchscreen@2a {
-		compatible = "eeti,egalax_ts";
+		compatible = "eeti,exc3000";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ts>;
 		reg = <0x2a>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
-		wakeup-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+		touchscreen-inverted-x;
+		touchscreen-swapped-x-y;
 		status = "disabled";
 	};
 
-- 
2.19.1
