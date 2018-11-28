Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr60052.outbound.protection.outlook.com ([40.107.6.52]:25184
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726972AbeK1QVw (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Nov 2018 11:21:52 -0500
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V2 4/4] ARM64: dts: imx: add i.MX8QXP system controller RTC
 support
Date: Wed, 28 Nov 2018 05:21:26 +0000
Message-ID: <1543382119-2918-5-git-send-email-Anson.Huang@nxp.com>
References: <1543382119-2918-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1543382119-2918-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng DONG <aisheng.dong@nxp.com>, Andy Gross <andy.gross@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olof@lixom.net>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Add i.MX8QXP system controller RTC support.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/d=
ts/freescale/imx8qxp.dtsi
index 9155d45..ef57db6 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -433,4 +433,8 @@
 		#size-cells =3D <1>;
 		ranges =3D <0x5f000000 0x0 0x5f000000 0x1000000>;
 	};
+
+	rtc: rtc {
+		compatible =3D "nxp,imx8qxp-sc-rtc";
+	};
 };
--=20
2.7.4
