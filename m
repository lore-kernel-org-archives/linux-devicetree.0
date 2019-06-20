From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH 0/6] usb: bdc: Updates and fixes to USB BDC driver
Date: Thu, 20 Jun 2019 17:09:45 -0400
Message-ID: <1561064991-16874-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, devicetree@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

This is a series of updates and fixes to the Broadcom USB BDC driver

Al Cooper (6):
  usb: bdc: driver runs out of buffer descriptors on large ADB transfers
  usb: bdc: Cleanup clock support
  usb: bdc: driver may fail to get USB PHY
  usb: bdc: Fix bug causing crash after multiple disconnects
  dt-bindings: usb: bdc: Update compatible strings
  usb: bdc: Update compatible match strings

 Documentation/devicetree/bindings/usb/brcm,bdc.txt |  4 ++--
 drivers/usb/gadget/udc/bdc/bdc.h                   |  2 +-
 drivers/usb/gadget/udc/bdc/bdc_core.c              | 26 ++++++++++++++++------
 drivers/usb/gadget/udc/bdc/bdc_ep.c                | 16 ++++++++-----
 4 files changed, 32 insertions(+), 16 deletions(-)

-- 
1.9.0.138.g2de3478
