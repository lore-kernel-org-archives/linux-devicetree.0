From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] dmaengine: sun6i: Correct DMA support on H3
Date: Mon, 4 Sep 2017 08:50:27 +0200
Message-ID: <20170904065027.7splxlgxhpu5nj56@flea>
References: <20170830233609.13855-1-stefan.bruens@rwth-aachen.de>
 <a649f98d4ac44abc873c5110ce9363e5@rwthex-w2-b.rwth-ad.de>
 <20170901133549.cr2ivmfr5mnrdujg@flea>
 <5722405.lpx0YHbn2k@sbruens-linux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lybdai6y7ovcphjs"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5722405.lpx0YHbn2k@sbruens-linux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?B?QnL8bnMs?= Stefan <Stefan.Bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--lybdai6y7ovcphjs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2017 at 02:42:47PM +0000, Br=FCns, Stefan wrote:
> On Freitag, 1. September 2017 15:35:49 CEST Maxime Ripard wrote:
> > On Fri, Sep 01, 2017 at 05:04:54AM +0200, Stefan Bruens wrote:
> > > On Donnerstag, 31. August 2017 16:51:35 CEST Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Thu, Aug 31, 2017 at 01:36:07AM +0200, Stefan Br=FCns wrote:
> > > > > +/* Between SoC generations, there are some significant differenc=
es:
> > > > > + * - A23 added a clock gate register
> > > > > + * - the H3 burst length field has a different offset
> > > > > + */
> > > >=20
> > > > This is not the proper comment style.
> > > >=20
> > > > > +enum dmac_variant {
> > > > > +	DMAC_VARIANT_A31,
> > > > > +	DMAC_VARIANT_A23,
> > > > > +	DMAC_VARIANT_H3,
> > > > > +};
> > > > > +
> > > >=20
> > > > And this is redundant with what we already have in our structures.
> > >=20
> > > Actually, its not. For H3, there are currently at least 3 register
> > > compatible SoCs: H5 is identical, R40 has 16 dma channels, A64 has 8
> > > channels. So if the current config structure is kept, we need 3 diffe=
rent
> > > compatible strings. Same for the A23, which is register compatible to
> > > e.g. A83t and V3s, but with different numbers of DMA channels.
> > >=20
> > > So either you decorate the code with a cascade of
> > >=20
> > > if ((of_is_compatible(..A23..) || of_is_compatible(..A83T..) || ...) {
> > > } else if ((of_is_compatible(..H3..) || of_is_compatible(..A64..) || =
=2E..)
> > > {
> > > } else { /* A31 */
> > > }
> > >=20
> > > in a number of places, or you do it just once.
> >=20
> > That's not how you retrieve the structures. They are already
> > associated to the compatible, and you need to do a single lookup to
> > get them. So that's nowhere near what you're suggesting. You can have
> > a look at the of_match_device in the probe function.
>=20
> Please have a look at the current implementation of how the clock autogat=
ing=20
> in the probe function is done - it matches with the compatible string.

Yeah, and we should get rid of that as well.

> Of course we can replace this with a match between sdev->config and the=
=20
> various sun6i_dma_config instances, but we would still have to do 3 match=
es=20
> for the A23 register configuration (A23 || A83T || V3s) and 3 matches for=
 the=20
> H3 register configuration (H3 || R40 || A64). There are currently *7*=20
> different configs (V3s, R40 and A64 taken into account), but only 3 diffe=
rent=20
> register variants.
>=20
> This is the same rationale as the "gate_needed" boolean property proposed=
 by=20
> Icenowy Zheng in the "Allwinner V3s DMA support" patch series. Obviously =
we=20
> don't need a boolean, but a ternary option to cater for the gate_needed=
=20
> differences - "NO_GATE", "A23_STYLE_GATE", "H3_STYLE_GATE".

Or we can just have an extra field in sun6i_dma_config that would set
the gate register offset? If it's non-zero, use whatever you have set
there, and then you just have to care about two cases, no matter how
many offsets we'll have in the wild.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lybdai6y7ovcphjs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZrPezAAoJEBx+YmzsjxAgRT0P/36L4fu6Bb3GrTfRqaJ0lDJB
2MbXYfSn6ATBgrwKD4iBGyzNPV8bVvZ9c8vUkGhHyr+fULblOrBLxjWr2qFS7vKy
fVcQSYEoQjqHvB661lYJK2eadmw1aLDDvHTzGETt2iItzGHMfhYcFeDyBbV2HWai
FGnYZplqCNMHbwC7u6/HdEIqCN9BtYuIPFygXN4iIGhi6GbDzzGsQpnDTS7Gtkb+
MnWTj1P8RHKZKhtKXyslQceFEXYJlvvBUIT9dRTz3hGOHij35/YRKqbz4BQVwBAJ
iKh210rYNPgv7VFAv9PVZGNtJS/pMXDWncO+qlplavi2qiRTHSgRFgT/dThKrOh8
/3uItk4QnwvNu9udEUkHDR3bmqNaTtI0/Aksvxc2MdzvDQI986UzttJc7WrTLADm
RZP1+50ebIcSFRJiTwaYNAsEKPyHzPZ7PbRrdMc4Zep3k/i/DFWkNGE3bVbZbfX6
46rK57lV6BKOA5HsPHbjnJT9MCn0PADpdVhryszcDX1Ot4qfgTcoYnPGwkPXSzf4
rIInJxvHp9nqAVpX9ZSbARMoSRZqP/o4BGNW3au4Lozs8vS4XnBNKTlah+Ob/n75
NUpliMyIuN0K9dh0myDQzfAbRm1CHopC17gGTBGLPyOGuyg6RGJlbUJJvi10XFUF
zh6I3Hv/Fbw42Q9Mj6bv
=swfz
-----END PGP SIGNATURE-----

--lybdai6y7ovcphjs--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
