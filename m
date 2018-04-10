Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] usb: gadet: udc: renesas_usb3: add role switch for R-Car SoCs
Date: Tue, 10 Apr 2018 21:13:52 +0900
Message-Id: <1523362434-17808-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch is based on the today's Linus master branch.
This patch uses the USB role switch framework to attach/detach USB 3.0
host driver when changes the role via the rcar usb switch driver [1]
and "usb_role" sysfs.

[1] https://patchwork.kernel.org/patch/10332865/

In the future, I will add using the USB role switch APIs to renesas_usb3
driver. But, for now, since the device connection framework is not good
for device tree environment (e.g. calling the API on a driver with
device name, but device names on device tree environment will be
<base address register>.<device name>).

Yoshihiro Shimoda (2):
  usb: gadget: udc: renesas_usb3: add property "renesas,ignore-id"
  usb: gadget: udc: renesas_usb3: add devm_of_platform_populate()

 Documentation/devicetree/bindings/usb/renesas_usb3.txt |  2 ++
 drivers/usb/gadget/udc/Kconfig                         |  1 +
 drivers/usb/gadget/udc/renesas_usb3.c                  | 16 ++++++++++++++++
 3 files changed, 19 insertions(+)

-- 
1.9.1
