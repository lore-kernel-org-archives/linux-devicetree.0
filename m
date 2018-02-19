Return-Path: <SRS0=5STX=FN=gmail.com=thierry.reding@kernel.org>
Date: Mon, 19 Feb 2018 15:27:33 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 1/7] dt-bindings: ahci-tegra: add binding documentation
Message-ID: <20180219142733.GC11455@ulmo>
References: <1518456406-21564-1-git-send-email-pchandru@nvidia.com>
 <1518456406-21564-2-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="96YOpH+ONegL0A3E"
Content-Disposition: inline
In-Reply-To: <1518456406-21564-2-git-send-email-pchandru@nvidia.com>
To: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Cc: tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, preetham260@gmail.com, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2018 at 10:56:40PM +0530, Preetham Chandru Ramchandra wrote:
> From: Preetham Ramchandra <pchandru@nvidia.com>
>=20
> This adds bindings documentation for the
> AHCI controller on Tegra210

Please avoid lines that are too short. They shouldn't exceed 72
characters, but you're supposed to make fully use of those. Also the
above is a sentence, so should end with a '.'.

> diff --git a/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.t=
xt b/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
> index 66c83c3e8915..0f4520a00716 100644
> --- a/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
> +++ b/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
> @@ -1,20 +1,19 @@
> -Tegra124 SoC SATA AHCI controller
> +Tegra SoC SATA AHCI controller
> =20
>  Required properties :
> -- compatible : For Tegra124, must contain "nvidia,tegra124-ahci".  Other=
wise,
> -  must contain '"nvidia,<chip>-ahci", "nvidia,tegra124-ahci"', where <ch=
ip>
> -  is tegra132.
> -- reg : Should contain 2 entries:
> +- compatible : Must be one of:
> +  - Tegra124 : "nvidia,tegra124-ahci"
> +  - Tegra210 : "nvidia,tegra210-ahci"
> +- reg : Should contain 3 entries:
>    - AHCI register set (SATA BAR5)
>    - SATA register set
> +  - AUX register set
>  - interrupts : Defines the interrupt used by SATA
>  - clocks : Must contain an entry for each entry in clock-names.
>    See ../clocks/clock-bindings.txt for details.
>  - clock-names : Must include the following entries:
>    - sata
>    - sata-oob
> -  - cml1
> -  - pll_e
>  - resets : Must contain an entry for each entry in reset-names.
>    See ../reset/reset.txt for details.
>  - reset-names : Must include the following entries:
> @@ -24,9 +23,19 @@ Required properties :
>  - phys : Must contain an entry for each entry in phy-names.
>    See ../phy/phy-bindings.txt for details.
>  - phy-names : Must include the following entries:
> -  - sata-phy : XUSB PADCTL SATA PHY
> -- hvdd-supply : Defines the SATA HVDD regulator
> -- vddio-supply : Defines the SATA VDDIO regulator
> -- avdd-supply : Defines the SATA AVDD regulator
> -- target-5v-supply : Defines the SATA 5V power regulator
> -- target-12v-supply : Defines the SATA 12V power regulator
> +  - For T124:
> +    - sata-phy : XUSB PADCTL SATA PHY
> +  - For T210:
> +    - sata-0
> +- For T124:

Can we please use TegraXYZ here? I find it useful to be consistent here
because those will show up if I grep for "tegra", whereas TXYZ won't.

Thierry

--96YOpH+ONegL0A3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqK3tUACgkQ3SOs138+
s6E2QQ/+K0ggtXK0LGrL27RTS4DO9e/dowrX33gYK7H9bm3PFx3qBj1BNYAspVEI
fJIRYOMhGIz5pDkaVGOj3lkuftVzW3LEYCAYyaGD2HoLqY3Ixum7dIqzvIkBkF1p
eSHGIzXsxCgSMT8H3ncI8AgOd0y7rgH8lQFx4dbcUhDIiiSPEZJBEscm2aPDcO/S
fGHY4836RcQmq7uRiGCjq/oHDqo+h5u/a4gLh34Ss48TrzjnRLnjQboL1fnk93bW
fUPl1z+L0ku6ypFLtzlwiKFZ6+kePqOYuLqb4hAEVe6n7Vxtp3eYJgbFBbyycQJ1
zlIY8tsQe2pnOMmdlkkVsmMGylMOmns+nKLxTNBIC3vZdmPRC8emfj4MauzpANCF
yQNHZYLwxhSmMJHullZ2ZV71FlZVI3z8sanE86V84KgI6M1lSyuoDJ8yBoFe3wEP
1Sc83WU1n9GAhA4XpiI3/rY26hUBQ0IF33VCoCo9EShydAeFl3Y6jfXjiPSC7iWW
TBkJDvve/VAbM2immGTMSeMpoOzRYAbihWeQt3YWMmFgMO2dnGPTCB+j+tMo7TfK
IeN+gMAuGGXQRkRiJvF4QVXBUmgy3ovI2vjJIpuAtXp5aMgMK2miXJKFWWAZfNHj
WAj7n0O64muN5F2dl5p9720snl+d8tYTtG8417v5bKbXj6SPLS4=
=K/MR
-----END PGP SIGNATURE-----

--96YOpH+ONegL0A3E--
