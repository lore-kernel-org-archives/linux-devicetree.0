From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v7 3/6] coresight: of: Use of_cpu_node_to_id helper
Date: Mon, 9 Oct 2017 10:58:42 +0800
Message-ID: <20171009025842.GA3146@leoy-linaro>
References: <20171006103610.11853-1-suzuki.poulose@arm.com>
 <20171006103610.11853-4-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171006103610.11853-4-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh@kernel.org, will.deacon@arm.com, sudeep.holla@arm.com, frowand.list@gmail.com, devicetree@vger.kernel.org, Jonathan.Cameron@huawei.com, marc.zyngier@arm.com, peterz@infradead.org, mathieu.poirier@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Suzuki,

On Fri, Oct 06, 2017 at 11:36:07AM +0100, Suzuki K Poulose wrote:
> Reuse the new generic helper, of_cpu_node_to_id() to map a
> given CPU phandle to a logical CPU number.
> 
> Cc: Leo Yan <leo.yan@linaro.org>
> Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Tested-by: Leo Yan <leo.yan@linaro.org>

BTW, I think the function get_cpu_for_node() in the file
arch/arm64/kernel/topology.c we also can refactor with the same
function, just reminding for this.

> ---
> Changes since V4:
>  - Fix a regression introduced in v4, reported by bugrobot
> Changes since V3:
>  - Reflect the renaming of the helper and return value changes
> ---
>  drivers/hwtracing/coresight/of_coresight.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/of_coresight.c b/drivers/hwtracing/coresight/of_coresight.c
> index a18794128bf8..7c375443ede6 100644
> --- a/drivers/hwtracing/coresight/of_coresight.c
> +++ b/drivers/hwtracing/coresight/of_coresight.c
> @@ -104,26 +104,17 @@ static int of_coresight_alloc_memory(struct device *dev,
>  int of_coresight_get_cpu(const struct device_node *node)
>  {
>  	int cpu;
> -	bool found;
> -	struct device_node *dn, *np;
> +	struct device_node *dn;
>  
>  	dn = of_parse_phandle(node, "cpu", 0);
> -
>  	/* Affinity defaults to CPU0 */
>  	if (!dn)
>  		return 0;
> -
> -	for_each_possible_cpu(cpu) {
> -		np = of_cpu_device_node_get(cpu);
> -		found = (dn == np);
> -		of_node_put(np);
> -		if (found)
> -			break;
> -	}
> +	cpu = of_cpu_node_to_id(dn);
>  	of_node_put(dn);
>  
>  	/* Affinity to CPU0 if no cpu nodes are found */
> -	return found ? cpu : 0;
> +	return (cpu < 0) ? 0 : cpu;
>  }
>  EXPORT_SYMBOL_GPL(of_coresight_get_cpu);
>  
> -- 
> 2.13.6
> 
