From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 2/3] firmware: qcom: scm: Expose download-mode control
Date: Wed, 31 May 2017 09:27:26 -0700
Message-ID: <20170531162726.GZ20170@codeaurora.org>
References: <20170527063308.10483-1-bjorn.andersson@linaro.org>
 <20170527063308.10483-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170527063308.10483-2-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/26, Bjorn Andersson wrote:
> In order to aid post-mortem debugging the Qualcomm platforms provides a
> "memory download mode", where the boot loader will provide an interface
> for custom tools to "download" the content of RAM to a host machine.
> 
> The mode is triggered by writing a magic value somehwere in RAM, that is
> read in the boot code path after a warm-restart. Two mechanism for
> setting this magic value are supported in modern platforms; a direct SCM
> call to enable the mode or through a secure io write of a magic value.
> 
> In order for a normal reboot not to trigger "download mode" the magic
> must be cleared during a clean reboot.
> 
> Download mode has to be enabled by including qcom_scm.download_mode=1 on
> the command line.

Why the kernel command line parameter? If we keep the kernel
command line param, perhaps we can also gain a config option to
make it default enabled or default disabled so that we don't have
to specify it on the commandline to get the feature all the time.

> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> index 20f26fbce875..388817d1d00e 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> @@ -18,6 +18,8 @@ Required properties:
>   * Core, iface, and bus clocks required for "qcom,scm"
>  - clock-names: Must contain "core" for the core clock, "iface" for the interface
>    clock and "bus" for the bus clock per the requirements of the compatible.
> +- qcom,dload-mode-addr: Specifies the address (2 cells) for the download mode
> +			magic (optional)

Was it decided that reg was improper? Or a phandle to a node that
has a reg property?

>  
>  Example for MSM8916:
>  
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index e18d63935648..98f4747acddb 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -19,6 +19,7 @@
>  #include <linux/cpumask.h>
>  #include <linux/export.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/module.h>
>  #include <linux/types.h>
>  #include <linux/qcom_scm.h>
>  #include <linux/of.h>
> @@ -28,6 +29,9 @@
>  
>  #include "qcom_scm.h"
>  
> +static bool download_mode;
> +module_param(download_mode, bool, 0700);

0700? Not 0600? And what if we have it == 1 on the command line
and then write 0 at runtime with module param? Shouldn't we
handle that with a callback and turn off download mode there?
Otherwise when we reboot we will reboot into download mode?


> +
>  #define SCM_HAS_CORE_CLK	BIT(0)
>  #define SCM_HAS_IFACE_CLK	BIT(1)
>  #define SCM_HAS_BUS_CLK		BIT(2)
> @@ -365,6 +393,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	struct qcom_scm *scm;
>  	unsigned long clks;
>  	int ret;
> +	u64 val;
>  
>  	scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
>  	if (!scm)
> @@ -418,9 +447,22 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  
>  	__qcom_scm_init();
>  
> +	ret = of_property_read_u64(pdev->dev.of_node, "qcom,dload-mode-addr", &val);
> +	if (!ret)
> +		scm->dload_mode_addr = val;

How about:

	of_property_read_u64(pdev->dev.of_node, "qcom,dload-mode-addr",
			     &scm->dload_mode_addr)

> +
> +	if (download_mode)
> +		qcom_scm_set_download_mode(true);
> +
>  	return 0;
>  }
>  
> +void qcom_scm_shutdown(struct platform_device *pdev)

static?

> +{
> +	if (download_mode)
> +		qcom_scm_set_download_mode(false);
> +}
> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
