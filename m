Return-Path: <SRS0=bjk3=QP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr50070.outbound.protection.outlook.com ([40.107.5.70]:14256
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727641AbfBHScz (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Feb 2019 13:32:55 -0500
From: Frank Li <frank.li@nxp.com>
Subject: [PATCH 4/4] MAINTAINERS: Added imx DDR performonitor driver
 maintainer information
Date: Fri, 8 Feb 2019 18:32:47 +0000
Message-ID: <1549650743-27581-4-git-send-email-Frank.Li@nxp.com>
References: <1549650743-27581-1-git-send-email-Frank.Li@nxp.com>
In-Reply-To: <1549650743-27581-1-git-send-email-Frank.Li@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "mark.rutland@arm.com" <mark.rutland@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lznuaa@gmail.com" <lznuaa@gmail.com>
Cc: Frank Li <frank.li@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Add DDR perf counter driver maintainer information

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6ba068e..687be0f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6163,6 +6163,13 @@ L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-cpm.c
=20
+FREESCALE IMX DDR Performance Monitor DRIVER
+M:	Frank Li <Frank.li@nxp.com>
+L:	linux-arm-kernel@lists.infradead.org
+S:	Maintained
+F:	drivers/perf/fsl_imx8_ddr_perf.c
+F:	Documentation/devicetree/bindings/perf/fsl-imx-ddr.txt
+
 FREESCALE IMX LPI2C DRIVER
 M:	Dong Aisheng <aisheng.dong@nxp.com>
 L:	linux-i2c@vger.kernel.org
--=20
2.5.2
