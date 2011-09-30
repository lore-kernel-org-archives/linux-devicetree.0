From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 0/3] GIC OF bindings
Date: Fri, 30 Sep 2011 14:27:57 -0500
Message-ID: <1317410880-24828-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: grant.likely@secretlab.ca, marc.zyngier@arm.com, thomas.abraham@linaro.org, jamie@jamieiles.com, b-cousson@ti.com, shawn.guo@linaro.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Another round of GIC devicetree support.

This moves the tracking of the starting hwirq number into the irq domain
code. Doing this makes hwirq == GIC interrupt ID and simplifies the GIC
code removing irq_offset.

The full series is available here. This includes Russell's devel-stable and
for-next branches and Nico's vmalloc branch:

git://git.jdl.com/software/linux-3.0.git gic-v2

Tested on highbank and Realview 11MPCore qemu (2 GICs).

Rob

Rob Herring (3):
  irq: support domains with non-zero hwirq base
  ARM: gic: add irq_domain support
  ARM: gic: add OF based initialization

 Documentation/devicetree/bindings/arm/gic.txt |   55 ++++++++++
 arch/arm/common/Kconfig                       |    1 +
 arch/arm/common/gic.c                         |  142 +++++++++++++++++++------
 arch/arm/include/asm/hardware/gic.h           |    5 +-
 include/linux/irqdomain.h                     |   16 +++-
 kernel/irq/irqdomain.c                        |   12 +-
 6 files changed, 189 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/gic.txt

-- 
1.7.5.4
