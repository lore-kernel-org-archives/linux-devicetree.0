From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH v2 01/11] dt-bindings: update the
 binding for Allwinner H3 TVE support
Date: Tue, 13 Jun 2017 09:41:28 +0200
Message-ID: <20170613074128.q4mhf46gogn6jhvl@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-2-icenowy@aosc.io>
 <20170607084544.kgclybyxxttfk3ko@flea.lan>
 <092D4797-0034-4C39-A30A-92CFAB23AAF8@aosc.io>
 <20170609164915.enap3epreg5vr2gy@flea.home>
 <53E8FC74-8AC0-461A-B875-812EE4A3267E@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w5ohdwsyzrw47olh"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBM5O73EQKGQEBKFIRIQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <53E8FC74-8AC0-461A-B875-812EE4A3267E-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--w5ohdwsyzrw47olh
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 10, 2017 at 12:51:02AM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B46=E6=9C=8810=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
12:49:15, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=
=B0:
> >On Wed, Jun 07, 2017 at 04:48:50PM +0800, Icenowy Zheng wrote:
> >> >> @@ -189,6 +211,8 @@ supported.
> >> >>  Required properties:
> >> >>    - compatible: value must be one of:
> >> >>      * allwinner,sun8i-v3s-de2-mixer
> >> >> +    * allwinner,sun8i-h3-de2-mixer0
> >> >> +    * allwinner,sun8i-h3-de2-mixer1
> >> >
> >> >Again, please explain why we need to have different compatibles
> >> >here. If it's only about the number of planes, this should be dealt
> >> >with a property, not a compatible.
> >>=20
> >> Only mixer0 has "VEP" and write-back support, at least on H3.
> >
> >What is that VEP? writeback support can also be expressed by a
> >property.
>=20
> I don't know what VEP is...

Ok. Let's forget about it at the moment then, especially if it's
optional, we can add support for it later.

> But we are really facing different cores, like sun50i-a64-mmc
> and sun50i-a64-emmc.

Not really. The eMMC and MMC controllers are *very* different. They
behave (slightly) differently, the eMMC controller has more signals
(8-bit bus, data strobe), can run at a higher frequency. You cannot
have exactly the same driver (or rather code path) to handle
both. Therefore the need for some other compatible.

This is not the case for the mixer here. The thing that differs
between instances is not behaviour but data. And we provide most of
the data through DT.

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

--w5ohdwsyzrw47olh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZP5coAAoJEBx+YmzsjxAg/PUQAIq24iosJhBWfqs/Wpe0q/cS
+Fvx2UK4lPd3NzfbM0JWBS+lhkz8W7aNmVIhIBh0Cf2/gAnDnIRYzHB0p3GeVfLQ
JLwyfmdXRysr3mZ6p2N6MtAuUpHDA6CIaByxFVGGO5plzjk73ZoORlJtMfawqyyU
Iu6vfQ6gXoThDrVoFJyYcRXk7HnYB2X4oZzaBn3MgYL8+pk9mGPyqboKoHgBCTag
pl4QetGGDm025Xh3iP1ojCwI0dQrIY91qUh/pFYwZrhCzS0zYRlVRhSKy/BQKG9/
hPt0ARnB0O8nV39OQyPvLu7QLSiBMqtPXtBD7q9w9/QrWXs4EVAberpxopcg1VCH
kPZiP22oOVIMYhVgG+MJv2IyHdOZ2LyjF+xezLDSgOZk/sOiY+0sA8b7E06ph7xQ
zo/RTXCBLyah9QKoxdhMhHCcBapx341HrLD8U/6JMZcdaWhwCUXVnElVKgpmwhNF
Kx4Ais9lPCiWxURRNrPItkPaerEZzEa9Pn8BeyWefXDIAno3k1yFykc9VmM79j0f
6XaibWk30p3n6J/nXQJnYyUgi8r/KrLecVEfAWXJatGwzX0a3YJp5Q7H79YFvSlI
V6mC+iCLVkjHTgD3qwvlYySVi7tXdIcoqN68VBpGmIvuX9L8AB8Hv3qXeX0MJ4sx
CXIPFBBqPGN7LwcUeGE+
=8PjL
-----END PGP SIGNATURE-----

--w5ohdwsyzrw47olh--
