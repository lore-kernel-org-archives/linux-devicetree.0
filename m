From: Sergio Prado <sergio.prado@e-labworks.com>
Subject: [PATCH 0/2] usb: gadget: s3c2410: add device tree support
Date: Fri,  9 Dec 2016 17:06:38 -0200
Message-ID: <1481310400-28676-1-git-send-email-sergio.prado@e-labworks.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, balbi@kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>
List-Id: devicetree@vger.kernel.org

This series adds support for configuring Samsung's s3c2410 and
compatible USB device controller via devicetree.

Tested on FriendlyARM mini2440, based on s3c2440 SoC.

Sergio Prado (2):
  dt-bindings: usb: add DT binding for s3c2410 USB device controller
  usb: gadget: s3c2410: allow probing from device tree

 .../devicetree/bindings/usb/s3c2410-usb.txt        |  28 ++++
 drivers/usb/gadget/udc/s3c2410_udc.c               | 142 +++++++++++++++++----
 drivers/usb/gadget/udc/s3c2410_udc.h               |   4 +
 3 files changed, 151 insertions(+), 23 deletions(-)

-- 
1.9.1
