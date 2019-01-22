From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v5 0/3] Reset controller support for i.MX8MQ
Date: Mon, 21 Jan 2019 18:10:40 -0800
Message-ID: <20190122021043.25449-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: p.zabel@pengutronix.de
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, Rob Herring <robh@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>, linux-kernel@vger.kernel.org, linux-imx@nxp.com, Fabio Estevam <fabio.estevam@nxp.com>, Leonard Crestez <leonard.crestez@nxp.com>, cphealy@gmail.com, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

This patch contains changes I made in order to add support for i.MX8MQ
to reset-imx7.c in order to enable support of PCIE IP block on i.MX8MQ
SoCs.

Feedback is welcome!

Thanks,
Andrey Smirnov

Changes since [v4]

 - Reset driver reworked to support different IP variants by providing
   different struct reset_control_ops instead of having a .prepare
   callback

Changes since [v3]

 - Kconfig entry is converted to use ARCH_MXC

 - Collected Reviewed-by from Rob Herring

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

[v4] lkml.kernel.org/r/20181220010700.8598-1-andrew.smirnov@gmail.com
[v3] lkml.kernel.org/r/20181217023827.7947-1-andrew.smirnov@gmail.com
[v2] lkml.kernel.org/r/20181128043738.12714-1-andrew.smirnov@gmail.com
[v1] lkml.kernel.org/r/20181117181131.9330-2-andrew.smirnov@gmail.com

Andrey Smirnov (3):
  reset: imx7: Add plubming to support multiple IP variants
  dt-bindings: reset: imx7: Document usage on i.MX8MQ SoCs
  reset: imx7: Add support for i.MX8MQ IP block variant

 .../bindings/reset/fsl,imx7-src.txt           |   7 +-
 drivers/reset/Kconfig                         |   4 +-
 drivers/reset/reset-imx7.c                    | 172 ++++++++++++++++--
 include/dt-bindings/reset/imx8mq-reset.h      |  64 +++++++
 4 files changed, 229 insertions(+), 18 deletions(-)
 create mode 100644 include/dt-bindings/reset/imx8mq-reset.h

-- 
2.20.1
