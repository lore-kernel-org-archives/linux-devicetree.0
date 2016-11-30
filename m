From: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] Support for Synopsys UDC for ARM platforms
Date: Wed, 30 Nov 2016 11:35:08 +0530
Message-ID: <1480485910-7797-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for Synposys Designware core AHB-UDC
(USB Device controller) for Arm platfoms.

New UDC driver is added to drivers/usb/gadget directory along with
updating the Kconfig and Makefile. 
DT bindings documentation is also added for the same.
Device tree entry for the same in NS2 dtsi will be sent for review
once the DRD phy driver code is pushed (which is being reviewed in a
separate patch series).

This patchset is tested on Broadcom NS2 BCM958712K reference board.

Repo: https://github.com/Broadcom/arm64-linux.git
Branch: udc_v1

Raviteja Garimella (2):
  Add DT bindings documentation for Synopsys UDC driver
  Synopsys USB 2.0 Device Controller (UDC) Driver

 .../devicetree/bindings/usb/snps,dw-ahb-udc.txt    |   29 +
 drivers/usb/gadget/udc/Kconfig                     |   12 +
 drivers/usb/gadget/udc/Makefile                    |    1 +
 drivers/usb/gadget/udc/snps_udc.c                  | 1751 ++++++++++++++++++++
 drivers/usb/gadget/udc/snps_udc.h                  | 1071 ++++++++++++
 5 files changed, 2864 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
 create mode 100644 drivers/usb/gadget/udc/snps_udc.c
 create mode 100644 drivers/usb/gadget/udc/snps_udc.h

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
