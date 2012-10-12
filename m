From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 2/3] dmaengine: dw_dmac: Enhance device tree support
Date: Fri, 12 Oct 2012 16:27:19 +0300
Message-ID: <1350047732.10584.155.camel__4862.8973345787$1351697574$gmane$org@smile>
References: <142ef9170a2c69657d8a05ac127a9970d7b04965.1350020375.git.viresh.kumar@linaro.org>
 <91e41b4cc972d298f714cbd6f400569a9710304c.1350020375.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Resent-Message-Id: <E1TMfGp-0000gm-Od@smile>
In-Reply-To: <91e41b4cc972d298f714cbd6f400569a9710304c.1350020375.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Resent-To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2012-10-12 at 11:14 +0530, Viresh Kumar wrote: 
> dw_dmac driver already supports device tree but it used to have its platform
> data passed the non-DT way.
Another portion of comments.

> diff --git a/drivers/dma/dw_dmac.c b/drivers/dma/dw_dmac.c

> +static struct dw_dma_platform_data *
> +__devinit dw_dma_parse_dt(struct platform_device *pdev)
> +{
> +	struct device_node *sn, *cn, *np = pdev->dev.of_node;
> +	struct dw_dma_platform_data *pdata;
> +	struct dw_dma_slave *sd;
> +	u32 count, val, arr[4];
> +
> +	if (!np) {
> +		dev_err(&pdev->dev, "Missing DT data\n");
> +		return NULL;
> +	}
> +
> +	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return NULL;
> +
> +	if (of_property_read_u32(np, "nr_channels", &pdata->nr_channels))
> +		return NULL;
> +
> +	if (of_property_read_bool(np, "is_private"))
> +		pdata->is_private = true;
> +
> +	if (!of_property_read_u32(np, "chan_allocation_order",
> +				&val))
Fits one line?

> +		pdata->chan_allocation_order = (unsigned char)val;
do we really need explicit casting here?

> +
> +	if (!of_property_read_u32(np, "chan_priority", &val))
> +		pdata->chan_priority = (unsigned char)val;
ditto

> +
> +	if (!of_property_read_u32(np, "block_size", &val))
> +		pdata->block_size = (unsigned short)val;
ditto 
> +
> +	if (!of_property_read_u32(np, "nr_masters", &val)) {
> +		if (val > 4)
I thought once that we might introduce constant like #define
DW_MAX_AHB_MASTERS 4. It seems a bit useless because hw is designed for
that number anyway, but maybe you have another opinion. 

> +			return NULL;
> +
> +		pdata->nr_masters = (unsigned char)val;
> +	}
> +
> +	if (!of_property_read_u32_array(np, "data_width", arr,
> +				pdata->nr_masters))
> +		for (count = 0; count < pdata->nr_masters; count++)
> +			pdata->data_width[count] = arr[count];
Ah, it would be nice to have of_property_read_u8_array and so on...

> +
> +	/* parse slave data */
> +	sn = of_find_node_by_name(np, "slave_info");
> +	if (!sn)
> +		return pdata;
> +
> +	count = 0;
> +	/* calculate number of slaves */
> +	for_each_child_of_node(sn, cn)
> +		count++;

of.h: static inline int of_get_child_count(const struct device_node *np)


> +
> +	if (!count)
> +		return NULL;
> +
> +	sd = devm_kzalloc(&pdev->dev, sizeof(*sd) * count, GFP_KERNEL);
> +	if (!sd)
> +		return NULL;
> +
> +	count = 0;
> +	for_each_child_of_node(sn, cn) {
> +		of_property_read_string(cn, "bus_id", &sd[count].bus_id);
> +		of_property_read_u32(cn, "cfg_hi", &sd[count].cfg_hi);
> +		of_property_read_u32(cn, "cfg_lo", &sd[count].cfg_lo);
> +		if (!of_property_read_u32(cn, "src_master", &val))
> +			sd[count].src_master = (u8)val;
Explicit casting?

> +
> +		if (!of_property_read_u32(cn, "dst_master", &val))
> +			sd[count].dst_master = (u8)val;
ditto 
> +
> +		sd[count].dma_dev = &pdev->dev;
> +		count++;
> +	}

what about to define sd as sd[0]; in the platform_data structure and
then use smth like following

struct ... *sd = pdata->sd;
for_each... {
sd->... = ;
sd++;
}

it will probably require to split this part in a separate function and
calculate count of slave_info children before pdata memory allocation.


> +
> +	pdata->sd = sd;
> +	pdata->sd_count = count;
> +
> +	return pdata;
> +}

-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
