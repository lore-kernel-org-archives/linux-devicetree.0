Return-Path: <SRS0=Ntpg=NO=synopsys.com=thinh.nguyen@kernel.org>
Date: Fri, 2 Nov 2018 18:35:39 -0700
Message-ID: <cover.1541208283.git.thinhn@synopsys.com>
From: Thinh Nguyen <thinh.nguyen@synopsys.com>
Subject: [PATCH 0/3] usb: dwc3: Introduce refclk lpm
MIME-Version: 1.0
Content-Type: text/plain
To: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

This patch series introduce a new feature in DWC_usb31 with more
aggressive low power management using reference clock.


Thinh Nguyen (3):
  usb: dwc3: Add reference clock properties
  usb: dwc3: Set reference clock period
  usb: dwc3: Enable low power management using refclk

 Documentation/devicetree/bindings/usb/dwc3.txt | 18 ++++++++++++++
 drivers/usb/dwc3/core.c                        | 34 ++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h                        | 14 +++++++++++
 3 files changed, 66 insertions(+)

-- 
2.11.0
