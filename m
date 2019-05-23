Return-Path: <SRS0=XkBP=TX=gmail.com=thierry.reding@kernel.org>
Date: Thu, 23 May 2019 11:39:32 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V3 1/8] phy: tegra: xusb: t210: add XUSB dual mode support
Message-ID: <20190523093932.GA30331@ulmo>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-2-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <1557988772-15406-2-git-send-email-nkristam@nvidia.com>
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 12:09:25PM +0530, Nagarjuna Kristam wrote:
> Configure the port capabilities based on usb_dr_mode settings.
>=20
> Based on work by JC Kuo <jckuo@nvidia.com>.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzmakIACgkQ3SOs138+
s6HqrBAAh1I9ZpDHggSxfIdrB2BJGE9ome+J+MrxPp7RJStGx/jG7N9ChEhBFkRw
36c7vnIokb/5cN/wIxqUQordGrK5eNzYtVk9NEn00Qc+jNqp/pIlJ9TAf7xhDjIP
ucVEQ4N31B0oEnT1siIbXsnWzbh4/apBUUUiEXY1DtgBntfizcUXrcsZwXy6+mIL
Y2FDmknz2kGrIHzHIgsTh4qU3p3P2Rr5XUFAKURnZJK1YTu5bK05gI4mwuqnSy1S
ZktoXTBV/FQHTyxy2UsK9M2UV8yLgfiIc9LoK5ZbouoIWHUnb5Lig5bkh4OwoEey
5nGAPGGby+yPg9qEnAGF5oDn8LU/4mc1ISz1wqJ8vv3C/uLagyeSUr5EZDG4TC2L
KZ0JjzWzLPHub9MuAgviacmSTuV0v1x14fgHXqURh5z+iW4MiGdmRbSy6PrQB7Fa
O/5xephgkozime0SFGHCgDt7Y3cU4h9q4NCQL5JopV6amTytp3usmezUqWpXHGf6
+L6uNd8A0yE5h5diJ9usDouCZyo1p+yGAlj1DKNMC1WmbQFdPx3U6hDYc/7klvTa
XV3/IKYGJTHhrtBHkLtCtBelKPajOHeZF4MUXBQ+C0dfd49LLXF986W61030ig9F
8MPmcaE044JuYXXiaicjLHcLHAfuiDysOshEe3/EsZ5TPm/Sqtc=
=CaMa
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
