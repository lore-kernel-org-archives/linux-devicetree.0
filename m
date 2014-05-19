From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH v2 00/10] Marvell Berlin full clock support
Date: Mon, 19 May 2014 18:43:21 +0200
Message-ID: <1400517811-24668-1-git-send-email-sebastian.hesselbarth@gmail.com>
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
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jisheng Zhang <jszhang@marvell.com>, Mike Turquette <mturquette@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Mike,

this is v2 of the Berlin SoC clock driver [1] but with a reworked DT
binding as requested [2]. We decided to not even try to split up the chip
control registers that deal with pinmux, padmux, clock, reset, and evil
stuff we haven't even looked at. Instead we keep a single node that clock
driver will remap early, while proper platform_drivers use a regmap
instead. Although clock and other drivers share the same register range,
they use individual registers exclusively.

There are some functional fixes in the single clock drivers, I noticed
while retesting each individial driver. There will be more to fixup but
without any drivers actually using the clocks, it is hard to tell what
isn't working now.

Anyway, the current binding should match what you requested and having
a clock driver for v3.16 will really be a huge benefit for us to work
on more driver support.

If you are fine with it, please take patches 2-7 and I'll pick up
1,8-10 in berlin branch.

Sebastian

[1] https://lkml.kernel.org/r/1399839881-29895-1-git-send-email-sebastian.hesselbarth@gmail.com
[2] https://lkml.kernel.org/r/20140515044106.19795.57249@quantum

Alexandre Belloni (4):
  clk: berlin: add driver for BG2x simple PLLs
  clk: berlin: add driver for BG2x complex divider cells
  clk: berlin: add core clock driver for BG2Q
  ARM: dts: berlin: convert BG2Q to DT clock nodes

Sebastian Hesselbarth (6):
  dt-binding: ARM: add clock binding docs for Marvell Berlin2 SoCs
  clk: berlin: add binding include for Berlin SoC clock ids
  clk: berlin: add driver for BG2x audio/video PLL
  clk: berlin: add core clock driver for BG2/BG2CD
  ARM: dts: berlin: convert BG2CD to DT clock nodes
  ARM: dts: berlin: convert BG2 to DT clock nodes

 .../devicetree/bindings/arm/marvell,berlin.txt     |  47 ++
 arch/arm/boot/dts/berlin2.dtsi                     |  56 +-
 arch/arm/boot/dts/berlin2cd.dtsi                   |  53 +-
 arch/arm/boot/dts/berlin2q.dtsi                    |  54 +-
 drivers/clk/Makefile                               |   1 +
 drivers/clk/berlin/Makefile                        |   4 +
 drivers/clk/berlin/berlin2-avpll.c                 | 393 ++++++++++++
 drivers/clk/berlin/berlin2-avpll.h                 |  36 ++
 drivers/clk/berlin/berlin2-div.c                   | 265 ++++++++
 drivers/clk/berlin/berlin2-div.h                   |  89 +++
 drivers/clk/berlin/berlin2-pll.c                   | 117 ++++
 drivers/clk/berlin/berlin2-pll.h                   |  37 ++
 drivers/clk/berlin/bg2.c                           | 691 +++++++++++++++++++++
 drivers/clk/berlin/bg2q.c                          | 389 ++++++++++++
 drivers/clk/berlin/common.h                        |  29 +
 include/dt-bindings/clock/berlin2.h                |  45 ++
 include/dt-bindings/clock/berlin2q.h               |  31 +
 17 files changed, 2240 insertions(+), 97 deletions(-)
 create mode 100644 drivers/clk/berlin/Makefile
 create mode 100644 drivers/clk/berlin/berlin2-avpll.c
 create mode 100644 drivers/clk/berlin/berlin2-avpll.h
 create mode 100644 drivers/clk/berlin/berlin2-div.c
 create mode 100644 drivers/clk/berlin/berlin2-div.h
 create mode 100644 drivers/clk/berlin/berlin2-pll.c
 create mode 100644 drivers/clk/berlin/berlin2-pll.h
 create mode 100644 drivers/clk/berlin/bg2.c
 create mode 100644 drivers/clk/berlin/bg2q.c
 create mode 100644 drivers/clk/berlin/common.h
 create mode 100644 include/dt-bindings/clock/berlin2.h
 create mode 100644 include/dt-bindings/clock/berlin2q.h

---
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Mike Turquette <mturquette@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Jisheng Zhang <jszhang@marvell.com>
Cc: devicetree@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
-- 
1.9.1
