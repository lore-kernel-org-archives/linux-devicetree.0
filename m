From: Sherman Yin <syin@broadcom.com>
Subject: [PATCH v2 3/4] Update bcm_defconfig with new pinctrl CONFIG
Date: Thu, 23 Jan 2014 12:44:46 -0800
Message-ID: <1390509887-19278-4-git-send-email-syin@broadcom.com>
References: <1390343886-25852-1-git-send-email-syin@broadcom.com>
 <1390509887-19278-1-git-send-email-syin@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1390509887-19278-1-git-send-email-syin@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Christian Daudt <bcm@fixthebug.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Sherman Yin <syin@broadcom.com>
List-Id: devicetree@vger.kernel.org

To be consistent with other Broadcom drivers, the Broadcom Capri pinctrl
driver and its related CONFIG option are renamed to bcm281xx.

This commit updates the defconfig that enables the pinctrl driver.

Signed-off-by: Sherman Yin <syin@broadcom.com>
Reviewed-by: Matt Porter <mporter@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/configs/bcm_defconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/bcm_defconfig b/arch/arm/configs/bcm_defconfig
index bede511..53d6d47 100644
--- a/arch/arm/configs/bcm_defconfig
+++ b/arch/arm/configs/bcm_defconfig
@@ -126,4 +126,4 @@ CONFIG_CRC_ITU_T=y
 CONFIG_CRC7=y
 CONFIG_XZ_DEC=y
 CONFIG_AVERAGE=y
-CONFIG_PINCTRL_CAPRI=y
+CONFIG_PINCTRL_BCM281XX=y
-- 
1.7.9.5
