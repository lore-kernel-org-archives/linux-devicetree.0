From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V2 0/4] Add i.MX SCU general interrupt support
Date: Thu, 14 Feb 2019 03:44:19 +0000
Message-ID: <1550115535-14488-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "sboyd@kernel.org" <sboyd@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-rtc
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch series adds i.MX SCU general interrupt support, the SCU general
interrupt supports RTC alarm, wdog, thermal alarm etc., e.g. RTC alarm
irq is controlled by system controller and when RTC alarm fires, system
controller will general SCU MU general interrupt rather than RTC IRQ, so
need to use notification for RTC driver to handle the alarm event.

RTC alarm function patch depends on i.MX SCU general interrupt support,
so put it into same series for review.

Anson Huang (4):
  dt-bindings: fsl: scu: add general interrupt support
  firmware: imx: enable imx scu general irq function
  arm64: dts: freescale: imx8qxp: enable scu general irq channel
  rtc: imx-sc: add rtc alarm support

 .../devicetree/bindings/arm/freescale/fsl,scu.txt  |  18 ++--
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   6 +-
 drivers/firmware/imx/imx-scu.c                     | 101 +++++++++++++++++=
++++
 drivers/rtc/rtc-imx-sc.c                           | 100 +++++++++++++++++=
+++
 include/linux/firmware/imx/sci.h                   |   3 +
 5 files changed, 220 insertions(+), 8 deletions(-)

--=20
2.7.4
