From: Anson.Huang@nxp.com
Subject: [PATCH 3/3] arm64: defconfig: Select CONFIG_PINCTRL_IMX8MN by default
Date: Thu, 30 May 2019 11:05:46 +0800
Message-ID: <20190530030546.9224-3-Anson.Huang@nxp.com>
References: <20190530030546.9224-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530030546.9224-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org, stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, catalin.marinas@arm.com, will.deacon@arm.com, maxime.ripard@bootlin.com, olof@lixom.net, horms+renesas@verge.net.au, jagan@amarulasolutions.com, leonard.crestez@nxp.com, bjorn.andersson@linaro.org, dinguyen@kernel.org, enric.balletbo@collabora.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Enable CONFIG_PINCTRL_IMX8MN by default to support i.MX8MN
pinctrl driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7c7b6b5..8d4f25c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -373,6 +373,7 @@ CONFIG_SPI_SUN6I=y
 CONFIG_SPMI=y
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_PINCTRL_MAX77620=y
+CONFIG_PINCTRL_IMX8MN=y
 CONFIG_PINCTRL_IMX8MM=y
 CONFIG_PINCTRL_IMX8MQ=y
 CONFIG_PINCTRL_IMX8QXP=y
-- 
2.7.4
