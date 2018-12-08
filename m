Return-Path: <SRS0=Q85b=OR=synopsys.com=thinh.nguyen@kernel.org>
Date: Fri, 7 Dec 2018 18:27:23 -0800
Message-ID: <cover.1544235317.git.thinhn@synopsys.com>
From: Thinh Nguyen <thinh.nguyen@synopsys.com>
Subject: [PATCH v2 0/4] usb: dwc3: Introduce refclk lpm
MIME-Version: 1.0
Content-Type: text/plain
To: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

This patch series introduce a new feature in DWC_usb31 with more
aggressive low power management using reference clock.

Changes in v2:
- Revise commit messages to correctly describe the feature
- Split previous patch "usb: dwc3: Add reference clock properties" to 2
  separate patches
- Remove reference clock period validation in since DWC_usb3
  can support more periods than DWC_usb31
- Rename property snps,enable-refclk-lpm to snps,enable-refclk-sof


Thinh Nguyen (4):
  usb: dwc3: Add property snps,refclk-period-ns
  usb: dwc3: Set the reference clock period
  usb: dwc3: Add property snps,enable-refclk-sof
  usb: dwc3: Enable frame number tracking based on reference clock

 Documentation/devicetree/bindings/usb/dwc3.txt |  5 +++
 drivers/usb/dwc3/core.c                        | 60 ++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h                        | 16 +++++++
 3 files changed, 81 insertions(+)

-- 
2.11.0
