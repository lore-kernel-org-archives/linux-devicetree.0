From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v5 0/7] sunxi: Add DT representation for the MBUS
 controller
Date: Mon, 8 Apr 2019 10:21:16 +0200
Message-ID: <20190408082116.ndh3qnbgw4p6j75c@flea>
References: <cover.f8909884585996f28d97f4ef95efbcab19527dc4.1554108995.git-series.maxime.ripard@bootlin.com>
 <5ca841d1.1c69fb81.f4702.b85d@mx.google.com>
 <20190408081126.t3blyvtcqslzvki2@flea>
 <CAGb2v66cc-y0c98yaggFpnuWGwdWa5HpG0uapidreSqmc_maAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1789475610=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGb2v66cc-y0c98yaggFpnuWGwdWa5HpG0uapidreSqmc_maAQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, devicetree <devicetree@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, Georgi Djakov <georgi.djakov@linaro.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Yong Deng <yong.deng@magewell.com>, Frank Rowand <frowand.list@gmail.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============1789475610==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="icwy4xww433vtde7"
Content-Disposition: inline


--icwy4xww433vtde7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 08, 2019 at 04:14:53PM +0800, Chen-Yu Tsai wrote:
> On Mon, Apr 8, 2019 at 4:11 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
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
> Wouldn't there be some runtime dependency between 3, 4, and 5?

What issue did you have in mind?

I guess the only issue would be if we have the new DT properties, but
not the new core code. But that seems pretty unlikely, since each of
the trees will work independently, and next should have all of them.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--icwy4xww433vtde7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKsEfAAKCRDj7w1vZxhR
xQaEAQCjhg8hQs5SWWaTx+cGymxQRADr9EokhV0aemSp75TUGgEAztIDyNTTXeqS
92Vu+ICKEwRJOUeC09HDWwR8oPJtHgw=
=KVwc
-----END PGP SIGNATURE-----

--icwy4xww433vtde7--

--===============1789475610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1789475610==--
