From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 04/19] clk: sunxi: Add TCON channel1 clock
Date: Thu, 19 Nov 2015 16:35:16 +0100
Message-ID: <20151119153516.GP32142@lukather>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-5-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v650S8+8SNNBqx7u8k8wxHm2fSKdht=W3yA9Mh=rpU+hOA@mail.gmail.com>
 <20151107000139.GP6114@lukather>
 <CAGb2v65MUrBKA=pAC95evdiSBMaewRcnLUhBcqCbx_Pc6Jutnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CUrluEZVXmx7ezWQ"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v65MUrBKA=pAC95evdiSBMaewRcnLUhBcqCbx_Pc6Jutnw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-sunxi <linux-sunxi@googlegroups.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, Alexander Kaplan <alex@nextthing.co>, Wynter Woods <wynter@nextthing.co>, Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org


--CUrluEZVXmx7ezWQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2015 at 11:36:15AM +0800, Chen-Yu Tsai wrote:
> >> > +       sclk1_parents[0] =3D sclk2_name;
> >> > +       sclk1_parents[1] =3D sclk2d2_name;
> >>
> >> Is there any need to expose these 2 clocks via DT using of_clk_add_pro=
vider?
> >
> > No, as far as I'm aware, there's no user external to this clock
> > driver.
> >
> >> Note that these complex clock trees within a clock node breaks the
> >> assigned-clock-parents mechanism, as you can no longer specify the out=
put
> >> clock's direct parents.
> >
> > There's no point of changing the parent either. Hardware blocks are
> > always connected to the leaf clock (sclk1). We could also model it as
> > an extra 1-bit divider, which would simplify a bit the logic though.
>=20
> Probably not. You still have a gate to handle. It's just moving the
> divider from 1 clock to the other. I think the current approach of
> modeling it like the hardware is better.

Not really if you model it using sclk2 being a mux + gate, and sclk1
being a divider + gate. It works great using the composite clocks.

> About reparenting, what I meant was if sclk2 is not exposed through
> of_clk_add_provider, then we can't do assigned-clocks stuff on it,
> like setting a default parent or making each channel use a different
> source pll.

And we don't really want to. Using the divider allow us to simply set
the rate of sclk1, and the mux / divider will do the rest. Since only
sclk1 is exposed to the rest of the system, we do not really care
about the rate of sclk2 anyway.

> What I'm saying is if it is not expected to work with another core
> binding, we should probably note it somewhere.

Indeed.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--CUrluEZVXmx7ezWQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWTew0AAoJEBx+YmzsjxAglmQQAJ9RD7jN3NHFkxBNGSenrS3h
6GI5eyIXvjfX5lFHdxog5Wv26gPnV9h3vx43bDWGADy6LhetRtiKnBCoCDubdHKX
dyPrSxiqQPDbLR3y7nKvtvNBEfS5nQWmvgNRosDEzCsfYj1fUVEX0PRbmJabLyBN
d4g+2/AjQOaV9xUkN+B9djI5wJ4upj5yMibjJmrWJLC5AskDjhIEGjqL5KgJsRwJ
Z/vv3uDH8D8ZI8ueBp3K/nbmzGCGoY6ey1MXXQkSvDicI2A4JoiOUepguYkN42ci
OLIkAo5/bCx0xSijpmHpvJQ60onY8aq89BNiJACSfdjbi9zL7TXDepqhHrwxcBuh
Ff0JY9o2/RkVmkOZ1WPIzlCG4qkSXXyIgaLgFNizoLX+IWNPtrswPTNQOumcMnXu
t3TtTEPeZJQk0Urav+UA7q0CQ1+tY1mOkLWjVvJW9wJ4HCOpEwZn67TXypxvS0/Z
hYsdIA+RYzRNDXfVmNsAbH7KFI3liOHyZh2V8ZH01nBc3Vdcx8XbFgUgYisu48eg
Z5XN7PSghl7GErM50fqqkCEiuHF22ZGOo6AOi9M2RWLM2vGRNK2u6utpwHCK4rRe
uXaNTXmGyYsepM+3n1Cgusj3Lz/QeX01up/NxSqpGFl6TtXBNu9uOE1QkWkMvngm
oKMeP7c6ir/zr2UUVtie
=wo2/
-----END PGP SIGNATURE-----

--CUrluEZVXmx7ezWQ--
