From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: Convert to using %pOF instead of full_name
Date: Thu, 17 Aug 2017 15:00:07 +0200
Message-ID: <20170817150007.4635f3d6@bbrezillon>
References: <20170718214339.7774-37-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170718214339.7774-37-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Le Tue, 18 Jul 2017 16:43:17 -0500,
Rob Herring <robh@kernel.org> a écrit :

> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.

Applied to l2-mtd/master.

Thanks,

Boris

> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> Cc: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/maps/physmap_of_core.c |  4 ++--
>  drivers/mtd/maps/sun_uflash.c      |  4 ++--
>  drivers/mtd/ofpart.c               | 23 +++++++++++------------
>  drivers/mtd/spi-nor/hisi-sfc.c     |  8 ++++----
>  4 files changed, 19 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap_of_core.c b/drivers/mtd/maps/physmap_of_core.c
> index 62fa6836f218..1343c34092ca 100644
> --- a/drivers/mtd/maps/physmap_of_core.c
> +++ b/drivers/mtd/maps/physmap_of_core.c
> @@ -178,8 +178,8 @@ static int of_flash_probe(struct platform_device *dev)
>  	 */
>  	p = of_get_property(dp, "reg", &count);
>  	if (!p || count % reg_tuple_size != 0) {
> -		dev_err(&dev->dev, "Malformed reg property on %s\n",
> -				dev->dev.of_node->full_name);
> +		dev_err(&dev->dev, "Malformed reg property on %pOF\n",
> +				dev->dev.of_node);
>  		err = -EINVAL;
>  		goto err_flash_remove;
>  	}
> diff --git a/drivers/mtd/maps/sun_uflash.c b/drivers/mtd/maps/sun_uflash.c
> index 414956eca0c9..1e73bba6e286 100644
> --- a/drivers/mtd/maps/sun_uflash.c
> +++ b/drivers/mtd/maps/sun_uflash.c
> @@ -55,8 +55,8 @@ int uflash_devinit(struct platform_device *op, struct device_node *dp)
>  		/* Non-CFI userflash device-- once I find one we
>  		 * can work on supporting it.
>  		 */
> -		printk(KERN_ERR PFX "Unsupported device at %s, 0x%llx\n",
> -		       dp->full_name, (unsigned long long)op->resource[0].start);
> +		printk(KERN_ERR PFX "Unsupported device at %pOF, 0x%llx\n",
> +		       dp, (unsigned long long)op->resource[0].start);
> 
>  		return -ENODEV;
>  	}
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index 2861c7079d7b..6bdf4e525677 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -50,8 +50,8 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>  		 * when using another parser), so don't be louder than
>  		 * KERN_DEBUG
>  		 */
> -		pr_debug("%s: 'partitions' subnode not found on %s. Trying to parse direct subnodes as partitions.\n",
> -			 master->name, mtd_node->full_name);
> +		pr_debug("%s: 'partitions' subnode not found on %pOF. Trying to parse direct subnodes as partitions.\n",
> +			 master->name, mtd_node);
>  		ofpart_node = mtd_node;
>  		dedicated = false;
>  	} else if (!of_device_is_compatible(ofpart_node, "fixed-partitions")) {
> @@ -87,9 +87,9 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>  		reg = of_get_property(pp, "reg", &len);
>  		if (!reg) {
>  			if (dedicated) {
> -				pr_debug("%s: ofpart partition %s (%s) missing reg property.\n",
> -					 master->name, pp->full_name,
> -					 mtd_node->full_name);
> +				pr_debug("%s: ofpart partition %pOF (%pOF) missing reg property.\n",
> +					 master->name, pp,
> +					 mtd_node);
>  				goto ofpart_fail;
>  			} else {
>  				nr_parts--;
> @@ -100,9 +100,9 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>  		a_cells = of_n_addr_cells(pp);
>  		s_cells = of_n_size_cells(pp);
>  		if (len / 4 != a_cells + s_cells) {
> -			pr_debug("%s: ofpart partition %s (%s) error parsing reg property.\n",
> -				 master->name, pp->full_name,
> -				 mtd_node->full_name);
> +			pr_debug("%s: ofpart partition %pOF (%pOF) error parsing reg property.\n",
> +				 master->name, pp,
> +				 mtd_node);
>  			goto ofpart_fail;
>  		}
> 
> @@ -131,8 +131,8 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>  	return nr_parts;
> 
>  ofpart_fail:
> -	pr_err("%s: error parsing ofpart partition %s (%s)\n",
> -	       master->name, pp->full_name, mtd_node->full_name);
> +	pr_err("%s: error parsing ofpart partition %pOF (%pOF)\n",
> +	       master->name, pp, mtd_node);
>  	ret = -EINVAL;
>  ofpart_none:
>  	of_node_put(pp);
> @@ -166,8 +166,7 @@ static int parse_ofoldpart_partitions(struct mtd_info *master,
>  	if (!part)
>  		return 0; /* No partitions found */
> 
> -	pr_warn("Device tree uses obsolete partition map binding: %s\n",
> -		dp->full_name);
> +	pr_warn("Device tree uses obsolete partition map binding: %pOF\n", dp);
> 
>  	nr_parts = plen / sizeof(part[0]);
> 
> diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
> index d1106832b9d5..04f9fb5cd9b6 100644
> --- a/drivers/mtd/spi-nor/hisi-sfc.c
> +++ b/drivers/mtd/spi-nor/hisi-sfc.c
> @@ -355,16 +355,16 @@ static int hisi_spi_nor_register(struct device_node *np,
> 
>  	ret = of_property_read_u32(np, "reg", &priv->chipselect);
>  	if (ret) {
> -		dev_err(dev, "There's no reg property for %s\n",
> -			np->full_name);
> +		dev_err(dev, "There's no reg property for %pOF\n",
> +			np);
>  		return ret;
>  	}
> 
>  	ret = of_property_read_u32(np, "spi-max-frequency",
>  			&priv->clkrate);
>  	if (ret) {
> -		dev_err(dev, "There's no spi-max-frequency property for %s\n",
> -			np->full_name);
> +		dev_err(dev, "There's no spi-max-frequency property for %pOF\n",
> +			np);
>  		return ret;
>  	}
>  	priv->host = host;
> --
> 2.11.0
> 
