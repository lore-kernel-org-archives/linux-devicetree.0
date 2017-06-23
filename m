From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 03/11] drm: sun4i: ignore swapped mixer<->tcon
 connection for DE2
Date: Fri, 23 Jun 2017 09:31:51 +0200
Message-ID: <20170623073151.p5ubvf6u6htfbggk@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-4-icenowy@aosc.io>
 <20170607093512.rfvpefmyskgjw3ik@flea.lan>
 <01A7F22E-C4FF-4B4B-A9BC-FF0C96B996B9@aosc.io>
 <20170607143827.4ng5gedvzn3f5pyx@flea.lan>
 <66881eac1dd06d918692482bdb1ea9e6@aosc.io>
 <20170609144649.67i3zscq26jt5hhe@flea.home>
 <03e5cb4ada3e19ed3476e1d562450f6f@aosc.io>
 <20170613094347.nlvxcaopd5qyq3tb@flea.lan>
 <CAGb2v66NPY0hDL+sTmyfAQq+cpR6rGtVriXTyDG2CRHjoMMEDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="i6qsilk5epi4itnt"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66NPY0hDL+sTmyfAQq+cpR6rGtVriXTyDG2CRHjoMMEDw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Icenowy Zheng <icenowy@aosc.io>, devicetree <devicetree@vger.kernel.org>, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--i6qsilk5epi4itnt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 13, 2017 at 06:05:57PM +0800, Chen-Yu Tsai wrote:
> > That's not true. DE1's can output to several TCONs (or rather, TCONs
> > can select multiple engines as their input). The A31 for example is in
> > this case.
>=20
> Actually that's not true. The TCON is bound to the backend. I don't see
> any controls for muxing that. So the TCON-backend search routine is very
> simple for DE1. The frontends are free to feed either backend though.

I think it does, look at the lower bits of TCON0_CTL_REG and
TCON1_CTL_REG in the A31 datasheet. It clearly seems used to control
=66rom which DE you fetch your data from, and you have both options.

> >> For example, if we enabled mixer0, tcon0 and tcon1, tcon1 shouldn't
> >> be bound at all. However in BFS situation tcon1 will also be bound
> >> and then fail to be bound if the backward engine searching is fixed.
> >
> > Short term view: we shouldn't be in that case in the first place.
> > Long term view: there's no reason it shouldn't work.
>=20
> Maybe I missed something? TCONs and everything before them should always
> be enabled. There's no reason not to. This is especially true for TCON0
> which holds the mux register on some SoCs.

If we're not able to use anything connected to TCON1, disabling it
still seems like a good stop-gap measure.

> About Maxime's long term view: there's no reason we can't just silently
> ignore a component if its supposed companion is missing, like a TCON
> missing its backend, or the other way around.

It's a bit more complicated than that. TCON0 is probably mandatory,
and even if TCON1 is missing, we can entirely route around it in
hardware, and I think it's the case for all the stages in our
pipelines. There's no reason we could not operate that way.

But this is clearly something that we should aim for, not something
that needs to be done today.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--i6qsilk5epi4itnt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZTMPnAAoJEBx+YmzsjxAgJjgP/0RWqX/pfBw4QURxCkFN+aIe
TNuDqxuG+o+P/2dvtudTRRu0ora/FnpQuY1Ig4Z9OfPxdiTl76jvI40QD5YSFQC/
SYUSRpFr327Tju6ZQnqHHw1WzGSrSL46Ls430NNUzpyBVvtpIw8UyUkvZbR+KmIO
7JYHyLBEmhyfr2XqVxn6z2U51WRvosG5sNE2Yss1/j6CKiD7qc+VaKRQrtee60O2
J2+T5oZJarF/197ZnHwpDCTT3WJTL2VuHpgzlCw/SpiHeFf09akb632r3uRYVMp3
klM10DlLTnU0adxOfZXlKIMmzUvYoFmjcC/Igf60RWyyZbWgJsLm+heaUux3Fl+G
1Oc0CqFjjhNwsXFF+USkuW80rgySVPH9la1ys7K14gHoZJY7h986vQvdzzRdAPro
xmyIOEOtPUJEiZEwXUjlMqVW/jinRgUiuH98ZJ0QeewF2GjKEMQi5mHDR2YP3mB4
ZuNRV/Qglf8LCvkIgDZ74Y6mdsYfHSs5rQGn4BnPp5jX54WYkFQO9WBmZUp905Yq
LqDI6jCgn31UZbj9l5SKnx0kU3Tp4T5NOOx6OidshPqS+xgviU9t8Kmi745IVlZH
AVuiYFzhhU997s7zJEz4QU46FgosX2iK/AHsQFDtl5ch7SASArk1r+zp3rCaKr1G
0++eURMZZdHEamQXpoPR
=Us03
-----END PGP SIGNATURE-----

--i6qsilk5epi4itnt--
