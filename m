From: Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH v1 0/2] Introduced new Cadence USBSS DRD Driver.
Date: Mon, 10 Dec 2018 12:39:13 +0000
Message-ID: <1544445555-17325-1-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, balbi@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com, Pawel Laszczak <pawell@cadence.com>
List-Id: devicetree@vger.kernel.org

This patch set introduce new Cadence USBSS DRD driver
to linux kernel.

The Cadence USBSS DRD Driver s a highly
configurable IP Core which can be
instantiated as Dual-Role Device (DRD),
Peripheral Only and Host Only (XHCI)
configurations.

The current driver has been validated with
FPGA burned. We have support for PCIe
bus, which is used on FPGA prototyping.

The host site of USBSS controller is compliance
with XHCI specification, so it works with
standard XHCI linux driver.

---

Pawel Laszczak (2):
  dt-bindings: add binding for USBSS-DRD controller.
  usb:cdns3 Add Cadence USB3 DRD Driver

 .../devicetree/bindings/usb/cdns3-usb.txt     |   31 +
 drivers/usb/Kconfig                           |    2 +
 drivers/usb/Makefile                          |    2 +
 drivers/usb/cdns3/Kconfig                     |   44 +
 drivers/usb/cdns3/Makefile                    |   16 +
 drivers/usb/cdns3/cdns3-pci-wrap.c            |  157 ++
 drivers/usb/cdns3/core.c                      |  451 +++++
 drivers/usb/cdns3/core.h                      |  108 +
 drivers/usb/cdns3/debug.h                     |  346 ++++
 drivers/usb/cdns3/debugfs.c                   |  168 ++
 drivers/usb/cdns3/drd.c                       |  315 +++
 drivers/usb/cdns3/drd.h                       |  129 ++
 drivers/usb/cdns3/ep0.c                       |  864 ++++++++
 drivers/usb/cdns3/gadget-export.h             |   28 +
 drivers/usb/cdns3/gadget.c                    | 1802 +++++++++++++++++
 drivers/usb/cdns3/gadget.h                    | 1177 +++++++++++
 drivers/usb/cdns3/host-export.h               |   28 +
 drivers/usb/cdns3/host.c                      |   74 +
 drivers/usb/cdns3/trace.c                     |   11 +
 drivers/usb/cdns3/trace.h                     |  343 ++++
 20 files changed, 6096 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cdns3-usb.txt
 create mode 100644 drivers/usb/cdns3/Kconfig
 create mode 100644 drivers/usb/cdns3/Makefile
 create mode 100644 drivers/usb/cdns3/cdns3-pci-wrap.c
 create mode 100644 drivers/usb/cdns3/core.c
 create mode 100644 drivers/usb/cdns3/core.h
 create mode 100644 drivers/usb/cdns3/debug.h
 create mode 100644 drivers/usb/cdns3/debugfs.c
 create mode 100644 drivers/usb/cdns3/drd.c
 create mode 100644 drivers/usb/cdns3/drd.h
 create mode 100644 drivers/usb/cdns3/ep0.c
 create mode 100644 drivers/usb/cdns3/gadget-export.h
 create mode 100644 drivers/usb/cdns3/gadget.c
 create mode 100644 drivers/usb/cdns3/gadget.h
 create mode 100644 drivers/usb/cdns3/host-export.h
 create mode 100644 drivers/usb/cdns3/host.c
 create mode 100644 drivers/usb/cdns3/trace.c
 create mode 100644 drivers/usb/cdns3/trace.h

-- 
2.17.1
