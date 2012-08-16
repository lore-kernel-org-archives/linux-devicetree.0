From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/6] Integrator devicetree support
Date: Thu, 16 Aug 2012 14:15:17 +0200
Message-ID: <1345119317-22600-1-git-send-email-linus.walleij@linaro.org>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Will Deacon <will.deacon@arm.com>, Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

This is a patch set for devicetree on the Integrator/AP and
Integrator/CP I've been cooking. I did some stepwise development
in recent kernels moving to sparse IRQs, per-system clock
source then common clk. Now we can do single zImage and
also devicetree on this platform, so this is a first patch
set.

In case you're wondering why, take down your Torvalds
autobiography and read the title. It was also a bit of
learning exercise, plus it's fun to run devicetree on this
ARMv4 system.

This patch set moves all the non-DT platform code into
#ifndef CONFIG_OF sections for clarity. The plan is to
delete them after deprecation.

Remaining roadblocks to deleting non-DT code altogether.

- Uncertain about how to do the fpga-irq DT binding so
  please review closely.

- The Integrator/AP ARM core tiles have add-on logic modules
  called Integrator/IM-PD1 with a load of PrimeCells and
  stuff. These spawn off a special bus called "lm" in
  arch/arm/mach-integrator/lm.c, and the core module support
  is in impd1.c. It'd probably be pretty easy to create
  device tree bindings for these, but I have no such module
  and no clue on where to get one. Is anyone actually using
  it? Russell?

- The special PCI adapter in the Integrator has to be DT:ed,
  but AFAICT there is still a problem with how to represent
  these things in DT. Any hints/examples, Arnd, Rob?
  arch/arm/mach-integrator/pci_v3.c

Yours,
Linus Walleij

Linus Walleij (6):
  ARM: integrator: call common init function from machine
  ARM: integrator: check PL010 device name rather than base address
  ARM: plat-versatile: add DT support to FPGA IRQ controller
  ARM: integrator: initial device tree support
  ARM: integrator: convert AMBA devices to device tree
  ARM: integrator: convert platform devices to Device Tree

 Documentation/devicetree/bindings/arm/arm-boards   |  12 +
 .../devicetree/bindings/arm/versatile-fpga-irq.txt |  35 +++
 arch/arm/boot/dts/integratorap.dts                 |  78 ++++++
 arch/arm/boot/dts/integratorcp.dts                 | 122 +++++++++
 arch/arm/mach-integrator/common.h                  |   3 +
 arch/arm/mach-integrator/core.c                    |  14 +-
 arch/arm/mach-integrator/integrator_ap.c           | 214 ++++++++++-----
 arch/arm/mach-integrator/integrator_cp.c           | 296 +++++++++++++--------
 arch/arm/plat-versatile/fpga-irq.c                 |  41 +++
 arch/arm/plat-versatile/include/plat/fpga-irq.h    |   2 +
 10 files changed, 640 insertions(+), 177 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/versatile-fpga-irq.txt
 create mode 100644 arch/arm/boot/dts/integratorap.dts
 create mode 100644 arch/arm/boot/dts/integratorcp.dts

-- 
1.7.11.2
