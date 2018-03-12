Return-Path: <SRS0=wf0n=GC=gmail.com=thierry.reding@kernel.org>
Date: Mon, 12 Mar 2018 13:14:34 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V8 4/9] ata: ahci_tegra: Update initialization sequence
Message-ID: <20180312121434.GE15972@ulmo>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
 <1520854838-21779-5-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
Content-Disposition: inline
In-Reply-To: <1520854838-21779-5-git-send-email-pchandru@nvidia.com>
To: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Cc: tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 12, 2018 at 05:10:33PM +0530, Preetham Chandru Ramchandra wrote:
> From: Preetham Ramchandra <pchandru@nvidia.com>
>=20
> Update the controller initialization sequence and move Tegra124
> specifics to tegra124_ahci_init.
>=20
> Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
> ---
> v8:
> * Renamed soc_data variable to soc and made it const.
> * Removed unneeded whitespace change.
> * Made use the full width of a line for comments.
> * Renamed tegra124_ahci_soc_data to tegra124_ahci_soc.
> * Made ops a pointer to a function table.
> v7:
> * moved tegra124_ahci_soc_data definition to be
>   just above the of_device_id table.
> ---
>  drivers/ata/ahci_tegra.c | 288 ++++++++++++++++++++++++++++++++++++-----=
------
>  1 file changed, 224 insertions(+), 64 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqmbyoACgkQ3SOs138+
s6GtcBAAmfTJWuLxVBRLshNkIUUIz6lN7of+Vpro8U9dACUdRRHEKpYJVPoU97dJ
yK//Q1k5nAyCkdCOQCy/Q0221+DltsWc3UwDbW+Utjvrciia2KxZ9U/ozswj2RV8
gY7Xa+fOqMf5aHPFzUd1bPNWl3XXrvcgzDq2TxsaV9JJ4svGi4r21Rm310dXngBm
+AiB8vp/V4Wa7fHxx4RfZv9t7kITL7SGmvnc/IEYW1BRGIkyDRFtq2Dupn0wslfm
3QZK9Z4Etb0EZxy+dfssvPtVUy78KZvVUfc1YXdkOr3uvYegC7Q06MYUYy93vYXi
rb/APHPTjgvPp8s2vW7uz18aurlBNed4LNOFLfMJX+zGPNqk9GKDzxPN9V44R+JQ
Huv4boKTdd62hm65UhP+dqxqeDlqgZiYjlHebGIk+LXldB77cVmaBdd3J3Maq58x
XzEk86b9vqd7alSHmkcijQuc5zQWfMbI0UskcDes3qWcDEhA0Zehgr3SZvo4daOu
v27rvWjyp7x5r2kgdFuXxLN/muqUp7XHEBNTdepRqh1D3RwLX6C+Faove/xyaEdK
OWQwhpoXRYvMJw1t3VI/Y/b08U1aVCYAEnQIYUKMpo2LarxaH88FOdCR2dM2URcj
d7LYJroZBc+XExH5iMyVD0822OQrYV8KsGfdu7GB9THKU1nmxq8=
=L4ZN
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--
