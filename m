From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: sun8i: r40: add USB host port nodes for R40
Date: Mon, 16 Oct 2017 14:06:33 +0200
Message-ID: <20171016120633.6jof6wvsre27rxhv@flea.lan>
References: <20171008042906.46779-1-icenowy@aosc.io>
 <20171008042906.46779-3-icenowy@aosc.io>
 <20171009210340.ak6wo3vqnwj4gom4@flea.home>
 <55B35500-67FC-40AA-9A07-98C843DE55B3@aosc.io>
 <20171016093229.waizww2n4gwn4qpw@flea.lan>
 <7ee77556174b84846a59d57525ec1cb9@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="eldpgxkgtcfx6fey"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7ee77556174b84846a59d57525ec1cb9-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--eldpgxkgtcfx6fey
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2017 at 05:39:58PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-10-16 17:32=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Tue, Oct 10, 2017 at 07:24:28AM +0800, Icenowy Zheng wrote:
> > > >> +			interrupts =3D <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> > > >> +			clocks =3D <&ccu CLK_BUS_OHCI1>,
> > > >> +				 <&ccu CLK_BUS_EHCI1>,
> > > >> +				 <&ccu CLK_USB_OHCI1>;
> > > >> +			resets =3D <&ccu RST_BUS_OHCI1>,
> > > >> +				 <&ccu RST_BUS_EHCI1>;
> > > >
> > > >Why do you need to take the OHCI resources too?
> > >=20
> > > AW's strange design -- without OHCI resources taken EHCI
> > > won't work.
> >=20
> > How has this been tested?
>=20
> As EHCI is probed before OHCI, this behavior is easy to
> appear if the OHCI resources are removed.

And what is "this behaviour" exactly?

What have you tested, what device did you connect, what is the outcome
that isn't something you expected, etc.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--eldpgxkgtcfx6fey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ5KDJAAoJEBx+YmzsjxAgFnYQAI4ZEPOtReKyzR4vUJLvKpmN
GHu5vl7EFYylMBVUB/D4KOhzF4o7P1BCVAwfne92xV3L0qX6DlV11XOz/3+1Vgme
aUwOM7wqIc++jXnQchFSckhqTWSUQyFgUCQoSfJW4ctXHRJDzTzH0KBSY5dEHdP4
07uUEL9eSiwto5iQz/nOsdtYyXEvhBVG6TdP3GKaprxktFRqwfFtSf1roViE1lY0
TzyTDni2s9C9AsBetOYIfI9xylwg3hnvePGxex3nEGg4z96gD+IFtQ/XT93jiUQp
lxx5w+K2nba49UqZI58GmxtLXLMYRyo80BjoUnDr703lKqwvPTrVt9SDqHhdmRDv
Y7VyeS+7vTMdIQ+v/N0f5i43L8wLUiX56AEX/zs4TFl9dRptj8jiouFI0R+qMe5S
xg/n+4vW/MrcnJcTXFKVX6eEA12uw75MfS2Xwm73xy04LbBzC7nvJr+NA46UMDBB
hwk2LRphsrQIwa3JGSJB+BCYiHs76VzrQmgYHAxWW7Dk2ZSDk0WWorZjN1tSDWe/
qMVeNu1R8PGfCPh2JrypvX3ZtNRRlHJkcK78hsv1UKttVkmRNB9OaepvZhb0TEKu
q53E34uwdPTGNhxy7mqUQuKIJ853mbLn29vXlmC2TlqYL9gky+0ruce/m/kf1Muw
oNTIXaHqUSPXYoU2Qfuz
=/8XH
-----END PGP SIGNATURE-----

--eldpgxkgtcfx6fey--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
