Return-Path: <SRS0=7LTX=UT=gmail.com=thierry.reding@kernel.org>
Date: Thu, 20 Jun 2019 12:14:48 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 23/27] arm64: tegra: Add PEX DPD states as pinctrl
 properties
Message-ID: <20190620101448.GA28703@ulmo>
References: <20190618180206.4908-1-mmaddireddy@nvidia.com>
 <20190618180206.4908-24-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
In-Reply-To: <20190618180206.4908-24-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 11:32:02PM +0530, Manikanta Maddireddy wrote:
> Add PEX deep power down states as pinctrl properties to set in PCIe drive=
r.
> In Tegra210, BIAS pads are not in power down mode when clamps are applied.
> To set the pads in DPD, pass the PEX DPD states as pinctrl properties to
> PCIe driver.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V6: No change
>=20
> V5: No change
>=20
> V4: No change
>=20
> V3: No change
>=20
> V2: Using standard pinctrl names, default and idle
>=20
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Applied to for-5.3/arm64/dt, thanks.

Thierry

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LXJMACgkQ3SOs138+
s6F/mA//fJQuFOTfEgBtJKU2ttaAA4tljAjtpXw+rmm4/rRxiamPODEAxhM5h/mt
YG9YYN0Q0BJQcFOQVa34OOIVhkkf1UZDWrOhfYDuEqXyhjlS1rysGSmsGH1W9+fM
CKbNflkRjMWt50+XsrN+izdmtJop6OVJB3T9644ERt2N8s9sc46P3gPlPoXL9rXL
w5yB2IvEG5wgRBCXYZzjiK2BBbaKb8EgXy/nhtd8UJZQbNx2YVWf/v8DGtmOUfbJ
aTy0LvMJwFDkpf88+6Cgg4Ouh+n2PBZHifMCWdJy3WOTLMVx40NCbq5BAIu1Ziot
nBSEs0Lvc1fOI5iEqdRV/bFBnbC8h88sWljznaqVBT/fKL/g8Te8a+hBmym4SlkY
ULN/CZmcpbzDEcPLXwje3sK62OEEL3hAXBaxQ/DrugTT3B9svrg42unVCn3ByCyC
TGcTqE9uA75PFT7nyCEXLXXJ2vzV5GZKaPYbv//J56UWiuSO2Ly7d4l4n76ppvz7
gM3Nl25OnKvyWT38/cD9HxNjRxYjqYLVXDFw13BBhKNgpxFXpivdKpAiPIMq63Kg
eCjZMcVWnBgo/wQ5sgjnk7ri7g3t4vCcjQE+9ClaU4OMi7eaWH+18iR8csNoa4ZD
Anh9dzE/ZKXPjU1uw5vUNkO91oipN7x82nFbGojSZz/aer0XlnY=
=W9FW
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
