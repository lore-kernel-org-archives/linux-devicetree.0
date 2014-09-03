From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH 06/12] clk: mmp: add mmp private gate clock
Date: Wed, 03 Sep 2014 10:55:37 -0700
Message-ID: <20140903175537.11368.98589@quantum>
References: <1409027904-21859-1-git-send-email-chao.xie@marvell.com>
 <1409027904-21859-7-git-send-email-chao.xie@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409027904-21859-7-git-send-email-chao.xie@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chao Xie <chao.xie@marvell.com>, haojian.zhuang@gmail.com, haojian.zhuang@linaro.orgchao.xie@marvell.com, xiechao_mail@163.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Chao Xie (2014-08-25 21:38:18)
> From: Chao Xie <chao.xie@marvell.com>
> 
> Some SOCes have this kind of the gate clock
> 1. There are some bits to control the gate not only one bit.
> 2. Some clocks has operations of "out of reset" and "enable".
>    To enable clock, we need do "out of reset" and "enable".
>    To disable clock, we may not need "set to reset". It depends
>    on the SOCes' design.

Are there any other IP blocks affected by the "out of reset" and "set to
reset" states? I wonder if you might benefit from the reset controller
framework?  For example see,

drivers/clk/qcom/gcc-apq8084.c

<snip>

> +static int mmp_clk_gate_enable(struct clk_hw *hw)
> +{
> +       struct mmp_clk_gate *gate = to_clk_mmp_gate(hw);
> +       struct clk *clk = hw->clk;
> +       unsigned long flags = 0;
> +       unsigned long rate;
> +       u32 tmp;
> +
> +       if (gate->lock)
> +               spin_lock_irqsave(gate->lock, flags);
> +
> +       tmp = readl(gate->reg);
> +       tmp &= ~gate->mask;
> +       tmp |= gate->val_enable;
> +       writel(tmp, gate->reg);
> +
> +       if (gate->lock)
> +               spin_unlock_irqrestore(gate->lock, flags);
> +
> +       if (gate->flags & MMP_CLK_GATE_NEED_DELAY) {
> +               rate = __clk_get_rate(clk);
> +               /* Need delay 2 cycles. */
> +               udelay(2000000/rate);

How long are these delays? Long enough to warrant using clk_prepare
instead of clk_enable? Are these clocks enabled from interrupt context?

Regards,
Mike
