From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V2 2/2] ARM: dts: imx6sx-sabreauto: add external 24MHz clock source
Date: Mon, 19 Mar 2018 10:30:45 +0800
Message-ID: <1521426645-19246-2-git-send-email-Anson.Huang@nxp.com>
References: <1521426645-19246-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521426645-19246-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org, shengjiu.wang@nxp.com
Cc: Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On i.MX6SX SabreAuto board, there is external 24MHz clock
source for analog clock2, add this clock source to clock tree.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
changes since V1:
	remove unnecessary clocks container.
 arch/arm/boot/dts/imx6sx-sabreauto.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx-sabreauto.dts b/arch/arm/boot/dts/imx6sx-sabreauto.dts
index 72da5ac..a3b022b 100644
--- a/arch/arm/boot/dts/imx6sx-sabreauto.dts
+++ b/arch/arm/boot/dts/imx6sx-sabreauto.dts
@@ -18,6 +18,12 @@
 		reg = <0x80000000 0x80000000>;
 	};
 
+	codec_osc: anaclk2 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <24576000>;
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.7.4
