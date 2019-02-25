From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 5/5] arm64: dts: imx8qm: Enable wm8524 codec
Date: Mon, 25 Feb 2019 13:17:50 +0000
Message-ID: <20190225131722.10253-5-daniel.baluta@nxp.com>
References: <20190225131722.10253-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190225131722.10253-1-daniel.baluta@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "baruch@tkos.co.il" <baruch@tkos.co.il>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, Daniel Baluta <daniel.baluta@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

This uses simple-audio-card machine driver adding 1 CPU DAI
and 1 Codec DAI.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index 58de4a3d6029..77f590c13ee0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -31,6 +31,35 @@
 		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	wm8524: audio-codec-0 {
+		#sound-dai-cells = <0>;
+		compatible = "wlf,wm8524";
+		clocks = <&clk IMX8MQ_CLK_SAI2_ROOT>;
+		clock-names = "mclk";
+		wlf,mute-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+	};
+
+	sound-wm8524 {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "wm8524-audio";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&cpudai>;
+		simple-audio-card,bitclock-master = <&cpudai>;
+		simple-audio-card,widgets =
+			"Line", "Left Line Out Jack",
+			"Line", "Right Line Out Jack";
+		simple-audio-card,routing =
+			"Left Line Out Jack", "LINEVOUTL",
+			"Right Line Out Jack", "LINEVOUTR";
+		cpudai: simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+		link_codec: simple-audio-card,codec {
+			sound-dai = <&wm8524>;
+			clocks = <&clk IMX8MQ_CLK_SAI2_ROOT>;
+		};
+	};
 };
 
 &fec1 {
-- 
2.17.1
