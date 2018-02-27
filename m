Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] usb: add USB2.0/3.0 peripheral bindings for r8a77965
Date: Tue, 27 Feb 2018 17:16:01 +0900
Message-Id: <1519719363-27850-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch set is based on the latest Felipe's usb.git / testing/next
branch (commit id = 892b3e4a3df3f8fa18053aba65acd5a3dee05325).


Yoshihiro Shimoda (2):
  usb: renesas_usbhs: add binding for r8a77965
  usb: gadget: udc: renesas_usb3: add binging for r8a77965

 Documentation/devicetree/bindings/usb/renesas_usb3.txt  | 1 +
 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 1 +
 2 files changed, 2 insertions(+)

-- 
1.9.1
