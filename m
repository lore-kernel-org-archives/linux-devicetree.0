From: Roger Quadros <rogerq@ti.com>
Subject: [PATCH v2 0/3] usb: dwc3: Add support for AM654 USB
Date: Thu, 10 Jan 2019 17:04:27 +0200
Message-ID: <1547132670-5908-1-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org
Cc: vigneshr@ti.com, robh+dt@kernel.org, nsekhar@ti.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Felipe,

TI's AM654 USB SoC has 2 instances of the DWC3 controller.
This series adds AM654 USB wrapper support to the keystone-usb driver.

Changelog:
v2:
- Moved compatible to separate lines in DT binding.

cheers,
-roger

Roger Quadros (3):
  usb: dwc3: gadget: Fix OTG events when gadget driver isn't loaded
  dt-bindings: usb: keystone-usb: Add ti,am654-dwc3 support
  usb: dwc3: keystone: Add support for ti,am654-dwc3

 Documentation/devicetree/bindings/usb/keystone-usb.txt |  6 ++++--
 drivers/usb/dwc3/Kconfig                               |  6 +++---
 drivers/usb/dwc3/dwc3-keystone.c                       | 11 ++++++++++-
 drivers/usb/dwc3/gadget.c                              |  2 ++
 4 files changed, 19 insertions(+), 6 deletions(-)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
