From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RESEND 2/2] regulator: mt6397: Add buck change mode
 regulator interface for mt6397
Date: Wed, 11 May 2016 15:50:46 +0100
Message-ID: <20160511145046.GI6261@sirena.org.uk>
References: <1462959090-2877-1-git-send-email-henryc.chen@mediatek.com>
 <1462959090-2877-3-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7IgncvKP0CVPV/ZZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462959090-2877-3-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Laxman Dewangan <ldewangan@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--7IgncvKP0CVPV/ZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2016 at 05:31:30PM +0800, Henry Chen wrote:

> +The possible values for "regulator-supported-modes" are:
> +	0: PWM mode, mapping to regulator fast mode, allow the
> +	converter to remain in the PWM mode regardless of the load current, so
> +	that the noise spectrum of the converter can be minimized for certain
> +	highly-noise-sensitive handset applications.
> +	1: Auto mode, mapping to regulator normal mode, mode switch by current
> +	loading. At light load currents, the converter automatically enters
> +	PFM mode to save power and improve light load efficiency. At heavy
> +	load currents, the converter automatically enters PWM mode to minimiz
> +	the noise spectrum of the converter.

The details of how this maps onto Linux shouldn't be in the bindings.

> +				regulator-allow-change-mode;
> +				regulator-supported-modes =3D <0 1>;

These are problematic too as covered in my other mail.=20

> -static struct regulator_ops mt6397_volt_range_ops =3D {
> +static const struct regulator_ops mt6397_volt_range_ops =3D {

The constification is fine but an unrelated change.  Otherwise this
looks fine from a code point of view, let's get that merged separately.

--7IgncvKP0CVPV/ZZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXM0bFAAoJECTWi3JdVIfQWUIH/iYT3d/hj9humaXhx493iF37
DIeyno9cdT4e1Fc8W6Qr7Tr/lAOn5j9mBTilozxp0Y5lPk5SmbZhQnLWuVGBcetQ
Zq1VjqZ8pksAWhNwb3j6M/UyOuFmHRQZRpoV35xbLj4JTWdATrBAb0wqJkSmQa0c
5BI1NS0hMaq0DcH5CODK2uP5u4ka5fMllT/UrWtq+FskWLIarhM8vrMvrqNzQewp
+DVV8UftScFV20RUtv/barWrVGUtXzOf6+XMs3FuZi21XUG4I+QCpNCdHxHzYkcB
A2ZDQHUKR/7c9DVd+Q6bliNZ6Bgjy52gsnXQMJc618j2/Hf+hvkF4xbezdeZfps=
=Rydm
-----END PGP SIGNATURE-----

--7IgncvKP0CVPV/ZZ--
