From: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/6] usb: chipidea: usbmisc: rename file, struct and
 functions to usbmisc_imx
Date: Wed, 14 Nov 2012 16:32:03 +0100
Message-ID: <20121114153203.GB13387@pengutronix.de>
References: <1352894137-2050-1-git-send-email-m.grzeschik@pengutronix.de>
 <1352894137-2050-3-git-send-email-m.grzeschik@pengutronix.de>
 <CAOMZO5Ajdp3DT1b+Mx6ufjhuCoOmZ6CEwk+TgWEj-mjd1Hub1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5Ajdp3DT1b+Mx6ufjhuCoOmZ6CEwk+TgWEj-mjd1Hub1Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 14, 2012 at 09:57:50AM -0200, Fabio Estevam wrote:
> Hi Michael,
> 
> On Wed, Nov 14, 2012 at 9:55 AM, Michael Grzeschik
> <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > This driver will be used for every Freescale SoC which has this misc
> > memory layout to control the basic usb handling. So better name this
> > driver, function and struct names in a more generic way.
> >
> > Reported-by: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  drivers/usb/chipidea/usbmisc_imx.c   |  163 ++++++++++++++++++++++++++++++++++
> >  drivers/usb/chipidea/usbmisc_imx6q.c |  163 ----------------------------------
> 
> Please use git mv / git format -M so that git can detect the file rename.

I have created this patch with git mv. Until now, i did not know
that git send-email needs -M to stick with the git format.

Will change that in V2.

Thanks,
Michael

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
