Return-Path: <SRS0=9/dT=NT=synopsys.com=thinh.nguyen@kernel.org>
Date: Wed, 7 Nov 2018 19:51:02 -0800
Message-ID: <cover.1541648784.git.thinhn@synopsys.com>
From: Thinh Nguyen <thinh.nguyen@synopsys.com>
Subject: [PATCH v5 0/3] usb: dwc3: Workaround isoc start_transfer failure
MIME-Version: 1.0
Content-Type: text/plain
To: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

DWC_usb31 peripheral v1.70a-ea06 and prior needs a SW workaround for isoc START
TRANSFER command failure. This patch series implements that workaround

Change in v5:
 - Splited and resent from an old patch series
 - Cleanup and fixed review issues
Change in v4:
 - None
Change in v3:
 - None
Change in v2:
 - None


Thinh Nguyen (3):
  usb: dwc3: Track DWC_usb31 VERSIONTYPE
  usb: dwc3: Add disabling of start_transfer failure quirk
  usb: dwc3: Add workaround for isoc start transfer failure

 Documentation/devicetree/bindings/usb/dwc3.txt |   3 +
 drivers/usb/dwc3/core.c                        |   3 +
 drivers/usb/dwc3/core.h                        |  19 ++++
 drivers/usb/dwc3/gadget.c                      | 132 +++++++++++++++++++++++++
 4 files changed, 157 insertions(+)

-- 
2.11.0
