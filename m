From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v3 0/3] pinctrl: imx: Add driver for i.MX8MQ
Date: Wed, 20 Jun 2018 10:24:20 +0300
Message-ID: <1529479463-26961-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-imx@nxp.com, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

This is the third version for the patch series sent by Lucas.

https://www.spinics.net/lists/devicetree/msg212752.html

Changes since v2:
 * switch back to the 'fsl,pins' and hardcoded the config values
inside the dts.
 * updated documentation accordingly

Abel Vesa (1):
  dt-bindings: add binding for i.MX8MQ IOMUXC

Lucas Stach (2):
  pinctrl: imx: allow to configure SION with generic pinconf
  pinctrl: imx: add driver for i.MX8MQ

 .../bindings/pinctrl/fsl,imx8mq-pinctrl.txt        |  13 +
 drivers/pinctrl/freescale/Kconfig                  |   7 +
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-imx.c            |  19 +-
 drivers/pinctrl/freescale/pinctrl-imx.h            |   4 +
 drivers/pinctrl/freescale/pinctrl-imx8mq.c         | 356 +++++++++++++++++++++
 6 files changed, 388 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx8mq.c

-- 
2.7.4
