From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: chosen: Document linux,initrd-{start,end}
Date: Sat, 16 Dec 2017 06:41:39 +0100
Message-ID: <20171216054139.d6hkbasex3p7h3qo@latitude>
References: <20171209153305.11012-1-j.neuschaefer@gmx.net>
 <20171215210147.w3xqs3di2vbbvv5p@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zneft6tu6oj7qer3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171215210147.w3xqs3di2vbbvv5p@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zneft6tu6oj7qer3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2017 at 03:01:47PM -0600, Rob Herring wrote:
> On Sat, Dec 09, 2017 at 04:33:02PM +0100, Jonathan Neusch=C3=A4fer wrote:
> > These properties have been in use for a very long time (at least since
> > 2005), but were never documented in chosen.txt.
> >=20
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/chosen.txt | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
>=20
> Applied.

Thanks.

> I'm inclined to say to document these in the DT spec, but I'm assuming=20
> there was some reason why they weren't put into the spec (ePAPR at the=20
> time) originally.

I don't know about the history of this, but I think if and when these
properties were specified in DTSpec, they should get a non-linux-specific
name, such as initrd-start/initrd-end, and a compatibility fallback to
linux,initrd-* (similar to stdout-path and phandle).


Jonathan Neusch=C3=A4fer

--zneft6tu6oj7qer3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJaNLIKAAoJEAgwRJqO81/bRQgP/3V44Q3S2KSMezCncquc9Zgu
DEjT1XpaSznO81X3Y3y3pNv9SB8MxMkD5MX9qLpfGPDeE8YSTg7lCkH5V559QLAM
cHLTDxlGZISaVKhT0FYeohqW9yqKvEDRaJ+C6ys5rR0/3H1cXtLoLvMz1/4MkeF0
GZAqq9CEXclcf5XapLQHFmC+7b+ouRAeRrZqx2T1fd2nAfVeC/lWsn8zCOiJypb7
tFIeIOFVq6yl+HCZrIy6SUpGRkrr+LMTjrTyJgzBR0ZH4MgIwAHvc24SXi6Nmodz
ZqaSH9N82csgaS0YLwZVW3QjAeQ3AdOgbKwN/3dTzqpAbwdfRw7z42y/TmFiK4hS
iTx9sXl4+ZXwJpfjhokbJUveulpb+Y37RT3NF5mflmPYd1MncuDJoqybgwm6016s
WxiO9gGnho1MYgslVdJA5AgYOtXgNH0XC2m/Popxi8juvSZMneC0RSWWfLPMdJJ2
Ef34dDm+wGAjnjdiaUU/wq67KQuFJUxBG7IsVd7n3ajmS7WyMLXyuXq+YFYePawP
6zmDMfCqFsa/Cj4nk1VX1TwqyaRJ+pnxEDBG4L363jAM13HNjZi4TYYqBmlejc5+
A811asi48yZI/Pvz42vrbgqjIIP6RmG2B9GAJWS7W2s1BOF5ObexhDlvH0x4NQH9
q1gCvde7NLOMRNQhDJ61
=UVav
-----END PGP SIGNATURE-----

--zneft6tu6oj7qer3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
