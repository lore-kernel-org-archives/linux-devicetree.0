Return-Path: <SRS0=gYPT=OI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00041.outbound.protection.outlook.com ([40.107.0.41]:22400
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726944AbeK2MyJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 29 Nov 2018 07:54:09 -0500
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V4 4/4] ARM64: dts: imx: add i.MX8QXP system controller RTC
 support
Date: Thu, 29 Nov 2018 01:50:26 +0000
Message-ID: <1543455856-18021-5-git-send-email-Anson.Huang@nxp.com>
References: <1543455856-18021-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1543455856-18021-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng DONG <aisheng.dong@nxp.com>, Andy Gross <andy.gross@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olof@lixom.net>, "LW@KARO-electronics.de" <LW@KARO-electronics.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Add i.MX8QXP system controller RTC support.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
ChangeLog:
V3->V4:
  *move sc rtc to inside of SCU node.
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/d=
ts/freescale/imx8qxp.dtsi
index 9155d45..b38730a 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -84,6 +84,10 @@
 			compatible =3D "fsl,imx8qxp-scu-pd";
 			#power-domain-cells =3D <1>;
 		};
+
+		rtc: rtc {
+			compatible =3D "fsl,imx8qxp-sc-rtc";
+		};
 	};
=20
 	tsens: thermal-sensor {
--=20
2.7.4
