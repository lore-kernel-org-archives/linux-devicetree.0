From: Zhou Wang <wangzhou.bry@gmail.com>
Subject: [PATCH v4 1/4] ARM: hip04: add GPIO configure in hisi_defconfig
Date: Fri,  5 Dec 2014 11:38:39 +0800
Message-ID: <1417750722-14027-2-git-send-email-wangzhou.bry@gmail.com>
References: <1417750722-14027-1-git-send-email-wangzhou.bry@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1417750722-14027-1-git-send-email-wangzhou.bry@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Haojian Zhuang <haojian.zhuang@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, liguozhu@hisilicon.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, atull@altera.com, sebastian.hesselbarth@gmail.com, bigeasy@linutronix.de, jamie@jamieiles.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, wangzhou1@hisilicon.com, Zhou Wang <wangzhou.bry@gmail.com>
List-Id: devicetree@vger.kernel.org

The GPIO controller of Hisilicon hip04 Soc uses the IP from Sysnopsis,
gpio-dwapb.c can be reused to support this GPIO controller. This patch
adds related configure items in hisi_defconfig.

Signed-off-by: Zhou Wang <wangzhou.bry@gmail.com>
---
 arch/arm/configs/hisi_defconfig |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/hisi_defconfig b/arch/arm/configs/hisi_defconfig
index 1772505..130292b 100644
--- a/arch/arm/configs/hisi_defconfig
+++ b/arch/arm/configs/hisi_defconfig
@@ -41,6 +41,9 @@ CONFIG_SPI_PL022=y
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_GPIO_GENERIC_PLATFORM=y
 CONFIG_REGULATOR_GPIO=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_DWAPB=y
+CONFIG_GPIO_SYSFS=y
 CONFIG_DRM=y
 CONFIG_FB_SIMPLE=y
 CONFIG_USB=y
-- 
1.7.9.5

