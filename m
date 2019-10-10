From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/2] ASOC: Add ADAU7118 8 Channel
 PDM-to-I2S/TDM Converter driver
Date: Thu, 10 Oct 2019 15:05:12 +0100
Message-ID: <20191010140512.GT2036@sirena.org.uk>
References: <20191010074234.7344-1-nuno.sa@analog.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0006631323230166991=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20191010074234.7344-1-nuno.sa@analog.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============0006631323230166991==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZYwTRRUThkGj9JQ7"
Content-Disposition: inline


--ZYwTRRUThkGj9JQ7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2019 at 09:42:33AM +0200, Nuno S=E1 wrote:

> +			/* power on */
> +			ret =3D regulator_enable(st->iovdd);
> +			if (ret)
> +				return ret;
> +
> +			/* there's no timing constraints before enabling dvdd */
> +			ret =3D regulator_enable(st->dvdd);
> +			if (ret) {
> +				regulator_disable(st->iovdd);
> +				return ret;
> +			}

You could use regulator_bulk_enable() here (and similarly on
disable) but it doesn't fundamentally matter - they do guarantee
that they'll do things in sequence, though they don't wait for
the ramp to complete before kicking off the next enable in the
sequence which can be an issue for some hardware.

--ZYwTRRUThkGj9JQ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2fOpUACgkQJNaLcl1U
h9BEPwf/VxMhiR0z6PYlab1hBh6JMo2K1WIXb2S3zahILtM5SXxYMmwRh16GuG0o
pIrwnxc5hMD4+bqp6vYu9QaISbKB8UoBsAr+SU5b/eHsba3r0Jbl/wNdTdbgCVus
ZCYLHYtnWZrx9okSggQ9viUDkqls7dLCPMfu/+qV5NiDAasZJZUIEjkaUdfAhYwS
z0yrot94R5p3QdNEI5ds7y5ZuKWGDEcWJNU3PekJ+putlZyUF8qa9/nV+/uZigQ/
hH+oMbQGEg9pgx/neQN2VxC4hIXtXcaDMT4WuEVt2HjWCK2xcFrauNzAg7HkdV0z
EkVGgsiWwDQG59xutrTflWxmmQCOtw==
=S+PA
-----END PGP SIGNATURE-----

--ZYwTRRUThkGj9JQ7--

--===============0006631323230166991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============0006631323230166991==--
