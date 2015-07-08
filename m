From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 0/4] musb: sunxi: Add support for the Allwinner sunxi musb
Date: Wed,  8 Jul 2015 16:41:36 +0200
Message-ID: <1436366500-12555-1-git-send-email-hdegoede@redhat.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Felipe,

As requested here is a new version of my "musb: sunxi: Add support for the
Allwinner sunxi musb controller" patch, fixing the "Should it be static?"
compiler warning.

While working on this I noticed that sun4i_usb_phy_set_squelch_detect()
from phy-sun4i-usb.c is missing an EXPORT_SYMBOL, something which I did
not notice before I was always building both phy-sun4i-usb and musb
into the kernel.

I've added a patch fixing this, and I'm posting a new version of the
entire set including this patch.

I believe that like the original patch adding the
sun4i_usb_phy_set_squelch_detect function, this patch should go upstream
through your (Felipe's) tree as the musb-sunxi patches depend on this.

The other oustanding phy-sun4i-usb patches can still go upstream through
Kishon's tree, they do not conflict with the small patch fixing the
missing EXPORT_SYMBOL.

Thanks & Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
