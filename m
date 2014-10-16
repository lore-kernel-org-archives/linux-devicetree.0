From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3 1/3] power-domain: add power domain drivers for
 Rockchip platform
Date: Thu, 16 Oct 2014 15:06:16 +0200
Message-ID: <CAPDyKFoHkr-Z3PY0tTw9BPF8gJY_bVLtJL2KK7_uoq_008ymnw@mail.gmail.com>
References: <1413457353-4222-1-git-send-email-jinkun.hong@rock-chips.com>
	<1413457353-4222-2-git-send-email-jinkun.hong@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413457353-4222-2-git-send-email-jinkun.hong@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "jinkun.hong" <jinkun.hong@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Jack Dai <jack.dai@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Hi Jinkun,

[...]

> +
> +static int rockchip_pd_power_on(struct generic_pm_domain *domain)
> +{
> +       int ret = 0;
> +       struct rockchip_domain *pd = to_rockchip_pd(domain);
> +
> +       if (pd->dev == NULL)
> +               pr_err("pd->dev is NULL, power on failed!", __func__);
> +
> +       pm_clk_resume(pd->dev);
> +       ret = rockchip_pmu_set_power_domain(pd, true);
> +       pm_clk_suspend(pd->dev);
> +
> +       return ret;
> +}
> +
> +static int rockchip_pd_power_off(struct generic_pm_domain *domain)
> +{
> +       int ret = 0;
> +       struct rockchip_domain *pd = to_rockchip_pd(domain);
> +
> +       if (pd->dev == NULL)
> +               pr_err("pd->dev is NULL, power off failed!", __func__);
> +
> +       pm_clk_resume(pd->dev);
> +       ret = rockchip_pmu_set_power_domain(pd, false);
> +       pm_clk_suspend(pd->dev);
> +
> +       return 0;
> +}
> +
> +void rockchip_pm_domain_attach_dev(struct device *dev)
> +{
> +       struct clk *clk;
> +       int ret;
> +       int i = 0;
> +       struct rockchip_domain *pd;
> +
> +       pd = (struct rockchip_domain *)dev->pm_domain;
> +       pd->dev = dev;

This looks wrong.

You will update "pd->dev" for each device that gets added to the PM
domain. The last one will be set to "pd->dev".
So, it would still work as long as you only have one device per
domain. Is that the case?

Could you elaborate on why you have chosen to do it this way?

> +
> +       ret = pm_clk_create(dev);
> +       if (ret) {
> +               dev_err(dev, "pm_clk_create failed %d\n", ret);
> +               return;
> +       };
> +
> +       while ((clk = of_clk_get(dev->of_node, i++)) && !IS_ERR(clk)) {
> +               ret = pm_clk_add_clk(dev, clk);
> +               if (ret) {
> +                       dev_err(dev, "pm_clk_add_clk failed %d\n", ret);
> +                       goto clk_err;
> +               };
> +       }
> +
> +       if (!IS_ENABLED(CONFIG_PM_RUNTIME)) {

Could you elaborate on why you need to do this check here?

When I see a check for IS_ENABLED(CONFIG_PM_RUNTIME), that indicates
to me that we actually have an another issue, perhaps in the PM clk
API.

> +               ret = pm_clk_resume(dev);
> +               if (ret) {
> +                       dev_err(dev, "pm_clk_resume failed %d\n", ret);
> +                       goto clk_err;
> +               };
> +       }
> +       return;
> +
> +clk_err:
> +       pm_clk_destroy(dev);
> +
> +}
> +
> +void rockchip_pm_domain_detach_dev(struct device *dev)
> +{
> +       struct rockchip_domain *pd;
> +
> +       pd = (struct rockchip_domain *)dev->pm_domain;
> +       pd->dev = NULL;
> +
> +       pm_clk_destroy(dev);
> +}
> +

[...]

Kind regards
Uffe
