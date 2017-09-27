From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Subject: [RFC 0/4] Add Ingenic X1000 SoC Support
Date: Wed, 27 Sep 2017 20:45:23 +0530
Message-ID: <20170927151527.25570-1-prasannatsmkumar@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, mturquette@baylibre.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, paul@crapouillou.net, malat@debian.org, dom.peklo@gmail.com
Cc: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
List-Id: devicetree@vger.kernel.org

Add support for Ingenic X1000 SoC. This patch set provides enough bits
to boot a kernel to an initramfs user space.

I implemented this code during 2016. Boot stuck at "calibrating delay
loop ...". Now I have fixed the issue by setting the correct irq. I do
not have access to this device anymore so could not test the fix.
Marking this patch series as RFC as this needs to be tested.

Test and feedback appreciated.

This series enables uart, timer and interrupt controller. As this is
very minimal a static elf binary should be used as init and should be
available in initramfs.

PrasannaKumar Muralidharan (4):
  dt-bindings: Add Ingenic X1000 SoC clock define
  clk: Add Ingenic X1000 CGU driver
  MIPS: Ingenic: Initial X1000 SoC support
  MIPS: Ingenic: Add Halley2 development board support

 arch/mips/boot/dts/ingenic/Makefile    |   1 +
 arch/mips/boot/dts/ingenic/halley2.dts |  46 ++++++++
 arch/mips/boot/dts/ingenic/x1000.dtsi  |  93 +++++++++++++++
 arch/mips/configs/halley2_defconfig    |  61 ++++++++++
 arch/mips/jz4740/Kconfig               |  10 ++
 arch/mips/jz4740/time.c                |   2 +-
 drivers/clk/ingenic/Makefile           |   1 +
 drivers/clk/ingenic/x1000-cgu.c        | 203 +++++++++++++++++++++++++++++++++
 include/dt-bindings/clock/x1000-cgu.h  |  46 ++++++++
 9 files changed, 462 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/boot/dts/ingenic/halley2.dts
 create mode 100644 arch/mips/boot/dts/ingenic/x1000.dtsi
 create mode 100644 arch/mips/configs/halley2_defconfig
 create mode 100644 drivers/clk/ingenic/x1000-cgu.c
 create mode 100644 include/dt-bindings/clock/x1000-cgu.h

-- 
2.10.0
