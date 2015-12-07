From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format
 binding
Date: Mon, 7 Dec 2015 12:36:28 +1100
Message-ID: <20151207013628.GC20139@voom.fritz.box>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-4-git-send-email-computersforpeace@gmail.com>
 <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ@mail.gmail.com>
 <CAOMqctTbUNd0GtY07YJuxem9HkU1WZ-NtO556=Yg2QrsF49Xjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Md/poaVZ8hnGTzuv"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOMqctTbUNd0GtY07YJuxem9HkU1WZ-NtO556=Yg2QrsF49Xjw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Md/poaVZ8hnGTzuv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 05, 2015 at 10:33:30PM +0100, Michal Suchanek wrote:
> On 5 December 2015 at 12:39, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
> > On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
> > <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> >> +
> >> +Examples:
> >> +
> >> +flash@0 {
> >> +       partitions {
> >> +               compatible =3D "google,fmap";
> >> +       };
> >> +};
> >
> > I wonder if this wouldn't be better served in a separate binding doc
> > with its compatible name as the filename, like we do with
> > driver^Whardware blocks, especially if we want to add more parsers.
>=20
>=20
> I find that *very* counter productive for bindings that go to the same
> node. You have a description of a node, and then suddenly there you
> have another file with another description of the same node. Totally
> awesome.

I can't actually work out from that if you're agreeing with the
original post or the first reply.

> Also how do you plan to write partitioning schemes with parameters
> like with non-zero offset of the partition table.

Presumably with properties in the patitions node.  Not seeing the
problem here.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Md/poaVZ8hnGTzuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWZOKbAAoJEGw4ysog2bOSVUsQAMtI5JFXm2WzQrFHqxgSpKUp
/FeQiNTO93Zwsi1qFlTqkLf0bET66lt0vQNHLKnDpPCnRAJ6EQZqEF2b0WyDYmYM
imBC1+J6Y4WaC5IXtV7BG/hDp6sCf7FII2okZhZ7VXlTNfJSt7gQw/3z9Aebhuc9
JysF+c8GUiVdq48+3V1zXTyZN9rOBdx0JamT0XTQ6fM6mrDUIg/wDRFxiHwH5t71
M6xHpTwuvSjOcfEyegBkIOHm+iM2ofvTGx9Bbr3W0CFVs7yzOaL2X5oTP4UNnW/i
KQSUGhv0emI9g3M1WpQMgN3WjZUfGlrPz8gx5q4S9dIG7udwh4NITAuJL83WhkE6
Gg1qlH8O7T50oD/SQW16ic1CNmUUM6DUIHLcM9KRkoLxWsxYnt/CTkDGs8MOQD87
1BC8oy1rN4ACSUNsm6T9e9QUqTdRT4rh+70xf4VI/Gw8ADnRaO590ZZivxiBblFX
1B5jhBIsGUYzLegGfhmCuFy3ix3yZ/wK/snkSMZz/XUhOY0zofn3RGlw0aqJuZnv
eSUgqwqOR0ca3T0PbXsVfwvyrUku6XPR3DvT6fgmlesSfcKq77aYRIbbCnuulQ3h
RtTHTi5zv931WBWyofGl7d2eXrgtd9pDXDu5KazRhbxntTQqiJQ0+dFphRROWVNC
Scn1qD+Zp6Qgy5MtvN3y
=OXEZ
-----END PGP SIGNATURE-----

--Md/poaVZ8hnGTzuv--
