Return-Path: <SRS0=T75w=N2=synopsys.com=thinh.nguyen@kernel.org>
Date: Wed, 14 Nov 2018 22:56:41 -0800
Message-ID: <cover.1542264763.git.thinhn@synopsys.com>
From: Thinh Nguyen <thinh.nguyen@synopsys.com>
Subject: [PATCH v7 0/2] usb: dwc3: Workaround isoc start_transfer failure
MIME-Version: 1.0
Content-Type: text/plain
To: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

DWC_usb31 peripheral v1.70a-ea06 and prior needs a SW workaround for isoc START
TRANSFER command failure. This patch series implements that workaround

Change in v7:
 - Rebased on Felipe's branch
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


Thinh Nguyen (2):
  usb: dwc3: Add disabling of start_transfer failure quirk
  usb: dwc3: Add workaround for isoc start transfer failure

 Documentation/devicetree/bindings/usb/dwc3.txt |   3 +
 drivers/usb/dwc3/core.c                        |   2 +
 drivers/usb/dwc3/core.h                        |  13 +++
 drivers/usb/dwc3/gadget.c                      | 131 +++++++++++++++++++++++++
 4 files changed, 149 insertions(+)

-- 
2.11.0
