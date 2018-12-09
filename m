From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v5 0/6] Add basic support for i.MX8MQ SoC and i.MX8MQ EVK
 board
Date: Sun, 9 Dec 2018 14:26:05 +0000
Message-ID: <1544365552-30270-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Took this from Lucas since he's busy with some other work for the moment an=
d
I thought we might be able to get this ready for the merge window.

Basically is just a respin with a minor fix for a comment from Rob.

Lucas, thanks for all the effort with this.

Changes since v5:
 * replaced the name of the node peripherals with soc in dts file

Baruch Siach (2):
  arm64: dts: imx8mq: add watchdog devices
  arm64: dts: imx8mq-evk: enable watchdog

Lucas Stach (4):
  arm64: add basic Kconfig symbols for i.MX8
  arm64: add basic DTS for i.MX8MQ
  arm64: add support for i.MX8M EVK board
  MAINTAINERS: add i.MX8 DT path to i.MX architecture

 Documentation/devicetree/bindings/arm/fsl.txt  |   8 +
 MAINTAINERS                                    |   1 +
 arch/arm64/Kconfig.platforms                   |  14 +
 arch/arm64/boot/dts/freescale/Makefile         |   2 +
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts   | 303 ++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h | 623 +++++++++++++++++++++=
++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi      | 416 +++++++++++++++++
 7 files changed, 1367 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq.dtsi

--=20
2.7.4
