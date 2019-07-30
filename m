From: Oliver Graute <oliver.graute@kococonnector.com>
Subject: [PATCHv3 0/1] arm64: dts: add basic DTS for imx8qm-rom7720 board
Date: Tue, 30 Jul 2019 11:06:04 +0000
Message-ID: <20190730110140.17247-1-oliver.graute@kococonnector.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Oliver Graute <oliver.graute@kococonnector.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This patch is ontop of Aisheng Dongs clock driver and imx8 changes for the
imx8qm

https://patchwork.kernel.org/patch/11046313/
https://patchwork.kernel.org/patch/11046343/

This patch is based on next-20190716

I need some hints and review why the imx8qm-rom-7720 just stops at "Startin=
g
kernel ..." with these changes. The device tree is similar to imx8qm-mek.dt=
s.

Oliver Graute (1):
  arm64: dts: add basic DTS for imx8qm-rom7720-a1 board

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8qm-rom7720-a1.dts  | 228 ++++++++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-rom7720-a1.dts

--=20
2.17.1
