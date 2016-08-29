From: John Youn <johnyoun@synopsys.com>
Subject: [PATCH 0/6] usb: dwc2: gadget: Fix TX FIFO handling
Date: Mon, 29 Aug 2016 13:38:46 -0700
Message-ID: <cover.1472502978.git.johnyoun__9706.34783520854$1472503141$gmane$org@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Youn <johnyoun@synopsys.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: Robert Baldyga <r.baldyga@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi,

This is a resend of a patch series originally submitted by Robert
Baldyga back in February.

Somehow I missed it back then. Sorry about that.

It should fix some FIFO programming related issues on RPi and maybe
other platforms.

Also, this series makes the g-tx-fifo-size DT property obsolete. I've
added a patch at the end of the series to document that.

Regards,
John

John Youn (1):
  Documentation: devicetree: dwc2: Deprecate g-tx-fifo-size

Robert Baldyga (5):
  usb: dwc2: gadget: use ep->fifo_index in context of FIFO registers
  usb: dwc2: gadget: fix TX FIFO size and address initialization
  usb: dwc2: gadget: change variable name to more meaningful
  usb: dwc2: gadget: remove dead code from dwc2_hsotg_ep_enable()
  usb: dwc2: gadget: free TX FIFO after killing requests

 Documentation/devicetree/bindings/usb/dwc2.txt |  5 +-
 drivers/usb/dwc2/core.h                        |  7 ---
 drivers/usb/dwc2/gadget.c                      | 79 +++++++-------------------
 3 files changed, 23 insertions(+), 68 deletions(-)

-- 
2.9.0
