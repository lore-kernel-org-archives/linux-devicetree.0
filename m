From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH] power: reset: msm: Add support for download-mode control
Date: Thu, 19 Jul 2018 12:29:20 +0530
Message-ID: <ca74b7f4-3e60-2f3b-3d66-ac167c913c0e@codeaurora.org>
References: <1531977529-23304-1-git-send-email-rnayak@codeaurora.org>
 <20180719054200.GB30024@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180719054200.GB30024@minitux>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: sre@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 7/19/2018 11:12 AM, Bjorn Andersson wrote:
> On Wed 18 Jul 22:18 PDT 2018, Rajendra Nayak wrote:
> 
>> commit '8c1b7dc9b: firmware: qcom: scm: Expose download-mode control'
>> added support for download-mode control using the scm firmware
>> driver for platforms which require a secure call to write the magic
>> cookie into the tcsr location.
>>
>> For platforms which *do not* need an scm call and where the kernel can
>> write the cookie by a direct read/write, add similar support in the
>> msm-poweroff driver.
>> Similar to the scm driver, the msm-poweroff driver clears the cookie
>> during a clean reboot.
>>
>> Download mode using msm-poweroff driver can be enabled by including
>> msm-poweroff.download_mode=1 on the command line.
>>
> 
> Should have thought about this when I wrote the scm code...
> 
> I would prefer if we could find a way to consolidate the two
> implementations behind the same Kconfig and command line parameters.

The only problem I saw with this was that *both* drivers would think
its enabled and try their own ways to enable it, and one of it would
always fail. We could fail silently, which would mean we will miss
cases when its a genuine failure but that should be fine?

>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   .../bindings/power/reset/msm-poweroff.txt          |  3 ++
>>   drivers/power/reset/Kconfig                        | 11 +++++++
>>   drivers/power/reset/msm-poweroff.c                 | 38 ++++++++++++++++++++++
>>   3 files changed, 52 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/reset/msm-poweroff.txt b/Documentation/devicetree/bindings/power/reset/msm-poweroff.txt
>> index ce44ad3..9dd489f 100644
>> --- a/Documentation/devicetree/bindings/power/reset/msm-poweroff.txt
>> +++ b/Documentation/devicetree/bindings/power/reset/msm-poweroff.txt
>> @@ -8,6 +8,9 @@ settings.
>>   Required Properties:
>>   -compatible: "qcom,pshold"
>>   -reg: Specifies the physical address of the ps-hold register
>> +Optional Properties:
>> +-qcom,dload-mode: phandle to the TCSR hardware block and offset of the
>> +		 download mode control register
>>   
>>   Example:
>>   
>> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> index df58fc8..0c97e34 100644
>> --- a/drivers/power/reset/Kconfig
>> +++ b/drivers/power/reset/Kconfig
>> @@ -104,6 +104,17 @@ config POWER_RESET_MSM
>>   	help
>>   	  Power off and restart support for Qualcomm boards.
>>   
>> +config POWER_RESET_MSM_DOWNLOAD_MODE
> 
> How about moving QCOM_SCM_DOWNLOAD_MODE_DEFAULT to
> drivers/soc/qcom/Kconfig (and removing "SCM") and referencing this in
> both drivers?

yes, thats possible, but I am not sure how to make the command line
option common for both. One other option I thought was if we could handle it
within the scm driver itself with an additional
binding to specify the non-secure download mode address.
something like qcom,dload-mode-ns?

regards,
Rajendra

> 
>> +	bool "Qualcomm download mode enabled by default"
>> +	depends on POWER_RESET_MSM
>> +	help
>> +	  A device with "download mode" enabled will upon an unexpected
>> +	  warm-restart enter a special debug mode that allows the user to
>> +	  "download" memory content over USB for offline postmortem analysis.
>> +	  The feature can be enabled/disabled on the kernel command line.
>> +
>> +	  Say Y here to enable "download mode" by default.
>> +
>>   config POWER_RESET_OCELOT_RESET
>>   	bool "Microsemi Ocelot reset driver"
>>   	depends on MSCC_OCELOT || COMPILE_TEST
>> diff --git a/drivers/power/reset/msm-poweroff.c b/drivers/power/reset/msm-poweroff.c
>> index 01b8c71..c33eac5 100644
>> --- a/drivers/power/reset/msm-poweroff.c
>> +++ b/drivers/power/reset/msm-poweroff.c
>> @@ -18,11 +18,20 @@
>>   #include <linux/io.h>
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/mfd/syscon.h>
>>   #include <linux/module.h>
>>   #include <linux/reboot.h>
>> +#include <linux/regmap.h>
>>   #include <linux/pm.h>
>>   
>> +static bool download_mode = IS_ENABLED(CONFIG_POWER_RESET_MSM_DOWNLOAD_MODE);
>> +module_param(download_mode, bool, 0);
> 
> Iirc it's possible to have multiple implementations of __setup() for the
> same string. I'm uncertain if this would be considered okay though.
> 
>> +
>> +#define QCOM_SET_DLOAD_MODE 0x10
>>   static void __iomem *msm_ps_hold;
>> +static struct regmap *tcsr_regmap;
>> +static unsigned int dload_mode_offset;
>> +
>>   static int deassert_pshold(struct notifier_block *nb, unsigned long action,
>>   			   void *data)
>>   {
>> @@ -44,9 +53,30 @@ static void do_msm_poweroff(void)
>>   
>>   static int msm_restart_probe(struct platform_device *pdev)
>>   {
>> +	int ret;
>> +	struct of_phandle_args args;
>>   	struct device *dev = &pdev->dev;
>>   	struct resource *mem;
>>   
>> +	if (download_mode) {
>> +		ret = of_parse_phandle_with_fixed_args(dev->of_node,
>> +						       "qcom,dload-mode", 1, 0,
>> +						       &args);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		tcsr_regmap = syscon_node_to_regmap(args.np);
>> +		of_node_put(args.np);
>> +		if (IS_ERR(tcsr_regmap))
>> +			return PTR_ERR(tcsr_regmap);
>> +
>> +		dload_mode_offset = args.args[0];
>> +
>> +		/* Enable download mode by writing the cookie */
>> +		regmap_write(tcsr_regmap, dload_mode_offset,
>> +			     QCOM_SET_DLOAD_MODE);
>> +	}
>> +
>>   	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>   	msm_ps_hold = devm_ioremap_resource(dev, mem);
>>   	if (IS_ERR(msm_ps_hold))
>> @@ -59,6 +89,13 @@ static int msm_restart_probe(struct platform_device *pdev)
>>   	return 0;
>>   }
>>   
>> +static void msm_restart_shutdown(struct platform_device *pdev)
>> +{
>> +	/* Clean shutdown, disable download mode to allow normal restart */
>> +	if (download_mode)
>> +		regmap_write(tcsr_regmap, dload_mode_offset, 0x0);
>> +}
>> +
>>   static const struct of_device_id of_msm_restart_match[] = {
>>   	{ .compatible = "qcom,pshold", },
>>   	{},
>> @@ -71,6 +108,7 @@ static int msm_restart_probe(struct platform_device *pdev)
>>   		.name = "msm-restart",
>>   		.of_match_table = of_match_ptr(of_msm_restart_match),
>>   	},
>> +	.shutdown = msm_restart_shutdown,
>>   };
> 
> Implementation looks good.
> 
> Regards,
> Bjorn
> 
