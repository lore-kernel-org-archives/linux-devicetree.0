From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v8 2/6] misc: sram: implement reserved sram areas
Date: Mon, 03 Mar 2014 12:29:47 +0100
Message-ID: <1393846187.3369.0.camel@paszta.hi.pengutronix.de>
References: <21117503.1c6iOkvYSr@phil> <8769537.NUv9SMRkyo@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8769537.NUv9SMRkyo@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

Am Dienstag, den 25.02.2014, 12:46 +0100 schrieb Heiko St=C3=BCbner:
> This implements support for defining reserved areas as subnodes,
> to keep the genpool from using these.
>=20
> Suggested-by: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Tested-by: Ulrich Prinz <ulrich.prinz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

> ---
>  drivers/misc/sram.c | 125 ++++++++++++++++++++++++++++++++++++++++++=
+++++++---
>  1 file changed, 118 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
> index afe66571..674b0cd 100644
> --- a/drivers/misc/sram.c
> +++ b/drivers/misc/sram.c
> @@ -24,6 +24,9 @@
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/list.h>
> +#include <linux/list_sort.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> @@ -36,14 +39,35 @@ struct sram_dev {
>  	struct clk *clk;
>  };
> =20
> +struct sram_reserve {
> +	struct list_head list;
> +	u32 start;
> +	u32 size;
> +};
> +
> +static int sram_reserve_cmp(void *priv, struct list_head *a,
> +					struct list_head *b)
> +{
> +	struct sram_reserve *ra =3D list_entry(a, struct sram_reserve, list=
);
> +	struct sram_reserve *rb =3D list_entry(b, struct sram_reserve, list=
);
> +
> +	return ra->start - rb->start;
> +}
> +
>  static int sram_probe(struct platform_device *pdev)
>  {
>  	void __iomem *virt_base;
>  	struct sram_dev *sram;
>  	struct resource *res;
> -	unsigned long size;
> +	struct device_node *np =3D pdev->dev.of_node, *child;
> +	unsigned long size, cur_start, cur_size;
> +	struct sram_reserve *rblocks, *block;
> +	struct list_head reserve_list;
> +	unsigned int nblocks;
>  	int ret;
> =20
> +	INIT_LIST_HEAD(&reserve_list);
> +
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	virt_base =3D devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(virt_base))
> @@ -65,19 +89,106 @@ static int sram_probe(struct platform_device *pd=
ev)
>  	if (!sram->pool)
>  		return -ENOMEM;
> =20
> -	ret =3D gen_pool_add_virt(sram->pool, (unsigned long)virt_base,
> -				res->start, size, -1);
> -	if (ret < 0) {
> -		if (sram->clk)
> -			clk_disable_unprepare(sram->clk);
> -		return ret;
> +	/*
> +	 * We need an additional block to mark the end of the memory region
> +	 * after the reserved blocks from the dt are processed.
> +	 */
> +	nblocks =3D (np) ? of_get_available_child_count(np) + 1 : 1;
> +	rblocks =3D kmalloc((nblocks) * sizeof(*rblocks), GFP_KERNEL);
> +	if (!rblocks) {
> +		ret =3D -ENOMEM;
> +		goto err_alloc;
>  	}
> =20
> +	block =3D &rblocks[0];
> +	for_each_available_child_of_node(np, child) {
> +		struct resource child_res;
> +
> +		ret =3D of_address_to_resource(child, 0, &child_res);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev,
> +				"could not get address for node %s\n",
> +				child->full_name);
> +			goto err_chunks;
> +		}
> +
> +		if (child_res.start < res->start || child_res.end > res->end) {
> +			dev_err(&pdev->dev,
> +				"reserved block %s outside the sram area\n",
> +				child->full_name);
> +			ret =3D -EINVAL;
> +			goto err_chunks;
> +		}
> +
> +		block->start =3D child_res.start - res->start;
> +		block->size =3D resource_size(&child_res);
> +		list_add_tail(&block->list, &reserve_list);
> +
> +		dev_dbg(&pdev->dev, "found reserved block 0x%x-0x%x\n",
> +			block->start,
> +			block->start + block->size);
> +
> +		block++;
> +	}
> +
> +	/* the last chunk marks the end of the region */
> +	rblocks[nblocks - 1].start =3D size;
> +	rblocks[nblocks - 1].size =3D 0;
> +	list_add_tail(&rblocks[nblocks - 1].list, &reserve_list);
> +
> +	list_sort(NULL, &reserve_list, sram_reserve_cmp);
> +
> +	cur_start =3D 0;
> +
> +	list_for_each_entry(block, &reserve_list, list) {
> +		/* can only happen if sections overlap */
> +		if (block->start < cur_start) {
> +			dev_err(&pdev->dev,
> +				"block at 0x%x starts after current offset 0x%lx\n",
> +				block->start, cur_start);
> +			ret =3D -EINVAL;
> +			goto err_chunks;
> +		}
> +
> +		/* current start is in a reserved block, so continue after it */
> +		if (block->start =3D=3D cur_start) {
> +			cur_start =3D block->start + block->size;
> +			continue;
> +		}
> +
> +		/*
> +		 * allocate the space between the current starting
> +		 * address and the following reserved block, or the
> +		 * end of the region.
> +		 */
> +		cur_size =3D block->start - cur_start;
> +
> +		dev_dbg(&pdev->dev, "adding chunk 0x%lx-0x%lx\n",
> +			cur_start, cur_start + cur_size);
> +		ret =3D gen_pool_add_virt(sram->pool,
> +				(unsigned long)virt_base + cur_start,
> +				res->start + cur_start, cur_size, -1);
> +		if (ret < 0)
> +			goto err_chunks;
> +
> +		/* next allocation after this reserved block */
> +		cur_start =3D block->start + block->size;
> +	}
> +
> +	kfree(rblocks);
> +
>  	platform_set_drvdata(pdev, sram);
> =20
>  	dev_dbg(&pdev->dev, "SRAM pool: %ld KiB @ 0x%p\n", size / 1024, vir=
t_base);
> =20
>  	return 0;
> +
> +err_chunks:
> +	kfree(rblocks);
> +err_alloc:
> +	if (sram->clk)
> +		clk_disable_unprepare(sram->clk);
> +	return ret;
>  }
> =20
>  static int sram_remove(struct platform_device *pdev)

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
