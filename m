From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] DeviceTree fixes for 4.17
Date: Mon, 7 May 2018 10:09:49 -0500
Message-ID: <CAL_JsqJcQnEoWK8F0f1SzUstAPvYyRwht4UQOo1ZLGb6t-o8YQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull DT fixes for 4.17. Details below.

Rob


The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.17

for you to fetch changes up to f130307054a59ca21d2396f386be77ebd2e8ca96:

  dt-bindings: panel: lvds: Fix path to display timing bindings
(2018-05-01 09:26:31 -0500)

----------------------------------------------------------------
DeviceTree fixes for 4.17:

- Fix path to display timing binding

- Fix some typos in interrupt-names and clock-names

- Fix a resource leak on overlay removal

- Add missing documentation for R8A77965 DMA, serial, and net

- Cleanup sunxi pinctrl description

- Add Kieback & Peter GmbH vendor prefix

----------------------------------------------------------------
Geert Uytterhoeven (3):
      dt-bindings: meson-uart: DT fix s/clocks-names/clock-names/
      dt-bindings: mvebu-uart: DT fix s/interrupts-names/interrupt-names/
      dt-bindings: panel: lvds: Fix path to display timing bindings

Jacopo Mondi (3):
      dt-bindings: net: ravb: Add support for r8a77965 SoC
      dt-bindings: serial: sh-sci: Add support for r8a77965 (H)SCIF
      dt-bindings: dmaengine: rcar-dmac: document R8A77965 support

Jan Kiszka (1):
      of: overlay: Stop leaking resources on overlay removal

Lukasz Majewski (1):
      doc: Add vendor prefix for Kieback & Peter GmbH

Matheus Castello (1):
      dt-bindings: pinctrl: sunxi: Fix reference to driver

Rob Herring (1):
      dtc: checks: drop warning for missing PCI bridge bus-range

 .../bindings/display/panel/panel-common.txt        |  2 +-
 .../devicetree/bindings/dma/renesas,rcar-dmac.txt  |  1 +
 .../devicetree/bindings/net/renesas,ravb.txt       |  1 +
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |  6 ++---
 .../bindings/serial/amlogic,meson-uart.txt         |  2 +-
 .../devicetree/bindings/serial/mvebu-uart.txt      |  2 +-
 .../bindings/serial/renesas,sci-serial.txt         |  2 ++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 Documentation/devicetree/overlay-notes.txt         |  8 ++++++
 drivers/of/overlay.c                               | 30 +++++++++++++++-------
 scripts/dtc/checks.c                               |  5 ++--
 11 files changed, 42 insertions(+), 18 deletions(-)
