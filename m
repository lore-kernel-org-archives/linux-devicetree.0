From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/2] USB OTG PHY driver for NXP LPC18xx family
Date: Wed, 10 Jun 2015 21:09:49 +0200
Message-ID: <CAGhQ9VzoZN0wow6csD7Mq58CFk31DGup676NoO=hyqnuAwNQwA@mail.gmail.com>
References: <1432922617-11512-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432922617-11512-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kishon,

On 29 May 2015 at 20:03, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This patch set adds support for the internal USB OTG PHY found
> on NXP LPC18xx and LPC43xx devices. Driver takes care of
> enabling the PHY and setting the clock rate which is need for
> USB0 support on this platform.
>
> This version address the comments from Kishon Vijay Abraham I.
>
> Changes in v3:
>  - depend on MFD_SYSCON
>
> Changes in v2:
>  - use PTR_ERR_OR_ZERO in phy driver
>  - rename binding doc
>  - update doc commit message
>
> Base support for this platform can now be found in arm-soc next.
>
> Joachim Eastwood (2):
>   phy: add lpc18xx usb otg phy driver
>   phy: dt bindings: add XP LPC18xx/43xx USB OTG PHY bindings

Do you have any more comments on the patches or are they okey now?


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
