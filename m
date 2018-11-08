Return-Path: <SRS0=9/dT=NT=synopsys.com=thinh.nguyen@kernel.org>
Date: Wed, 7 Nov 2018 18:10:23 -0800
Message-ID: <cover.1541642865.git.thinhn@synopsys.com>
From: Thinh Nguyen <thinh.nguyen@synopsys.com>
Subject: [PATCH 0/3] usb: dwc3: Misc USB2 LPM settings
MIME-Version: 1.0
Content-Type: text/plain
To: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

This patch series adds miscellaneous USB2 LPM related settings


Thinh Nguyen (3):
  usb: dwc3: Set GUSB2PHYCFG.ENBLSLPM
  usb: dwc3: Add a property to disable USB2 LPM
  usb: dwc3: Support option to disable USB2 LPM

 Documentation/devicetree/bindings/usb/dwc3.txt | 1 +
 drivers/usb/dwc3/core.c                        | 4 ++++
 drivers/usb/dwc3/core.h                        | 2 ++
 drivers/usb/dwc3/host.c                        | 5 ++++-
 4 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.11.0
