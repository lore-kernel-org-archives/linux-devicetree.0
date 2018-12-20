Return-Path: <SRS0=JDpP=O5=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V5 3/4] defconfig: arm64: add i.MX system controller RTC
 support
Date: Thu, 20 Dec 2018 08:56:25 +0000
Message-ID: <1545295872-20169-4-git-send-email-Anson.Huang@nxp.com>
References: <1545295872-20169-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1545295872-20169-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Aisheng Dong <aisheng.dong@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, Andy Gross <andy.gross@linaro.org>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "arnd@arndb.de" <arnd@arndb.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

This patch enables CONFIG_RTC_DRV_IMX_SC as module by default.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change since V4.
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
