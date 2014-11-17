From: =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dza2k=?= <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/5] clk: s2mps11: Add the support for S2MPS13 PMIC clock
Date: Mon, 17 Nov 2014 11:16:25 +0100
Message-ID: <5469CAF9.6020700@samsung.com>
References: <1416184980-532-1-git-send-email-cw00.choi@samsung.com>
 <1416184980-532-4-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1416184980-532-4-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, lee.jones@linaro.org, broonie@kernel.org, mturquette@linaro.org, a.zummo@towertech.it
Cc: lgirdwood@gmail.com, sbkim73@samsung.com, sameo@linux.intel.com, geunsik.lim@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 17.11.2014 01:42, Chanwoo Choi wrote:
> This patch adds the support for S2MPS13 PMIC clock which is same with existing
> S2MPS14 RTC IP. But, S2MPS13 uses all of clocks (32khz_{ap|bt|cp}).
> 
> Cc: Mike Turquette <mturquette@linaro.org>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  drivers/clk/clk-s2mps11.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
> index b7797fb..7bb13af 100644
> --- a/drivers/clk/clk-s2mps11.c
> +++ b/drivers/clk/clk-s2mps11.c
> @@ -23,6 +23,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/platform_device.h>
>  #include <linux/mfd/samsung/s2mps11.h>
> +#include <linux/mfd/samsung/s2mps13.h>
>  #include <linux/mfd/samsung/s2mps14.h>
>  #include <linux/mfd/samsung/s5m8767.h>
>  #include <linux/mfd/samsung/core.h>
> @@ -120,6 +121,24 @@ static struct clk_init_data s2mps11_clks_init[S2MPS11_CLKS_NUM] = {
>  	},
>  };
>  
> +static struct clk_init_data s2mps13_clks_init[S2MPS11_CLKS_NUM] = {
> +	[S2MPS11_CLK_AP] = {
> +		.name = "s2mps13_ap",
> +		.ops = &s2mps11_clk_ops,
> +		.flags = CLK_IS_ROOT,
> +	},
> +	[S2MPS11_CLK_CP] = {
> +		.name = "s2mps13_cp",
> +		.ops = &s2mps11_clk_ops,
> 		.flags = CLK_IS_ROOT,

The patch looks corrupted here. Missing '+'?

Rest looks fine.
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof


> +	},
> +	[S2MPS11_CLK_BT] = {
> +		.name = "s2mps13_bt",
> +		.ops = &s2mps11_clk_ops,
> +		.flags = CLK_IS_ROOT,
> +	},
> +};
> +
>  static struct clk_init_data s2mps14_clks_init[S2MPS11_CLKS_NUM] = {
>  	[S2MPS11_CLK_AP] = {
>  		.name = "s2mps14_ap",
> @@ -184,6 +203,10 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
>  		s2mps11_reg = S2MPS11_REG_RTC_CTRL;
>  		clks_init = s2mps11_clks_init;
>  		break;
> +	case S2MPS13X:
> +		s2mps11_reg = S2MPS13_REG_RTCCTRL;
> +		clks_init = s2mps13_clks_init;
> +		break;
>  	case S2MPS14X:
>  		s2mps11_reg = S2MPS14_REG_RTCCTRL;
>  		clks_init = s2mps14_clks_init;
> @@ -279,6 +302,7 @@ static int s2mps11_clk_remove(struct platform_device *pdev)
>  
>  static const struct platform_device_id s2mps11_clk_id[] = {
>  	{ "s2mps11-clk", S2MPS11X},
> +	{ "s2mps13-clk", S2MPS13X},
>  	{ "s2mps14-clk", S2MPS14X},
>  	{ "s5m8767-clk", S5M8767X},
>  	{ },
> 
