Return-Path: <SRS0=kndj=O5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00072.outbound.protection.outlook.com ([40.107.0.72]:35904
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725775AbeLTJIq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 20 Dec 2018 04:08:46 -0500
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V5 3/4] defconfig: arm64: add i.MX system controller thermal
 support
Date: Thu, 20 Dec 2018 09:08:42 +0000
Message-ID: <1545296609-20477-4-git-send-email-Anson.Huang@nxp.com>
References: <1545296609-20477-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1545296609-20477-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Andy Gross <andy.gross@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

This patch enables CONFIG_IMX_SC_THERMAL as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change since V4.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index abd80c5..9f12324 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -376,6 +376,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=3Dm
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
 CONFIG_CPU_THERMAL=3Dy
 CONFIG_THERMAL_EMULATION=3Dy
+CONFIG_IMX_SC_THERMAL=3Dm
 CONFIG_ROCKCHIP_THERMAL=3Dm
 CONFIG_RCAR_GEN3_THERMAL=3Dy
 CONFIG_ARMADA_THERMAL=3Dy
--=20
2.7.4
