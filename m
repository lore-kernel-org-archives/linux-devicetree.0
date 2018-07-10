From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH v2 0/3] clk: meson: add a sub EMMC clock controller support
Date: Tue, 10 Jul 2018 16:36:55 +0000
Message-ID: <20180710163658.6175-1-yixun.lan@amlogic.com>
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
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>, Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>
List-Id: devicetree@vger.kernel.org

This driver will add a MMC clock controller driver support.
The original idea about adding a clock controller is during the
discussion in the NAND driver mainline effort[1].

I've tested this in the S400 board (AXG platform) by using NAND driver.

Changes since v1 [2]:
 - implement phase clock
 - update compatible name
 - adjust file name
 - divider probe() into small functions, and re-use them

[1] https://lkml.kernel.org/r/20180628090034.0637a062@xps13
[2] https://lkml.kernel.org/r/20180703145716.31860-1-yixun.lan@amlogic.com

Yixun Lan (3):
  clk: meson: add DT documentation for emmc clock controller
  clk: meson: add sub MMC clock dt-bindings IDs
  clk: meson: add sub MMC clock controller driver

 .../bindings/clock/amlogic,mmc-clkc.txt       |  31 ++
 drivers/clk/meson/Kconfig                     |   9 +
 drivers/clk/meson/Makefile                    |   1 +
 drivers/clk/meson/mmc-clkc.c                  | 419 ++++++++++++++++++
 .../clock/amlogic,meson-mmc-clkc.h            |  16 +
 5 files changed, 476 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt
 create mode 100644 drivers/clk/meson/mmc-clkc.c
 create mode 100644 include/dt-bindings/clock/amlogic,meson-mmc-clkc.h

-- 
2.18.0
