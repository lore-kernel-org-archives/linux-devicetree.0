From: Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3 0/8] ARM: Add minimal Raspberry Pi 4 support
Date: Sat, 28 Sep 2019 14:07:06 +0200
Message-ID: <1569672435-19823-1-git-send-email-wahrenst@gmx.net>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, bcm-kernel-feedback-list@broadcom.com, Stefan Wahren <wahrenst@gmx.net>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series adds minimal support for the new Raspberry Pi 4, so we are able
to login via debug UART.

Patch 1-2:   Fix some DT schema warnings
Patch 3-4:   Prepare DTS for the new SoC BMC2711
Patch 5-7:   Add Raspberry Pi 4 DTS support
Patch 8:     Update MAINTAINERS

Unfortunately the Raspberry Pi Foundation didn't released a
peripheral documentation for the new SoC yet. So we only have a preliminary
datasheet [1] and reduced schematics [2].

Known issues:
Since Linux 5.3-rc1 DMA doesn't work properly on that platform.
Nicolas Saenz Julienne investigates on that issue. As a temporary workaround
i reverted the following patch to test this series:

79a98672 "dma-mapping: remove dma_max_pfn"
7559d612 "mmc: core: let the dma map ops handle bouncing"

Changes in V3:
- rebased series
- add Reviewed-by
- enable ARM_GIC for ARCH_BCM2835 on arm64 too
- configure i2c pull-up in bcm2711.dtsi
- move i2c2 to bcm2835-common.dtsi
- add missing compatibles to DT schema as suggested by Rob
- fix DT schema warnings in dtsi files
- replace brcm pintrl with generic pinctrl as suggested by Linus
- make dma_zone_size depend on CONFIG_ZONE_DMA as suggested by Matthias

Changes in V2:
- use separate board file for BCM2711
- enable ARM_GIC for ARCH_BCM2835
- add Acked-by and Reviewed-by
- fix arm-pmu and timer nodes for BCM2711 reported by Marc Zyngier
- enable HDMI at board level
- move HDMI and pixelvalve into bcm2835-common.dtsi as suggested by Eric Anholt
- fix DWC2 probing warning by setting USB role to peripheral
- fix order of node references in bcm2711.dtsi
- disable I2C clock stretching quirk for BCM2711
- mark PLLD_PER as critical clock
- make PLLH clock unavailable on BCM2711
- fix compile warning in clk-bcm2835 for arm64

Changes since RFC:
- change BCM2838 -> BCM2711 as discussed in RFC
- update MAINTAINERS accordingly
- drop "spi: bcm2835: enable shared interrupt support" from series
- squash all pinctrl-bcm2835 changes into one patch
- introduce SoC specific clock registration as suggested by Florian
- fix watchdog probing for Raspberry Pi 4
- convert brcm,bcm2835.txt to json-schema
- move VC4 node to bcm2835-common.dtsi
- fallback to legacy pull config for Raspberry Pi 4
- revert unintended change of mailbox in bcm283x.dtsi
- add reference for arm64

[1] - https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2711/rpi_DATA_2711_1p0_preliminary.pdf
[2] - https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_4b_4p0_reduced.pdf

Stefan Wahren (8):
  ARM: dts: bcm283x: Remove simple-bus from fixed clocks
  ARM: dts: bcm283x: Remove brcm,bcm2835-pl011 compatible
  ARM: dts: bcm283x: Move BCM2835/6/7 specific to bcm2835-common.dtsi
  dt-bindings: arm: Convert BCM2835 board/soc bindings to json-schema
  dt-bindings: arm: bcm2835: Add Raspberry Pi 4 to DT schema
  ARM: bcm: Add support for BCM2711 SoC
  ARM: dts: Add minimal Raspberry Pi 4 support
  MAINTAINERS: Add BCM2711 to BCM2835 ARCH

 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |  54 ++
 .../devicetree/bindings/arm/bcm/brcm,bcm2835.txt   |  67 --
 MAINTAINERS                                        |   3 +-
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts              | 121 +++
 arch/arm/boot/dts/bcm2711.dtsi                     | 838 +++++++++++++++++++++
 arch/arm/boot/dts/bcm2835-common.dtsi              | 194 +++++
 arch/arm/boot/dts/bcm2835-rpi.dtsi                 |   4 -
 arch/arm/boot/dts/bcm2835.dtsi                     |   1 +
 arch/arm/boot/dts/bcm2836.dtsi                     |   1 +
 arch/arm/boot/dts/bcm2837.dtsi                     |   1 +
 arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi  |   7 +
 arch/arm/boot/dts/bcm283x.dtsi                     | 190 +----
 arch/arm/mach-bcm/Kconfig                          |   3 +-
 arch/arm/mach-bcm/Makefile                         |   3 +-
 arch/arm/mach-bcm/bcm2711.c                        |  24 +
 arch/arm64/Kconfig.platforms                       |   5 +-
 17 files changed, 1257 insertions(+), 260 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-4-b.dts
 create mode 100644 arch/arm/boot/dts/bcm2711.dtsi
 create mode 100644 arch/arm/boot/dts/bcm2835-common.dtsi
 create mode 100644 arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
 create mode 100644 arch/arm/mach-bcm/bcm2711.c

--
2.7.4
