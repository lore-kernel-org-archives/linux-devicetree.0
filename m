From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] usb: renesas_usbhs: some modifications
Date: Mon, 27 Jun 2016 21:09:16 +0900
Message-ID: <1467029359-6812-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set is based on the latest Felipe's testing/next branch
(commit id = 1d23d16a88e6c8143b07339435ba061b131ebb8c) and the following
fixed patch set:
 http://thread.gmane.org/gmane.linux.kernel.stable/181504


Yoshihiro Shimoda (3):
  usb: renesas_usbhs: Fix a condition about a log of "transceiver found"
  usb: renesas_usbhs: show error code when probe failed
  usb: renesas_usbhs: Use devm_usb_get_phy_by_phandle()

 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 3 ++-
 drivers/usb/renesas_usbhs/common.c                      | 2 +-
 drivers/usb/renesas_usbhs/mod_gadget.c                  | 9 +++++++--
 3 files changed, 10 insertions(+), 4 deletions(-)

-- 
1.9.1
