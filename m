From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v3 0/3] Reset controller support for i.MX8MQ
Date: Sun, 16 Dec 2018 18:38:24 -0800
Message-ID: <20181217023827.7947-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, p.zabel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, cphealy@gmail.com, l.stach@pengutronix.de, Leonard Crestez <leonard.crestez@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Everyone:

This patch contains changes I made in order to add support for i.MX8MQ
to reset-imx7.c in order to enable support of PCIE IP block on i.MX8MQ
SoCs.

NOTE: This patch depens on CONFIG_ARCH_IMX8MQ introduced in [imx8mq]

Feedback is welcome!

Thanks,
Andrey Smirnov

Changes since [v2]

 - Constified "variant" field in struct imx7_src

 - Moved dt-bindings/reset/imx8mq-reset.h to be a part of the patch
   documenting DT bindings

Changes since [v1]

 - Series re-written to use a per-variant LUT instead of using a
   single table

- Changed driver to use "imx8mq" insead of "imx8m" to match other
  drivers and CONFIG_ARCH_IMX8MQ

- Updated list of exported i.MX8MQ resets, add missing and remove
  bogus ones (hopefully nothing is missing this time)

[v2] lkml.kernel.org/r/20181128043738.12714-1-andrew.smirnov@gmail.com
[v1] lkml.kernel.org/r/20181117181131.9330-2-andrew.smirnov@gmail.com
[imx8mq] https://www.spinics.net/lists/arm-kernel/msg687293.html

Andrey Smirnov (3):
  reset: imx7: Add plubming to support multiple IP variants
  dt-bindings: reset: imx7: Document usage on i.MX8MQ SoCs
  reset: imx7: Add support for i.MX8MQ IP block variant

 .../bindings/reset/fsl,imx7-src.txt           |   7 +-
 drivers/reset/Kconfig                         |   2 +-
 drivers/reset/reset-imx7.c                    | 166 ++++++++++++++++--
 include/dt-bindings/reset/imx8mq-reset.h      |  64 +++++++
 4 files changed, 220 insertions(+), 19 deletions(-)
 create mode 100644 include/dt-bindings/reset/imx8mq-reset.h

-- 
2.19.1
