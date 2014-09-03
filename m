From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/2] usb: renesas_usbhs: Add device tree support for R-Car
 H2 and M2
Date: Wed, 3 Sep 2014 14:25:25 +0900
Message-ID: <5406A645.6070601@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, SH-Linux <linux-sh@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Ulrich Hecht <ulrich.hecht@gmail.com>
List-Id: devicetree@vger.kernel.org

This driver supports other SoCs, but they need boards/Soc depend code.
So, this patch adds device tree support for R-Car H2 and M2 initially.

Changes from v2:
 - Add "Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>".

Changes from v1:
 - Change an optional property name from "buswait_bwait" to "buswait" in
   patch 1.
 - Add the prefix "renesas," to "buswait" and "enable-gpio" in patch 1.
 - Modify the usbhs_parse_dt() to remove the check of some
   of_device_is_compatible() in patch 2.

Yoshihiro Shimoda (2):
  usb: renesas_usbhs: Add device tree bindings documentation
  usb: renesas_usbhs: Add device tree support for R-Car H2 and M2

 .../devicetree/bindings/usb/renesas_usbhs.txt      |   24 +++++++++++
 drivers/usb/renesas_usbhs/common.c                 |   44 ++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas_usbhs.txt

-- 
1.7.9.5

