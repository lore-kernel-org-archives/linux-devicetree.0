From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arch: arm: Show the serial number from
 devicetree in cpuinfo
Date: Mon, 27 Apr 2015 20:45:49 +0200
Message-ID: <1430160349.5305.1.camel@collins>
References: <1429351135-11842-1-git-send-email-contact@paulk.fr>
	 <1429351135-11842-2-git-send-email-contact@paulk.fr>
	 <CAL_JsqKkw7n5p1ZH345BeKkyU=GKDrhaLef__0ET7t90Cm0Eog@mail.gmail.com>
	 <1430145747.3081.5.camel@collins>
	 <CAL_Jsq+x5vXTmzxFW8+YSKntRgNVr7AzAS+xAkuBGx1Nmfeaaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-UpJQS56MUmHtbbaY7UVF"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+x5vXTmzxFW8+YSKntRgNVr7AzAS+xAkuBGx1Nmfeaaw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-UpJQS56MUmHtbbaY7UVF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 27 avril 2015 =C3=A0 10:20 -0500, Rob Herring a =C3=A9crit :
> On Mon, Apr 27, 2015 at 9:42 AM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> wro=
te:
> > Le lundi 27 avril 2015 =C3=A0 08:48 -0500, Rob Herring a =C3=A9crit :
> >> On Sat, Apr 18, 2015 at 4:58 AM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> =
wrote:
> >> > This grabs the serial number shown in cpuinfo from the serial-number=
 devicetree
> >> > property in priority. When booting with ATAGs (and without device-tr=
ee), the
> >> > provided number is still shown instead.
> >> >
> >> > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> >>
> >> One comment below, otherwise:
> >>
> >> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>
> >> > ---
> >> >  arch/arm/include/asm/system_info.h |  1 +
> >> >  arch/arm/kernel/setup.c            | 27 +++++++++++++++++++++++++--
> >> >  2 files changed, 26 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/arch/arm/include/asm/system_info.h b/arch/arm/include/a=
sm/system_info.h
> >> > index 720ea03..3860cbd40 100644
> >> > --- a/arch/arm/include/asm/system_info.h
> >> > +++ b/arch/arm/include/asm/system_info.h
> >> > @@ -17,6 +17,7 @@
> >> >
> >> >  /* information about the system we're running on */
> >> >  extern unsigned int system_rev;
> >> > +extern const char *system_serial;
> >> >  extern unsigned int system_serial_low;
> >> >  extern unsigned int system_serial_high;
> >> >  extern unsigned int mem_fclk_21285;
> >> > diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> >> > index 1d60beb..349790f 100644
> >> > --- a/arch/arm/kernel/setup.c
> >> > +++ b/arch/arm/kernel/setup.c
> >> > @@ -93,6 +93,9 @@ unsigned int __atags_pointer __initdata;
> >> >  unsigned int system_rev;
> >> >  EXPORT_SYMBOL(system_rev);
> >> >
> >> > +const char *system_serial;
> >> > +EXPORT_SYMBOL(system_serial);
> >> > +
> >> >  unsigned int system_serial_low;
> >> >  EXPORT_SYMBOL(system_serial_low);
> >> >
> >> > @@ -821,8 +824,29 @@ arch_initcall(customize_machine);
> >> >
> >> >  static int __init init_machine_late(void)
> >> >  {
> >> > +#ifdef CONFIG_OF
> >> > +       struct device_node *root;
> >> > +       int ret;
> >> > +#endif
> >> > +
> >> >         if (machine_desc->init_late)
> >> >                 machine_desc->init_late();
> >> > +
> >> > +#ifdef CONFIG_OF
> >>
> >> These ifdefs should not be necessary, but please double check.
> >
> > Well, of_property_read_string is only defined when CONFIG_OF is set
> > (base.c is always built in drivers/of but the directory is only include=
d
> > when CONFIG_OF is set).
>=20
> Look at include/linux/of.h. There are an empty versions of both functions=
.

Oh, you're right, I didn't know it was the case. I'll submit another
version with those changes then!

> > Of course, on ARM, we now expect that it is the case, but it seems like
> > good practice to check for it, since it could theoretically be disabled=
.
>=20
> We still (and will continue to) have non-OF platforms.
>=20
> > This is also being done a few lines above in customize_machine.
>=20
> True, but that doesn't mean we want more.

Ack.

--=-UpJQS56MUmHtbbaY7UVF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVPoPdAAoJEIT9weqP7pUMjQ8P/0g4mcdofg7bQ4uDyShRpfOS
RtjpsIrKrpH49bP6k81oYCEMp7nZKv6b3+U0hmiw/gow1W7L9fZHRts7O/bNafLv
wsDx6SYd5i/08OdqkgC/SOEKwKECYRNe/9PqZs3lbDx/3+XYT0rMJRG+As/Ram7s
8iRLFpxsSNWr/mmHXSJyNJaOcmhyiEs0KjpWyZq6Cz8KPDYfxeZfe7cs75+zHx1i
PDjH4vneCZrJ6NiBjuKslaZeFQpIJtJNtZZP1+FVDHhUXJT2alVA927NpSt+SF0f
Mdx4n72zOS9Wigx+6WILogGoafOWDCQf3+VJ3IO2GuTTCDx7VK7ZcWLqrIJB24B1
Z2MDn2EYmsA7ag3AvzTB3nwAW8SU0x6HNdJ1T2GI3EDQFzZljuJaI6QiGs3kJcBa
MhVhM5oJTzyZ06ocNXHR5WUqSv6u1jqONCCjX4eyqiPx6H/k0NnQYDYTD233gCC9
xCQeLT54r45ATM0+dkjiLagIIrrpdE1IMSwWCuQN5s09tezew6zhG/gyzjBW+dh4
xgwXO2SpcJQaThD3r/TzHGKP+1C6urQ95GfPpERDRQKHASoC63wOC6bpNcF2kRft
KnubfHjOa0qTQSlpNwEW2sL4R4OfEg70l2LSdneqhp0y6gJ5XIE1NpbT8/jcTuIe
2to1GXpUIAnIwf3dNZ5z
=XOay
-----END PGP SIGNATURE-----

--=-UpJQS56MUmHtbbaY7UVF--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
