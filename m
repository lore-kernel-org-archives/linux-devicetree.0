Return-Path: <SRS0=J/Os=U7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr50089.outbound.protection.outlook.com ([40.107.5.89]:33765
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727126AbfGBKDk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 2 Jul 2019 06:03:40 -0400
From: Jacky Bai <ping.bai@nxp.com>
Subject: [RESEND PATCH 0/3] Add power domain driver support for imx8m family
Date: Tue, 2 Jul 2019 10:03:35 +0000
Message-ID: <20190702100832.29718-1-ping.bai@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <766968F6F8A0DD4BA88B3A7E38BF3337@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

I just resend this patchset again to let us rethink & find out a quick way =
enable
the power domain support in mainline to help other modules upstream.

The GPC module is used for system power management for CPU core & periphera=
l's
power domain. For the whole i.MX8M family, different SOC has different powe=
r
domain design. Some power domains need special on/off flow(need to access t=
he
register out of the GPC module).

It makes us hard to reuse the GPCv2 driver to cover all the different power
up sequence. Each time a new SOC is added, we must modify the GPCv2 power d=
omain
driver to make it resuable for it. We need to add a lot of code for each ne=
w chip.
We need to access the SRC & SS's GPR in GPCv2 power domain driver, it is
burden to maintain the GPCv2 power domain driver. For example, in the futur=
e
i.MX8MP, there are ~20 power domains, some of the power domain need some sp=
ecial
handling only for this specific chip, same situation on i.MX8MM & i.MX8MN.

THis patchset add a more generic power domain driver that give us the possi=
bility
to use one driver to cover the whole i.MX8M family power domain in kernel s=
ide.
kernel side driver don't need to handle the power domain difference time to=
 time.
All the power domain on/off sequence can be abstracted & handled in TF-A si=
de.
it can simplify the power domain handling in kernel side. All the power dom=
ain
details can be hiden to TF-A side. TF-A image is SOC specific, we don't nee=
d
to care more about the one image principle.

I know some guys suggest to use SCMI to implement the power domains, but it=
 is
a long way, need more time to investigate. especially, for the current SCMI=
 power
domain, it can not meet all our requirement for power domain management. On=
 i.MX8M,
some of the power domain on/off need to handle clock and external regulator=
s, it is
not a generic handling for other SOC vendors, I think.

Additonally, the SiP Service Calls provide interfaces to SoC implementation=
 specific
services on this platform. For example, Secure platform initialization, con=
figuration
and some power control. I don't think it can not be used for specific SOC.

Jacky Bai (3):
  dt-bindings: power: Add power domain binding for i.mx8m family
  soc: imx: Add power domain driver support for i.mx8m family
  arm64: dts: freescale: Add power domain nodes for i.mx8mm

 .../bindings/power/fsl,imx8m-genpd.txt        |  46 ++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     | 103 ++++++++
 drivers/soc/imx/Kconfig                       |   6 +
 drivers/soc/imx/Makefile                      |   1 +
 drivers/soc/imx/imx8m_pm_domains.c            | 224 ++++++++++++++++++
 include/soc/imx/imx_sip.h                     |  12 +
 6 files changed, 392 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/fsl,imx8m-genpd=
.txt
 create mode 100644 drivers/soc/imx/imx8m_pm_domains.c
 create mode 100644 include/soc/imx/imx_sip.h

--=20
2.21.0
