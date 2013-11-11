From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7] pinctrl: imx27: imx27 pincontrol driver
Date: Mon, 11 Nov 2013 10:50:18 +0100
Message-ID: <CACRpkdbJLSHOoE9gNDnne+xwCxu4FzGreeRJfNpL7nC8ddD04w@mail.gmail.com>
References: <1382950843-26066-3-git-send-email-mpa@pengutronix.de>
	<1383057139-25304-1-git-send-email-mpa@pengutronix.de>
	<CACRpkdYKgA5E4-APSTHsM=zVbb3X2R4v+V4EeK3+W1tKPR1FeA@mail.gmail.com>
	<CAHCPf3v3dsTyk9Cd93GBLBKQLSQ+Mb0mpq134X7Ko4U8m-b-qg@mail.gmail.com>
	<20131107091212.GH15098@pengutronix.de>
	<1383816481.4115.2.camel@weser.hi.pengutronix.de>
	<20131107103859.GI15098@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131107103859.GI15098-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 7, 2013 at 11:38 AM, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> On Thu, Nov 07, 2013 at 10:28:01AM +0100, Lucas Stach wrote:

>> > The first version of this series [1] was designed to have a iomux node
>> > with 6 gpio subnodes.
>>
>> Why was this changed? Having two different DT nodes requesting the same
>> IO region is certainly the wrong thing to do.
>
> It was suggested to map the same memory range from both drivers, so I
> changed the layout completely. Perhaps it would have been better to keep
> the DT node structure while not passing the memory to the gpio
> subdevices.

>From a pinctrl/GPIO point of view anything goes, it's a little bit like
big-endian vs little-endian.

I did merge the i.MX27 driver as it was ACKed by the subarch
maintainers.

So what do we do now, shall I revert this patch or can you refactor
it in accordance with the comments so it should be kept as a
base for the rewrite?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
