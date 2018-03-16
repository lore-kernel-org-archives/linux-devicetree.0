Return-Path: <SRS0=yttm=GG=synopsys.com=Thinh.Nguyen@kernel.org>
Date: Fri, 16 Mar 2018 15:33:41 -0700
Message-ID: <cover.1521239259.git.thinhn@synopsys.com>
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v5 00/10] usb: dwc3: Add new updates for DWC_usb31
MIME-Version: 1.0
Content-Type: text/plain
To: Felipe Balbi <balbi@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <John.Youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

This patch series adds new updates and some fixes for DWC_usb31.

Changes in v5:
 - Remove isoc workaround patches from series
 - Remove "usb: core: urb: Check SSP isoc ep comp descriptor" from series

Changes in v4:
 - Correctly refer "databook" as "programming guide"
 - Document more detail about enabling of ESS periodic tx/rx threshold

Changes in v3:
 - Add "usb: dwc3: Check controller type before setting speed" to series

Changes in v2:
 - Add another patch to the series to increase mass_storage max_speed
 - Separate "usb: dwc3: ep0: Reset TRB counter for ep0 IN" from series
 - Separate "usb: dwc3: gadget: Set maxpacket size for ep0 IN" from series
 - Use msleep() instead of mdelay() for SoftReset PHY sync delay
 - Rename new USB31 macros from DWC3_USB31_* to DWC31_*
 - Rename device properties and replace '_' with '-'
 - Minor fixes in the commit messages


Thinh Nguyen (10):
  usb: dwc3: Add SoftReset PHY synchonization delay
  usb: dwc3: Update DWC_usb31 GTXFIFOSIZ reg fields
  usb: dwc3: Check IP revision for GTXFIFOSIZ
  usb: dwc3: Add DWC_usb31 GRXTHRCFG bit fields
  usb: dwc3: gadget: Check IP revision for GRXTHRCFG
  usb: dwc3: Add DWC_usb31 GTXTHRCFG reg fields
  usb: dwc3: Make TX/RX threshold configurable
  usb: dwc3: Check for ESS TX/RX threshold config
  usb: dwc3: Dump LSP and BMU debug info
  usb: dwc3: Check controller type before setting speed

 Documentation/devicetree/bindings/usb/dwc3.txt | 16 ++++++
 drivers/usb/dwc3/core.c                        | 68 +++++++++++++++++++++++++-
 drivers/usb/dwc3/core.h                        | 35 +++++++++++++
 drivers/usb/dwc3/debugfs.c                     |  5 ++
 drivers/usb/dwc3/gadget.c                      | 16 ++++--
 5 files changed, 136 insertions(+), 4 deletions(-)

-- 
2.11.0
