From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 01/12] usb: otg: add notify_connect_change callback
Date: Mon, 21 May 2012 12:38:41 +0300
Message-ID: <20120521093840.GM8633@arwen.pp.htv.fi>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <1337592237-5090-2-git-send-email-richard.zhao@freescale.com>
 <20120521092635.GL8633@arwen.pp.htv.fi>
 <20120521093614.GL30755@b20223-02.ap.freescale.net>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oiL9LJXJsdjS5rzq"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120521093614.GL30755-iWYTGMXpHj9ITqJhDdzsOjpauB2SiJktrE5yTffgRl4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--oiL9LJXJsdjS5rzq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 21, 2012 at 05:36:16PM +0800, Richard Zhao wrote:
> On Mon, May 21, 2012 at 12:26:36PM +0300, Felipe Balbi wrote:
> > On Mon, May 21, 2012 at 05:23:46PM +0800, Richard Zhao wrote:
> > > This let usb phy driver has a chance to change hw settings when conne=
ct
> > > status change.
> > >=20
> > > Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > ---
> > >  include/linux/usb/otg.h |   13 +++++++++++++
> > >  1 files changed, 13 insertions(+), 0 deletions(-)
> > >=20
> > > diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
> > > index 38ab3f4..385641d 100644
> > > --- a/include/linux/usb/otg.h
> > > +++ b/include/linux/usb/otg.h
> > > @@ -117,6 +117,10 @@ struct usb_phy {
> > >  	int	(*set_suspend)(struct usb_phy *x,
> > >  				int suspend);
> > > =20
> > > +	/* notify phy connect status change */
> > > +	int	(*notify_connect_change)(struct usb_phy *x,
> > > +					 int port,
> > > +					 int connected);
> > >  };
> > > =20
> > > =20
> > > @@ -252,6 +256,15 @@ usb_phy_set_suspend(struct usb_phy *x, int suspe=
nd)
> > >  }
> > > =20
> > >  static inline int
> > > +usb_phy_notify_connect_change(struct usb_phy *x, int port, int conne=
cted)
> > > +{
> > > +	if (x->notify_connect_change !=3D NULL)
> >=20
> > you don't need this !=3D NULL. See that no other wrapper has it. Keep
> > consistency.
> notify_connect_change callback is not a must. I just let the phy driver
> have a chance to do whatever it needs to do.

what I meant was:

-	if (x->notify_connect_change !=3D NULL)
+	if (x->notify_connect_change)

> > Also, this is the kind of stuff that I have been queueing for Greg so I
> > should be in Cc.
> Ah, I'm really sorry. I just find out I used the result of get_maintainer
> for v1 patchset.

hmm... ok, looks like I should patch MAINTAINERS file for that :-p

Greg, is it ok ?

--=20
balbi

--oiL9LJXJsdjS5rzq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPug0gAAoJEIaOsuA1yqRExD8P/RKfJcVoPSGrJOQbKq6sMkUt
/oj9IqCVfoL7ZwmvcdR4VKjHFyq3fcT2q7PwidFbOZJFq8dWkWWjrQBSx1DwgsUA
3ZhOhcEmzCwbKn0WPDulwNVX9q9RPeZtNt326q78zkS7tVJnmMCql9bHu3bMoZpl
xJ6NtYCuVegdtEfkAbkcWCr9hpJC9Ztx0eesjBJmo/IrBSHwF9QXqapKfpS/3/vj
r31cbRQ4usI8b2rQwKVdkhb436sB3+fJNPH8k6LGao5QBl2YPdO/OEXtXC+wJnoE
fbzTOaqUz1BnIoXLSohhf2v/fGyBR54hlvHcvW0hD4YygG69+gSZgNPZI4GNXWkm
orAy/sym6QUz+lG9o0vC3neAUtszTQKEZdT5/zWmpS5d1HCG+qZIwyWb7FhQn07b
qxpdlKofDKl2BQ63BiWCWRREBQau2VEDmTekNOMxSDeGiLxmVnXYifcXBzs2UG/l
gHIvKrrLvU7yl+Ia4fsQtPi5/YKXDlOeu9zu46FidynE3ur1eG/KSf4HiYF/vvb0
hesi8aNUy2gJwL169H9uKY80ivisjau8zyw8ozrbZ8HwxYEnkQ6/OiyLoJ0DgjB8
4MFcWo09X/XPeRArNoMx+7o6UNjKmJ7aWsN/kZF0g3rEYLErYAIvbru0yck3Pd8F
flFCgfyOS8kjSpTuAUwO
=e1wk
-----END PGP SIGNATURE-----

--oiL9LJXJsdjS5rzq--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
