From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/4] phy: sun4i-usb: support PHY0 on H3 in
 MUSB mode
Date: Tue, 17 Jan 2017 21:06:58 +0100
Message-ID: <20170117200658.gcrcxeanthdtwg26@lukather>
References: <20170116191449.50397-1-icenowy@aosc.xyz>
 <20170116191449.50397-2-icenowy@aosc.xyz>
 <20170117080611.tn7s7ddj2csqr27m@lukather>
 <3866431484672228@web20j.yandex.ru>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mrti7sh6yaekxq5v"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB3PS7HBQKGQEAZ73HCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <3866431484672228-4uohKiiZEDlxpj1cXAZ9Bg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--mrti7sh6yaekxq5v
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2017 at 12:57:08AM +0800, Icenowy Zheng wrote:
>=20
>=20
> 17.01.2017, 16:06, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> > On Tue, Jan 17, 2017 at 03:14:46AM +0800, Icenowy Zheng wrote:
> >> =C2=A0The PHY0 on H3 can be wired either to MUSB controller or OHCI/EH=
CI
> >> =C2=A0controller.
> >>
> >> =C2=A0The original driver wired it to OHCI/EHCI controller; however, a=
s the
> >> =C2=A0code to use PHY0 as OHCI/EHCI is missing, it makes the PHY fully
> >> =C2=A0unusable.
> >>
> >> =C2=A0Rename the register (according to its function and the name in B=
SP
> >> =C2=A0driver), and remove the code which wires the PHY0 to OHCI/EHCI, =
as MUSB
> >> =C2=A0can support both peripheral and host mode (although the host mod=
e of
> >> =C2=A0MUSB is buggy).
> >
> > Can you elaborate on that? What's wrong with it?
>=20
> The configuration is at bit 0 of register 0x20 in PHY.
>=20
> When the PHY is reseted, it defaults as MUSB mode.
>=20
> However, the original author of the H3 PHY code seems to be lack of
> this knowledge (He named it PHY_UNK_H3), and changed the PHY to HCI
> mode.
>=20
> I just removed the code that wires it to HCI mode, thus it will work
> in MUSB mode, with my sun8i-h3-musb patch.

I have no idea what you mean by MUSB mode.

Do you mean that the previous code was only working in host mode, and
now it only works in peripheral?

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

--mrti7sh6yaekxq5v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYfnleAAoJEBx+YmzsjxAgquEQAK6+HJDNw1fYbwwofv13HuYv
o8CBdjoAv3OEcFqu466+WMic5t9oXakn3c2g49avCXo+cMAvGQXx31z+U7NharsR
KUoZP1HgIwZ43RElB1DmadO3yygg2ctK55CjHPZkGVvF7nbp01N4Dndao57nHCrW
7QmXA1NRyHrMjqa6UWc+KWPN3D3l6Xva+FI8N/I97uEpvsE9o+0o+QqjJqGxKiwj
PqRvc9yHI/TTgHcPoyxb1sL7cV0IBWJZRVMX63QizmGLE+/y8B8nfW0Q7K3k3AgK
z1uMEGkSKcaQ6B7+vNevHhek07IgIjm5Em8+eOr6HccSmsk3LJ/1lAMskS40Jm2I
6RRoYPyNyueDminpafQIq6iWD12h64iWEkvfPIwNyNtwrVUbRPh1VBs+yQgSwTv+
uRvQ3Rf73PYD2qpgN0NBWBM3ITScP1Oz46BnyROtdDCqHWXw+FTzhWHPyRu04Hi3
G4zA3JkvIvPNAo6ve7prce4rV0OGadHuNHRJou1Wkoehhmx4I2gOVZqm7xKntIJG
Aow03fT+ywucBQ7Rjn/IAZPsmmZi9rvyZPvK/SPhaQqryA1zWjFRnhiMqxVOjrLR
bXqyPjyztE7e65Kf2mt2MPFM3+WZoa0KHYJiqFZgfKR0BwBOYLB65uEIP1j5KvSo
LGoGftwE5ZETS6QD34xw
=aKhc
-----END PGP SIGNATURE-----

--mrti7sh6yaekxq5v--
