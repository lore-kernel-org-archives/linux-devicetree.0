From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: add binding for A64 DE2 CCU with SRAM
 section
Date: Fri, 27 Oct 2017 17:13:34 +0200
Message-ID: <20171027151334.c3b7yqoiexgwopsf@flea>
References: <20171014122925.13220-1-icenowy@aosc.io>
 <20171016091136.b4rnckh2tfi26shx@flea.lan>
 <d62ac8b8ff9073b886ceaa9ce54e6903@aosc.io>
 <20171016120912.lxu7rikhffxsu5o4@flea.lan>
 <b8c770bdc7a0541b8d1179598d814b75@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="e6u3rr5h4mzoevj7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b8c770bdc7a0541b8d1179598d814b75-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--e6u3rr5h4mzoevj7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2017 at 10:33:29PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-10-16 20:09=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Mon, Oct 16, 2017 at 05:41:10PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> > > =E5=9C=A8 2017-10-16 17:11=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=
=EF=BC=9A
> > > > On Sat, Oct 14, 2017 at 08:29:24PM +0800, Icenowy Zheng wrote:
> > > > > A64's Display Engine 2.0 needs a section of SRAM (SRAM C) to be
> > > > > claimed.
> > > >
> > > > Why?
> > >=20
> > > Allwinner didn't document this, but if the SRAM is not claimed, the
> > > DE2 MMIO zone is totally not accessible.
> >=20
> > Not accessible how? It generates an abort when you access it? It
> > returns 0?
> >=20
> > > It seems that Allwinner uses the SRAM C in the DE2 internally.
> >=20
> > Then shouldn't it be tied to all the DE2 devices then? So mixers
> > too. Either way, this should be mentionned in your commit logs. How
> > you're fixing things is much less interesting than why you're doing
> > them. You can tell how you're doing them from your code already.
>=20
> Yes I checked and when the SRAM is not claimed any part in DE2 memory
> zone can't be accessed.

Then all the nodes that depend on it should have it, and the bindings
should be modified appropriately.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--e6u3rr5h4mzoevj7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ800eAAoJEBx+YmzsjxAgJu8P/0KYhU1Vhx8/2gS7lO4n18/o
zbdyv6tzYp+NL+TCYJg7GKUVTNdh5C0o2tg1FsdHMwi1iSpc8qLv5W+S39W4TH8N
H3XuheB7SzMaJbXj7SA3z3Xv07upfmqXcAOhtkwZ9ADyKtIVpu/r7PxOhd2mLCbT
tYoiYmh/pcuvyc+OIzU1/eKHSxASXLFr8H4HNSe2pAIlh+MWFhOkSq8/9NpBhV27
9yk+RnDU04sjNJ5LTDc04jHoknXd5Pg1V1StJE/maSpcwtk5eC9Ebhd8Kr1UQxvm
0iTJKaoWH8nBQmdt0jl0mYNTpi4rRvox3e5mdPlw3VlKbteyM4ssMZBjCZGdfJ97
hqMijodcDsHo4f1Vw+RAC4bztxZMF05CSp8amxzsi6TRJ9/05j/7ds9HO473k1jx
205PseruvKPGj46AIA6IP6ZYgRdOsPxE5ey8AjdPnXXXSnH/qw+zgTZaa2hgjZr6
5Cqi7vr0BxNSGb4MSh7GGim+HXywcPVmc6M6lazyV4IP05gvhHl2KqpB8BXY/z7s
yyBgYbyWMDrMSXbRWhMfRHGIQ+wVaHnrxJvLXTQTW57kwe5SJYvOB6uzWwIYaPFI
j2hMyxQGFF6B4rQ69SD1X2oxaOQ63iFB9W+IfUfMbenud20FnodBF71UVwQ5iUgc
WMzSRojHODEitf2q3wsb
=Q6qZ
-----END PGP SIGNATURE-----

--e6u3rr5h4mzoevj7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
