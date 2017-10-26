From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v9 7/7] clk: qcom: Add APCS clock controller support
Date: Wed, 25 Oct 2017 21:39:19 -0700
Message-ID: <20171026043919.GM1575@tuxbook>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
 <20170921164940.20343-8-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170921164940.20343-8-georgi.djakov@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, jassisinghbrar@gmail.com, robh+dt@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 21 Sep 09:49 PDT 2017, Georgi Djakov wrote:

> Add a driver for the APCS clock controller. It is part of the APCS
> hardware block, which among other things implements also a combined
> mux and half integer divider functionality. It can choose between a
> fixed-rate clock or the dedicated APCS (A53) PLL. The source and the
> divider can be set both at the same time.
> 
> This is required for enabling CPU frequency scaling on MSM8916-based
> platforms.

As stated in the binding patch I think you should describe the "two"
parts in one node and probably add this code to the existing driver,
rather than spawning a new device.

[..]
> diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
[..]
> +#include "clk-regmap.h"
> +#include "clk-regmap-mux-div.h"

These two include files might cause some issues, but I would prefer that
you bake this code into the existing apcs driver.

[..]
> +static int __init qcom_apcs_msm8916_clk_init(void)
> +{
> +	return platform_driver_register(&qcom_apcs_msm8916_clk_driver);
> +}
> +core_initcall(qcom_apcs_msm8916_clk_init);

NB. The a53 clock is a builtin_platform_driver(), i.e. device_initcall()
the clock will never be available at core_initcall(), so the
devm_clk_get() should always hit a probe defer. Use
module_platform_driver() instead.

> +
> +static void __exit qcom_apcs_msm8916_clk_exit(void)
> +{
> +	platform_driver_unregister(&qcom_apcs_msm8916_clk_driver);
> +}
> +module_exit(qcom_apcs_msm8916_clk_exit);

Regards,
Bjorn
