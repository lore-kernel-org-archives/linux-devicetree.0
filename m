Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 13:32:13 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 08/30] PCI: tegra: Disable AFI dynamic clock gating
Message-ID: <20190415113213.GI29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-9-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4LwthZj+AV2mq5CX"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-9-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--4LwthZj+AV2mq5CX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:33PM +0530, Manikanta Maddireddy wrote:
> Outstanding write counter in AFI is used to generate idle signal to
> dynamically gate the AFI clock. When there are 32 outstanding writes
> from AFI to memory, the outstanding write counter overflows and
> indicates that there are "0" outstanding write transactions.
>=20
> When memory controller is under heavy load, write completions to AFI
> gets delayed and AFI write counter overflows. This causes AFI clock gating
> even when there are outstanding transactions towards memory controller
> resutling in system hang.

s/resutling/resulting/

With that fixed:

Acked-by: Thierry Reding <treding@nvidia.com>

--4LwthZj+AV2mq5CX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0a7wACgkQ3SOs138+
s6H7Pw//YXsORx2wrc4XpQ66886+swzirPX74X+sHYCYJYt4Z2BfkvoZkYaPEfqv
rIjIv83dIiBOCuXh2ORfX7xH3u0sLiIHLvLmmyCMAWy8nJQNUrJ4VIPl9PApkpbr
mRjLiGlsFEVZn+zFEXOhSURWQitb/ucYU2m8MsFZZzZxQx1GJ+uzlXv3GBk27jOn
uJr18ef07rI4snfup9iCPWrzMU9QQKIHz/92zN05zNCo555XOiSLrghCsFNO8eqo
3oBoChvVvizKMfjmrVJjpFwuKGWy6NpMU5aIAmr674hHZCmodGGPsJTQqIPqKt3r
Vfi5xIFcPhmfl9VUYjD+M2rzPK+gI3xV+LnSgjbWzwj2SS7ANPhkzx5w4xu+oF/l
k2MpUuDkuIlqXmgo8JcGLZ6RLTi4yVnlJb+T0dD3ZjAvnOG4o6DICLiyOI8PnZcZ
E5WRkEhJs2hf5f919M3sCAomnIhneI+tqI8KpB0Rn5AU05FX3AwEhXFKbYvhZl+8
ectB/PrmCuChrNyTzC1+orJu+TOwoRPTbi/nzXmHbuQ6FFZlzo00A/0BPJvDhDqa
CgzMqSGCY6C8WM3kgvnYA/EyaTBnWeafscGDxG353cT/2rYcHrbWO2YtMum1tAuP
gWav1QW6XAU0b3BRZAZBRoz9UWXko1gSIrC6zArDsw1RVrMc6ME=
=mA7t
-----END PGP SIGNATURE-----

--4LwthZj+AV2mq5CX--
