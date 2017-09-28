From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 00/11] dmaengine: sun6i: Fixes for
 H3/A83T, enable A64
Date: Thu, 28 Sep 2017 17:26:46 +0200
Message-ID: <20170928152646.jteewxaqqbkw777s@flea>
References: <3c78e966-2ece-4e67-94de-801aa569089f@rwthex-w2-a.rwth-ad.de>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zmuabj2gnergbqcl"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBQNJWTHAKGQEMESU5HY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <3c78e966-2ece-4e67-94de-801aa569089f-cBaz+nnMw1+1MzRH+ruthl5UTUQ924AY@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--zmuabj2gnergbqcl
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 01:49:17AM +0000, Stefan Br=C3=BCns wrote:
> Commit 3a03ea763a67 ("dmaengine: sun6i: Add support for Allwinner A83T
> (sun8i) variant") and commit f008db8c00c1 ("dmaengine: sun6i: Add support=
 for
> Allwinner H3 (sun8i) variant") added support for the A83T resp. H3, but m=
issed
> some differences between the original A31 and A83T/H3.
>=20
> The first patch adds a callback to the controller config to set the clock
> autogating register of different SoC generations, i.e. A31, A23+A83T, H3+=
later,
> and uses it to for the correct clock autogating setting.
>=20
> The second patch adds a callback for the burst length setting in the chan=
nel
> config register, which has different field offsets and new burst widths/l=
engths,
> which differs between H3 and earlier generations
>=20
> The third patch restructures some code required for the fourth patch and =
adds the
> burst lengths to the controller config.
>=20
> The fourth patch adds the burst widths to the config and adds the handlin=
g of the
> H3 specific burst widths.
>=20
> Patch 5 restructures the code to decouple some controller details (e.g. c=
hannel
> count) from the compatible string/the config.
>=20
> Patches 6, 7 and 8 introduce and use the "dma-chans" property for the A64=
. Although
> register compatible to the H3, the channel count differs and thus it requ=
ires a
> new compatible. To avoid introduction of new compatibles for each minor v=
ariation,
> anything but the register model is moved to devicetree properties. There
> is at least one SoC (R40) which can then reuse the A64 compatible, the sa=
me
> would have worked for A83T+V3s.
>=20
> Patches 9 and 10 add the DMA controller node to the devicetree and add th=
e DMA
> controller reference to the SPI nodes.
>=20
> Patch 11 fixes a small error in the devicetree binding example.

Applied patches 9-11, thanks!
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

--zmuabj2gnergbqcl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZzRS2AAoJEBx+YmzsjxAgUDcP/i98qXuTV3oUVkapT5lgZf+Z
87m/BVBTXBkH617tizXtt/d8a9S1V1WSB/jfMUPaKolsu+4dcNmswr/yt8qOUEha
1KCYW8+pXrwE4yNRU5cHD4/jOClmmG7cvIKOKY8TjZXuzWV/PFkPfmVjmqr80nnH
C0UKDGA7prm+meXh6JRg/WZE8sY+OgusJ6cCF/Pvl1uPB/n3o+8wFe8uZOVPqH7M
jpYe3jsiwVe0+eby30DO7roVcs+KoGQBTzY74vEwcYbTCsNJM2ovEDXYT/ssRung
36X45YJyGzOg+a2DcCaSEqOq9iWwk8eDsUnXcAafl1l/dKEdinOFTctIigBgojSK
qADerRwfJLmMxgpdcycDQSwxa29Pyy7SyZDMw76DfW46C1kFty0kbUwoKC71E176
dmDX0uR8UM4mdPPBtGTRJ3zCf7+8wgtOLYJDtk2IzQ/KdTB+iUq4i+keX89JFf1k
MIzqocWCYI6aslCOsb8cZXeZhBV3JoQM0PNnrQ6MxtOHBB8gfEE+MVbrW/64a9d5
oOLLUCBrqLTfaDUDORkK/fr6rLJDZGexPam8rx2Cu3LbP81UsE40Sf4WbaaCIr1L
QjX3xunHCjXkjBTTkIpChiyBdQt4ThODpbjnzbwdfsrLo2ggBNnNxqyjghtbdAKC
n2TqhBAZACo9s9BwBaxT
=U705
-----END PGP SIGNATURE-----

--zmuabj2gnergbqcl--
