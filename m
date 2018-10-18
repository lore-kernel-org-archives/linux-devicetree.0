From: Shyam Saini <shyam.saini@amarulasolutions.com>
Subject: [PATCH] ARM: dts: imx: Add missing stdout-path property
Date: Thu, 18 Oct 2018 20:21:28 +0530
Message-ID: <20181018145128.21117-1-shyam.saini@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com, Shyam Saini <shyam.saini@amarulasolutions.com>, jagan@amarulasolutions.com, kernel@pengutronix.de, fabio.estevam@nxp.com, michael@amarulasolutions.com, linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

This would help us to get early boot logs by passing "earlycon" to
kernel bootargs.

Further, by adding this we don't have to depend on complex earlyprintk
configs for early boot logs.

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 arch/arm/boot/dts/imx6qdl-icore.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-icore.dtsi b/arch/arm/boot/dts/imx6qdl-icore.dtsi
index 9ce993776160..f5b8ea6f7ee9 100644
--- a/arch/arm/boot/dts/imx6qdl-icore.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-icore.dtsi
@@ -49,6 +49,10 @@
 		reg = <0x10000000 0x80000000>;
 	};
 
+	chosen {
+		stdout-path = &uart4;
+	};
+
 	backlight_lvds: backlight-lvds {
 		compatible = "pwm-backlight";
 		pwms = <&pwm3 0 100000>;
-- 
2.11.0
