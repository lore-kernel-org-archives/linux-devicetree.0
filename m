Return-Path: <SRS0=m20R=QU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr40056.outbound.protection.outlook.com ([40.107.4.56]:10048
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729210AbfBMDJK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 Feb 2019 22:09:10 -0500
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 2/3] arm64: defconfig: enable i.mx system controller cpufreq
Date: Wed, 13 Feb 2019 03:09:07 +0000
Message-ID: <1550027011-7884-2-git-send-email-Anson.Huang@nxp.com>
References: <1550027011-7884-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1550027011-7884-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Andy Gross <andy.gross@linaro.org>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "arnd@arndb.de" <arnd@arndb.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "olof@lixom.net" <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Select CONFIG_ARM_IMX_SC_CPUFREQ by default to support
i.MX system controller cpufreq driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2d9c390..3a940ae 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -109,6 +109,7 @@ CONFIG_CPUFREQ_DT=3Dy
 CONFIG_ACPI_CPPC_CPUFREQ=3Dm
 CONFIG_ARM_ARMADA_37XX_CPUFREQ=3Dy
 CONFIG_ARM_SCPI_CPUFREQ=3Dy
+CONFIG_ARM_IMX_SC_CPUFREQ=3Dy
 CONFIG_ARM_TEGRA186_CPUFREQ=3Dy
 CONFIG_ARM_SCPI_PROTOCOL=3Dy
 CONFIG_RASPBERRYPI_FIRMWARE=3Dy
--=20
2.7.4
