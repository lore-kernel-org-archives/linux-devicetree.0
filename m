From: Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: [PATCH RESEND V2 0/4] ARM: dts: imx: Add flexcan stop mode wake
Date: Mon, 3 Dec 2018 05:20:16 +0000
Message-ID: <20181203051753.1532-1-qiangqing.zhang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joakim Zhang <qiangqing.zhang@nxp.com>
List-Id: devicetree@vger.kernel.org

This patchset intends to add flexcan stop mode wakeup support on IMX6/7 pla=
tforms.

ChangeLog:
V1->V2:
	*update stop mode property(stop-mode -> fsl,stop-mode).

Hi Shawn,
   This property has been merged both flexcan bindings doc and kernel
   driver.

Best Regards,
Joakim Zhang

Aisheng Dong (4):
  ARM: dts: imx6sx: Add flexcan stop mode wakeup support
  ARM: dts: imx6qdl: Add flexcan stop mode wakeup support
  ARM: dts: imx6ul: Add flexcan stop mode wakeup support
  ARM: dts: imx7s: Add flexcan stop mode wakeup support

 arch/arm/boot/dts/imx6qdl.dtsi | 2 ++
 arch/arm/boot/dts/imx6sx.dtsi  | 2 ++
 arch/arm/boot/dts/imx6ul.dtsi  | 2 ++
 arch/arm/boot/dts/imx7s.dtsi   | 2 ++
 4 files changed, 8 insertions(+)

--=20
2.17.1
