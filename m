From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 4/6] rtc: sun6i: Force the mux to the external oscillator
Date: Sat, 21 Jan 2017 11:53:08 +0800
Message-ID: <CAGb2v650f-4RZ6RrRBGcmPz8mJ4KbJwTTj6=w3HeSWUZtLAKcw@mail.gmail.com>
References: <cover.180d5ae6bc36ead9625d208824f5cbd7114cf92e.1484927680.git-series.maxime.ripard@free-electrons.com>
 <409c56f0ed1c4b0026ad60cb1218c99fe1686408.1484927680.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <409c56f0ed1c4b0026ad60cb1218c99fe1686408.1484927680.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Jan 20, 2017 at 11:56 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> The internal oscillator is way too inaccurate to do something useful with
> it. Switch to the external oscillator if it is available.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/rtc/rtc-sun6i.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index edd5627da10f..1695fae24cd5 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -493,6 +493,7 @@ static const struct rtc_class_ops sun6i_rtc_ops = {
>  static int sun6i_rtc_probe(struct platform_device *pdev)
>  {
>         struct sun6i_rtc_dev *chip = sun6i_rtc;
> +       struct clk *parent;
>         int ret;
>
>         if (!chip)
> @@ -540,6 +541,17 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
>         /* disable alarm wakeup */
>         writel(0, chip->base + SUN6I_ALARM_CONFIG);
>
> +       parent = clk_get(&pdev->dev, NULL);
> +       if (!IS_ERR(parent)) {
> +               ret = clk_set_parent(chip->losc, parent);
> +               clk_put(parent);
> +
> +               if (ret) {
> +                       dev_err(&pdev->dev,
> +                               "Failed to reparent the RTC to the external oscillator\n");
> +                       return ret;
> +               }
> +       }

Following what I mentioned in patch 1, maybe it is easier to force
the mux before the clocks are registered by writing directly to
the registers? We could also backport the changes to stable?

ChenYu

>         clk_prepare_enable(chip->losc);
>
>         chip->rtc = rtc_device_register("rtc-sun6i", &pdev->dev,
> --
> git-series 0.8.11
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
