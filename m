From: James Morse <james.morse@arm.com>
Subject: Re: [PATCH v4 4/4] edac: Add support for Amazon's Annapurna Labs L2
 EDAC
Date: Fri, 2 Aug 2019 16:11:53 +0100
Message-ID: <a060cbce-14f3-0592-4998-0a900d3fe6e4@arm.com>
References: <20190801130956.26388-1-hhhawa@amazon.com>
 <20190801130956.26388-5-hhhawa@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190801130956.26388-5-hhhawa@amazon.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Hanna Hawa <hhhawa@amazon.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, linus.walleij@linaro.org, Jonathan.Cameron@huawei.com, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Hanna,

On 01/08/2019 14:09, Hanna Hawa wrote:
> Adds support for Amazon's Annapurna Labs L2 EDAC driver to detect and
> report L2 errors.
> diff --git a/drivers/edac/al_l2_edac.c b/drivers/edac/al_l2_edac.c
> new file mode 100644
> index 000000000000..6c6d37cf82ab
> --- /dev/null
> +++ b/drivers/edac/al_l2_edac.c
> @@ -0,0 +1,189 @@

> +#include <asm/sysreg.h>
> +#include <linux/bitfield.h>

#include <linux/cpumask.h> ?

> +#include <linux/of.h>
> +#include <linux/smp.h>

[...]

> +static void al_l2_edac_l2merrsr(void *arg)
> +{
> +	struct edac_device_ctl_info *edac_dev = arg;
> +	int cpu, i;
> +	u32 ramid, repeat, other, fatal;
> +	u64 val = read_sysreg_s(ARM_CA57_L2MERRSR_EL1);
> +	char msg[AL_L2_EDAC_MSG_MAX];
> +	int space, count;
> +	char *p;
> +
> +	if (!(FIELD_GET(ARM_CA57_L2MERRSR_VALID, val)))
> +		return;
> +
> +	write_sysreg_s(0, ARM_CA57_L2MERRSR_EL1);
> +
> +	cpu = smp_processor_id();
> +	ramid = FIELD_GET(ARM_CA57_L2MERRSR_RAMID, val);
> +	repeat = FIELD_GET(ARM_CA57_L2MERRSR_REPEAT, val);
> +	other = FIELD_GET(ARM_CA57_L2MERRSR_OTHER, val);
> +	fatal = FIELD_GET(ARM_CA57_L2MERRSR_FATAL, val);
> +
> +	space = sizeof(msg);
> +	p = msg;
> +	count = scnprintf(p, space, "CPU%d L2 %serror detected", cpu,
> +			  (fatal) ? "Fatal " : "");
> +	p += count;
> +	space -= count;
> +
> +	switch (ramid) {
> +	case ARM_CA57_L2_TAG_RAM:
> +		count = scnprintf(p, space, " RAMID='L2 Tag RAM'");
> +		break;
> +	case ARM_CA57_L2_DATA_RAM:
> +		count = scnprintf(p, space, " RAMID='L2 Data RAM'");
> +		break;
> +	case ARM_CA57_L2_SNOOP_RAM:
> +		count = scnprintf(p, space, " RAMID='L2 Snoop RAM'");

Nit: The TRMs both call this 'L2 Snoop Tag RAM'. Could we include 'tag' in the
description. 'tag' implies its some kind of metadata, so an uncorrected error here affect
a now unknown location, its more series than a 'data RAM' error. v8.2 would term this kind
of error 'uncontained'.


> +		break;
> +	case ARM_CA57_L2_DIRTY_RAM:
> +		count = scnprintf(p, space, " RAMID='L2 Dirty RAM'");
> +		break;
> +	case ARM_CA57_L2_INC_PF_RAM:
> +		count = scnprintf(p, space, " RAMID='L2 internal metadat'");

Nit: metadata

> +		break;
> +	default:
> +		count = scnprintf(p, space, " RAMID='unknown'");
> +		break;
> +	}
> +
> +	p += count;
> +	space -= count;
> +
> +	count = scnprintf(p, space,
> +			  " repeat=%d, other=%d (L2MERRSR_EL1=0x%llx)",
> +			  repeat, other, val);
> +
> +	for (i = 0; i < repeat; i++) {
> +		if (fatal)
> +			edac_device_handle_ue(edac_dev, 0, 0, msg);
> +		else
> +			edac_device_handle_ce(edac_dev, 0, 0, msg);
> +	}
> +}

[...]

> +static int al_l2_edac_probe(struct platform_device *pdev)
> +{
> +	struct edac_device_ctl_info *edac_dev;
> +	struct al_l2_edac *al_l2;
> +	struct device *dev = &pdev->dev;
> +	int ret, i;
> +
> +	edac_dev = edac_device_alloc_ctl_info(sizeof(*al_l2),
> +					      (char *)dev_name(dev), 1, "L", 1,
> +					      2, NULL, 0,
> +					      edac_device_alloc_index());
> +	if (IS_ERR_OR_NULL(edac_dev))
> +		return -ENOMEM;
> +
> +	al_l2 = edac_dev->pvt_info;
> +	edac_dev->edac_check = al_l2_edac_check;
> +	edac_dev->dev = dev;
> +	edac_dev->mod_name = DRV_NAME;
> +	edac_dev->dev_name = dev_name(dev);
> +	edac_dev->ctl_name = "L2 cache";
> +	platform_set_drvdata(pdev, edac_dev);

> +	for_each_online_cpu(i) {

for_each_possible_cpu()?

If you boot with maxcpus= the driver's behaviour changes.
But you are only parsing information from the DT, so you don't really need the CPUs to be
online.


> +		struct device_node *cpu;
> +		struct device_node *cpu_cache, *l2_cache;
> +
> +		cpu = of_get_cpu_node(i, NULL);

(of_get_cpu_node() can return NULL, but I don't think it can ever happen like this)

> +		cpu_cache = of_find_next_cache_node(cpu);
> +		l2_cache = of_parse_phandle(dev->of_node, "l2-cache", 0);
> +
> +		if (cpu_cache == l2_cache)
> +			cpumask_set_cpu(i, &al_l2->cluster_cpus);

You need to of_node_put() these device_node pointers once you're done with them.


> +	}
> +
> +	if (cpumask_empty(&al_l2->cluster_cpus)) {
> +		dev_err(dev, "CPU mask is empty for this L2 cache\n");
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	ret = edac_device_add_device(edac_dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to add L2 edac device\n");
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	edac_device_free_ctl_info(edac_dev);
> +
> +	return ret;
> +}

With the of_node_put()ing:
Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James
