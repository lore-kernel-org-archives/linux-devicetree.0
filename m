From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH v2 2/2] arm64: dts: imx8mq-librem5: Enable MIPI D-PHY
Date: Mon, 15 Jul 2019 12:43:06 +0200
Message-ID: <f80df8fcae320eb6eb4937fb5a07799fc610adae.1563187253.git.agx@sigxcpu.org>
References: <cover.1563187253.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1563187253.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This enables the Mixel MIPI D-PHY on the Librem 5 devkit

Signed-off-by: Guido Günther <agx@sigxcpu.org>
Acked-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
index 5179e22f5126..683a11035643 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
@@ -174,6 +174,10 @@
 	assigned-clock-rates = <786432000>, <722534400>;
 };
 
+&dphy {
+	status = "okay";
+};
+
 &fec1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec1>;
-- 
2.20.1
