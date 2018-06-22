From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v5 0/2] pinctrl: imx: Add driver for i.MX8MQ
Date: Fri, 22 Jun 2018 18:15:47 +0300
Message-ID: <1529680549-22079-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-imx@nxp.com, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

This is the fifth version for the patch series sent by Lucas.

https://www.spinics.net/lists/devicetree/msg212752.html

Fourth version can be found here:

https://lkml.org/lkml/2018/6/20/478

Changes since v4:
 * implemented all Aisheng's review comments

Changes since v3:
 * dropped the SION generic pinconf changes
 * added examples to the bindings doc

Changes since v2:
 * switch back to the 'fsl,pins' and hardcoded the config values
inside the dts.
 * updated documentation accordingly

Abel Vesa (1):
  dt-bindings: add binding for i.MX8MQ IOMUXC

Lucas Stach (1):
  pinctrl: imx: add driver for i.MX8MQ

 .../bindings/pinctrl/fsl,imx8mq-pinctrl.txt        |  32 ++
 drivers/pinctrl/freescale/Kconfig                  |   7 +
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-imx8mq.c         | 351 +++++++++++++++++++++
 4 files changed, 391 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx8mq.c

-- 
2.7.4
