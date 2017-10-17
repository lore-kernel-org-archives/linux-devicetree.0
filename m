From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/9] drm/panel: simple: make it possible to override LCD
 bus format
Date: Tue, 17 Oct 2017 14:56:42 +0200
Message-ID: <20171017125642.GE27983@ulmo>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
 <1507721021-28174-4-git-send-email-LW@KARO-electronics.de>
 <20171017121240.GD684@ulmo>
 <20171017144423.4ddd6047@karo-electronics.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PGNNI9BzQDUtgA2J"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171017144423.4ddd6047-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?utf-8?Q?Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--PGNNI9BzQDUtgA2J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 02:44:23PM +0200, Lothar Wa=C3=9Fmann wrote:
> Hi,
>=20
> On Tue, 17 Oct 2017 14:12:40 +0200 Thierry Reding wrote:
> > On Wed, Oct 11, 2017 at 01:23:35PM +0200, Lothar Wa=C3=9Fmann wrote:
> > > The baseboards for the Ka-Ro electronics series of i.MX modules
> > > use a 24bit LCD interface, no matter what LCD bus width the SoC on the
> > > module provides and what the LCD panel expects. LCDs with 6bit per co=
lor
> > > will ignore the 2 LSBs of each color lane, and modules using a SoC
> > > that provides only 6bit per color, drive the display information on t=
he
> > > 6 MSBs of each color lane and tie the 2 LSBs of each color lane to GN=
D.
> > >=20
> > > Thus, no matter what combination of LCD and SoC is used, the LCD port
> > > can be used without shuffling bit lanes by always configuring the LCD
> > > output to 24bit mode.
> > >=20
> > > Add a function to handle certain quirks of the LCD interface to the
> > > panel driver to be able to override the bus format specified in a
> > > panel's display_mode.
> >=20
> > I think the above paragraph clearly indicates that this is the wrong
> > place to workaround this. You say yourself that the LCD interface has
> > quirks that need to be handled, so why do you want to force this
> > handling into the panel driver?
> >=20
> The quirk is in the interfacing of the SoM's LCD output to the LCD
> panel. Thus it can be handled in either place.

Yes. What I'm saying is that the panel is, in my opinion, the wrong
place to handle an LCD interface (originating from the SoM) quirk.

> > The panel remains the same, no matter what interface you connect it to.
> >=20
> Because that's just ONE place to change, no matter what LCD driver is
> being used.

That's a Linux specific implementation detail. If you ever want to use
a panel that is not driven by simple-panel you'd have to change it in
that driver, too.

Thierry

--PGNNI9BzQDUtgA2J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnl/goACgkQ3SOs138+
s6GdyQ//QHyEwTnjb5yoGCkFI6DasMxmR39vnXvfVz8gqsvyGf9w7LDxhiq6Cbw8
OW0N3iOy77Ajtuwk1IeKaKNj6+fzjdbBkXEudecCyiPTLEjVMDq+vcysaX6x4lbG
Qmu4P34qhMpO3OwAtSsm6LN8qZGiKWNqsJ6NwZSMUa133reVCf9aPkblHjsE3BK4
LNIGYEYpzbAAWJ0se8CAlNRypSSsucM14z2icgpuvB6IO+2NvFXCFlBVwgKd1Kry
QnZis1v6M1foZhYOm529rXtW4arHnV99o9gY4LGt38sFr/waPyVDMokD0KIxWh7a
PrYedntvv6mrPWBnZ2luz2LKQD7YbSMt0x9KKQA3mRqnJ8QmiISwDduc5ngjdOWE
uuRQTZDLTNYSXUT4t7+HIx7tlv2fjxV0kwFfzC1Sq8oT68wRmW3J4mGBKCd9timC
h5kRa8kunNu6AXIxqI8DbT4Fwur3BET3x0kX1WoIAU8P5v0Zyc3AOMQjy/P4+x/e
ZtGNTtL4fMBSb8uRNUnnefiH/0QaFUpXgTvh9rAy3YpFX0plKHH8sfq3G60owiEN
jKRxZkb8NxwclfGTh0Tf1o61WDXXoaHzckFQS12emcMj3BU3Y2TNTif0kK60Yg+M
tXPpJ1UUJxCEbSV9+27vFz+ilHCHDoLfdswpOqfBGG1eZNBOW4I=
=qD5t
-----END PGP SIGNATURE-----

--PGNNI9BzQDUtgA2J--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
