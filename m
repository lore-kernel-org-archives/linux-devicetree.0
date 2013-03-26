From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v4 0/6] support other fsl SoCs with usbmisc + small fixes
Date: Tue, 26 Mar 2013 14:29:40 +0200
Message-ID: <87txnyjqdn.fsf@ashishki-desk.ger.corp.intel.com>
References: <1354033021-10585-1-git-send-email-m.grzeschik@pengutronix.de> <20121128025217.GC18593@nchen-desktop> <87ip6mor1e.fsf@ashishki-desk.ger.corp.intel.com> <CAOMZO5ArDLKDLEzhYc7EP2CNQGcT=vO7ctbiEsjzsGs+EaT7Dw@mail.gmail.com> <20130325162931.GB22810@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130325162931.GB22810-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> Hi Alexander, Fabio, Greg,
>

Some more fun:

> /*
>  * Peters branch already contain the usbmisc series,
>  * but they never made it to ci-for-greg, although
>  * Alexander already mentioned (24 Jan 2013) to queue them.
>  */
> https://github.com/hzpeterchen/linux-usb.git master^^
> 4d36511 Merge 'v3.9/topic/usb-peterchen'
> 90314f3 usb: chipidea: usbmisc: add post handling and errata fix for mx25
> edde2ad usb: chipidea: usbmisc: add mx53 support
> 6150722 usb: chipidea: usbmisc: prepare driver to handle more than one soc
> 542384e usb: chipidea: usbmisc: fix a potential race condition
> cdffb44 usb: chipidea: usbmisc: unset global varibale usbmisc on driver remove
> b8e47e3 usb: chipidea: usbmisc: rename file, struct and functions to usbmisc_imx

These patches were not part of Peter's patchset, but the one that I
acked before. Yes, these go in too.

> c5863f9 usb: chipidea: imx: select usb id pin using syscon interface

Can't see it in my mailbox.

> 8c8a1f5 usb: chipidea: udc: fix the oops when plugs in usb cable after rmmod gadget
> c703723 usb: chipidea: imx: add getting vbus regulator code
> e897d66 usb: chipidea: delete the delayed work
> 4c0be3e usb: chipidea: add vbus regulator control
> f1e52f8 usb: chipidea: udc: retire the flag CI13_PULLUP_ON_VBUS
> af4e743 usb: chipidea: udc: add pullup/pulldown dp at hw_device_state
> 1be0011 usb: chipidea: add otg id switch and vbus connect/disconnect detect
> 7c3c62d usb: chipidea: add otg file
> 618bfec Revert "USB: chipidea: add vbus detect for udc"

This is, btw, an o-o-o-old version of Peter's work.

Regards,
--
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
