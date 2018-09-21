Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/5] usb: renesas_usbhs: use otg mode and add support for R-Car E3
Date: Fri, 21 Sep 2018 21:26:27 +0900
Message-Id: <1537532792-20376-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch set is based on the latest Greg's usb.git / usb-testing branch
(the commit id is ae8a2ca8a2215c7e31e6d874f7303801bb15fbbc)

The previous code set the mode as peripheral mode by the UGCTRL2 register
for R-Car D3. But, this SoC can select OTG mode in fact. So, at first,
I'd like to revert related patches I submitted in patch 1 and 2.
Then, in patch 3, it sets the mode as "OTG" and in patch 4 and 5, it
supports for R-Car E3.

To use this controller for R-Car D3 and E3, we need the following
patch set. Otherwize, the mode will not be changed to peripheral mode
by the phy's COMMCTRL register:
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=21629


Yoshihiro Shimoda (5):
  Revert "usb: renesas_usbhs: add extcon notifier to set mode for
    non-otg channel"
  Revert "usb: renesas_usbhs: set the mode by using extcon state for
    non-otg channel"
  usb: renesas_usbhs: rcar3: Use OTG mode for R-Car D3
  dt-bindings: usb: renesas_usbhs: add bindings for r8a77990
  usb: renesas_usbhs: add support for R-Car E3

 .../devicetree/bindings/usb/renesas_usbhs.txt      |  1 +
 drivers/usb/renesas_usbhs/common.c                 | 13 ++++-------
 drivers/usb/renesas_usbhs/common.h                 |  1 -
 drivers/usb/renesas_usbhs/rcar3.c                  | 27 ++--------------------
 4 files changed, 7 insertions(+), 35 deletions(-)

-- 
1.9.1
