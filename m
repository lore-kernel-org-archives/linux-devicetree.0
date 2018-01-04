From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/3] usb: renesas_usbhs: Add RZ/A1 support
Date: Thu,  4 Jan 2018 15:01:47 -0500
Message-ID: <20180104200150.11352-1-chris.brandt@renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds RZ/A1 gadget support to the renesas_usbhs driver.
Basically, it's almost the same HW as the R-Car (and SH) parts.
The only real difference is the some extra registers for the PHY.

This was tested on an RSK board by connecting to a PC as an
Ethernet CDC gadget.

Chris Brandt (3):
  usb: renesas_usbhs: Add support for RZ/A1
  dt-bindings: usb: renesas_usbhs: Add support for RZ/A1
  ARM: dts: r7s72100: add USB device to device tree

 .../devicetree/bindings/usb/renesas_usbhs.txt      |  2 +
 arch/arm/boot/dts/r7s72100.dtsi                    | 20 +++++++++
 drivers/usb/renesas_usbhs/Makefile                 |  2 +-
 drivers/usb/renesas_usbhs/common.c                 | 17 +++++++
 drivers/usb/renesas_usbhs/common.h                 |  6 +++
 drivers/usb/renesas_usbhs/rza.c                    | 52 ++++++++++++++++++++++
 drivers/usb/renesas_usbhs/rza.h                    |  4 ++
 include/linux/usb/renesas_usbhs.h                  |  1 +
 8 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/renesas_usbhs/rza.c
 create mode 100644 drivers/usb/renesas_usbhs/rza.h

-- 
2.15.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
