Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:17:41 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 07/28] PCI: tegra: Advertise PCIe Advanced Error
 Reporting (AER) capability
Message-ID: <20190509141741.GG8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-8-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sLx0z+5FKKtIVDwd"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-8-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--sLx0z+5FKKtIVDwd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:04PM +0530, Manikanta Maddireddy wrote:
> Default root port setting hides AER capability. This patch enables the
> advertisement of AER capability by root port.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: No change
>=20
>  drivers/pci/controller/pci-tegra.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--sLx0z+5FKKtIVDwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUNoQACgkQ3SOs138+
s6FbsQ//YavA3usgKFIoR6+YrHrTJrgo7tDpFnGll8ELzOqKV5vKdaCSdPeCKkpM
qqErThvDrgMzb9M6S30IymhkoO2LNGNMqGtOdVqHNX/murNGOkcs7CABE+va75LA
EpyQnOHbpNKfxV4SXlAyf+N7eR4v4fHjE6qAGurni4/+JDRiTyAOpnr1MKaCaXN2
NJpfX2zwBncj4BaKZ6GSUu2nWs/1jqNMl8XroKXNc129qF6PV3OUegE3vvrUiLIf
E6om1GJLAD+ep/hV3qMwJGzgqpkdI2HyKCWlsRYkyz1UyqrdSKQ5enu033xh1FKS
QtdeNX+l7VHnrUDBZ6DEvGatqspf/Q3Aj7+zfFXGL+NLG6t+1TnlGOpTFlVkU8fi
7We6eG8wMjcI1xV1+YMTf467P2ZClTJhrwrrGRXQa5KTqffqU4XCtT40AeaDfUCK
vEd3d1RMdmlP6WZNOe7gqYsGyZHSX5ofN0VzGlQ5/UkpnDi2qg0e4lbHu+uPsz2s
PAWlkyY0Vv391xwFXQv1PP1E9sl0rLWwjQsWbwV88Dm5aWEgpI5eoyJu3tINQtUB
jRu5SrGyObAuWMEtXE6gIBT3ULGuUmCVksgHaGtpYTl2oubr7+bUzIA2tyEeXhh2
pQblXHZtOCzfVDn5ZbWPCaA9OygGj9/hI7Eb8CA7SyiX1nQeoW4=
=3/Hz
-----END PGP SIGNATURE-----

--sLx0z+5FKKtIVDwd--
