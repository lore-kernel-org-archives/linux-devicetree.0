From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] usb: renesas_usbhs: Add device tree support for R-Car
 H2 and M2
Date: Fri, 1 Aug 2014 20:49:04 +0900
Message-ID: <53DB7EB0.8000401@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-2022-JP"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: SH-Linux <linux-sh@vger.kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

This driver supports other SoCs, but they need boards/Soc depend code.
So, this patch adds device tree support for R-Car H2 and M2 initially.

Yoshihiro Shimoda (2):
  usb: renesas_usbhs: Add device tree bindings documentation
  usb: renesas_usbhs: Add device tree support for R-Car H2 and M2

 .../devicetree/bindings/usb/renesas_usbhs.txt      |   24 +++++++++++
 drivers/usb/renesas_usbhs/common.c                 |   43 ++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas_usbhs.txt

-- 
1.7.9.5
