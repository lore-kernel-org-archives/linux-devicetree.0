From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v2]   PCI: Store PCIe bus address in struct of_pci_range
Date: Wed, 22 Jul 2015 11:46:19 +0100
Message-ID: <20150722104619.GE14923@e106497-lin.cambridge.arm.com>
References: <1436870799-207766-1-git-send-email-gabriele.paoloni@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1436870799-207766-1-git-send-email-gabriele.paoloni@huawei.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Gabriele Paoloni <gabriele.paoloni@huawei.com>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, James Morse <James.Morse@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "yuanzhichang@hisilicon.com" <yuanzhichang@hisilicon.com>, "zhudacai@hisilicon.com" <zhudacai@hisilicon.com>, "zhangjukuo@huawei.com" <zhangjukuo@huawei.com>, "qiuzhenfa@hisilicon.com" <qiuzhenfa@hisilicon.com>, "liguozhu@hisilicon.com" <liguozhu@hisilicon.com>
List-Id: devicetree@vger.kernel.org

Hi Gabriele,

On Tue, Jul 14, 2015 at 11:46:39AM +0100, Gabriele Paoloni wrote:
> From: gabriele paoloni <gabriele.paoloni@huawei.com>
>=20
>     This patch is needed port PCIe designware to new DT parsing API
>     As discussed in
>     http://lists.infradead.org/pipermail/linux-arm-kernel/2015-Januar=
y/317743.html
>     in designware we have a problem as the PCI addresses in the PCIe =
controller
>     address space are required in order to perform correct HW operati=
on.
>=20
>     In order to solve this problem commit
>     f4c55c5a3 "PCI: designware: Program ATU with untranslated address=
"
>     added code to read the PCIe controller start address directly fro=
m the
>     DT ranges.
>=20
>     In the new DT parsing API of_pci_get_host_bridge_resources() hide=
s the
>     DT parser from the host controller drivers, so it is not possible
>     for drivers to parse values directly from the DT.
>=20
>     In http://www.spinics.net/lists/linux-pci/msg42540.html we alread=
y tried
>     to use the new DT parsing API but there is a bug (obviously) in s=
etting
>     the <*>_mod_base addresses
>     Applying this patch we can easily set "<*>_mod_base =3D win->__re=
s.start"
>=20
>     This patch adds a new field in "struct of_pci_range" to store the
>     pci bus start address; it fills the field in of_pci_range_parser_=
one();
>     in of_pci_get_host_bridge_resources() it retrieves the resource e=
ntry
>     after it is created and added to the resource list and uses
>     entry->__res.start to store the pci controller address
>=20
>     the patch is based on 4.2-rc1
>=20
>     Signed-off-by: Gabriele Paoloni <gabriele.paoloni@huawei.com>
> ---
>  drivers/of/address.c       | 2 ++
>  drivers/of/of_pci.c        | 4 ++++
>  include/linux/of_address.h | 1 +
>  3 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 8bfda6a..23a5793 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -253,6 +253,7 @@ struct of_pci_range *of_pci_range_parser_one(stru=
ct of_pci_range_parser *parser,
>  						struct of_pci_range *range)
>  {
>  	const int na =3D 3, ns =3D 2;
> +	const int p_ns =3D of_n_size_cells(parser->node);
> =20
>  	if (!range)
>  		return NULL;
> @@ -265,6 +266,7 @@ struct of_pci_range *of_pci_range_parser_one(stru=
ct of_pci_range_parser *parser,
>  	range->pci_addr =3D of_read_number(parser->range + 1, ns);
>  	range->cpu_addr =3D of_translate_address(parser->node,
>  				parser->range + na);
> +	range->bus_addr =3D of_read_number(parser->range + na, p_ns);
>  	range->size =3D of_read_number(parser->range + parser->pna + na, ns=
);
> =20
>  	parser->range +=3D parser->np;
> diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
> index 5751dc5..b171d02 100644
> --- a/drivers/of/of_pci.c
> +++ b/drivers/of/of_pci.c
> @@ -198,6 +198,7 @@ int of_pci_get_host_bridge_resources(struct devic=
e_node *dev,
> =20
>  	pr_debug("Parsing ranges property...\n");
>  	for_each_of_pci_range(&parser, &range) {
> +		struct resource_entry *entry;
>  		/* Read next ranges element */
>  		if ((range.flags & IORESOURCE_TYPE_BITS) =3D=3D IORESOURCE_IO)
>  			snprintf(range_type, 4, " IO");
> @@ -240,6 +241,9 @@ int of_pci_get_host_bridge_resources(struct devic=
e_node *dev,
>  		}
> =20
>  		pci_add_resource_offset(resources, res,	res->start - range.pci_add=
r);
> +		entry =3D list_last_entry(resources, struct resource_entry, node);
> +		/*we are using __res for storing the PCI controller address*/

Minor nit, please add spaces around the beginning and end of comment ma=
rkers.

> +		entry->__res.start =3D range.bus_addr;
>  	}
> =20
>  	return 0;
> diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> index d88e81b..865f96e 100644
> --- a/include/linux/of_address.h
> +++ b/include/linux/of_address.h
> @@ -16,6 +16,7 @@ struct of_pci_range {
>  	u32 pci_space;
>  	u64 pci_addr;
>  	u64 cpu_addr;
> +	u64 bus_addr;
>  	u64 size;
>  	u32 flags;
>  };
> --=20
> 1.9.1
>=20

This touches code I have previously added, so I guess you need:

Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>

Best regards,
Liviu

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
