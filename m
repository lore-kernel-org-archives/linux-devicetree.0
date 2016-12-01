From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [RFC PATCH] ARM: dts: sun8i: add simplefb node
 for H3
Date: Thu, 1 Dec 2016 09:45:36 +0100
Message-ID: <20161201084536.syigq46mevwv6cv3@lukather>
References: <20161130220324.3Kg4VPEw@smtp1m.mail.yandex.net>
 <2717236.xBNAaGdqdc@jernej-laptop>
 <20161130203724.a390595df0199ed19069f91d@free.fr>
 <185067972.ij8nq5Ea6J@jernej-laptop>
 <20161130205233.mwfqlfuqg4cefink@lukather>
 <1777251480557779@web18m.yandex.ru>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="urjzv4wmykszw6fw"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBMOG77AQKGQEO57ZJOQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1777251480557779-y7RzsOdW5YFxpj1cXAZ9Bg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "wens-jdAy2FN1RRM@public.gmane.org" <wens-jdAy2FN1RRM@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--urjzv4wmykszw6fw
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2016 at 10:02:59AM +0800, Icenowy Zheng wrote:
>=20
>=20
> 01.12.2016, 04:52, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> > On Wed, Nov 30, 2016 at 09:41:26PM +0100, Jernej =C5=A0krabec wrote:
> >> =C2=A0> > > > The only
> >> =C2=A0> > > > code left from you is for DE2. HDMI stuff is basically c=
opied from
> >> =C2=A0> > > > Rockhip
> >> =C2=A0> > > > driver (including EDID reading), TCON code is now revert=
ed to the same
> >> =C2=A0> > > > as
> >> =C2=A0> > > > it is in sunxi_display.c. I think it is worth to take a =
look at EDID
> >> =C2=A0> > > > code
> >> =C2=A0> > > > and compare it.
> >> =C2=A0> > >
> >> =C2=A0> > > So is the TCON of DE 2.0 identical to the original TCON?
> >> =C2=A0> > >
> >> =C2=A0> > > If so, we should reuse sun4i-tcon ...
> >> =C2=A0> >
> >> =C2=A0> > Well, TCON is splitted in two parts (two base addresses), on=
e for HDMI and
> >> =C2=A0> > one for TV. However, register offsets are same as before, so=
 I guess
> >> =C2=A0> > driver reusage make sense. I think that there are few additi=
onal
> >> =C2=A0> > registers, but they can be ignored for simplefb.
> >> =C2=A0>
> >> =C2=A0> The TCON1 of the H3 is not usable (no ckock). Analog TV has it=
s own
> >> =C2=A0> clock and I/O area.
> >> =C2=A0>
> >>
> >> =C2=A0True, H3 user manual can be misleading sometimes. But this doesn=
't change the
> >> =C2=A0fact that TCON0 has same register offsets with same meaning.
> >
> > Then yes, we should definitely share the drivers too. So, in the end,
> > the only thing that is actually new is the display-engine?
>=20
> And HDMI PHY on H3 ;-)

Yes, and that one :)

> In my opinion, we should just put sun8i-de2-drm related code into
> drivers/gpu/drm/sun4i/ .  (Or rename the directory to sunxi)

We should definitely reuse the drivers that are already in there for
the TCON and HDMI parts.

I'd have to look at the exact amount of code that would be needed to
support the new display engine, but I guess if it's big, then a
separate folder makes sense, if it isn't, then putting it in sun4i
makes sense (but I'm reluctant to renaming it to sunxi).

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

--urjzv4wmykszw6fw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYP+MsAAoJEBx+YmzsjxAglmEP/2riPLgGLl1OefQo8q5t+uJn
mEBthoeTEvN+f7otYkOxiiQPM6paWjmE2ySna8r/tJ5X2gdEcMsPSwQuSoMAj2Lh
dsnRHPaFkO25x/dKg/My2gMofrnEo/PCfbbGIuKS7Pua4We+dlFtWNoARQCAmlAt
E2DuN5n7ENxd3ejcnvJLf+GZBxDItR3dzTi6nn/G74z4wPyDIQ9QQJtCCW84zjcA
wqDxxRF8hrEp2rd8kF1R76jAqfI1QiM1lA14WPYqNQIfvRNDA1C0P6GSVCUMz1dw
L578rGpHBVdBpjGoZ4QsBCCC7+tHQKv/nnO5Na6g8ENGqLFbBYVSjlrwmerxlsLg
Er881tS+TfxKaHo/EmN//9L+DzIjpTcsql34951b/b6W8RxpvQwgrBiCN9ZjI3dw
jn2geHJUz5jt/W693F2zBfrkJfUxOdTgM3ST1zrtILUMpw/QUw4WRZC5JRx3Pdla
Ev/S39oPd0YXK2pmEQFTSKA29GpIlNM0PnEntJ64JZs6/Btfj6h9sY01uiwqlG7e
LrW053BHQw7Dx5O/nw0Bi89aluvwqJoQF96quVLby0LLM17D+A2WBABOvgKgAkH/
AoTGUqlBjoa+TwWMaxJQV4Y4EOvmmNVxt8zN9feM2BZQFBrbIKhCV8bjezUT//Oh
VP58+sHhR9wGR/3NvoJx
=qoeZ
-----END PGP SIGNATURE-----

--urjzv4wmykszw6fw--
