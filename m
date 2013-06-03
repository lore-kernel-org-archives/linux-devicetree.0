From: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 3/7] USB: chipidea: add PTW, PTS and STS handling
Date: Mon, 3 Jun 2013 18:11:36 +0200
Message-ID: <20130603161136.GB28181@pengutronix.de>
References: <1370025529-7414-1-git-send-email-mgr@pengutronix.de>
 <1370025529-7414-4-git-send-email-mgr@pengutronix.de>
 <8738szjrs6.fsf@ashishki-desk.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8738szjrs6.fsf-qxRn5AmX6ZD9BXuAQUXR0fooFf0ArEBIu+b9c/7xato@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hey Alex,

On Mon, Jun 03, 2013 at 03:35:37PM +0300, Alexander Shishkin wrote:
> Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
>=20
> > From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >
> > This patch makes it possible to configure the PTW, PTS and STS bits
> > inside the portsc register for host and device mode before the driv=
er
> > starts and the phy can be addressed as hardware implementation is
> > designed.
>=20
> The bulk of this patch is good, but the OF part should still go to
> ci13xxx_imx along with the dt bindings description.

referring to the last discussion [=B9] about what should be handled
where, your last statement is pretty confusing. We might say we
somehow stuck in a loop if i would repost this patch again
and somebody (probably you :]) is telling me to do the opposite again!

If you have a closer look, you can see that we are checking for
valid pdata:

@@ -408,6 +452,9 @@ static int ci_hdrc_probe(struct platform_device *pd=
ev)
                return -ENODEV;
        }

+       if (!ci->platdata->phy_mode)
+               ci->platdata->phy_mode =3D of_usb_get_phy_mode(dev->of_=
node);
+

This way we can ensure that platforms without OF still
can use the pdata. _But_ we always fall back to OF in the
core _if_ nobody cared. This should be done with all properties
that are not SoC, but _common_ device specific settings.

[=B9] https://patchwork.kernel.org/patch/2196981/

Thanks,
Michael

--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
