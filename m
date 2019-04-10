From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v5 0/7] sunxi: Add DT representation for the MBUS
 controller
Date: Wed, 10 Apr 2019 16:34:44 +0200
Message-ID: <20190410143444.tbuafcrqzbhwwsag@flea>
References: <cover.f8909884585996f28d97f4ef95efbcab19527dc4.1554108995.git-series.maxime.ripard@bootlin.com>
 <5ca841d1.1c69fb81.f4702.b85d@mx.google.com>
 <20190408081126.t3blyvtcqslzvki2@flea>
 <20190410140128.GA6232@bogus>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0680717603=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190410140128.GA6232@bogus>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org, Georgi Djakov <georgi.djakov@linaro.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Yong Deng <yong.deng@magewell.com>, Frank Rowand <frowand.list@gmail.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0680717603==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mdb5rg4uvbunhslt"
Content-Disposition: inline


--mdb5rg4uvbunhslt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 10, 2019 at 09:01:28AM -0500, Rob Herring wrote:
> On Mon, Apr 08, 2019 at 10:11:26AM +0200, Maxime Ripard wrote:
> > On Sat, Apr 06, 2019 at 01:06:07AM -0500, Rob Herring wrote:
> > > On Mon, Apr 01, 2019 at 10:56:40AM +0200, Maxime Ripard wrote:
> > > > Hi,
> > > >
> > > > We've had for quite some time to hack around in our drivers to take into
> > > > account the fact that our DMA accesses are not done through the parent
> > > > node, but through another bus with a different mapping than the CPU for the
> > > > RAM (0 instead of 0x40000000 for most SoCs).
> > > >
> > > > After some discussion after the submission of a camera device suffering of
> > > > the same hacks, I've decided to put together a serie that introduce a
> > > > special interconnect name called "dma" that that allows to express the DMA
> > > > relationship between a master and its bus, even if they are not direct
> > > > parents in the DT.
> > > >
> > > > Let me know what you think,
> > > > Maxime
> > >
> > > LGTM.
> > >
> > > How do you propose merging this? I can take 1-5, and 6 and 7 thru
> > > arm-soc?
> >
> > You can merge 1-4, and I'll merge 5 through drm-misc and 6-7 through
> > arm-soc
>
> Done.

Thanks!

Applied 5, 6 and 7

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--mdb5rg4uvbunhslt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXK3/BAAKCRDj7w1vZxhR
xUD4AQD5hS7+ZHmcWTv1U+MW+IfeKNzwi9gGJSCD6GW83mUcmgEA+Jr6UQf6ld55
Yw55wvLBfnlr+KlG11XCEYLm6wiKFQY=
=LOGN
-----END PGP SIGNATURE-----

--mdb5rg4uvbunhslt--

--===============0680717603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0680717603==--
