Return-Path: <SRS0=4we3=Q3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr40062.outbound.protection.outlook.com ([40.107.4.62]:28160
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725890AbfBTGxx (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 20 Feb 2019 01:53:53 -0500
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V7 3/4] defconfig: arm64: add i.MX system controller thermal
 support
Date: Wed, 20 Feb 2019 06:53:49 +0000
Message-ID: <1550645332-2907-3-git-send-email-Anson.Huang@nxp.com>
References: <1550645332-2907-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1550645332-2907-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, Andy Gross <andy.gross@linaro.org>, "heiko@sntech.de" <heiko@sntech.de>, "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

This patch enables CONFIG_IMX_SC_THERMAL as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No changes since V6.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2d9c390..52d503e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -413,6 +413,7 @@ CONFIG_SENSORS_INA2XX=3Dm
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
 CONFIG_CPU_THERMAL=3Dy
 CONFIG_THERMAL_EMULATION=3Dy
+CONFIG_IMX_SC_THERMAL=3Dm
 CONFIG_ROCKCHIP_THERMAL=3Dm
 CONFIG_RCAR_THERMAL=3Dy
 CONFIG_RCAR_GEN3_THERMAL=3Dy
--=20
2.7.4
