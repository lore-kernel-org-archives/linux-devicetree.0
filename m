Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr50067.outbound.protection.outlook.com ([40.107.5.67]:34688
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727382AbeK1U66 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Nov 2018 15:58:58 -0500
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V3 3/4] defconfig: arm64: add i.MX system controller RTC
 support
Date: Wed, 28 Nov 2018 09:57:37 +0000
Message-ID: <1543398696-3140-4-git-send-email-Anson.Huang@nxp.com>
References: <1543398696-3140-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1543398696-3140-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng DONG <aisheng.dong@nxp.com>, Andy Gross <andy.gross@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olof@lixom.net>, "LW@KARO-electronics.de" <LW@KARO-electronics.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

This patch enables CONFIG_RTC_DRV_IMX_SC as module by default.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d3aa3f7..abd80c5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -572,6 +572,7 @@ CONFIG_RTC_DRV_PL031=3Dy
 CONFIG_RTC_DRV_SUN6I=3Dy
 CONFIG_RTC_DRV_ARMADA38X=3Dy
 CONFIG_RTC_DRV_TEGRA=3Dy
+CONFIG_RTC_DRV_IMX_SC=3Dm
 CONFIG_RTC_DRV_XGENE=3Dy
 CONFIG_DMADEVICES=3Dy
 CONFIG_DMA_BCM2835=3Dm
--=20
2.7.4
