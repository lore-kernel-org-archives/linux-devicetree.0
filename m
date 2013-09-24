From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] media: i2c: adv7343: fix the DT binding properties
Date: Tue, 24 Sep 2013 16:52:16 +0100
Message-ID: <20130924155216.GG3226@sirena.org.uk>
References: <1379073471-7244-1-git-send-email-prabhakar.csengg@gmail.com>
 <3002978.Cb6jL1xtkE@avalon>
 <5240B396.2010705@wwwdotorg.org>
 <6800560.AEqRA3IBkp@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+sHJum3is6Tsg7/J"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6800560.AEqRA3IBkp@avalon>
Sender: linux-doc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, Rob Landley <rob@landley.net>, Pawel Moll <pawel.moll@arm.com>, LDOC <linux-doc@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <rob.herring@calxeda.com>, Prabhakar Lad <prabhakar.csengg@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sakari Ailus <sakari.ailus@iki.fi>, LAK <linux-arm-kernel@lists.infradead.org>, LMML <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--+sHJum3is6Tsg7/J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2013 at 11:44:57AM +0200, Laurent Pinchart wrote:
> On Monday 23 September 2013 15:33:10 Stephen Warren wrote:

> > So I think you want to make the supply properties mandatory in DT (since
> > some form of supply is mandatory in HW), yet make the driver support
> > broken DTs which don't have those properties, by error-checking the
> > return value from regulator_get(). You might want to put a note into DT
> > saying that a previous version of the binding didn't require those
> > supply properties, so they may be missing from older DTs.

> Are there such devices in the wild ?

=46rom v3.12 on the kernel will stub in a dummy supply if one isn't found
when using DT but I wouldn't mention that in the bindings since it's
very much fixing up broken DTs rather than a good idea.

--+sHJum3is6Tsg7/J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSQbUtAAoJELSic+t+oim9jA4P/26rkmuuP5nriq1ksfexe3KT
45LgsHxK0sW4KDRIhgezhnNgoqRmHRmECRu3CkKuMOKw2I7W31295yP3ge1qgaM9
AbH810Nvfv530yWr2SovCddiz6YGn+Ayw+i00sD+AvUrBkZf6OBcZailrpSzdOUk
KqJ1cM7B/F1Cw225DeyZvUoqZdmmirFgN/kEmq9H3GA/efN6wdO5ZU2VGaGgNT8F
1YGv3r3YNw+EtjpxjbNWLBVoEIDGrdsVHDy6KgSZrPJnwwbA4IkqdtDNNLqi/WSh
ta/Z4gMnuulcj13e/xWHek8CSY115oCR7+Zv3Chcb+DYJUhXo9HrCF386qHQlqvy
3o4TioJgMLl/0hpKsLCrpFtPFi+2JBCsxF3tyMdbllZBNhZgt6+PHR2OACUGw0CA
NraSpp2T4/INUVR0EuIeKwpZ8RQwlqgUtu1ehZr1nNq/wD3dvLw+v57RUPdvTyDP
xWBJt/jM+wiYppuFkUJeQVil5qcZEOnzBTC4rSbhEd7gjrV6i6G6x/cdlB1pStzC
flgWprarGf6TXRl9CHa7w8vNDumJUfPptHYIFfDiPeWn6/xbSrGsAo6VnzVDQzHB
ADWbTSM4ZumEBwHSBTZdAYRwsQ7ANpECWb3UdQjw2Y4Vnx6U3wbMoBPJ56/ic/6D
SwU86Q3zZ/jTFdNZMBu8
=Ogxx
-----END PGP SIGNATURE-----

--+sHJum3is6Tsg7/J--
