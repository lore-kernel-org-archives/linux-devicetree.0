Return-Path: <SRS0=wf0n=GC=gmail.com=thierry.reding@kernel.org>
Date: Mon, 12 Mar 2018 13:15:26 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V8 7/9] ata: ahci_tegra: disable DIPM
Message-ID: <20180312121526.GH15972@ulmo>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
 <1520854838-21779-8-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qVHblb/y9DPlgkHs"
Content-Disposition: inline
In-Reply-To: <1520854838-21779-8-git-send-email-pchandru@nvidia.com>
To: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Cc: tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--qVHblb/y9DPlgkHs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 12, 2018 at 05:10:36PM +0530, Preetham Chandru Ramchandra wrote:
> From: Preetham Ramchandra <pchandru@nvidia.com>
>=20
> Tegra does not support DIPM and it should be disabled.
>=20
> Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
> ---
> v8:
> * renamed tegra to Tegra in commit message
> ---
>  drivers/ata/ahci_tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--qVHblb/y9DPlgkHs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqmb14ACgkQ3SOs138+
s6E6CRAAtbqF4w/CwPWA6ed24XwAKgo1q2YBxNCM1FoLjgxUKovAly9BtCPxw0R7
myySmoGyvhC+na2fKAc5FE0Kg/akwHITXvuy+tN3Jf8ooqVD5xLFKe5pU+bsRYrU
/yXxLHRZcEK3TLNz18okZArm62smY9yKespEaZ4vfsvQc0B4v04pixUcabq3UGnx
vvUxNg+JXGcXSjNAnxRlusQ3QzPNq0WsjwQAWtMd+naaFiwS83g6ppyWwKTNwx60
l+eoGzoyNUMu8ditse9zp6XTPGExd+xYgO2jpTSmPAZ9xEoIWZ+Gl5XJHkeR1YaV
+G0H/FmDhEI+lFAHvloqMxu67NWozUj0xkqUCci2AH80FxV2jIjzfi8S5LajOhZd
xkmLVIKqE2myoAlQAqthODWZC809vPNwY8D6dV5Gp2GITwCIbsvPupg+ddOnfx8w
h1762jodDVTfz3yGPV3xb+tzq4OxVHJOosuTCyRRY0UnxProETjrHA98/eVGcBo7
g0qrG7g4TPY1ew425VdupS6ax/YCShjRKz+1KlZO/8oHG0CYqpZ7d3iUUSJQv08A
Tbc09RjXFIr1I38I2TPSOt8aZ7S+W6ou+7uc3YnDzNZ+MkSGhF3UBEDSeHVd5YzG
WV5Ip/aZXfKP95la4llp18ImfuNsi9vfBZ69YLO7CAQYnn1XSyg=
=gOy6
-----END PGP SIGNATURE-----

--qVHblb/y9DPlgkHs--
