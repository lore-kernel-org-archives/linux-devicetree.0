Return-Path: <SRS0=wf0n=GC=gmail.com=thierry.reding@kernel.org>
Date: Mon, 12 Mar 2018 13:15:16 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V8 6/9] ata: ahci_tegra: disable devslp for Tegra124
Message-ID: <20180312121516.GG15972@ulmo>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
 <1520854838-21779-7-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I3tAPq1Rm2pUxvsp"
Content-Disposition: inline
In-Reply-To: <1520854838-21779-7-git-send-email-pchandru@nvidia.com>
To: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Cc: tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--I3tAPq1Rm2pUxvsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 12, 2018 at 05:10:35PM +0530, Preetham Chandru Ramchandra wrote:
> From: Preetham Ramchandra <pchandru@nvidia.com>
>=20
> Tegra124 does not support devslp and it should be disabled.
>=20
> Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
> ---
> v8:
> * spelled out t124 as Tegra124
> * changed u32 quirks to boolean supports_devslp
> * moved the aux register comments above platform_get_resource()
> ---
>  drivers/ata/ahci_tegra.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--I3tAPq1Rm2pUxvsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqmb1QACgkQ3SOs138+
s6Graw/+KGrsgaognjrVyfr0dtcTbSWoIXxH/O1Z7p3nIayKgvoC6rBHc+b6lXwG
RxYV3YKtsIIDk8siznK44Y9FUpy6lPg75rL2ESCBU9hmOUXE5DqbuYLtaWH2bhnp
gx3oIRhYoTMB3VkIf5uyH7+sg5hNuzc1HST5G9EjQIr1+uMFiohDTyXa2C0i/mud
pCsyOx8tID+Ke46wXoksdF6q7VM254Bb6Q1ec6FZ07qyTWXK4ZCehv0XCg+HaUMD
BkXWizzrZzyITOZqiNnJpOc6ggT9Bs5rxxaXhfI21ppxlhF8lhAoem/2EldSywsY
G/uvGXCs4Gvo6Ap+fPAJJzvul5d1ui5uaAq06UrzxKlUY6tFx3hfZZtu2WHz+VMv
8nqsdYMlhSmnMA774QEFYocaLSHXC8e5KLbijcr/eyFFI8CTGbRt1w0nrpTZfjC4
7Lx9c9W+O3I3DJI+z+lCuz/eszxXAj+I5jh47/o5JyMXROuqPL24wNd4Z+qBFio9
N/5m4utjvSHj1RdNrnlVCk0aO+i6yVVMOuZicryT2rZ5MXamhQ4FEcNXTkeUh3YQ
GkaQVCfGOIoxgg0tgPIVmZcueAPXFvAei7AUsRSdpxqJTnHQ68BhGmeQbB+yStaM
Upi+TuOD+uHaVZgBOrPGmVY3EYZKDkgu3EgJ5h0XkSfJSbHtvkk=
=QXEt
-----END PGP SIGNATURE-----

--I3tAPq1Rm2pUxvsp--
