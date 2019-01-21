From: Liming Sun <lsun@mellanox.com>
Subject: [PATCH v7 0/9] Mellanox BlueField ARM SoC Rshim driver
Date: Mon, 21 Jan 2019 14:17:48 -0500
Message-ID: <1548098268-982-1-git-send-email-lsun@mellanox.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, David Woods <dwoods@mellanox.com>, Robin Murphy <robin.murphy@arm.com>, arm-soc <arm@kernel.org>
Cc: devicetree@vger.kernel.org, Liming Sun <lsun@mellanox.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch series implements Linux driver support for the Rshim
component on Mellanox BlueField ARM SoC.

1. Overview of the Rshim component

The Rshim component provides a connection among different other
components of the SoC and can be accessed externally via USB or
PCIe. USB access is available on standard appliance and SmartNIC.
PCIe access is for SmartNIC only.

>From user perspective, Rshim provides the following
functionalities.

1.1 Boot FIFO

  The Boot FIFO is polled by the boot ROM. At a later booting
  phase it's read by UEFI as well to load the Linux kernel.

  The Boot FIFO is a one-way direction FIFO. The data could
  come from different sources.

    a) On-chip eMMC, which is the default configuration.

      After chip reset, HW will generate eMMC commands, which
      triggers the boot stream on the eMMC boot partition to show
      up in Boot FIFO.

      This one doesn't need any Linux driver.

    b) Injected externally from USB or PCIe.

      External host could overwrite the boot mode and inject
      boot stream into the Boot FIFO over USB or PCIe. It's
      used in board bring-up, fault recovering or debugging.

      This one usually needs driver support in the external host.

1.2 TmFifo

  TmFifo are FIFOs which can be used for communication between
  the SoC ARM core and the external side. Each direction has its
  own FIFO.

  TmFifo needs driver support on both the SoC side and the
  external host side.

1.3 Rshim register space access

  Rshim register space could be accessed externally via
  USB or PCIe. It's used for configuration, debugging, etc.
  More specifically, it could be used to access the ARM
  CoreSight component which could do on-chip debugging,
  such as for boot loader, drivers, or crash information
  collection.

  This one needs driver support from external host.

2. Driver Introduction

  This patch series provides several drivers.

  *) Patch 1/9 ~ 4/9 (tmfifo.c, tmfifo_regs.h, Kconfig, Makefile)

    They provide Linux driver support for the TmFifo on the
    SoC side (see above 1.2).

  *) Patch 5/9 ~ 9/9

    They provide Linux driver support for the external host.

    - Patch 5/9 (rshim.c, rshim.h, rshim_regs.h, Makefile)

      It provides common functionalities and register access
      to the RShim component. Several character devices are
      created like below for easy user-access.

      /dev/rshim<N>/boot 

        This device file is used to inject boot stream into
        the Boot FIFO, such as
              'cat boot-image > /dev/rshim<N>/boot'
        This one is to implement the above function 1.1.b

      /dev/rshim<N>/rshim

        This device file is used to access Rshim register
        space like a plat file.

      /dev/rshim<N>/console

        This device file is used to access the virtual
        console to the SoC via the TmFifo (see above
        functionality 1.2). It can be used by any standard tools
        like minicom, screen, etc.

    - Patch 6/9 (rshim_net.c)

      This patch provides virtual networking support over
      the Rshim TmFifo (see above functionality 1.2).

    - Patch 7/9 (rshim_usb.c)

      This is the USB backend driver, which implements the
      details to access the RShim component via USB. It supports
      endpoints, USB bulk-transfer and interrupts. After loaded
      by ACPI, it triggers the loading of the common driver
      and network driver, and provides low-level APIs to the
      common driver.

      Below is an example of the networking calling stack.

      Linux Network Stack --> virtio_net --> rshim_net -->
      rshim common driver --> rshim USB backend driver

    - Patch 8/9 (rshim_pcie.c)

      This is the PCIe backend driver, which implements the
      details to access the RShim component via PCIe when
      the HCA firmware is ready. In such case, the Rshim component
      is exposed as a standard PCIe PF and it's register space
      can be mapped in BAR0.

      Linux Network Stack --> virtio_net --> rshim_net -->
      rshim common driver --> rshim PCIe backend driver

   - Patch 9/9 (rshim_pcie_lf.c)

     Similarly, this is another PCIe backend driver, but provides
     slow access when the HCA firmware is not ready. In such as,
     the BAR0 mapping is not available. The Rshim register access
     is done via a slow access gateway. The below calling stack
     is also similar.

      Linux Network Stack --> virtio_net --> rshim_net -->
      rshim common driver --> rshim PCIe livefish backend driver

Liming Sun (9):
  soc: Add TmFifo driver for Mellanox BlueField Soc
  arm64: Add Mellanox BlueField SoC config option
  dt-bindings: soc: Add TmFifo binding for Mellanox BlueField SoC
  MAINTAINERS: Add entry for Mellanox Bluefield Soc
  soc: mellanox: host: Add the common host side Rshim driver
  soc: mellanox: host: Add networking support over Rshim
  soc: mellanox: host: Add the Rshim USB backend driver
  soc: mellanox: host: Add the Rshim PCIe backend driver
  soc: mellanox: host: Add the Rshim PCIe live-fish backend driver

 .../devicetree/bindings/soc/mellanox/tmfifo.txt    |   23 +
 MAINTAINERS                                        |    8 +
 arch/arm64/Kconfig.platforms                       |    6 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/soc/Kconfig                                |    1 +
 drivers/soc/Makefile                               |    1 +
 drivers/soc/mellanox/Kconfig                       |   26 +
 drivers/soc/mellanox/Makefile                      |    6 +
 drivers/soc/mellanox/host/Makefile                 |    2 +
 drivers/soc/mellanox/host/rshim.c                  | 2673 ++++++++++++++++++++
 drivers/soc/mellanox/host/rshim.h                  |  361 +++
 drivers/soc/mellanox/host/rshim_net.c              |  834 ++++++
 drivers/soc/mellanox/host/rshim_pcie.c             |  478 ++++
 drivers/soc/mellanox/host/rshim_pcie_lf.c          |  695 +++++
 drivers/soc/mellanox/host/rshim_regs.h             |  152 ++
 drivers/soc/mellanox/host/rshim_usb.c              | 1035 ++++++++
 drivers/soc/mellanox/tmfifo.c                      | 1244 +++++++++
 drivers/soc/mellanox/tmfifo_regs.h                 |   76 +
 18 files changed, 7622 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mellanox/tmfifo.txt
 create mode 100644 drivers/soc/mellanox/Kconfig
 create mode 100644 drivers/soc/mellanox/Makefile
 create mode 100644 drivers/soc/mellanox/host/Makefile
 create mode 100644 drivers/soc/mellanox/host/rshim.c
 create mode 100644 drivers/soc/mellanox/host/rshim.h
 create mode 100644 drivers/soc/mellanox/host/rshim_net.c
 create mode 100644 drivers/soc/mellanox/host/rshim_pcie.c
 create mode 100644 drivers/soc/mellanox/host/rshim_pcie_lf.c
 create mode 100644 drivers/soc/mellanox/host/rshim_regs.h
 create mode 100644 drivers/soc/mellanox/host/rshim_usb.c
 create mode 100644 drivers/soc/mellanox/tmfifo.c
 create mode 100644 drivers/soc/mellanox/tmfifo_regs.h

-- 
1.8.3.1
