From: Aleix Roca Nonell <kernelrocks@gmail.com>
Subject: [PATCH 0/6] Add Banana Pi BPI-W2 basic support
Date: Sun, 7 Jul 2019 15:22:23 +0200
Message-ID: <20190707132223.GA13340@arks.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series adds minimum support to boot a Banana Pi BPI-W2. This
board serial interface is muxed through a custom Realtek driver not
currently in mainline. Without the driver, it is only possible to
initialize a bootconsole, but init cannot be run. The datasheet of the
board's RTD1296 SoC is not publicly available and the procedure to
interface the interrupt controller registers is not completely known
yet, however, it works.

This patch is based on the official BPI-W2 downstream kernel driver [1]
and the last attempt of Andreas Färber [2] to support such driver.

Please, note that the board still requires a slightly modified version
of the downstreamed Realtek U-Boot to launch the Linux Kernel, which
essentially removes the need for some dts nodes not included in this
patch and reallocates u-boot before loading the kernel to avoid
overriding U-Boot code.

[1] - https://github.com/BPI-SINOVOIP/BPI-W2-bsp
[2] - https://patchwork.kernel.org/patch/10011891

Aleix Roca Nonell (6):
  dt-bindings: interrupt-controller: Document RTD129x
  irqchip: Add Realtek RTD129x intc driver
  arm64: dts: realtek: Move rtd1295 memreserve areas from the generic
    rtd129x to its specific dtsi
  arm64: dts: realtek: Add realtek intc to RTD129x
  dt-bindings: arm: Document RTD1296
  arm64: dts: realtek: Add bpi-w2 board support and its RTD1296 SoC

 .../devicetree/bindings/arm/realtek.txt       |  13 +
 .../realtek,rtd129x-intc.txt                  |  24 ++
 arch/arm64/boot/dts/realtek/Makefile          |   1 +
 arch/arm64/boot/dts/realtek/rtd1295.dtsi      |   3 +
 .../dts/realtek/rtd1296-bananapi-bpi-w2.dts   |  27 ++
 arch/arm64/boot/dts/realtek/rtd1296.dtsi      |  77 ++++
 arch/arm64/boot/dts/realtek/rtd129x.dtsi      |  12 +-
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-rtd129x.c                 | 371 ++++++++++++++++++
 9 files changed, 527 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/realtek,rtd129x-intc.txt
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1296-bananapi-bpi-w2.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1296.dtsi
 create mode 100644 drivers/irqchip/irq-rtd129x.c

-- 
2.21.0
