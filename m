From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 0/2] USB OTG PHY driver for NXP LPC18xx family
Date: Thu,  9 Jul 2015 22:48:24 +0200
Message-ID: <1436474906-2669-1-git-send-email-manabian@gmail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set adds support for the internal USB OTG PHY found
on NXP LPC18xx and LPC43xx devices. Driver takes care of
enabling the PHY and setting the clock rate which is need for
USB0 support on this platform.

This version address moves the dt node under the creg syscon
and rebases the patch set on 4.2-rc1.

Changes in v4:
 - rebase on 4.2-rc1
 - move dt node under creg where the control reg is

Changes in v3:
 - depend on MFD_SYSCON

Changes in v2:
 - use PTR_ERR_OR_ZERO in phy driver
 - rename binding doc
 - update doc commit message

Joachim Eastwood (2):
  phy: add lpc18xx usb otg phy driver
  phy: dt bindings: add NXP LPC18xx/43xx USB OTG PHY bindings

 .../bindings/phy/phy-lpc18xx-usb-otg.txt           |  26 ++++
 drivers/phy/Kconfig                                |  11 ++
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-lpc18xx-usb-otg.c                  | 143 +++++++++++++++++++++
 4 files changed, 181 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt
 create mode 100644 drivers/phy/phy-lpc18xx-usb-otg.c

-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
