Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DAF1CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 14:33:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5B232184C
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 14:33:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbfJVOdg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 10:33:36 -0400
Received: from 20.mo5.mail-out.ovh.net ([91.121.55.239]:43458 "EHLO
        20.mo5.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfJVOdg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 10:33:36 -0400
X-Greylist: delayed 4521 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Oct 2019 10:33:33 EDT
Received: from player793.ha.ovh.net (unknown [10.108.42.75])
        by mo5.mail-out.ovh.net (Postfix) with ESMTP id 0D983254337
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 15:18:10 +0200 (CEST)
Received: from armadeus.com (lfbn-1-7591-179.w90-126.abo.wanadoo.fr [90.126.248.179])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player793.ha.ovh.net (Postfix) with ESMTPSA id 4AB2AB3E3E75;
        Tue, 22 Oct 2019 13:17:57 +0000 (UTC)
From:   =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Julien Boibessot <julien.boibessot@armadeus.com>,
        =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Subject: [PATCH 2/9] ARM: dts: imx6qdl-{apf6,apf6dev}: remove container node around pinctrl nodes
Date:   Tue, 22 Oct 2019 15:16:48 +0200
Message-Id: <20191022131655.25737-3-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191022131655.25737-1-sebastien.szymanski@armadeus.com>
References: <20191022131655.25737-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 113152942423888965
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeejgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Remove the function node around the pinctrl nodes that was obsoleted
by commit 5fcdf6a7ed95 ("pinctrl: imx: Allow parsing DT without
function nodes").

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---
 arch/arm/boot/dts/imx6qdl-apf6.dtsi    | 112 +++++----
 arch/arm/boot/dts/imx6qdl-apf6dev.dtsi | 306 ++++++++++++-------------
 2 files changed, 207 insertions(+), 211 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-apf6.dtsi b/arch/arm/boot/dts/imx6qdl-apf6.dtsi
index 392a71f99aaa..10981c74c90d 100644
--- a/arch/arm/boot/dts/imx6qdl-apf6.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apf6.dtsi
@@ -51,65 +51,63 @@
 };
 
 &iomuxc {
-	apf6 {
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b8b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
-				MX6QDL_PAD_ENET_RX_ER__GPIO1_IO24	0x130b0
-				MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28	0x130b0
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x13030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x13030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1f030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1f030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x13030
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b8b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_ENET_RX_ER__GPIO1_IO24	0x130b0
+			MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28	0x130b0
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x13030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x13030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1f030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1f030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x13030
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b0
-				MX6QDL_PAD_SD4_DAT5__UART2_RTS_B	0x1b0b0
-				MX6QDL_PAD_SD4_DAT6__UART2_CTS_B	0x1b0b0
-				MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b0
-				MX6QDL_PAD_SD4_DAT3__GPIO2_IO11		0x130b0 /* BT_EN */
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b0
+			MX6QDL_PAD_SD4_DAT5__UART2_RTS_B	0x1b0b0
+			MX6QDL_PAD_SD4_DAT6__UART2_CTS_B	0x1b0b0
+			MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b0
+			MX6QDL_PAD_SD4_DAT3__GPIO2_IO11		0x130b0 /* BT_EN */
+		>;
+	};
 
-		pinctrl_usdhc1: usdhc1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_CMD__SD1_CMD	0x17059
-				MX6QDL_PAD_SD1_CLK__SD1_CLK	0x10059
-				MX6QDL_PAD_SD1_DAT0__SD1_DATA0	0x17059
-				MX6QDL_PAD_SD1_DAT1__SD1_DATA1	0x17059
-				MX6QDL_PAD_SD1_DAT2__SD1_DATA2	0x17059
-				MX6QDL_PAD_SD1_DAT3__SD1_DATA3	0x17059
-				MX6QDL_PAD_SD4_DAT0__GPIO2_IO08	0x1b0b0 /* WL_EN */
-				MX6QDL_PAD_SD4_DAT2__GPIO2_IO10	0x1b0b0 /* WL_IRQ */
-			>;
-		};
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__SD1_CMD	0x17059
+			MX6QDL_PAD_SD1_CLK__SD1_CLK	0x10059
+			MX6QDL_PAD_SD1_DAT0__SD1_DATA0	0x17059
+			MX6QDL_PAD_SD1_DAT1__SD1_DATA1	0x17059
+			MX6QDL_PAD_SD1_DAT2__SD1_DATA2	0x17059
+			MX6QDL_PAD_SD1_DAT3__SD1_DATA3	0x17059
+			MX6QDL_PAD_SD4_DAT0__GPIO2_IO08	0x1b0b0 /* WL_EN */
+			MX6QDL_PAD_SD4_DAT2__GPIO2_IO10	0x1b0b0 /* WL_IRQ */
+		>;
+	};
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD	0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK	0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0	0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1	0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2	0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3	0x17059
-				MX6QDL_PAD_SD3_DAT4__SD3_DATA4	0x17059
-				MX6QDL_PAD_SD3_DAT5__SD3_DATA5	0x17059
-				MX6QDL_PAD_SD3_DAT6__SD3_DATA6	0x17059
-				MX6QDL_PAD_SD3_DAT7__SD3_DATA7	0x17059
-			>;
-		};
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD	0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK	0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0	0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1	0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2	0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3	0x17059
+			MX6QDL_PAD_SD3_DAT4__SD3_DATA4	0x17059
+			MX6QDL_PAD_SD3_DAT5__SD3_DATA5	0x17059
+			MX6QDL_PAD_SD3_DAT6__SD3_DATA6	0x17059
+			MX6QDL_PAD_SD3_DAT7__SD3_DATA7	0x17059
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi b/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
index 0c389bcc9d8c..7cf41a9450b8 100644
--- a/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
@@ -254,178 +254,176 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpios>;
 
-	apf6dev {
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT4__AUD3_TXC  0x1b0b0
-				MX6QDL_PAD_CSI0_DAT5__AUD3_TXD  0x1b0b0
-				MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS 0x1b0b0
-				MX6QDL_PAD_CSI0_DAT7__AUD3_RXD  0x1b0b0
-				MX6QDL_PAD_GPIO_0__CCM_CLKO1    0x130b0
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT4__AUD3_TXC  0x1b0b0
+			MX6QDL_PAD_CSI0_DAT5__AUD3_TXD  0x1b0b0
+			MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS 0x1b0b0
+			MX6QDL_PAD_CSI0_DAT7__AUD3_RXD  0x1b0b0
+			MX6QDL_PAD_GPIO_0__CCM_CLKO1    0x130b0
+		>;
+	};
 
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL1__ECSPI1_MISO 0x100b1
-				MX6QDL_PAD_KEY_ROW0__ECSPI1_MOSI 0x100b1
-				MX6QDL_PAD_KEY_COL0__ECSPI1_SCLK 0x100b1
-				MX6QDL_PAD_KEY_ROW1__GPIO4_IO09  0x1b0b0
-				MX6QDL_PAD_KEY_ROW2__GPIO4_IO11  0x1b0b0
-				MX6QDL_PAD_KEY_COL2__GPIO4_IO10  0x1b0b0
-			>;
-		};
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL1__ECSPI1_MISO 0x100b1
+			MX6QDL_PAD_KEY_ROW0__ECSPI1_MOSI 0x100b1
+			MX6QDL_PAD_KEY_COL0__ECSPI1_SCLK 0x100b1
+			MX6QDL_PAD_KEY_ROW1__GPIO4_IO09  0x1b0b0
+			MX6QDL_PAD_KEY_ROW2__GPIO4_IO11  0x1b0b0
+			MX6QDL_PAD_KEY_COL2__GPIO4_IO10  0x1b0b0
+		>;
+	};
 
-		pinctrl_flexcan2: flexcan2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL4__FLEXCAN2_TX 0x1b0b0
-				MX6QDL_PAD_KEY_ROW4__FLEXCAN2_RX 0x1b0b0
-			>;
-		};
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL4__FLEXCAN2_TX 0x1b0b0
+			MX6QDL_PAD_KEY_ROW4__FLEXCAN2_RX 0x1b0b0
+		>;
+	};
 
-		pinctrl_gpio_keys: gpiokeysgrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_9__GPIO1_IO09 0x1b0b0
-			>;
-		};
+	pinctrl_gpio_keys: gpiokeysgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_9__GPIO1_IO09 0x1b0b0
+		>;
+	};
 
-		pinctrl_gpio_leds: gpioledsgrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_17__GPIO7_IO12 0x130b0
-			>;
-		};
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_17__GPIO7_IO12 0x130b0
+		>;
+	};
 
-		pinctrl_gpios: gpiosgrp {
-			fsl,pins = <
-				MX6QDL_PAD_DI0_PIN4__GPIO4_IO20		0x100b1
-				MX6QDL_PAD_DISP0_DAT18__GPIO5_IO12	0x100b1
-				MX6QDL_PAD_DISP0_DAT19__GPIO5_IO13	0x100b1
-				MX6QDL_PAD_DISP0_DAT20__GPIO5_IO14	0x100b1
-				MX6QDL_PAD_DISP0_DAT21__GPIO5_IO15	0x100b1
-				MX6QDL_PAD_DISP0_DAT22__GPIO5_IO16	0x100b1
-				MX6QDL_PAD_DISP0_DAT23__GPIO5_IO17	0x100b1
-				MX6QDL_PAD_CSI0_PIXCLK__GPIO5_IO18	0x100b1
-				MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21	0x100b1
-			>;
-		};
+	pinctrl_gpios: gpiosgrp {
+		fsl,pins = <
+			MX6QDL_PAD_DI0_PIN4__GPIO4_IO20		0x100b1
+			MX6QDL_PAD_DISP0_DAT18__GPIO5_IO12	0x100b1
+			MX6QDL_PAD_DISP0_DAT19__GPIO5_IO13	0x100b1
+			MX6QDL_PAD_DISP0_DAT20__GPIO5_IO14	0x100b1
+			MX6QDL_PAD_DISP0_DAT21__GPIO5_IO15	0x100b1
+			MX6QDL_PAD_DISP0_DAT22__GPIO5_IO16	0x100b1
+			MX6QDL_PAD_DISP0_DAT23__GPIO5_IO17	0x100b1
+			MX6QDL_PAD_CSI0_PIXCLK__GPIO5_IO18	0x100b1
+			MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21	0x100b1
+		>;
+	};
 
-		pinctrl_gsm: gsmgrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_4__GPIO1_IO04  0x130b0 /* GSM_POKIN */
-				MX6QDL_PAD_GPIO_18__GPIO7_IO13 0x130b0 /* GSM_PWR_EN */
-			>;
-		};
+	pinctrl_gsm: gsmgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_4__GPIO1_IO04  0x130b0 /* GSM_POKIN */
+			MX6QDL_PAD_GPIO_18__GPIO7_IO13 0x130b0 /* GSM_PWR_EN */
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT8__I2C1_SDA 0x4001b8b1
-				MX6QDL_PAD_CSI0_DAT9__I2C1_SCL 0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT8__I2C1_SDA 0x4001b8b1
+			MX6QDL_PAD_CSI0_DAT9__I2C1_SCL 0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL 0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA 0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL 0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA 0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_6__I2C3_SDA 0x4001b8b1
-				MX6QDL_PAD_GPIO_5__I2C3_SCL 0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_6__I2C3_SDA 0x4001b8b1
+			MX6QDL_PAD_GPIO_5__I2C3_SCL 0x4001b8b1
+		>;
+	};
 
-		pinctrl_ipu1_disp1: ipu1disp1grp {
-			fsl,pins = <
-				MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK	0x100b1
-				MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15		0x100b1
-				MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02		0x100b1
-				MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03		0x100b1
-				MX6QDL_PAD_DISP0_DAT0__IPU1_DISP0_DATA00	0x100b1
-				MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01	0x100b1
-				MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02	0x100b1
-				MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03	0x100b1
-				MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04	0x100b1
-				MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05	0x100b1
-				MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06	0x100b1
-				MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07	0x100b1
-				MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08	0x100b1
-				MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09	0x100b1
-				MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10	0x100b1
-				MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11	0x100b1
-				MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12	0x100b1
-				MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13	0x100b1
-				MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14	0x100b1
-				MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15	0x100b1
-				MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16	0x100b1
-				MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17	0x100b1
-			>;
-		};
+	pinctrl_ipu1_disp1: ipu1disp1grp {
+		fsl,pins = <
+			MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK	0x100b1
+			MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15		0x100b1
+			MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02		0x100b1
+			MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03		0x100b1
+			MX6QDL_PAD_DISP0_DAT0__IPU1_DISP0_DATA00	0x100b1
+			MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01	0x100b1
+			MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02	0x100b1
+			MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03	0x100b1
+			MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04	0x100b1
+			MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05	0x100b1
+			MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06	0x100b1
+			MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07	0x100b1
+			MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08	0x100b1
+			MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09	0x100b1
+			MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10	0x100b1
+			MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11	0x100b1
+			MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12	0x100b1
+			MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13	0x100b1
+			MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14	0x100b1
+			MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15	0x100b1
+			MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16	0x100b1
+			MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17	0x100b1
+		>;
+	};
 
-		pinctrl_pcie: pciegrp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT16__GPIO6_IO02 0x130b0
-			>;
-		};
+	pinctrl_pcie: pciegrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT16__GPIO6_IO02 0x130b0
+		>;
+	};
 
-		pinctrl_pwm3: pwm3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_DAT1__PWM3_OUT 0x1b0b1
-			>;
-		};
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT1__PWM3_OUT 0x1b0b1
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA 0x1b0b0
-				MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA 0x1b0b0
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA 0x1b0b0
+			MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA 0x1b0b0
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D23__UART3_CTS_B   0x1b0b0
-				MX6QDL_PAD_EIM_D24__UART3_TX_DATA 0x1b0b0
-				MX6QDL_PAD_EIM_D25__UART3_RX_DATA 0x1b0b0
-				MX6QDL_PAD_EIM_D31__UART3_RTS_B   0x1b0b0
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D23__UART3_CTS_B   0x1b0b0
+			MX6QDL_PAD_EIM_D24__UART3_TX_DATA 0x1b0b0
+			MX6QDL_PAD_EIM_D25__UART3_RX_DATA 0x1b0b0
+			MX6QDL_PAD_EIM_D31__UART3_RTS_B   0x1b0b0
+		>;
+	};
 
-		pinctrl_uart4: uart4grp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT12__UART4_TX_DATA 0x1b0b0
-				MX6QDL_PAD_CSI0_DAT13__UART4_RX_DATA 0x1b0b0
-			>;
-		};
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT12__UART4_TX_DATA 0x1b0b0
+			MX6QDL_PAD_CSI0_DAT13__UART4_RX_DATA 0x1b0b0
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x1b0b0
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x1b0b0
+		>;
+	};
 
-		pinctrl_usdhc2: usdhc2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_CMD__SD2_CMD    0x17059
-				MX6QDL_PAD_SD2_CLK__SD2_CLK    0x10059
-				MX6QDL_PAD_SD2_DAT0__SD2_DATA0 0x17059
-				MX6QDL_PAD_SD2_DAT1__SD2_DATA1 0x17059
-				MX6QDL_PAD_SD2_DAT2__SD2_DATA2 0x17059
-				MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x17059
-			>;
-		};
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_CMD__SD2_CMD    0x17059
+			MX6QDL_PAD_SD2_CLK__SD2_CLK    0x10059
+			MX6QDL_PAD_SD2_DAT0__SD2_DATA0 0x17059
+			MX6QDL_PAD_SD2_DAT1__SD2_DATA1 0x17059
+			MX6QDL_PAD_SD2_DAT2__SD2_DATA2 0x17059
+			MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x17059
+		>;
+	};
 
-		pinctrl_spdif: spdifgrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_19__SPDIF_OUT 0x1b0b0
-			>;
-		};
+	pinctrl_spdif: spdifgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_19__SPDIF_OUT 0x1b0b0
+		>;
+	};
 
-		pinctrl_touchscreen: touchscreengrp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT17__GPIO6_IO03 0x1b0b0
-			>;
-		};
+	pinctrl_touchscreen: touchscreengrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT17__GPIO6_IO03 0x1b0b0
+		>;
 	};
 };
-- 
2.21.0

