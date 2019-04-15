Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 17:42:01 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 21/30] PCI: tegra: Add "pci" type check before parsing
 child device tree node
Message-ID: <20190415154201.GN29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-22-mmaddireddy@nvidia.com>
 <20190415133715.GV29254@ulmo>
 <059fd53c-8a53-be56-a5bc-393f37aae168@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2CW6+cughRlDaKZr"
Content-Disposition: inline
In-Reply-To: <059fd53c-8a53-be56-a5bc-393f37aae168@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--2CW6+cughRlDaKZr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2019 at 09:00:58PM +0530, Manikanta Maddireddy wrote:
>=20
>=20
> On 15-Apr-19 7:07 PM, Thierry Reding wrote:
> > On Thu, Apr 11, 2019 at 10:33:46PM +0530, Manikanta Maddireddy wrote:
> >> Each root port is added as a child device tree node of PCIe controller
> >> node. These child nodes are parsed using open firmware PCI bus accessor
> >> functions. If the child node is not of "pci" type then device tree
> >> parsing fails. Add "pci" type check before parsing child device tree n=
ode.
> >>
> >> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> >> ---
> >>  drivers/pci/controller/pci-tegra.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> > Erm... what is the use-case that you're trying to support? Why would we
> > ever have children nodes that are not of type "pci"?
> >
> > Thierry
> In downstream kernel we have "prod-settings" node as one of the child nod=
es.
> Even though we are not supporting this in upstream kernel, I believe this
> check is good to have.

We don't have prod-settings upstream and for good reason. There's no
need to add this check in upstream. We can carry the change downstream
until we've moved away from prod-settings downstream as well.

Thierry

--2CW6+cughRlDaKZr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0pkkACgkQ3SOs138+
s6Hk6BAAuuLmSi3da795/1SMFfCMinG4+Xv2R3ifsnGGXF9deM9FABvAmRlwxQ4o
uXQ3ZgmW5TVPqydtUc4/bDmTl79P2Q2tthMzCmGw8PtWf3mPCeaeHwYGwGgq6b/7
ujii/QFJB3KnVFiB91lfog5oaKSfTH5igeSyzhofSWAyfoj+XXAsXZ2KlFpslKCu
g5daw4687XvnolPgpt/YtPemta+rEJaBl0ZonQpRxQnp3mJcbu1DumLbJB92vi0k
UrhzD2G5s/lZ78w1NuZaEwR6iz9Y8lilZ95lK5BZZJL9DsJVta0wI75lWfqi5JbD
yc8aI4FfrJ6V/zxi3MVhITDytLWyelmJcbFxZOs3qbGmdu0LczBmDtgik8sVGDkt
r0oyetd6kmp/JeWkf30A9zWm/pfR09JFOhG935lanjt5OSjNgWVX/7mDgCHLIG6q
GjZA90KrDUmMr7R6ewCd62wFOh7ftHlLq+B3CWGCE2h9CohPn21bD8kue8OR1zXf
E+v3ml38bdn3BkIZLWGysJLapOSNjGMXxjXXzGylTDyAN7E/Af+IE/pXvUt341+H
hv5733jebhTb0EPszwwWZC3sG6TdDkmxYtDVvCBEwNNK+qD53s9oFsUT4hQ04ehN
wBUmzXgJWnVL+RqFaSTmVPQIBQKac+vm89f4G/2XeO1vKFSNNQY=
=Hexk
-----END PGP SIGNATURE-----

--2CW6+cughRlDaKZr--
