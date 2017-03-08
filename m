From: Alban <albeu@free.fr>
Subject: Re: [PATCH v2 1/2] doc: bindings: Add bindings documentation for
 mtd nvmem
Date: Wed, 8 Mar 2017 16:20:01 +0100
Message-ID: <20170308162001.2b7e2304@avionic-0020>
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
 <1488875164-30440-2-git-send-email-albeu@free.fr>
 <20170307220107.03436537@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8393250552279214546=="
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20170307220107.03436537@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Moritz Fischer <moritz.fischer@ettus.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Alban <albeu@free.fr>, linux-mtd@lists.infradead.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
List-Id: devicetree@vger.kernel.org

--===============8393250552279214546==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_BhksKoh7HhPJ0Z48j9QDKg"; protocol="application/pgp-signature"

--Sig_/_BhksKoh7HhPJ0Z48j9QDKg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Mar 2017 22:01:07 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Tue,  7 Mar 2017 09:26:03 +0100
> Alban <albeu@free.fr> wrote:
>=20
> > Config data for drivers, like MAC addresses, is often stored in MTD.
> > Add a binding that define how such data storage can be represented in
> > device tree.
> >=20
> > Signed-off-by: Alban <albeu@free.fr>
> > ---
> > Changelog:
> > v2: * Added a "Required properties" section with the nvmem-provider
> >       property
> > ---
> >  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 ++++++++++++++=
++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.t=
xt
> >=20
> > diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Do=
cumentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> > new file mode 100644
> > index 0000000..8ed25e6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> > @@ -0,0 +1,33 @@
> > +=3D NVMEM in MTD =3D
> > +
> > +Config data for drivers, like MAC addresses, is often stored in MTD.
> > +This binding define how such data storage can be represented in device=
 tree.
> > +
> > +An MTD can be defined as an NVMEM provider by adding the `nvmem-provid=
er`
> > +property to their node. =20
>=20
> If everyone agrees that this is actually needed, then it should
> definitely go in the nvmem binding doc, and we should patch all nvmem
> providers to define this property (even if we keep supporting nodes
> that are not defining it). I'm not fully convinced yet, but I might be
> wrong.

I really like to hear what the DT people think about this.

> I also think we should take the "nvmem under flash node without partition=
s"
> into account now, or at least have a clear plan on how we want to represe=
nt
> it.
>=20
> Something like that?

Yes, but with the following extras:

> 	flash {
                nvmem-provider;
> 		partitions {
> 			part@X {
> 				nvmem {
  					compatible =3D "nvmem-cells";
> 					#address-cells =3D <1>;
> 					#size-cells =3D <1>;
>=20
> 					cell@Y {
> 					};
> 				};
> 			};
> 		};
>=20
> 		nvmem {
  			compatible =3D "nvmem-cells";
> 			#address-cells =3D <1>;
> 			#size-cells =3D <1>;
>=20
> 			cell@X {
> 			};
> 		};
> 	};
>
> Note that patching nvmem core to support the subnode case should be
> pretty easy (see below).

This shouldn't be needed as nothing would change for the NVMEM devices,
what could be added is a check for the "nvmem-provider" property.
To support the proposed binding we would only need a minor change to
of_nvmem_cell_get():

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 408b521ee520..6231ea27c9f4 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -444,6 +444,10 @@ struct nvmem_device *nvmem_register(const struct nvmem=
_config *config)
        if (!config->dev)
                return ERR_PTR(-EINVAL);

+       if (config->dev->of_node &&
+           !of_property_read_bool(config->dev->of_node, "nvmem-provider"))
+               return ERR_PTR(-ENODEV);
+
        nvmem =3D kzalloc(sizeof(*nvmem), GFP_KERNEL);
        if (!nvmem)
                return ERR_PTR(-ENOMEM);
@@ -777,6 +781,15 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_nod=
e *np,
        if (!nvmem_np)
                return ERR_PTR(-EINVAL);

+       /* handle the new cell binding */
+       if (of_device_is_compatible(nvmem_np, "nvmem-cells")) {
+               nvmem_np =3D of_get_next_parent(cell_np);
+               if (!nvmem_np)
+                       return ERR_PTR(-EINVAL);
+               if (!of_property_read_bool(nvmem_np, "nvmem-provider"))
+                       return ERR_PTR(-ENODEV);
+       }
+
        nvmem =3D __nvmem_device_get(nvmem_np, NULL, NULL);
        if (IS_ERR(nvmem))
                return ERR_CAST(nvmem);


> --->8--- =20
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 408b521ee520..507c6190505b 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -465,7 +465,7 @@ struct nvmem_device *nvmem_register(const struct nvme=
m_config *config)
>         nvmem->priv =3D config->priv;
>         nvmem->reg_read =3D config->reg_read;
>         nvmem->reg_write =3D config->reg_write;
> -       np =3D config->dev->of_node;
> +       np =3D config->of_node ? : config->dev->of_node;
>         nvmem->dev.of_node =3D np;
>         dev_set_name(&nvmem->dev, "%s%d",
>                      config->name ? : "nvmem", config->id);
> diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provide=
r.h
> index cd93416d762e..ec2f5116d62d 100644
> --- a/include/linux/nvmem-provider.h
> +++ b/include/linux/nvmem-provider.h
> @@ -21,6 +21,7 @@ typedef int (*nvmem_reg_write_t)(void *priv, unsigned i=
nt offset,
> =20
>  struct nvmem_config {
>         struct device           *dev;
> +       struct device_node      *of_node;
>         const char              *name;
>         int                     id;
>         struct module           *owner;


--Sig_/_BhksKoh7HhPJ0Z48j9QDKg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYwCEhAAoJEHSUmkuduC286TcQAIqEPKiCNqpWUx4pAb0j52aN
E5ovFVywWx74+H+5uV1cdUOBvVtv9bb/vXIbFQHhM4HAZgOLeYP+LcOlx8HcvvM2
wniZhtfQNpln5ZAjycO2dZ53w8bCE0uzFGQ+Dz7KlbqqOfYXRFCVJ2HflvzRUFrU
TCLWzi27tbmvyQVXMYMTIVdieObVKatJg2/b21sHUFAAOO30W5SL/Ux0rgTFad/e
Uglv5NiwTB39ptrjeQmxLp8WfMkXls+uQ2dq9qUTuzTblQTnpfGckKzkG61nRJ6z
X2+aM4NH3OGS96+q9Ap6wB3cLSanT1Brx6Nbota6cMPem47Hu0Eu6ssm/XzOuwxb
IY9GqLYisKpKIrZO43n9dXIXgIHZEe5T1BOE2TF4jEs+iHX3NH+1gLH8EBlVZf3C
YsAIcUPP9STDXzMf5kaRyGayimoTeGXVZfjSBMn6PSajTb9QF3Vk/VR3innZc+2C
r6iuaHfJmY//LNk3JizwI6HV71QxrqsH6LvfkxugnR8aTPNceZRxvD5LFcqhsi8R
m0c1kiEedxlq+H85Q+lUh01mwi68/x1UBUeqsI8BAkRBh0Jfzsa2SMA3kUmvSBDM
f3Ayij2jCXbaT1DZaWLfGNbWKbmsrRE/j1jply34DSVligAEewCKppUuHVMZP+rh
sYgku56ezNZPqYXXRfhE
=UaGV
-----END PGP SIGNATURE-----

--Sig_/_BhksKoh7HhPJ0Z48j9QDKg--


--===============8393250552279214546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8393250552279214546==--
