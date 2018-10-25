From: Alex Gonzalez <alex.gonzalez@digi.com>
Subject: [PATCH v1 3/4] ARM: imx_v6_v7_defconfig: Select TOUCHSCREEN_GOODIX
Date: Thu, 25 Oct 2018 17:09:32 +0200
Message-ID: <1540480173-12009-4-git-send-email-alex.gonzalez@digi.com>
References: <1540480173-12009-1-git-send-email-alex.gonzalez@digi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540480173-12009-1-git-send-email-alex.gonzalez@digi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org, shawnguo@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alex.gonzalez@digi.com
List-Id: devicetree@vger.kernel.org

Select CONFIG_TOUCHSCREEN_GOODIX so that we can have functional touch
screen by default on Digi International's AUO/Goodix LCD accessory kit used
with the ConnectCore 6UL SBC Pro (ccimx6ulsbcpro) board.

Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 7eca43ff69bb..d6e947307d67 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -170,6 +170,7 @@ CONFIG_MOUSE_PS2_ELANTECH=y
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ADS7846=y
 CONFIG_TOUCHSCREEN_EGALAX=y
+CONFIG_TOUCHSCREEN_GOODIX=y
 CONFIG_TOUCHSCREEN_MAX11801=y
 CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
 CONFIG_TOUCHSCREEN_EDT_FT5X06=y
