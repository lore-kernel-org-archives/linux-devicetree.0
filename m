From: Anson.Huang@nxp.com
Subject: [PATCH V2 3/3] arm64: defconfig: Select CONFIG_PINCTRL_IMX8MN by default
Date: Tue, 11 Jun 2019 20:25:35 +0800
Message-ID: <20190611122535.23583-3-Anson.Huang@nxp.com>
References: <20190611122535.23583-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611122535.23583-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org, stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, catalin.marinas@arm.com, will.deacon@arm.com, maxime.ripard@bootlin.com, olof@lixom.net, horms+renesas@verge.net.au, jagan@amarulasolutions.com, bjorn.andersson@linaro.org, leonard.crestez@nxp.com, dinguyen@kernel.org, enric.balletbo@collabora.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Enable CONFIG_PINCTRL_IMX8MN by default to support i.MX8MN
pinctrl driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
Changes since V1:
	- sort the change in alphabet order.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9e6e07e..a47b0d6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -374,6 +374,7 @@ CONFIG_SPMI=y
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_IMX8MM=y
+CONFIG_PINCTRL_IMX8MN=y
 CONFIG_PINCTRL_IMX8MQ=y
 CONFIG_PINCTRL_IMX8QXP=y
 CONFIG_PINCTRL_IPQ8074=y
-- 
2.7.4
