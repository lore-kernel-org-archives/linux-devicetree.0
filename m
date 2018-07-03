From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH 0/3] clk: meson: add a sub EMMC clock controller support
Date: Tue, 3 Jul 2018 14:57:13 +0000
Message-ID: <20180703145716.31860-1-yixun.lan@amlogic.com>
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

This driver will add a EMMC clock controller driver support.
The original idea about adding a clock controller is during the
discussion in the NAND driver mainline effort[1].

I've tested this in the S400 board (AXG platform) by using NAND driver.

[1] https://lkml.kernel.org/r/20180628090034.0637a062@xps13

Yixun Lan (3):
  clk: meson: add DT documentation for emmc clock controller
  clk: meson: add sub EMMC clock dt-bindings IDs
  clk: meson: add sub EMMC clock controller driver

 .../bindings/clock/amlogic,emmc-clkc.txt      |  45 ++++++
 drivers/clk/meson/Kconfig                     |   9 ++
 drivers/clk/meson/Makefile                    |   1 +
 drivers/clk/meson/emmc-clkc.c                 | 136 ++++++++++++++++++
 include/dt-bindings/clock/emmc-clkc.h         |  14 ++
 5 files changed, 205 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,emmc-clkc.txt
 create mode 100644 drivers/clk/meson/emmc-clkc.c
 create mode 100644 include/dt-bindings/clock/emmc-clkc.h

-- 
2.18.0
