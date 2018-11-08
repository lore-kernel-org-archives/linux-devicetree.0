Return-Path: <SRS0=9/dT=NT=synopsys.com=thinh.nguyen@kernel.org>
Date: Thu, 8 Nov 2018 12:06:41 -0800
Message-ID: <cover.1541707248.git.thinhn@synopsys.com>
From: Thinh Nguyen <thinh.nguyen@synopsys.com>
Subject: [PATCH v6 0/3] usb: dwc3: Workaround isoc start_transfer failure
MIME-Version: 1.0
Content-Type: text/plain
To: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

DWC_usb31 peripheral v1.70a-ea06 and prior needs a SW workaround for isoc START
TRANSFER command failure. This patch series implements that workaround

Change in v6:
 - Defined more version types in "usb: dwc3: Track DWC_usb31 VERSIONTYPE"
 - Minor cleanup/fix in "usb: dwc3: Add workaround for isoc start transfer failure"
Change in v5:
 - Splitted and resent from an old patch series
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
 drivers/usb/dwc3/core.h                        |  23 +++++
 drivers/usb/dwc3/gadget.c                      | 131 +++++++++++++++++++++++++
 4 files changed, 160 insertions(+)

-- 
2.11.0
