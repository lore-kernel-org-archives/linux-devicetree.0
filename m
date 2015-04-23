From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] 2nd batch of DeviceTree for 4.1
Date: Wed, 22 Apr 2015 23:08:42 -0500
Message-ID: <CAL_JsqKb6k3nHCx6tC42eDJcRMVAvZS6PPu9ayyBrT-23LTa_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi LInus,

As Grant mentioned, here is the 2nd batch of DT changes for 4.1. The
main remaining item here is the endianness bindings and related 8250
driver support. Please pull.

Rob

The following changes since commit 01218bf14ee60d4a2d6c667ebdbba3ae9a7a1d66:

  of: Explicitly include linux/types.h in of_graph.h (2015-03-26 12:14:56 -0500)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-4.1

for you to fetch changes up to 04fca0e390e80d88c2f959aef86e0bb7f26fea01:

  frv: add io{read,write}{16,32}be functions (2015-04-22 22:38:21 -0500)

----------------------------------------------------------------
Devicetree updates for 4.1:

- DT endianness specification bindings
- Big endian 8250 serial support
- DT overlay unittest updates
- Various DT doc updates
- Compile fixes for OF_IRQ=n

----------------------------------------------------------------
Alessio Igor Bogani (1):
      of: add vendor prefix for Artesyn

Baruch Siach (1):
      of: base: improve of_get_next_child() kernel-doc

Dinh Nguyen (1):
      Documentation: DT bindings: add doc for Altera's SoCFPGA platform

Florian Fainelli (1):
      of/fdt: Remove "reg" data prints from early_init_dt_scan_memory

Geert Uytterhoeven (2):
      of: OF_IRQ should depend on IRQ_DOMAIN
      of: Add dummy of_irq_to_resource_table() for IRQ_OF=n

Guenter Roeck (2):
      mn10300: add io{read,write}{16,32}be functions
      frv: add io{read,write}{16,32}be functions

Kevin Cernekee (5):
      of: Add helper function to check MMIO register endianness
      of/fdt: Add endianness helper function for early init code
      of: Document {little,big,native}-endian bindings
      serial: 8250: Add support for big-endian MMIO accesses
      serial: of_serial: Support big-endian register accesses

Mark Rutland (1):
      Doc: dt: arch_timer: discourage clock-frequency use

Pantelis Antoniou (1):
      of: unittest: overlay: Keep track of created overlays

Ricky Liang (1):
      of/fdt: fix allocation size for device node path

 Documentation/devicetree/bindings/arm/altera.txt   | 14 +++++
 .../devicetree/bindings/arm/arch_timer.txt         |  8 ++-
 .../devicetree/bindings/common-properties.txt      | 60 +++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 arch/frv/include/asm/io.h                          |  5 ++
 arch/mn10300/include/asm/io.h                      |  5 ++
 drivers/of/Kconfig                                 |  2 +-
 drivers/of/base.c                                  | 28 +++++++++-
 drivers/of/fdt.c                                   | 24 +++++++--
 drivers/of/unittest.c                              | 62 ++++++++++++++++++++++
 drivers/tty/serial/8250/8250_core.c                | 20 +++++++
 drivers/tty/serial/8250/8250_early.c               |  5 ++
 drivers/tty/serial/of_serial.c                     |  3 +-
 include/linux/of.h                                 |  6 +++
 include/linux/of_fdt.h                             |  2 +
 include/linux/of_irq.h                             |  9 +++-
 16 files changed, 243 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/altera.txt
 create mode 100644 Documentation/devicetree/bindings/common-properties.txt
