From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v15 0/5] Add i.MX8MQ clock driver
Date: Sat, 1 Dec 2018 10:52:09 +0000
Message-ID: <1543661502-18573-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Aisheng DONG <aisheng.dong@nxp.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abelvesa@linux.com>, dl-linux-imx <linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Unfortunately, there was a problem with some divisions by 64-bit values
in the Fractional PLL which led to a link failuire on arm32.
That has been fixed now without any kind of functionality changes.

Though the v14 has made it to clk-next, due to the arm32 build failure,
this patch series had to be dropped until the failure gets fixed.

Stephen, please take this in one more time and sorry for all the trouble
caused by this series. Thanks for all the support.

Here is a link to the 14th version:

https://lkml.org/lkml/2018/11/29/767

Changes since v14:
 * fixed all the divisions by 64-bit by replacing with do_divs in clk-frac-pll

Abel Vesa (2):
  clk: imx: Add imx composite clock
  clk: imx: Add clock driver for i.MX8MQ CCM

Lucas Stach (3):
  dt-bindings: Add binding for i.MX8MQ CCM
  clk: imx: Add fractional PLL output clock
  clk: imx: Add SCCG PLL type

 .../devicetree/bindings/clock/imx8mq-clock.txt     |  20 +
 drivers/clk/imx/Makefile                           |   6 +-
 drivers/clk/imx/clk-composite-8m.c                 | 178 +++++++
 drivers/clk/imx/clk-frac-pll.c                     | 232 ++++++++
 drivers/clk/imx/clk-imx8mq.c                       | 589 +++++++++++++++++++++
 drivers/clk/imx/clk-sccg-pll.c                     | 256 +++++++++
 drivers/clk/imx/clk.h                              |  64 +++
 include/dt-bindings/clock/imx8mq-clock.h           | 395 ++++++++++++++
 8 files changed, 1739 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8mq-clock.txt
 create mode 100644 drivers/clk/imx/clk-composite-8m.c
 create mode 100644 drivers/clk/imx/clk-frac-pll.c
 create mode 100644 drivers/clk/imx/clk-imx8mq.c
 create mode 100644 drivers/clk/imx/clk-sccg-pll.c
 create mode 100644 include/dt-bindings/clock/imx8mq-clock.h

-- 
2.7.4
