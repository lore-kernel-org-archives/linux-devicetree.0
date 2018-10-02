Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] usb: gadget: udc: renesas_usb3: add support for r8a77990
Date: Tue,  2 Oct 2018 20:58:25 +0900
Message-Id: <1538481507-24821-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch set is based on the latest Greg's usb.git / usb-testing branch.

Yoshihiro Shimoda (2):
  dt-bindings: usb: renesas_usb3: add bindings for r8a77990
  usb: gadget: udc: renesas_usb3: add support for r8a77990

 Documentation/devicetree/bindings/usb/renesas_usb3.txt |  1 +
 drivers/usb/gadget/udc/renesas_usb3.c                  | 11 +++++++++++
 2 files changed, 12 insertions(+)

-- 
1.9.1
