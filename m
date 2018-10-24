From: Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: [PATCH V1 0/3] Add flexcan support
Date: Wed, 24 Oct 2018 11:14:29 +0000
Message-ID: <20181024111213.2724-1-qiangqing.zhang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joakim Zhang <qiangqing.zhang@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch series intends to add flexcan support for IMX6 platforms.

Dong Aisheng (3):
  ARM: dts: imx6sx-sdb: Add flexcan support
  ARM: dts: imx6sx-sabreauto: Add flexcan support
  ARM: dts: sabreauto: Add flexcan support

 .../boot/dts/imx6dl-sabreauto-flexcan1.dts    | 19 +++++++
 .../arm/boot/dts/imx6q-sabreauto-flexcan1.dts | 19 +++++++
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi      | 48 ++++++++++++++++
 arch/arm/boot/dts/imx6sx-sabreauto.dts        | 57 +++++++++++++++++++
 arch/arm/boot/dts/imx6sx-sdb-reva.dts         | 12 ++++
 arch/arm/boot/dts/imx6sx-sdb.dts              |  5 ++
 arch/arm/boot/dts/imx6sx-sdb.dtsi             | 42 ++++++++++++++
 7 files changed, 202 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-sabreauto-flexcan1.dts
 create mode 100644 arch/arm/boot/dts/imx6q-sabreauto-flexcan1.dts

--=20
2.17.1
