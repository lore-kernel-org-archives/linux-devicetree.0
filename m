Return-Path: <SRS0=O2+a=GC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:39878 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751313AbeCLMPn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 12 Mar 2018 08:15:43 -0400
Date: Mon, 12 Mar 2018 13:15:39 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V8 8/9] ata: ahci_tegra: Add AHCI support for Tegra210
Message-ID: <20180312121539.GI15972@ulmo>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
 <1520854838-21779-9-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0NB0lE7sNnW8+0qW"
Content-Disposition: inline
In-Reply-To: <1520854838-21779-9-git-send-email-pchandru@nvidia.com>
Sender: devicetree-owner@vger.kernel.org
To: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Cc: tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--0NB0lE7sNnW8+0qW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 12, 2018 at 05:10:37PM +0530, Preetham Chandru Ramchandra wrote:
> From: Preetham Ramchandra <pchandru@nvidia.com>
>=20
> Add support for the AHCI-compliant Serial ATA host controller on the
> Tegra210 system-on-chip.
>=20
> Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
> ---
> v8:
> * renamed the structure tegra210_ahci_soc_data to tegra210_ahci_soc
> v7:
> * Added commit message
> ---
>  drivers/ata/ahci_tegra.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--0NB0lE7sNnW8+0qW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqmb2sACgkQ3SOs138+
s6GUeA/+Ka1gWfOOjAv7gn0Y185fVBwcDwAe8D+N3djsUTMoalNLePqEZxiwBqYc
RHnqdUaty8r7TkY4do3ofagp1vO73YLaJe6hFqWmLC27T9GQtTOFkDz0xWLTXLbl
Xga8aR0hu5xzXxY0KKwcmv0m17V/vIHc12pJhPol3eVO5xSEXpHbUt9xneE2omgP
HtXrXhPCU2HZw99FocrvaM3UzbOWt8xvEHqYZpNxpUdhXNuXL1oTkZRmh8ig8zZt
lX2TXimcneH7YqzWv9liawu41M7wCrvXO2tPj/kKCI/sJu63XKuIVPpKb8M3rhkd
Ga5X18a+c6hr4hqyVerummVZc+1LcuFBfrzv4l24cBOivO0Nd1VLeHrGpilCr1uQ
eqjLLH08yCODMORlFXk67KEZ7OF/VbxZ8/3PALivM2mZtew6Ewnu0TxOniuk8yhQ
f96wkCx+aJ4VltACifcKU5OYh6/7PtF226C/+ovkIP+GtuirLAW35sTOdSvP8V+d
P0FeERlUuLic2NvlQEJB8wsBtqEjUkdaRIc4Mm6AdVQ7KZAEeAbYKWKeBOdMQz8z
EQaWK5PNWgTvLF11jRP/wpmRW0hjFZf5Q4q6coi8fDTN4tuJ/1x2soNOHDIr8Uii
lulvrYsPWFiGaFLdHi4IckJC5zxr4M74d5PDVQN4ibX7xc80fCc=
=WLdL
-----END PGP SIGNATURE-----

--0NB0lE7sNnW8+0qW--
