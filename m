From: Gabriele Paoloni <gabriele.paoloni@huawei.com>
Subject: RE: [PATCH v4] PCI: Store PCIe bus address in struct of_pci_range
Date: Mon, 27 Jul 2015 10:41:34 +0000
Message-ID: <EE11001F9E5DDD47B7634E2F8A612F2E01D6DCBB@lhreml503-mbs>
References: <1437574937-135566-1-git-send-email-gabriele.paoloni@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1437574937-135566-1-git-send-email-gabriele.paoloni@huawei.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gabriele Paoloni <gabriele.paoloni@huawei.com>, "arnd@arndb.de" <arnd@arndb.de>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "james.morse@arm.com" <james.morse@arm.com>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>
Cc: Zhudacai <zhudacai@hisilicon.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Yuanzhichang <yuanzhichang@hisilicon.com>, qiuzhenfa <qiuzhenfa@hisilicon.com>, zhangjukuo <zhangjukuo@huawei.com>, "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Sent "[PATCH v5] PCI: Store PCIe bus address in struct of_pci_range" with Rob Herring ack

> -----Original Message-----
> From: Gabriele Paoloni
> Sent: Wednesday, July 22, 2015 3:22 PM
> To: Gabriele Paoloni; arnd@arndb.de; lorenzo.pieralisi@arm.com;
> Wangzhou (B); bhelgaas@google.com; robh+dt@kernel.org;
> james.morse@arm.com; Liviu.Dudau@arm.com
> Cc: linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; Yuanzhichang; Zhudacai; zhangjukuo;
> qiuzhenfa; Liguozhu (Kenneth)
> Subject: [PATCH v4] PCI: Store PCIe bus address in struct of_pci_range
> 
> From: gabriele paoloni <gabriele.paoloni@huawei.com>
> 
>     This patch is needed port PCIe designware to new DT parsing API
>     As discussed in
>     http://lists.infradead.org/pipermail/linux-arm-kernel/2015-
> January/317743.html
>     in designware we have a problem as the PCI addresses in the PCIe
> controller
>     address space are required in order to perform correct HW operation.
> 
>     In order to solve this problem commit
>     f4c55c5a3 "PCI: designware: Program ATU with untranslated address"
>     added code to read the PCIe controller start address directly from
> the
>     DT ranges.
> 
>     In the new DT parsing API of_pci_get_host_bridge_resources() hides
> the
>     DT parser from the host controller drivers, so it is not possible
>     for drivers to parse values directly from the DT.
> 
>     In http://www.spinics.net/lists/linux-pci/msg42540.html we already
> tried
>     to use the new DT parsing API but there is a bug (obviously) in
> setting
>     the <*>_mod_base addresses
>     Applying this patch we can easily set "<*>_mod_base = win-
> >__res.start"
> 
>     This patch adds a new field in "struct of_pci_range" to store the
>     pci bus start address; it fills the field in
> of_pci_range_parser_one();
>     in of_pci_get_host_bridge_resources() it retrieves the resource
> entry
>     after it is created and added to the resource list and uses
>     entry->__res.start to store the pci controller address
> 
>     the patch is based on 4.2-rc1
> 
>     Signed-off-by: Gabriele Paoloni <gabriele.paoloni@huawei.com>
>     Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>
> ---
>  drivers/of/address.c       | 2 ++
>  drivers/of/of_pci.c        | 4 ++++
>  include/linux/of_address.h | 1 +
>  3 files changed, 7 insertions(+)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 8bfda6a..23a5793 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -253,6 +253,7 @@ struct of_pci_range *of_pci_range_parser_one(struct
> of_pci_range_parser *parser,
>  						struct of_pci_range *range)
>  {
>  	const int na = 3, ns = 2;
> +	const int p_ns = of_n_size_cells(parser->node);
> 
>  	if (!range)
>  		return NULL;
> @@ -265,6 +266,7 @@ struct of_pci_range *of_pci_range_parser_one(struct
> of_pci_range_parser *parser,
>  	range->pci_addr = of_read_number(parser->range + 1, ns);
>  	range->cpu_addr = of_translate_address(parser->node,
>  				parser->range + na);
> +	range->bus_addr = of_read_number(parser->range + na, p_ns);
>  	range->size = of_read_number(parser->range + parser->pna + na,
> ns);
> 
>  	parser->range += parser->np;
> diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
> index 5751dc5..fe57030 100644
> --- a/drivers/of/of_pci.c
> +++ b/drivers/of/of_pci.c
> @@ -198,6 +198,7 @@ int of_pci_get_host_bridge_resources(struct
> device_node *dev,
> 
>  	pr_debug("Parsing ranges property...\n");
>  	for_each_of_pci_range(&parser, &range) {
> +		struct resource_entry *entry;
>  		/* Read next ranges element */
>  		if ((range.flags & IORESOURCE_TYPE_BITS) == IORESOURCE_IO)
>  			snprintf(range_type, 4, " IO");
> @@ -240,6 +241,9 @@ int of_pci_get_host_bridge_resources(struct
> device_node *dev,
>  		}
> 
>  		pci_add_resource_offset(resources, res,	res->start -
> range.pci_addr);
> +		entry = list_last_entry(resources, struct resource_entry,
> node);
> +		/* we are using __res for storing the PCI controller
> address */
> +		entry->__res.start = range.bus_addr;
>  	}
> 
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
> --
> 1.9.1
