From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] misc: cxl: Use device_type helpers to access the node type
Date: Mon, 10 Dec 2018 16:38:35 +1100
Message-ID: <878t0yeyas.fsf@concordia.ellerman.id.au>
References: <20181205191655.14612-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205191655.14612-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <andrew.donnellan@au1.ibm.com>
List-Id: devicetree@vger.kernel.org

Rob Herring <robh@kernel.org> writes:

> Remove directly accessing device_type property and use the
> of_node_is_type accessor instead. While not using it here, this is
> part of eventually removing the struct device_node.type pointer.
>
> Cc: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Acked-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
> - Reword commit message as this change was using the .type ptr.

I already have v1 in my next.

cheers

> diff --git a/drivers/misc/cxl/pci.c b/drivers/misc/cxl/pci.c
> index b66d832d3233..c79ba1c699ad 100644
> --- a/drivers/misc/cxl/pci.c
> +++ b/drivers/misc/cxl/pci.c
> @@ -1718,7 +1718,6 @@ int cxl_slot_is_switched(struct pci_dev *dev)
>  {
>  	struct device_node *np;
>  	int depth = 0;
> -	const __be32 *prop;
>  
>  	if (!(np = pci_device_to_OF_node(dev))) {
>  		pr_err("cxl: np = NULL\n");
> @@ -1727,8 +1726,7 @@ int cxl_slot_is_switched(struct pci_dev *dev)
>  	of_node_get(np);
>  	while (np) {
>  		np = of_get_next_parent(np);
> -		prop = of_get_property(np, "device_type", NULL);
> -		if (!prop || strcmp((char *)prop, "pciex"))
> +		if (!of_node_is_type(np, "pciex"))
>  			break;
>  		depth++;
>  	}
> -- 
> 2.19.1
