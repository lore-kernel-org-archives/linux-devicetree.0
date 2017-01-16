From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 3/3] reset: zx2967: add reset controller driver for
 ZTE's zx2967 family
Date: Mon, 16 Jan 2017 15:58:36 +0800
Message-ID: <20170116075835.GB11600@x250>
References: <1484377530-30635-1-git-send-email-baoyou.xie@linaro.org>
 <1484377530-30635-3-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1484377530-30635-3-git-send-email-baoyou.xie@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: jun.nie@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xie.baoyou@zte.com.cn, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-Id: devicetree@vger.kernel.org

On Sat, Jan 14, 2017 at 03:05:30PM +0800, Baoyou Xie wrote:
> +static int zx2967_reset_assert(struct reset_controller_dev *rcdev,
> +			   unsigned long id)
> +{
> +	struct zx2967_reset *reset = NULL;
> +	int bank = id / 32;
> +	int offset = id % 32;
> +	unsigned int reg;

u32 is probably better for register value.

> +	unsigned long flags;
> +
> +	reset = container_of(rcdev, struct zx2967_reset, rcdev);
> +
> +	spin_lock_irqsave(&reset->lock, flags);
> +
> +	reg = readl(reset->reg_base + (bank * 4));
> +	writel(reg & ~BIT(offset), reset->reg_base + (bank * 4));
> +	reg = readl(reset->reg_base + (bank * 4));

Is this read on the register is necessary?  If so, we should probably
have a comment for that.

> +
> +	spin_unlock_irqrestore(&reset->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int zx2967_reset_deassert(struct reset_controller_dev *rcdev,
> +			     unsigned long id)

Please indent the line right after parentheses.

> +{
> +	struct zx2967_reset *reset = NULL;
> +	int bank = id / 32;
> +	int offset = id % 32;
> +	unsigned int reg;
> +	unsigned long flags;
> +
> +	reset = container_of(rcdev, struct zx2967_reset, rcdev);
> +
> +	spin_lock_irqsave(&reset->lock, flags);
> +
> +	reg = readl(reset->reg_base + (bank * 4));
> +	writel(reg | BIT(offset), reset->reg_base + (bank * 4));
> +	reg = readl(reset->reg_base + (bank * 4));
> +
> +	spin_unlock_irqrestore(&reset->lock, flags);
> +
> +	return 0;
> +}

Only difference between these two functions is only one line.  Should we
consolidate them a bit?

Shawn
