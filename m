From: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Subject: [PATCH 0/3] usb: gadget: Add support for disabling U1 and U2 entries
Date: Thu, 2 May 2019 15:50:20 +0530
Message-ID: <1556792423-4833-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, v.anuragkumar@gmail.com, Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
List-Id: devicetree@vger.kernel.org

Gadget applications may have a requirement to disable the U1 and U2
entry based on the usecase. For example, when performing performance
benchmarking on mass storage gadget the U1 and U2 entries can be disabled.
Another example is when periodic transfers like ISOC transfers are used
with bInterval of 1 which doesn't require the link to enter into U1 or U2
state (since ping is issued from host for every uframe interval). In this
case the U1 and U2 entry can be disabled. This can be done by setting
U1DevExitLat and U2DevExitLat values to 0 in the BOS descriptor. Host on
seeing 0 value for U1DevExitLat and U2DevExitLat, it doesn't send SET_SEL
commands to the gadget. Thus entry of U1 and U2 states can be avioded.
This patch updates the same.

Anurag Kumar Vulisha (3):
  doc: dt: bindings: usb: dwc3: Update entries for disabling U1 and U2
  usb: gadget: send usb_gadget as an argument in get_config_params
  usb: dwc3: gadget: Add support for disabling U1 and U2 entries

 Documentation/devicetree/bindings/usb/dwc3.txt |  2 ++
 drivers/usb/dwc3/core.c                        |  4 ++++
 drivers/usb/dwc3/core.h                        |  4 ++++
 drivers/usb/dwc3/gadget.c                      | 19 +++++++++++++++++++
 drivers/usb/dwc3/gadget.h                      |  6 ++++++
 drivers/usb/gadget/composite.c                 |  2 +-
 include/linux/usb/gadget.h                     |  3 ++-
 7 files changed, 38 insertions(+), 2 deletions(-)

-- 
2.1.1
