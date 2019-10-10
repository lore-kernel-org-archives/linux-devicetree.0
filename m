From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/2] ASOC: Add ADAU7118 8 Channel
 PDM-to-I2S/TDM Converter driver
Date: Thu, 10 Oct 2019 16:36:23 +0100
Message-ID: <20191010153623.GD4741@sirena.org.uk>
References: <20191010074234.7344-1-nuno.sa@analog.com>
 <20191010140512.GT2036@sirena.org.uk>
 <eace751502e84651d4bc727b59464f7cfbbebbd5.camel@analog.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7422698485774087882=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <eace751502e84651d4bc727b59464f7cfbbebbd5.camel@analog.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: "Sa, Nuno" <Nuno.Sa@analog.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "lars@metafoo.de" <lars@metafoo.de>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============7422698485774087882==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5p8PegU4iirBW1oA"
Content-Disposition: inline


--5p8PegU4iirBW1oA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 10, 2019 at 03:05:24PM +0000, Sa, Nuno wrote:
> On Thu, 2019-10-10 at 15:05 +0100, Mark Brown wrote:

> > You could use regulator_bulk_enable() here (and similarly on
> > disable) but it doesn't fundamentally matter - they do guarantee
> > that they'll do things in sequence, though they don't wait for
> > the ramp to complete before kicking off the next enable in the
> > sequence which can be an issue for some hardware.

> Yes, regulator_bulk_enable() could fit. The only thing that worries me
> is that we only check for errors returned from regulator_enable() after
> all async work is done (which is probably what you mean by "they don't
> wait for the ramp to complete before kicking off the next enable...")
> which could leave us with DVDD applied without IOVDD for a short amount
> of time. I'm not sure this would be a really issue and that would
> damage the HW, but from what I can tell from the datasheet, It's not
> advised to apply DVDD without IOVDD.

Yeah, exactly.  OTOH things like that (especially for brief time
periods) are much more likely to result in the chip being in some
weird state on init which won't matter if we immediately power
off than anything else.  Like I say it's not a requirement to use
bulk operations.

--5p8PegU4iirBW1oA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2fT/cACgkQJNaLcl1U
h9Dt7gf/ZvUHZZNHq/t4g3RlSNysGA0NnGbqqC9iVDNUYtHm0yFv2ah5wg+ep56/
l4Hd2Z8Wikrf9rQfgfgAyvGkFDAqMZqchLf03KZu614f1qmUe9iwSDnszQT17mwl
mtQgoy+FzkZNKZdHGTHSfTxyZLlktWDZtAk//ucTOchkq2SiLree8x96Bd0+yvHZ
UQns3/11BrVtXyoj8T1wldhKfnv9mhG4A2BJSKsoxLSwMRv3KhuGtwD2fDMI2r83
bT3Z9ATm/z+EUftbBzNRK55l1q2xCgW2L2Cx+QN3foKOYp1xxvZp/0IkTohu+9mm
QCCHmaMkEfcWM4VQFFrQ5HUf+ClDqQ==
=W1nX
-----END PGP SIGNATURE-----

--5p8PegU4iirBW1oA--

--===============7422698485774087882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============7422698485774087882==--
