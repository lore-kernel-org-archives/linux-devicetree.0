From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v3 2/3] ARM: dts: add Netronix E60K02 board common file
Date: Fri, 11 Oct 2019 17:05:53 +0200
Message-ID: <20191011170147.1b3c4b25@kemnade.info>
References: <20191010192357.27884-1-andreas@kemnade.info>
        <20191010192357.27884-3-andreas@kemnade.info>
        <20191011065609.6irap7elicatmsgg@pengutronix.de>
        <20191011094148.1376430e@aktux>
        <20191011142927.GA11490@bogus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pKsq_nhga4Bcf+WxR+iqaqg"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011142927.GA11490@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Marco Felsch <m.felsch@pengutronix.de>, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, manivannan.sadhasivam@linaro.org, andrew.smirnov@gmail.com, marex@denx.de, angus@akkea.ca, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, j.neuschaefer@gmx.net, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

--Sig_/pKsq_nhga4Bcf+WxR+iqaqg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Oct 2019 09:29:27 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, Oct 11, 2019 at 09:41:48AM +0200, Andreas Kemnade wrote:
> > On Fri, 11 Oct 2019 08:56:09 +0200
> > Marco Felsch <m.felsch@pengutronix.de> wrote:
> >  =20
> > > Hi Andreas,
> > >=20
> > > On 19-10-10 21:23, Andreas Kemnade wrote: =20
> > > > The Netronix board E60K02 can be found some several Ebook-Readers,
> > > > at least the Kobo Clara HD and the Tolino Shine 3. The board
> > > > is equipped with different SoCs requiring different pinmuxes.
> > > >=20
> > > > For now the following peripherals are included:
> > > > - LED
> > > > - Power Key
> > > > - Cover (gpio via hall sensor)
> > > > - RC5T619 PMIC (the kernel misses support for rtc and charger
> > > >   subdevices).
> > > > - Backlight via lm3630a
> > > > - Wifi sdio chip detection (mmc-powerseq and stuff)
> > > >=20
> > > > It is based on vendor kernel but heavily reworked due to many
> > > > changed bindings.
> > > >=20
> > > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > > ---
> > > > Changes in v3:
> > > > - better led name
> > > > - correct memory size
> > > > - comments about missing devices
> > > >=20
> > > > Changes in v2:
> > > > - reordered, was 1/3
> > > > - moved pinmuxes to their actual users, not the parents
> > > >   of them
> > > > - removed some already-disabled stuff
> > > > - minor cleanups   =20
> > >=20
> > > You won't change the muxing, so a this dtsi can be self contained?
> > >  =20
> > So you want me to put a big=20
> > #if defined(MX6SLL)  =20
>=20
> Not sure what the comment meant, but no, don't do this. C defines in dts=
=20
> files are for symbolic names for numbers and assembling bitfields and=20
> that's it.

yes, that is also my opinion. For now, there is only one user
of this .dtsi, but I have another one in preparation. That is the
reason for splitting things between .dts and .dtsi to avoid such ugly
ifdefs

Regards,
Andreas

--Sig_/pKsq_nhga4Bcf+WxR+iqaqg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl2gmlEACgkQl4jFM1s/
ye9vKhAAos4YjS29TrFqk0UVc9rEP9svrO1m9mcIy34GAw1S8lPgrTQHk6CxjNYF
o2gTG/mcofsy1ngPu7kk625wYMDVzwP8ZXtM7N4DxYLS80vEKq56nkhrBnqIUCvb
Rv+8Sbo0TU4VAES/Hl2yjzl5XBiT6gPajB0BJE4WDSA+lHoZwRDpLz+4QbYlufTG
wJmiDj03mNOGU+UoQ6oruSYW9TQCbiGyx+W/nQGmxEBsT700acHt9A6WPvLeQBYi
nqKVtfVpd6uxxe58mJWEePFF9vEJNe2+FkSg9mMvSZd1SwfNfENw3XqYFb0V8xQ3
ZK8ZWp0ohC5Pa/+fSUlkKFOrPL/PDmK9arKOpj1+IHUg/HIUKW/PN+lzYK8d8Pw/
XKwmUkf4d8rMUyebbrmZgZmAA1V0lArO63RnWLY1COMo3x8whIx7TEjR7lCwi6ht
/p0k4uUw6tzdTsNDLhNNZs8jSY1fFWVJYdX5syspQGy9txQHmZCeDI7+qdleskUA
n7gJj7BslbrK5tmcC6kL2T8ZR8KtrEQjeeHM4UpuNh++7C9tkW44OGN/RP7ytcCr
4T3r21EoF1vNcIV9baRHD7iu74tbuvV8LW/hhsi7CBl2kKHDA1Q4uRaPIfF30wwD
8MwIW7K6JPxJvHlMbHOelBk1vI24MbMyXA4KjFewQDmZPfZK5AQ=
=icrB
-----END PGP SIGNATURE-----

--Sig_/pKsq_nhga4Bcf+WxR+iqaqg--
