Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:02:47 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 01/28] soc/tegra: pmc: Export
 tegra_powergate_power_on()
Message-ID: <20190509140247.GA8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-2-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-2-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:57:58PM +0530, Manikanta Maddireddy wrote:
> tegra_powergate_sequence_power_up() powers up partition and also enables
> clock & reset. However, if a controller like PCIe have multiple clocks
> & resets and they need to be enabled in a sequence, driver must use
> standalone function tegra_powergate_power_on() to power up partition.
>=20
> Export tegra_powergate_power_on() to allow Tegra controller drivers to
> unpower gate partition independent to clock & reset.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: No change
>=20
>  drivers/soc/tegra/pmc.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 0c5f79528e5f..cb3de81348bd 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -701,6 +701,7 @@ int tegra_powergate_power_on(unsigned int id)
> =20
>  	return tegra_powergate_set(pmc, id, true);
>  }
> +EXPORT_SYMBOL(tegra_powergate_power_on);
> =20
>  /**
>   * tegra_powergate_power_off() - power off partition

If the sequence for the PCI power partition is becoming non-standard,
this is going to hamper our efforts to move to generic PM domains. But
it is what it is, so let's do this for now. We might need to revise this
later on if/when we come up with a better solution.

Bjorn, do you want to pick this up as part of this series, given the
build dependency? If so:

Acked-by: Thierry Reding <treding@nvidia.com>

Alternatively I could provide a stable branch for you to pull in. But I
don't think it'd be necessary, the PMC driver is a fairly slow-moving
target these days.

Thierry

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUMwMACgkQ3SOs138+
s6HprA/9F4gXqL3jv8cXkVNJm079C4WLCBNlKQk0065YfmbsRGwyqJgSkMQcQybk
N9At6Dmh4fAUPh5xwJ8yQ5eOphdPtbpci1cPMJk6Ze/tuQTtObDjHeggFz3Zx6M7
+R/AmRcbiyBomUrcey7bO398IFSF6bhpaKXxmJxzwlNY2JAzRS77jo1JcCnYolh2
2WZypuJmC6Vp9Z9yC8u+nGdZRu2ca9VYDezV9yVrTN0mG+YYN/eFyjUcuRypLScF
lm2hoAXu5M3RywjACzJltQgJd1+y2looqmrTlBxXm5xlNq7DdHK8d7KVLrtb2Qn5
ml3BtQ540YQmzaWyeukbP3XGxJ2/gIkKhjQ249u0AV8Op+LcDuaduHzhTUjeIFTL
1o/Vhc5FO+uqlyF7ete2R3jejJF99dPIbB2qq3E1H7Wt2EBiNpMVeCYD4cwRH9R+
xsgEb9SjshqMoAbr3sx+9AumfGchj33Mf0WIDCmZYXzk2L4pERBMi4PtMABd2NY5
XHbKEBy7iYnQCmDnKqcf+3+8Y+EZx6voh9ntDQiZBcCEhpaPKVOFiUuP9naEar8K
ue23LYfeIOFjZyeI6Cbj9FmS3JDtSNcciymoVOGdby3n6rDh+2FrHkhpbkbA9C+3
fA0BNLhVJl7lQJ8SwdQqEbIbiVzw5lNlvPFW8CthRf12SmR7keI=
=Bhb3
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
