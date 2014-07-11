From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC PATCH v2 1/5] mfd: qpnp: add support for Qualcomm QPNP PMICs
Date: Fri, 11 Jul 2014 10:07:18 +0100
Message-ID: <20140711090718.GA30519@lee--X1>
References: <1404393243-7324-1-git-send-email-svarbanov@mm-sol.com>
 <1404393243-7324-2-git-send-email-svarbanov@mm-sol.com>
 <20140709143426.GC2635@lee--X1>
 <53BD5EC5.3080801@mm-sol.com>
 <20140710083654.GQ2635@lee--X1>
 <53BEB1DB.6010301@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53BEB1DB.6010301@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, Josh Cartwright <joshc@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu, 10 Jul 2014, Stanimir Varbanov wrote:
> >>>> The Qualcomm QPNP PMIC chips are components used with the
> >>>> Snapdragon 800 series SoC family.  This driver exists
> >>>> largely as a glue mfd component, it exists to be an owner
> >>>> of an SPMI regmap for children devices described in
> >>>> device tree.
> >>>>
> >>>> Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
> >>>> Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
> >>>> ---
> >>>>  drivers/mfd/Kconfig     |   15 ++++++
> >>>>  drivers/mfd/Makefile    |    1 +
> >>>>  drivers/mfd/qpnp-spmi.c |  129 ++++++++++++++++++++++++++++++++=
+++++++++++++++
> >>>>  3 files changed, 145 insertions(+), 0 deletions(-)
> >>>>  create mode 100644 drivers/mfd/qpnp-spmi.c
> >>>>
> >>>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> >>>> index ee8204c..258b733 100644
> >>>> --- a/drivers/mfd/Kconfig
> >>>> +++ b/drivers/mfd/Kconfig
> >>>> @@ -524,6 +524,21 @@ config MFD_PM8921_CORE
> >>>>  	  Say M here if you want to include support for PM8921 chip as=
 a module.
> >>>>  	  This will build a module called "pm8921-core".
> >>>> =20
> >>>> +config MFD_QPNP_SPMI
> >>>> +	tristate "Qualcomm QPNP SPMI PMIC"
> >>>> +	depends on ARCH_QCOM || COMPILE_TEST
> >>>> +	depends on OF
> >>>> +	select MFD_CORE
> >>>> +	select REGMAP_SPMI
> >>>> +	help
> >>>> +	  This enables support for the Qualcomm QPNP SPMI PMICs.
> >>>> +	  These PMICs are currently used with the Snapdragon 800 serie=
s of
> >>>> +	  SoCs.  Note, that this will only be useful paired with descr=
iptions
> >>>> +	  of the independent functions as children nodes in the device=
 tree.
> >>>
>=20
> <snip>
>=20
> >>>
> >>>> + * This program is distributed in the hope that it will be usef=
ul,
> >>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty =
of
> >>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See th=
e
> >>>> + * GNU General Public License for more details.
> >>>> + */
> >>>> +#include <linux/kernel.h>
> >>>> +#include <linux/module.h>
> >>>> +#include <linux/spmi.h>
> >>>> +#include <linux/regmap.h>
> >>>> +#include <linux/of_address.h>
> >>>> +#include <linux/slab.h>
> >>>> +#include <linux/mfd/core.h>
> >>>> +
> >>>> +#define QPNP_RESOURCE_SIZE	256
> >>>> +
> >>>> +static const struct regmap_config qpnp_regmap_config =3D {
> >>>> +	.reg_bits	=3D 16,
> >>>> +	.val_bits	=3D 8,
> >>>> +	.max_register	=3D 0xffff,
> >>>> +};
> >>>> +
> >>>> +static int qpnp_index_to_resource(struct device_node *np, int i=
ndex,
> >>>> +				  struct resource *res)
> >>>> +{
> >>>> +	const char *name =3D NULL;
> >>>> +	const __be32 *addrp;
> >>>> +	u64 addr;
> >>>> +
> >>>> +	addrp =3D of_get_address(np, index, NULL, NULL);
> >>>> +	if (!addrp)
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	addr =3D of_read_number(addrp, 1);
> >>>> +	if (addr =3D=3D OF_BAD_ADDR)
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	of_property_read_string_index(np, "reg-names", index, &name);
> >>>> +
> >>>> +	res->start =3D addr;
> >>>> +	res->end =3D addr + QPNP_RESOURCE_SIZE - 1;
> >>>> +	res->flags =3D IORESOURCE_REG;
> >>>> +	res->name =3D name ? name : np->name;
> >>>> +
> >>>> +	return 0;
> >>>> +}
> >>>> +
> >>>> +static int qpnp_add_device(struct spmi_device *root, struct dev=
ice_node *child)
> >>>> +{
> >>>> +	struct mfd_cell cell =3D {};
> >>>> +	struct resource *res, *r;
> >>>> +	int num_resources =3D 0;
> >>>> +	const char *compat;
> >>>> +	int ret, i;
> >>>> +
> >>>> +	compat =3D of_get_property(child, "compatible", NULL);
> >>>> +	if (!compat)
> >>>> +		return -ENODEV;
> >>>> +
> >>>> +	while (of_get_address(child, num_resources, NULL, NULL))
> >>>> +		num_resources++;
> >>>> +
> >>>> +	if (!num_resources)
> >>>> +		return -ENODEV;
> >>>> +
> >>>> +	res =3D kcalloc(num_resources, sizeof(*res), GFP_KERNEL);
> >>>> +	if (!res)
> >>>> +		return -ENOMEM;
> >>>> +
> >>>> +	r =3D res;
> >>>> +	for (i =3D 0; i < num_resources; i++, r++)
> >>>> +		qpnp_index_to_resource(child, i, r);
> >>>> +
> >>>> +	cell.name =3D kasprintf(GFP_KERNEL, "%x.%04x.%s", root->usid,
> >>>> +			      (u16)res[0].start, child->name);
> >>>> +	cell.of_compatible =3D compat;
> >>>> +	cell.num_resources =3D num_resources;
> >>>> +	cell.resources =3D res;
> >>>> +
> >>>> +	ret =3D mfd_add_devices(&root->dev, PLATFORM_DEVID_NONE, &cell=
, 1,
> >>>> +			      NULL, 0, NULL);
> >>>> +
> >>>> +	kfree(res);
> >>>> +	kfree(cell.name);
> >>>> +
> >>>> +	return ret;
> >>>> +}
> >>>> +
> >>>> +static int qpnp_probe(struct spmi_device *sdev)
> >>>> +{
> >>>> +	struct device_node *root =3D sdev->dev.of_node;
> >>>> +	struct device_node *child;
> >>>> +	struct regmap *regmap;
> >>>> +
> >>>> +	regmap =3D devm_regmap_init_spmi_ext(sdev, &qpnp_regmap_config=
);
> >>>> +	if (IS_ERR(regmap))
> >>>> +		return PTR_ERR(regmap);
> >>>> +
> >>>> +	for_each_available_child_of_node(root, child)
> >>>> +		qpnp_add_device(sdev, child);
> >>>
> >>> This entire driver looks like a re-write of of_platform_populate(=
).
> >>>
> >>> Why?
> >>
> >> of_platform_populate is not used because the PMIC function resourc=
es are
> >> non-translatable. You can see that the resources are of type
> >> IORESOURCE_REG (qpnp_index_to_resource()) not IORESOURCE_MEM or _I=
O.
> >>
> >> The whole point of this mfd driver is to parse devicetree to prepa=
re
> >> resources for every child and create platform device for it throug=
h
> >> mfd_add_devices(). Then the PMIC function driver got its resources=
 and
> >> use them as register addresses passed to regmap. These register ac=
cesses
> >> hits the SPMI controller which is the physical interface between P=
MIC's
> >> and SoC.
> >=20
> > I can't help but think that if this is required, it should be part =
of
> > the core OF code, rather than doing your own thing which looks
> > frighteningly like existing framework functionality.
>=20
> does it make sense to have a common of_mfd code for devicetree parsin=
g?
> Is that discussed already? I mean presently the mfd_cell resources an=
d
> number of resources are passed by the mfd_add_devices users. Is it
> possible to have common code which parses devicetree sub-nodes of the
> parent device_node and fill resources/create platform devices for the=
m.

I'm not sure it does.  Normally users _either_ represent devices in
MFD cells from within the driver _or_ populate using existing DT
interfaces i.e. of_platform_populate().  This is the first time I've
seen someone attempt to parse the entire MFD node structure from
within a driver.

After searching for some documentation to try and figure this out, I
noticed that you've also missed a patch from your set:

  mfd: qpnp-spmi: document DT bindings for Qualcomm QPNP PMICs

=2E.. which might help enlighten the DT guys.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
