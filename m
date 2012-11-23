From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v3 3/7] usb: chipidea: usbmisc: fix a potential race condition
Date: Fri, 23 Nov 2012 11:01:24 +0200
Message-ID: <87sj804rrv.fsf@ashishki-desk.ger.corp.intel.com>
References: <1353506793-8354-1-git-send-email-m.grzeschik@pengutronix.de> <1353506793-8354-4-git-send-email-m.grzeschik@pengutronix.de> <20121123053635.GB22420@nchen-desktop> <20121123073711.GJ10369@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121123073711.GJ10369-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> On Fri, Nov 23, 2012 at 01:36:36PM +0800, Peter Chen wrote:
>> On Wed, Nov 21, 2012 at 03:06:29PM +0100, Michael Grzeschik wrote:
>> > From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> > 
>> > This fixes a potential race condition where the ci13xxx_imx glue code
>> > could be fast enough to call one of the usbmisc_ops before he got a
>> > valid value on the static usbmisc pointer. To fix that we first set
>> > usbmisc, then call usbmisc_set_ops().
>> 
>> usbmisc is subsys_initcall, and cil13xxx_imx is module_init. Any
>> potential situation that the ci13xxx_imx's probe is ran before the
>> usbmisc's probe is completed?
>
> Not having looked at the code you are referring to at all I just want
> to say that: drivers can be modules (don't know if that's true for
> chipidea) and sooner or later we'll probably get devicetree overlays,

ChipIdea can be not even one, but two modules (ci_hdrc, the actual
controller driver, always a platform_driver) and platform bindings like
ci13xxx_imx, ci13xxx_pci, ci13xxx_msm, which can be platform or pci or
whatever else drivers.

> so the devicetree nodes might just appear during runtime. Depending on
> initcall order is generally not a good idea.

That's very true.

Regards,
--
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
