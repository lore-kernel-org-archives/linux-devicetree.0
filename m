From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/5] mfd: arizona: Add device tree binding for
 max_channels_clocked
Date: Tue, 24 Sep 2013 00:28:32 +0100
Message-ID: <20130923232832.GM21013@sirena.org.uk>
References: <1379961043-23762-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1379961043-23762-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <5240B4C2.2080600@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6tPBpOxN+lFhHURE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5240B4C2.2080600@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, lee.jones@linaro.org, sameo@linux.intel.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, rob@landley.net, patches@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--6tPBpOxN+lFhHURE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 23, 2013 at 03:38:10PM -0600, Stephen Warren wrote:
> On 09/23/2013 12:30 PM, Charles Keepax wrote:

> > +  - wlf,max-channels-clocked : The maximum number of channels to be clocked on
> > +    each AIF, useful for I2S systems with multiple data lines being mastered.
> > +    If specified three cells must supplied one for each AIF, specify zero for
> > +    AIFs that should be handled normally.

> What determines the value of this property? Is it really a definition of
> HW, or some kind of run-time configuration/limit? What goes into each of
> the 3 cells?

It's hardware, it's other devices wired in parallel on the bus that use
the CODEC as a clock master.  Personally I'd have this be set by the
ASoC machine driver so it's invisible from a DT point of view, that's
what it's really a property of.

--6tPBpOxN+lFhHURE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSQM6dAAoJELSic+t+oim9p5UP/0Ly4KU+DYlk4DxtcqQQmr5d
Q1FZTh+FEDRu6WqPgEXkQIbwOyr73vUSbzHkQ52qp3ISiENUqznps4FNQjYJTLTt
c+UZWqoF4ywXCl04s65ltaY+ntdCxdMQX7amFSaaNRqddnZxKSsn4y1L0bRnq7jV
pegn5P3gY4atV5OMDC3sQESl2HQIhb3SvhCW+nCiVha6P1WsRQUw/5nTrhyOZSGi
5B8bIvpm2KzVmY0YUNKDnMZyS5axUKW7yDD2XVfZfZFeDECkOK131od9pUhucxhi
ItzM8w2qtf100uUKUvmgpKYKJLVGn9toia1SD5BEsmWUDUEDlFL9GNhRsYHAu+e1
AeLYXUoDbzNIqIFwuD/ZXZNCCqafg63yQp0fB1Xw/Hn8wxUSvdkKFTzueYvRfUhF
abqBjNTm6tysbPTglmFojEEYz321HxRr7eHW1SzOSgTcuwNbv+d2m4cdnCFCS6+A
Ccbt47e1ZaS42hbmhcQWaCKZVquqqXE0Z8sSSdOboslA3gyyOxFM1jcSPVab6C0U
Tz1DgDPN/4a2LbGdNomV2idM4bAoExZkXNOqpgaqA5xg4LE8ci84MIsGVdil5N87
tSm4lGmLWmvxE8DxZFc+08L1kuv2bH71eG5cvnGFz2DbArnK0o6a1TSEQSEpu5ft
7xBwYzyjJ8OPY99yW/aC
=I6ps
-----END PGP SIGNATURE-----

--6tPBpOxN+lFhHURE--
