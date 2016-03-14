From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [v3] pstore-ram: add Device Tree bindings
Date: Mon, 14 Mar 2016 13:28:13 -0700
Message-ID: <20160314202813.GA129173@google.com>
References: <1452210056-14436-1-git-send-email-ghackmann@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452210056-14436-1-git-send-email-ghackmann@google.com>
Sender: linux-doc-owner@vger.kernel.org
To: Greg Hackmann <ghackmann@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>, John Stultz <john.stultz@linaro.org>, linux-doc@vger.kernel.org, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

Hi Greg,

On Thu, Jan 07, 2016 at 03:40:56PM -0800, Greg Hackmann wrote:
> ramoops is one of the remaining places where ARM vendors still rely on
> board-specific shims.  Device Tree lets us replace those shims with
> generic code.
> 
> These bindings mirror the ramoops module parameters, with two small
> differences:
> 
> (1) dump_oops becomes an optional "no-dump-oops" property, since ramoops
>     sets dump_oops=1 by default.
> 
> (2) mem_type=1 becomes the more self-explanatory "unbuffered" property.
> 
> Signed-off-by: Greg Hackmann <ghackmann@google.com>
> Acked-by: Kees Cook <keescook@chromium.org>
> 
> ---
> Changes in V3:
> - documentation fixes
> - look for "no-ram-oops" property as documented
> 
> Changes in V2:
> - make DT binding documentation more generic
> 
>  Documentation/devicetree/bindings/misc/ramoops.txt |  43 ++++++++
>  Documentation/ramoops.txt                          |   6 +-
>  fs/pstore/ram.c                                    | 110 ++++++++++++++++++++-
>  3 files changed, 155 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/misc/ramoops.txt
> 

[...]

> diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
> index 319c3a6..0f2912c 100644
> --- a/fs/pstore/ram.c
> +++ b/fs/pstore/ram.c
> @@ -34,6 +34,8 @@
>  #include <linux/slab.h>
>  #include <linux/compiler.h>
>  #include <linux/pstore_ram.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
>  
>  #define RAMOOPS_KERNMSG_HDR "===="
>  #define MIN_MEM_SIZE 4096UL
> @@ -458,15 +460,112 @@ static int ramoops_init_prz(struct device *dev, struct ramoops_context *cxt,
>  	return 0;
>  }
>  
> +static int ramoops_parse_dt_size(struct platform_device *pdev,
> +		const char *propname, unsigned long *val)
> +{
> +	u64 val64;
> +	int ret;
> +
> +	ret = of_property_read_u64(pdev->dev.of_node, propname, &val64);
> +	if (ret == -EINVAL) {
> +		*val = 0;
> +		return 0;
> +	} else if (ret != 0) {
> +		dev_err(&pdev->dev, "failed to parse property %s: %d\n",
> +				propname, ret);
> +		return ret;
> +	}
> +
> +	if (val64 > ULONG_MAX) {
> +		dev_err(&pdev->dev, "invalid %s %llu\n", propname, val64);
> +		return -EOVERFLOW;
> +	}
> +
> +	*val = val64;
> +	return 0;
> +}
> +
> +static int ramoops_parse_dt(struct platform_device *pdev,
> +		struct ramoops_platform_data *pdata)
> +{
> +	struct device_node *of_node = pdev->dev.of_node;
> +	struct device_node *mem_region;
> +	struct resource res;
> +	u32 ecc_size;
> +	int ret;
> +
> +	dev_dbg(&pdev->dev, "using Device Tree\n");
> +
> +	mem_region = of_parse_phandle(of_node, "memory-region", 0);
> +	if (!mem_region) {
> +		dev_err(&pdev->dev, "no memory-region phandle\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = of_address_to_resource(mem_region, 0, &res);
> +	of_node_put(mem_region);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to translate memory-region to resource: %d\n",
> +				ret);
> +		return ret;
> +	}
> +
> +	pdata->mem_size = resource_size(&res);
> +	pdata->mem_address = res.start;
> +	pdata->mem_type = of_property_read_bool(of_node, "unbuffered");
> +	pdata->dump_oops = !of_property_read_bool(of_node, "no-dump-oops");
> +
> +	ret = ramoops_parse_dt_size(pdev, "record-size", &pdata->record_size);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ramoops_parse_dt_size(pdev, "console-size", &pdata->console_size);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ramoops_parse_dt_size(pdev, "ftrace-size", &pdata->ftrace_size);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ramoops_parse_dt_size(pdev, "pmsg-size", &pdata->pmsg_size);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = of_property_read_u32(of_node, "ecc-size", &ecc_size);
> +	if (ret == 0) {
> +		if (ecc_size > INT_MAX) {
> +			dev_err(&pdev->dev, "invalid ecc-size %u\n", ecc_size);
> +			return -EOVERFLOW;
> +		}
> +		pdata->ecc_info.ecc_size = ecc_size;
> +	} else if (ret != -EINVAL) {
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int ramoops_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct ramoops_platform_data *pdata = pdev->dev.platform_data;
> +	struct ramoops_platform_data *pdata = platform_get_drvdata(pdev);

^^^ This is wrong. You don't set drvdata until later. This crashes
(e.g.) the Pixel 2, which uses platform data, not DT.

>  	struct ramoops_context *cxt = &oops_cxt;
>  	size_t dump_mem_sz;
>  	phys_addr_t paddr;
>  	int err = -EINVAL;
>  
> +	if (dev->of_node && !pdata) {
> +		pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +		if (!pdata) {
> +			err = -ENOMEM;
> +			goto fail_out;
> +		}
> +
> +		err = ramoops_parse_dt(pdev, pdata);
> +		if (err < 0)
> +			goto fail_out;
> +	}
> +
>  	/* Only a single ramoops area allowed at a time, so fail extra
>  	 * probes.
>  	 */
> @@ -561,6 +660,7 @@ static int ramoops_probe(struct platform_device *pdev)
>  		cxt->size, (unsigned long long)cxt->phys_addr,
>  		cxt->ecc_info.ecc_size, cxt->ecc_info.block_size);
>  
> +	platform_set_drvdata(pdev, pdata);

You don't ever (properly) use drvdata, so this line is superfluous.

>  	return 0;
>  
>  fail_buf:

[...]

Brian
