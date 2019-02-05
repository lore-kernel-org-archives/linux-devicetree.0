From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH 0/2] Reset xHCI port PHY on disconnect
Date: Tue,  5 Feb 2019 11:48:52 +0530
Message-ID: <1549347534-11320-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patch set adds a quirk in xHCI driver to reset PHY of xHCI port
on its disconnect event.

This patch set is based on Linux-5.0-rc2.

Srinath Mannam (2):
  dt-bindings: usb-xhci: Add usb-phy-port-reset property
  drivers: xhci: Add quirk to reset xHCI port PHY

 Documentation/devicetree/bindings/usb/usb-xhci.txt |  1 +
 drivers/usb/core/hcd.c                             |  6 ++++++
 drivers/usb/core/phy.c                             | 21 +++++++++++++++++++++
 drivers/usb/core/phy.h                             |  1 +
 drivers/usb/host/xhci-plat.c                       |  3 +++
 drivers/usb/host/xhci-ring.c                       |  9 ++++++---
 drivers/usb/host/xhci.h                            |  1 +
 include/linux/usb/hcd.h                            |  1 +
 8 files changed, 40 insertions(+), 3 deletions(-)

-- 
2.7.4
