From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH 00/10] Add clock support for Armada 37xx SoCs
Date: Fri, 10 Jun 2016 15:23:28 +0200
Message-ID: <1465565018-14172-1-git-send-email-gregory.clement@free-electrons.com>
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
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree@vger.kernel.org, Romain Perier <romain.perier@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Omri Itach <omrii@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Shadi Ammouri <shadi@marvell.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

this series add clock support for the Armada 37xx SoCs.

The design of the drivers is as close as possible as the hardware is,
with some clocks made of several layers: muxing, divider and gating.

The device tree binding was written in a way that even if we discover
some change inside the clocks, the binding should not be
affected. Especially, there are some holes in the clocks, but we
should be able to add them seamless.

I tried to follow the last update made in the clock framework, I hope
theses drivers will comply the new guidelines.

Thanks,

Gregory

Gregory CLEMENT (10):
  arm64: marvell: enable Armada 3700 clock drivers
  arm64: dts: marvell: Add xtal clock support for Armada 3700
  arm64: dts: marvell: add tbg clocks for Armada 37xx
  arm64: dts: marvell: add peripherals clocks for Armada 37xx
  dt-bindings: clock: add DT binding for the Xtal clock on Armada 3700
  clk: mvebu: Add the xtal clock for Armada 3700 SoC
  dt-bindings: clock: add DT binding for the TBG clocks on Armada 3700
  clk: mvebu Add the time base generator clocks for Armada 3700
  dt-bindings: clock: add DT binding for the peripheral clocks on Armada
    3700
  clk: mvebu: Add the peripheral clock driver for Armada 3700

 .../bindings/clock/armada3700-periph-clock.txt     |  70 ++++
 .../bindings/clock/armada3700-tbg-clock.txt        |  27 ++
 .../bindings/clock/armada3700-xtal-clock.txt       |  28 ++
 arch/arm64/Kconfig.platforms                       |   1 +
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |  35 ++
 drivers/clk/mvebu/Kconfig                          |   3 +
 drivers/clk/mvebu/Makefile                         |   3 +
 drivers/clk/mvebu/armada-37xx-periph.c             | 462 +++++++++++++++++++++
 drivers/clk/mvebu/armada-37xx-tbg.c                | 172 ++++++++
 drivers/clk/mvebu/armada-37xx-xtal.c               |  93 +++++
 10 files changed, 894 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/armada3700-tbg-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
 create mode 100644 drivers/clk/mvebu/armada-37xx-periph.c
 create mode 100644 drivers/clk/mvebu/armada-37xx-tbg.c
 create mode 100644 drivers/clk/mvebu/armada-37xx-xtal.c

-- 
2.5.0
