From: Pawel Moll <pawel.moll@arm.com>
Subject: [PATCH v2 0/4] Versatile Express DT support
Date: Wed, 23 Nov 2011 15:01:44 +0000
Message-ID: <1322060508-11298-1-git-send-email-pawel.moll@arm.com>
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
To: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Cc: Pawel Moll <pawel.moll@arm.com>
List-Id: devicetree@vger.kernel.org

Hello again,

This version of the series (hopefully) addresses all the suggestions
made by Dave, Rob and Russell.

The compatible values are specific for the tiles now and the memory
map variant is defined as a custom property in the motherboard node.

Tested on V2P-CA9 coretile both with ATAGs and DT and V2P-CA5s with DT.

All comments, as always, welcomed!

Pawel



Pawel Moll (4):
  ARM: vexpress: Get rid of MMIO_P2V
  ARM: vexpress: Add DT support in v2m
  ARM: vexpress: Initial RS1 memory map support
  ARM: vexpress: DT-based support for CoreTiles Express A5x2 and A9x4

 Documentation/devicetree/bindings/arm/vexpress    |  101 ++++++++
 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi           |  192 +++++++++++++++
 arch/arm/boot/dts/vexpress-v2m.dtsi               |  191 +++++++++++++++
 arch/arm/boot/dts/vexpress-v2p-ca5s.dts           |  132 ++++++++++
 arch/arm/boot/dts/vexpress-v2p-ca9.dts            |  146 +++++++++++
 arch/arm/include/asm/hardware/arm_timer.h         |    5 +
 arch/arm/mach-vexpress/Kconfig                    |   35 +++
 arch/arm/mach-vexpress/Makefile                   |    1 +
 arch/arm/mach-vexpress/Makefile.boot              |    6 +
 arch/arm/mach-vexpress/core.h                     |   21 ++-
 arch/arm/mach-vexpress/ct-ca9x4.c                 |   52 +---
 arch/arm/mach-vexpress/include/mach/ct-ca9x4.h    |   13 +-
 arch/arm/mach-vexpress/include/mach/debug-macro.S |   37 +++-
 arch/arm/mach-vexpress/include/mach/motherboard.h |   58 +++--
 arch/arm/mach-vexpress/include/mach/uncompress.h  |   13 +-
 arch/arm/mach-vexpress/platsmp.c                  |    4 +-
 arch/arm/mach-vexpress/v2m.c                      |  265 ++++++++++++++++++---
 arch/arm/mach-vexpress/v2p-ca5s_ca9.c             |  115 +++++++++
 18 files changed, 1272 insertions(+), 115 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/vexpress
 create mode 100644 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
 create mode 100644 arch/arm/boot/dts/vexpress-v2m.dtsi
 create mode 100644 arch/arm/boot/dts/vexpress-v2p-ca5s.dts
 create mode 100644 arch/arm/boot/dts/vexpress-v2p-ca9.dts
 create mode 100644 arch/arm/mach-vexpress/v2p-ca5s_ca9.c
