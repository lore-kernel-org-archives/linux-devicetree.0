From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v2 1/2] clk: qcom: gcc-msm8960: add child devices support.
Date: Fri, 30 Jan 2015 08:57:44 -0800
Message-ID: <CAJAp7Oi_nxEyBZ0bTaQr6d-8sy8M4dFLJxOWCrniX6Pd9+_AGQ@mail.gmail.com>
References: <1422613004-29802-1-git-send-email-srinivas.kandagatla@linaro.org>
	<1422613060-29886-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422613060-29886-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, edubezval@gmail.com, nrajan@codeaurora.com, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 30, 2015 at 2:17 AM, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
> This patch adds support to add child devices to gcc as some of the
> registers mapped by gcc are used by drivers like thermal sensors.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/clk/qcom/gcc-msm8960.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
> index 0cd3e26..3ba77c5 100644
> --- a/drivers/clk/qcom/gcc-msm8960.c
> +++ b/drivers/clk/qcom/gcc-msm8960.c
> @@ -15,6 +15,7 @@
>  #include <linux/bitops.h>
>  #include <linux/err.h>
>  #include <linux/platform_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> @@ -3658,6 +3659,7 @@ static int gcc_msm8960_probe(struct platform_device *pdev)
>         struct clk *clk;
>         struct device *dev = &pdev->dev;
>         const struct of_device_id *match;
> +       int ret;
>
>         match = of_match_device(gcc_msm8960_match_table, &pdev->dev);
>         if (!match)
> @@ -3677,12 +3679,18 @@ static int gcc_msm8960_probe(struct platform_device *pdev)
>         if (IS_ERR(clk))
>                 return PTR_ERR(clk);
>
> -       return qcom_cc_probe(pdev, match->data);
> +       ret = qcom_cc_probe(pdev, match->data);
> +       if (ret)
> +               return ret;
> +
> +       return of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);

How about calling of_syscon_register() instead? That would give us a
handle to a regmap that can be consumed in e.g. the thermal driver.

I think this use case is exactly why that was introduced.

Regards,
Bjorn
