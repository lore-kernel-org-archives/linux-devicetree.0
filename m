Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A692C432C3
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 17:04:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A9A220848
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 17:04:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727565AbfLBREi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 12:04:38 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42311 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727695AbfLBREi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 12:04:38 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1ibp7T-0007aM-Ct; Mon, 02 Dec 2019 18:04:19 +0100
Message-ID: <449968d8f085a1d1fcf4018bb8efe454fa35b3e3.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] reset: hisilicon: Extend reset operation type
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Jun Nie <jun.nie@linaro.org>, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        xuwei5@hisilicon.com, opensource@jilayne.com, swinslow@gmail.com,
        allison@lohutok.net, yuehaibing@huawei.com, tglx@linutronix.de,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, xuejiancheng@hisilicon.com
Date:   Mon, 02 Dec 2019 18:04:19 +0100
In-Reply-To: <20191202144524.5391-3-jun.nie@linaro.org>
References: <20191202144524.5391-1-jun.nie@linaro.org>
         <20191202144524.5391-3-jun.nie@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 2019-12-02 at 22:45 +0800, Jun Nie wrote:
> Extend reset operations to support combination of three type flags:
> ASSERT/DEASSERT SET/CLEAR POLL.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/clk/hisilicon/reset.c | 58 ++++++++++++++++++++++++++++++++---
>  1 file changed, 53 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/reset.c
> index 93cee17db8b1..de7d186b0894 100644
> --- a/drivers/clk/hisilicon/reset.c
> +++ b/drivers/clk/hisilicon/reset.c
> @@ -2,20 +2,25 @@
>  /*
>   * Hisilicon Reset Controller Driver
>   *
> - * Copyright (c) 2015-2016 HiSilicon Technologies Co., Ltd.
> + * Copyright (c) 2015-2019 HiSilicon Technologies Co., Ltd.
>   */
>  
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset-controller.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +
> +#include <dt-bindings/reset/hisilicon-resets.h>
>  #include "reset.h"
>  
>  #define	HISI_RESET_BIT_MASK	0x1f
>  #define	HISI_RESET_OFFSET_SHIFT	8
>  #define	HISI_RESET_OFFSET_MASK	0xffff00
> +#define	HISI_RESET_FLAG_SHIFT	24
> +#define	HISI_RESET_FLAG_MASK	0xff000000
>  
>  struct hisi_reset_controller {
>  	spinlock_t	lock;
> @@ -30,14 +35,17 @@ struct hisi_reset_controller {
>  static int hisi_reset_of_xlate(struct reset_controller_dev *rcdev,
>  			const struct of_phandle_args *reset_spec)
>  {
> +	unsigned long flags;
>  	u32 offset;
>  	u8 bit;
>  
> +	flags = (reset_spec->args[2] << HISI_RESET_FLAG_SHIFT)
> +		& HISI_RESET_FLAG_MASK;
>  	offset = (reset_spec->args[0] << HISI_RESET_OFFSET_SHIFT)
>  		& HISI_RESET_OFFSET_MASK;
>  	bit = reset_spec->args[1] & HISI_RESET_BIT_MASK;
>  
> -	return (offset | bit);
> +	return (flags | offset | bit);
>  }
>  
>  static int hisi_reset_assert(struct reset_controller_dev *rcdev,
> @@ -48,13 +56,33 @@ static int hisi_reset_assert(struct reset_controller_dev *rcdev,
>  	u32 offset, reg;
>  	u8 bit;
>  
> +	flags = (id & HISI_RESET_FLAG_MASK) >> HISI_RESET_FLAG_SHIFT;
> +	if (flags & HISI_ASSERT_NONE)
> +		return -ENOTSUPP; /* assert not supported for this reset */

As long as .assert and .deassert are the only implemented operations for
this reset controller, this does not make any sense to me. Are there
resets that can only be deasserted?

> +
>  	offset = (id & HISI_RESET_OFFSET_MASK) >> HISI_RESET_OFFSET_SHIFT;
>  	bit = id & HISI_RESET_BIT_MASK;
>  
> +	pr_devel("%s %s to %s 0x%x:bit[%d]\n", __func__,
> +		flags & HISI_ASSERT_POLL ? "poll" : "",
> +		flags & HISI_ASSERT_SET ? "set":"clear", offset, bit);
> +
> +	if (flags & HISI_ASSERT_POLL) {

Since HISI_ASSERT_POLL is 0, this is always false.

> +		if (flags & HISI_ASSERT_SET)
> +			return readl_poll_timeout(rstc->membase + offset,
> +						  reg, reg & BIT(bit), 0, 5000);
> +		else
> +			return readl_poll_timeout(rstc->membase + offset,
> +						  reg, !(reg & BIT(bit)),
> +						  0, 5000);

And this is effectively dead code. Do you really have hardware that
asserts or asserts a reset line in reaction to a read access?

Should HISI_ASSERT_POLL and HISI_DEASSERT_POLL be mutually exclusive?

> +	}
> +
>  	spin_lock_irqsave(&rstc->lock, flags);
>  
>  	reg = readl(rstc->membase + offset);
> -	writel(reg | BIT(bit), rstc->membase + offset);
> +	/* Default is setting to assert for no flag case. */
> +	reg = (flags & HISI_ASSERT_CLEAR) ? reg & ~BIT(bit) : reg | BIT(bit);

Consider moving this into a helper function with a boolean set/clear
parameter.

As long as HISI_ASSERT_CLEAR is 0, the first branch is dead code.

> +	writel(reg, rstc->membase + offset);
>  
>  	spin_unlock_irqrestore(&rstc->lock, flags);
>  
> @@ -69,13 +97,33 @@ static int hisi_reset_deassert(struct reset_controller_dev *rcdev,
>  	u32 offset, reg;
>  	u8 bit;
>  
> +	flags = (id & HISI_RESET_FLAG_MASK) >> HISI_RESET_FLAG_SHIFT;
> +	if (flags & HISI_DEASSERT_NONE)
> +		return -ENOTSUPP; /* deassert not supported for this reset */
> +

Are there resets that can only ever be asserted?

>  	offset = (id & HISI_RESET_OFFSET_MASK) >> HISI_RESET_OFFSET_SHIFT;
>  	bit = id & HISI_RESET_BIT_MASK;
>  
> +	pr_devel("%s %s to %s 0x%x:bit[%d]\n", __func__,
> +		flags & HISI_DEASSERT_POLL ? "poll" : "",
> +		flags & HISI_DEASSERT_SET ? "clear":"set", offset, bit);
> +
> +	if (flags & HISI_DEASSERT_POLL) {
> +		if (flags & HISI_DEASSERT_SET)
> +			return readl_poll_timeout(rstc->membase + offset,
> +						  reg, reg & BIT(bit), 0, 5000);
> +		else
> +			return readl_poll_timeout(rstc->membase + offset,
> +						  reg, !(reg & BIT(bit)),
> +						  0, 5000);

See above, this code currently can never be reached.

> +	}
> +
>  	spin_lock_irqsave(&rstc->lock, flags);
>  
>  	reg = readl(rstc->membase + offset);
> -	writel(reg & ~BIT(bit), rstc->membase + offset);
> +	/* Default is clearing to deasseart for no flag case. */
> +	reg = (flags & HISI_DEASSERT_SET) ? reg | BIT(bit) : reg & ~BIT(bit);

Same as above, the read-modify-write for set/clear could be split out
into a helper.

> +	writel(reg, rstc->membase + offset);
>  
>  	spin_unlock_irqrestore(&rstc->lock, flags);
>  
> @@ -103,7 +151,7 @@ struct hisi_reset_controller *hisi_reset_init(struct platform_device *pdev)
>  	rstc->rcdev.owner = THIS_MODULE;
>  	rstc->rcdev.ops = &hisi_reset_ops;
>  	rstc->rcdev.of_node = pdev->dev.of_node;
> -	rstc->rcdev.of_reset_n_cells = 2;
> +	rstc->rcdev.of_reset_n_cells = 3;

This breaks current device trees (before patch 3). You can make sure
device trees with #reset-cells = <2> keep working by parsing the #reset-
cells and setting this value to 2 for old DTs.

>  	rstc->rcdev.of_xlate = hisi_reset_of_xlate;
>  	reset_controller_register(&rstc->rcdev);

regards
Philipp

