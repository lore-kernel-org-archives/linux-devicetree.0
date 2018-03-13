Return-Path: <SRS0=Aw08=GD=gmail.com=thierry.reding@kernel.org>
Date: Tue, 13 Mar 2018 23:42:59 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V8 0/9] Refactor and add AHCI support for Tegra210
Message-ID: <20180313224258.GA23414@mithrandir>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
 <20180313210633.GP2943022@devbig577.frc2.facebook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
In-Reply-To: <20180313210633.GP2943022@devbig577.frc2.facebook.com>
To: Tejun Heo <tj@kernel.org>
Cc: Preetham Chandru Ramchandra <pchandru@nvidia.com>, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 13, 2018 at 02:06:33PM -0700, Tejun Heo wrote:
> On Mon, Mar 12, 2018 at 05:10:29PM +0530, Preetham Chandru Ramchandra wro=
te:
> > From: Preetham Ramchandra <pchandru@nvidia.com>
> >=20
> > 1. ADD AHCI support for Tegra210
> > 2. Extend the Tegra AHCI controller device tree binding with Tegra210
> > 3. Update initialization sequence
> > 4. Initialize regulators based on chip
> > 5. Disable DevSlp
> > 6. Disable DIPM
>=20
> All look good to me.  How should the patches be routed?

My suggestion would be that I pick up the arm64 patches (2 and 3) into
the Tegra tree and you take the rest (dt-bindings and driver changes)
through libata? There are no dependencies between the two sets, other
than maybe checkpatch.pl complaining about using an undocumented
compatible string until both get merged into v4.17-rc1.

I think that's fine, but we can be extra pedantic and carry patch 1 on
a stable branch that is merged into both the libata and Tegra trees to
avoid that warning.

Thierry

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqoU+sACgkQ3SOs138+
s6HeiRAAidK/fw3i7pgGPX4KulvkYia2sydm41dsafHcnNCuv6LWKQl8eRUDYTsh
01sZR+1CaklbWS4gLUMff5NE89GjUqDRrBALPhoM2Uix4WyLC2m4oyYUWEnPwJXn
QNB3W6eOu69fxpB+Xrh1HbU6D677VZk9MkGXMg0IEWFbBySfD2iNB7EYjVDFgELF
YT9k/pBbtCdZRMbbyAM4NaPxowVgm8MPyCkmknKXH4UY4S/RoqZd+4kf29n07PCc
otOiTSRkMciPOLEaa+mU+kJys9uUOYY9/CnC8UVfyumDKSCZ2YuHyy9rrFsgZ31h
6CxRH+nvSIFS7OcY+mU6rWv6pmjvGTeaNPKjG0QnHSqo2amCNdsunrWfYyYRIeBI
GxJBPr+T3VBxa20RkWNmjNtz2jfA2sS6Sy2IGefeY2c0ORDOM0UTtq5U8h/Ea4kk
9gAgxY7vZQjCXiXA9SKM88nT4pr3xJp80JeHBILBDOrL/B5LJh626cVIM8c1t7f0
HjbsV6WC2I/IBhadAAWA0x0lLMLWetah/tBrF16TWcFFGjEpTx2C7iJl8ESKUosY
MiBETkdTOM8E3QPRH21/LbVx6gAjIg/Ave282/NOMnI6eV6izNRLkwlJqmK+JE/3
3DUC0xBAGHWlcdfOX1pxjpCKVeelCA+/1bTkyDruQym9e+QZa+A=
=OXei
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
