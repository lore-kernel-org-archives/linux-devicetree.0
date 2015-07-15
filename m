From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 0/2] USB OTG PHY driver for NXP LPC18xx family
Date: Wed, 15 Jul 2015 16:20:09 +0530
Message-ID: <55A63AE1.50701@ti.com>
References: <1436474906-2669-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436474906-2669-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Friday 10 July 2015 02:18 AM, Joachim Eastwood wrote:
> This patch set adds support for the internal USB OTG PHY found
> on NXP LPC18xx and LPC43xx devices. Driver takes care of
> enabling the PHY and setting the clock rate which is need for
> USB0 support on this platform.
> 
> This version address moves the dt node under the creg syscon
> and rebases the patch set on 4.2-rc1.

merged this to linux-phy tree.

Cheers
Kishon

> 
> Changes in v4:
>  - rebase on 4.2-rc1
>  - move dt node under creg where the control reg is
> 
> Changes in v3:
>  - depend on MFD_SYSCON
> 
> Changes in v2:
>  - use PTR_ERR_OR_ZERO in phy driver
>  - rename binding doc
>  - update doc commit message
> 
> Joachim Eastwood (2):
>   phy: add lpc18xx usb otg phy driver
>   phy: dt bindings: add NXP LPC18xx/43xx USB OTG PHY bindings
> 
>  .../bindings/phy/phy-lpc18xx-usb-otg.txt           |  26 ++++
>  drivers/phy/Kconfig                                |  11 ++
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-lpc18xx-usb-otg.c                  | 143 +++++++++++++++++++++
>  4 files changed, 181 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt
>  create mode 100644 drivers/phy/phy-lpc18xx-usb-otg.c
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
