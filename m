From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [RFC PATCH] ARM: dts: sun8i: add simplefb node
 for H3
Date: Wed, 30 Nov 2016 21:52:33 +0100
Message-ID: <20161130205233.mwfqlfuqg4cefink@lukather>
References: <20161130220324.3Kg4VPEw@smtp1m.mail.yandex.net>
 <2717236.xBNAaGdqdc@jernej-laptop>
 <20161130203724.a390595df0199ed19069f91d@free.fr>
 <185067972.ij8nq5Ea6J@jernej-laptop>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5bpbmitmjaneujbj"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBEXY7TAQKGQE7WVBVDI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <185067972.ij8nq5Ea6J@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--5bpbmitmjaneujbj
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2016 at 09:41:26PM +0100, Jernej =C5=A0krabec wrote:
> > > > > The only
> > > > > code left from you is for DE2. HDMI stuff is basically copied fro=
m
> > > > > Rockhip
> > > > > driver (including EDID reading), TCON code is now reverted to the=
 same
> > > > > as
> > > > > it is in sunxi_display.c. I think it is worth to take a look at E=
DID
> > > > > code
> > > > > and compare it.
> > > >=20
> > > > So is the TCON of DE 2.0 identical to the original TCON?
> > > >=20
> > > > If so, we should reuse sun4i-tcon ...
> > >=20
> > > Well, TCON is splitted in two parts (two base addresses), one for HDM=
I and
> > > one for TV. However, register offsets are same as before, so I guess
> > > driver reusage make sense. I think that there are few additional
> > > registers, but they can be ignored for simplefb.
> >=20
> > The TCON1 of the H3 is not usable (no ckock). Analog TV has its own
> > clock and I/O area.
> >=20
>=20
> True, H3 user manual can be misleading sometimes. But this doesn't change=
 the=20
> fact that TCON0 has same register offsets with same meaning.

Then yes, we should definitely share the drivers too. So, in the end,
the only thing that is actually new is the display-engine?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--5bpbmitmjaneujbj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYPzwNAAoJEBx+YmzsjxAgwZMQALyX0ij4pqSbcHMFhz+3Ttsk
AogNkLk6K3X3FIuV/AxnjX0egZ6Vb16HLLzlije2UvvNXHqbAiLUJheRDNRc0DkQ
lggQv12d8NTvglnu5KRh3xdsdTh22hoISfxk9VovAkFn4pT7O/Tix0tYGA8r2zIr
oOAShtS6HlU3NFsnHyNbggWb4Uh59QZmPPZekE10u+FaGhTm69R38lc6Gj6BcBMc
G26bKynjjeke8mL984X0sRN5moe4l4ANhUPdFxaJvl0q0ziLZDEJTCYB/pD94dPP
OwfIN9FmfZPsFsagi98rMkC0UWvE5gNasAc/+WR3F5+V9udzEUHaoxTMUIbw1Ryl
EBdCoFNOnQ0+VCeoY4AfhXSyuhODEbVHJRHPwpQ9oAfEWejhcm4b6ECV+edysFu0
LD8lCY9mfF9KD2n8lA2493mcKI/q++WGFxTLZ0I4Cv6WPUjElkn2mXhjXliYeT4z
HoSbr38VmWjkC9nU/aKaPykFsYG+yjiAlzVgQYNIYkMDZ2gUezDOcCWZ3iEPRBsD
7EnC4BkZSI89EVtrfJgwm1K1w2i5enhnTOfzCmc9xhUwq+FNJ7XXralnqpCJhivC
f1p6Gl5VyNWMiZXo2wi/E65Pm9I7JEL8mMFkBC0J9lKA/cgpj6QiNik4K5OOJDhH
e4Tpla+YGtIQhJApLchZ
=InLG
-----END PGP SIGNATURE-----

--5bpbmitmjaneujbj--
