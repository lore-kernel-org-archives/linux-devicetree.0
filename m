From: Manish Narani <manish.narani@xilinx.com>
Subject: [RFC PATCH] usb: dwc3: add support for OTG driver compilation
Date: Wed, 4 Jan 2017 18:52:56 +0530
Message-ID: <1483536181-22356-2-git-send-email-mnarani@xilinx.com>
References: <1483536181-22356-1-git-send-email-mnarani@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483536181-22356-1-git-send-email-mnarani@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, balbi@kernel.org, gregkh@linuxfoundation.org, mathias.nyman@intel.com, agraf@suse.de, bharatku@xilinx.com, punnaiah.choudary.kalluri@xilinx.com, dhdang@apm.com, marc.zyngier@arm.com, mnarani@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc: anirudh@xilinx.com, anuragku@xilinx.com
List-Id: devicetree@vger.kernel.org

This patch adds support for OTG driver compilation and object
file creation

Signed-off-by: Manish Narani <mnarani@xilinx.com>
---
 drivers/usb/dwc3/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index ffca340..2d269ad 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -17,6 +17,10 @@ ifneq ($(filter y,$(CONFIG_USB_DWC3_GADGET) $(CONFIG_USB_DWC3_DUAL_ROLE)),)
 	dwc3-y				+= gadget.o ep0.o
 endif
 
+ifneq ($(CONFIG_USB_DWC3_DUAL_ROLE),)
+	dwc3-y				+= otg.o
+endif
+
 ifneq ($(CONFIG_USB_DWC3_ULPI),)
 	dwc3-y				+= ulpi.o
 endif
-- 
2.1.1
