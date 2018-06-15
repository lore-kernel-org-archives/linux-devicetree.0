From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [linux-sunxi] Re: [PATCH v2 04/27] dt-bindings: display:
 sunxi-drm: Add TCON TOP description
Date: Fri, 15 Jun 2018 10:45:42 +0200
Message-ID: <20180615084542.slp3ma4krrj744do@flea>
References: <20180612200036.21483-1-jernej.skrabec@siol.net>
 <20180612200036.21483-5-jernej.skrabec@siol.net>
 <20180613073456.jk72zw4rt4ysjco7@flea>
 <2481282.yoIGH2ksVh@jernej-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2062593239=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2481282.yoIGH2ksVh@jernej-laptop>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, wens@csie.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, robh+dt@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============2062593239==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uehqhgocot3w3pij"
Content-Disposition: inline


--uehqhgocot3w3pij
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 13, 2018 at 06:03:21PM +0200, Jernej =C5=A0krabec wrote:
> > > +Required properties:
> > > +  - compatible: value must be one of:
> > > +    * allwinner,sun8i-r40-tcon-top
> > > +  - reg: base address and size of the memory-mapped region.
> > > +  - clocks: phandle to the clocks feeding the TCON TOP
> > > +    * bus: TCON TOP interface clock
> > > +  - clock-names: clock name mentioned above
> > > +  - resets: phandle to the reset line driving the DRC
> >=20
> > s/DRC/TCON TOP/ ?
>=20
> Yes, copy & paste issue
>=20
> >=20
> > > +    * rst: TCON TOP reset line
> >=20
> > Remaining consistent with the clock name would be great
>=20
> You mean "ahb"? I noticed that most other nodes with reset lines don't ha=
ve a=20
> name associated. Maybe I could just drop it and use first specified reset?

It's called bus in the binding, but yes. And yeah, we can drop the
name as well.

> >=20
> > > +  - reset-names: reset name mentioned above
> > > +  - #clock-cells : must contain 1
> >=20
> > An example would be nice here
>=20
> You mean node example? with ports? In the past, Rob was against examples=
=20
> unless really necessary. Node from R40 DTSI can serve as an example.

Ok.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--uehqhgocot3w3pij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsjfLUACgkQ0rTAlCFN
r3Q+JQ/8C12cz1mDx1+BF4O9IZ2xfHWa/0ZHDDOVTxwRujGMDvmwMT7fUaJJTtl6
dBLUQAyGq/reCzTyHu2LgpduQ4BcGADTybfdOXAa9uED0I0/dfm6YjK4XlOFt8vs
q2KgSWCs0xddgw7/L/KzoN71E9IMv93sEd/f9HAxv6bfysrROJbtB5itaEvT+NcL
VbFd2lb5E6W3FJOxaVsjQFI1wT7fBP1pL3E796oY2ZSJWoiHTXiQ2tbRkfTM1PQz
KPv0XT2RD8A6/x+lUDo6RaQQJpZeFIwcZQJ1V4cJRXJLh20s0XtRga53Bcph2V8O
uRHQ/uPK4nG7ReT17ld6ofFF7PUDqh6ilJEf/RFd2mjVb/ob36iS2JCd2BORuhu+
C6ZX9SO73CSqVPJQmgfMiI9yUZ8WHg4LCletyN97SQijhMPiSE/AD73Xj9XVRaBD
2xVtUW3S7O1CDRambj7HxpfDWzxuShs0leTev46fBuzrHZTmJ4kLd50zSJIr0+cD
MD9ccJdOiK8cF8tDUYJlY81fI9j3ZtoEvbMZv3/yndSfHvm1ops97GGo2oCTGkMO
W6hA78jPMrWd/tDIJHEuWQu5AlTw6ZuZ0elcfHeXIThSS8SeeR52xfvb2s0/w+Wf
NXZdaeqei7Wg3hucgDsPcWt4BXSbkgHAlF7Xx4nOvr/9RHjmyF0=
=74NE
-----END PGP SIGNATURE-----

--uehqhgocot3w3pij--

--===============2062593239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2062593239==--
