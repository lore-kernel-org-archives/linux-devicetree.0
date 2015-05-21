From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] USB OTG PHY driver for NXP LPC18xx family
Date: Thu, 21 May 2015 17:59:19 +0200
Message-ID: <1432223961-26101-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set adds support for the internal USB OTG PHY found
on NXP LPC18xx and LPC43xx devices. Driver takes care of
enabling the PHY and setting the clock rate which is need for
USB0 support on this platform.

This version address the comments from Kishon Vijay Abraham I.

Changes in v2:
 - use PTR_ERR_OR_ZERO in phy driver
 - rename binding doc
 - update doc commit message

Base support for this platform can now be found in arm-soc next.

Joachim Eastwood (2):
  phy: add lpc18xx usb otg phy driver
  phy: dt bindings: add NXP LPC18xx/43xx USB OTG PHY bindings

 .../bindings/phy/phy-lpc18xx-usb-otg.txt           |  19 +++
 drivers/phy/Kconfig                                |  11 ++
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-lpc18xx-usb-otg.c                  | 143 +++++++++++++++++++++
 4 files changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt
 create mode 100644 drivers/phy/phy-lpc18xx-usb-otg.c

-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
