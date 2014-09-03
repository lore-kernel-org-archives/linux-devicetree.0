From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH resend 1/4] clk: hix5hd2: add complex clk
Date: Wed, 03 Sep 2014 10:37:53 -0700
Message-ID: <20140903173753.11368.10916@quantum>
References: <1409031970-4821-1-git-send-email-zhangfei.gao@linaro.org>
 <1409031970-4821-2-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409031970-4821-2-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Zhangfei Gao (2014-08-25 22:46:07)
> +static int clk_ether_enable(struct clk_hw *hw)
> +{
> +       struct hix5hd2_clk_complex *clk = to_complex_clk(hw);
> +       u32 val;
> +
> +       val = readl_relaxed(clk->ctrl_reg);
> +       val |= clk->ctrl_clk_mask | clk->ctrl_rst_mask;
> +       writel_relaxed(val, clk->ctrl_reg);
> +       val &= ~(clk->ctrl_rst_mask);
> +       writel_relaxed(val, clk->ctrl_reg);
> +
> +       val = readl_relaxed(clk->phy_reg);
> +       val |= clk->phy_clk_mask;
> +       val &= ~(clk->phy_rst_mask);
> +       writel_relaxed(val, clk->phy_reg);
> +       mdelay(10);
> +
> +       val &= ~(clk->phy_clk_mask);
> +       val |= clk->phy_rst_mask;
> +       writel_relaxed(val, clk->phy_reg);
> +       mdelay(10);
> +
> +       val |= clk->phy_clk_mask;
> +       val &= ~(clk->phy_rst_mask);
> +       writel_relaxed(val, clk->phy_reg);
> +       mdelay(30);

With all of these mdelays, I wonder if you should use .prepare and
.unprepare instead? Does the Ethernet driver call clk_{en|dis}able from
interrupt context?

> +       return 0;
> +}
> +
> +static void clk_ether_disable(struct clk_hw *hw)
> +{
> +       struct hix5hd2_clk_complex *clk = to_complex_clk(hw);
> +       u32 val;
> +
> +       val = readl_relaxed(clk->ctrl_reg);
> +       val &= ~(clk->ctrl_clk_mask);
> +       writel_relaxed(val, clk->ctrl_reg);
> +}
> +
> +static struct clk_ops clk_ether_ops = {
> +       .enable = clk_ether_enable,
> +       .disable = clk_ether_disable,
> +};
> +
> +static int clk_complex_enable(struct clk_hw *hw)
> +{
> +       struct hix5hd2_clk_complex *clk = to_complex_clk(hw);
> +       u32 val;
> +
> +       val = readl_relaxed(clk->ctrl_reg);
> +       val |= clk->ctrl_clk_mask;
> +       val &= ~(clk->ctrl_rst_mask);
> +       writel_relaxed(val, clk->ctrl_reg);
> +
> +       val = readl_relaxed(clk->phy_reg);
> +       val |= clk->phy_clk_mask;
> +       val &= ~(clk->phy_rst_mask);
> +       writel_relaxed(val, clk->phy_reg);
> +
> +       return 0;
> +}
> +
> +static void clk_complex_disable(struct clk_hw *hw)
> +{
> +       struct hix5hd2_clk_complex *clk = to_complex_clk(hw);
> +       u32 val;
> +
> +       val = readl_relaxed(clk->ctrl_reg);
> +       val |= clk->ctrl_rst_mask;
> +       val &= ~(clk->ctrl_clk_mask);
> +       writel_relaxed(val, clk->ctrl_reg);
> +
> +       val = readl_relaxed(clk->phy_reg);
> +       val |= clk->phy_rst_mask;
> +       val &= ~(clk->phy_clk_mask);
> +       writel_relaxed(val, clk->phy_reg);
> +}
> +
> +static struct clk_ops clk_complex_ops = {
> +       .enable = clk_complex_enable,
> +       .disable = clk_complex_disable,
> +};

These enable/disable callbacks look good, with no delays.

Regards,
Mike
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
