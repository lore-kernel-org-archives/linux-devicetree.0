Return-Path: <SRS0=LTWd=4A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8EAC3B187
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 19:20:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E70A82082F
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 19:20:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C3Lsoyn5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbgBLTUO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Feb 2020 14:20:14 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52087 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727439AbgBLTUO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Feb 2020 14:20:14 -0500
Received: by mail-wm1-f68.google.com with SMTP id t23so3616353wmi.1
        for <devicetree@vger.kernel.org>; Wed, 12 Feb 2020 11:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=w2vUIwWwKNO9W2sNPZhxON5wWAtY54xt6hYbQaXFl94=;
        b=C3Lsoyn5QDDQ0zF8YP5O8Cs5MiIyNGYW6XmCECtu9pn4jgJuBgvViw/x1T6TiHOYlJ
         ITPiIdQv94eCEHaNtn5IyAV7RKJI5t8V2d+KJCbItO47jNfHBWEibc4TDOQw6YP1WMs2
         JfmhYh15x95k8tTRpFnTMf65L8m8wRvqGfnQeLuhS7Ca/iLdKcSjq2XVlio5cMuKowCv
         JgzhfWACrXEi1D4yFixxyXZSvYg3rER1L4VWxMbwR+K69s7fozLLR9Kuz/5ONjXNYdqX
         vDL7mUl1ipDp24Vmloq1+XwsAzGhUApRlwDPtUEQsAQuWat1246smrTEEzh61hkg1BU+
         89yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=w2vUIwWwKNO9W2sNPZhxON5wWAtY54xt6hYbQaXFl94=;
        b=T+sPv2bbhx5L2JieXy7wN9DIRM9SiCVM2NJDjTvbRiZPa8SwFZVENzDokaUCfiUq0q
         EBDBJ8S9xJeZeyfQVy/GaMzj6m9d5YB0aURNvdWhnCX27ojWfBr8AWdERFVBAdZQBX/1
         vuYmjg30CZ51HLAVg/H3txMZxmBkmZ5A1UsptKOXyO8NlVZT+7e1Z1HRVOZogoHWmUU7
         +C3NVYnwCMbecsqn8XBNyrIjj0y9qjHHvDmqXtRpROT/wsI2y80GoD8e3UBDLT77AmHA
         z5ixXkFGRk8Q4sTcsts3e/I2dqReeUpodc3YxJUZGD0qGwWUIlXsnxh5wJOaWiw9vEDV
         s88g==
X-Gm-Message-State: APjAAAU9cghVpyjOWPJVapQvAPmS2HSj5VmlWnWznJWhQtiNe5+dBw19
        jlppiBxQVFMUzSXwe1oKrrMVGg==
X-Google-Smtp-Source: APXvYqyygMuL3xXUwHmWcxx8LC0FgEJdgazLThKiWvettER0LJVOoaKkPD7RUT+2XkI9CALO1U1k3w==
X-Received: by 2002:a7b:ce18:: with SMTP id m24mr550702wmc.123.1581535210701;
        Wed, 12 Feb 2020 11:20:10 -0800 (PST)
Received: from linaro.org (14.red-88-14-208.dynamicip.rima-tde.net. [88.14.208.14])
        by smtp.gmail.com with ESMTPSA id b13sm2032614wrn.9.2020.02.12.11.20.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 11:20:10 -0800 (PST)
Date:   Wed, 12 Feb 2020 20:20:06 +0100
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux@armlinux.org.uk, p.paillet@st.com, linus.walleij@linaro.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, fabrice.gasnier@st.com,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v3 2/2] clocksource: Add Low Power STM32 timers driver
Message-ID: <20200212192006.GB2949@linaro.org>
References: <20200128120702.26166-1-benjamin.gaignard@st.com>
 <20200128120702.26166-3-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200128120702.26166-3-benjamin.gaignard@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Benjamin,

On Tue, Jan 28, 2020 at 01:07:02PM +0100, Benjamin Gaignard wrote:
> From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> 
> Implement clock event driver using low power STM32 timers.
> Low power timers counter s running even in when CPU is in stop mode.

Can you fix the sentence above?

> It could be used as clock event broadcaster to wake up CPUs but not like
> a clocksource because each it rise an interrupt the counter restart from 0.

Please give a description of the timer (eg. e37e45934afed).
 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Signed-off-by: Pascal Paillet <p.paillet@st.com>
> ---
> version 3:
> - fix timer set sequence
> - don't forget to free irq on remove function
> - use devm_kzalloc to simplify errors handling in probe function
> 
>  drivers/clocksource/Kconfig          |   4 +
>  drivers/clocksource/Makefile         |   1 +
>  drivers/clocksource/timer-stm32-lp.c | 248 +++++++++++++++++++++++++++++++++++
>  3 files changed, 253 insertions(+)
>  create mode 100644 drivers/clocksource/timer-stm32-lp.c
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 5fdd76cb1768..d9d06c14777d 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -292,6 +292,10 @@ config CLKSRC_STM32
>  	select CLKSRC_MMIO
>  	select TIMER_OF
>  
> +config CLKSRC_STM32_LP
> +	bool "Low power clocksource for STM32 SoCs"

(silent option)

> +	depends on OF && ARM && (MACH_STM32MP157 || COMPILE_TEST)

Do you really want to make this option? This timer belongs to a mfd, so if the
mfd is enabled it should enable the timer also, no ?

> +
>  config CLKSRC_MPS2
>  	bool "Clocksource for MPS2 SoCs" if COMPILE_TEST
>  	depends on GENERIC_SCHED_CLOCK
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index 4dfe4225ece7..c6eef37be9cc 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_BCM_KONA_TIMER)	+= bcm_kona_timer.o
>  obj-$(CONFIG_CADENCE_TTC_TIMER)	+= timer-cadence-ttc.o
>  obj-$(CONFIG_CLKSRC_EFM32)	+= timer-efm32.o
>  obj-$(CONFIG_CLKSRC_STM32)	+= timer-stm32.o
> +obj-$(CONFIG_CLKSRC_STM32_LP)	+= timer-stm32-lp.o
>  obj-$(CONFIG_CLKSRC_EXYNOS_MCT)	+= exynos_mct.o
>  obj-$(CONFIG_CLKSRC_LPC32XX)	+= timer-lpc32xx.o
>  obj-$(CONFIG_CLKSRC_MPS2)	+= mps2-timer.o
> diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
> new file mode 100644
> index 000000000000..b6de1ca9e115
> --- /dev/null
> +++ b/drivers/clocksource/timer-stm32-lp.c
> @@ -0,0 +1,248 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
> + * Authors: Benjamin Gaignard <benjamin.gaignard@st.com> for STMicroelectronics.
> + *	    Pascal Paillet <p.paillet@st.com> for STMicroelectronics.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clocksource.h>
> +#include <linux/clockchips.h>
> +#include <linux/delay.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/stm32-lptimer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

Please check the headers above, all are not needed IMO.

> +#define LPTIM_ICR		0x04
> +#define ICR_ARRMCF		BIT(1)
> +
> +#define LPTIM_IER		0x08
> +#define IER_ARRMIE		BIT(1)
> +
> +#define LPTIM_CFGR		0x0C
> +#define CFGR_PSC_OFFSET		9
> +
> +#define LPTIM_CR		0x10
> +#define CR_ENABLE		BIT(0)
> +#define CR_SNGSTRT		BIT(1)
> +#define CR_CNTSTRT		BIT(2)
> +
> +#define LPTIM_CMP		0x14
> +#define LPTIM_ARR		0x18
> +
> +#define STM32_LP_BITS		16
> +#define STM32_LP_RATING		400
> +#define STM32_CLKRATE		(32000 * HZ)
> +#define TIMER_MAX_VAL		(BIT(STM32_LP_BITS) - 1)

STM32 prefix missing

> +#define STM32_LP_MAX_PSC	7
> +
> +struct stm32_lp_private {
> +	struct regmap *reg;
> +	struct clk *clk;
> +	struct clock_event_device clkevt;
> +	unsigned long rate;

This field can be saved if the parameter is passed to the set_prescalar
function.

> +	unsigned long period;
> +};
> +
> +static struct stm32_lp_private*
> +to_priv(struct clock_event_device *clkevt)
> +{
> +	return container_of(clkevt, struct stm32_lp_private, clkevt);
> +}
> +
> +static int stm32_clkevent_lp_shutdown(struct clock_event_device *clkevt)
> +{
> +	struct stm32_lp_private *priv = to_priv(clkevt);
> +
> +	regmap_write(priv->reg, LPTIM_CR, 0);
> +	regmap_write(priv->reg, LPTIM_IER, 0);
> +	/* clear pending flags */
> +	regmap_write(priv->reg, LPTIM_ICR, ICR_ARRMCF);
> +
> +	return 0;
> +}
> +
> +static int stm32_clkevent_lp_set_timer(unsigned long evt,
> +				       struct clock_event_device *clkevt,
> +				       int is_periodic)
> +{
> +	struct stm32_lp_private *priv = to_priv(clkevt);
> +
> +	/* disable TIMER */
> +	regmap_write(priv->reg, LPTIM_CR, 0);
> +	/* enable ARR interrupt */
> +	regmap_write(priv->reg, LPTIM_IER, IER_ARRMIE);
> +	/* enable LPTIMER*/
> +	regmap_write(priv->reg, LPTIM_CR, CR_ENABLE);
> +	/* set nex event counter */
> +	regmap_write(priv->reg, LPTIM_ARR, evt);
> +	/* reset counter */
> +	regmap_write(priv->reg, LPTIM_CMP, 0);
> +
> +	/* start counter */
> +	if (is_periodic)
> +		regmap_write(priv->reg, LPTIM_CR, CR_CNTSTRT | CR_ENABLE);
> +	else
> +		regmap_write(priv->reg, LPTIM_CR, CR_SNGSTRT | CR_ENABLE);

Please merge all these calls to regmap_write into a single one to reduce
contention.

> +	return 0;
> +}
> +
> +static int stm32_clkevent_lp_set_next_event(unsigned long evt,
> +					    struct clock_event_device *clkevt)
> +{
> +	return stm32_clkevent_lp_set_timer(evt, clkevt,
> +					   clockevent_state_periodic(clkevt));
> +}
> +
> +static int stm32_clkevent_lp_set_periodic(struct clock_event_device *clkevt)
> +{
> +	struct stm32_lp_private *priv = to_priv(clkevt);
> +
> +	return stm32_clkevent_lp_set_timer(priv->period, clkevt, true);
> +}
> +
> +static int stm32_clkevent_lp_set_oneshot(struct clock_event_device *clkevt)
> +{
> +	struct stm32_lp_private *priv = to_priv(clkevt);
> +
> +	return stm32_clkevent_lp_set_timer(priv->period, clkevt, false);
> +}
> +
> +static irqreturn_t stm32_clkevent_lp_irq_handler(int irq, void *dev_id)
> +{
> +	struct clock_event_device *clkevt = (struct clock_event_device *)dev_id;
> +	struct stm32_lp_private *priv = to_priv(clkevt);
> +
> +	regmap_write(priv->reg, LPTIM_ICR, ICR_ARRMCF);
> +
> +	clkevt->event_handler(clkevt);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/**

This is a kerneldoc format

> + * stm32_clkevent_lp_set_prescaler - Compute and set the prescaler register
> + * @priv: a pointer to a timer-of structure
> + *
> + * Compute the prescaler to always target a 32Khz timer rate
> + */

Given these are static callbacks, you can drop the function description by
moving it to a comment in the function. 

> +static void stm32_clkevent_lp_set_prescaler(struct stm32_lp_private *priv)
> +{
> +	int i;
> +
> +	for (i = 0; i <= STM32_LP_MAX_PSC; i++) {
> +		if (DIV_ROUND_CLOSEST(priv->rate, 1 << i) < STM32_CLKRATE)
> +			break;
> +	}
> +
> +	regmap_write(priv->reg, LPTIM_CFGR, i << CFGR_PSC_OFFSET);
> +
> +	/* Adjust rate and period given the prescaler value */
> +	priv->rate = DIV_ROUND_CLOSEST(priv->rate, (1 << i));
> +	priv->period = DIV_ROUND_UP(priv->rate, HZ);
> +}
> +
> +static int stm32_clkevent_lp_init(struct stm32_lp_private *priv,
> +				  struct device_node *np)
> +{
> +	int ret;
> +
> +	priv->clkevt.name = np->full_name;
> +	priv->clkevt.cpumask = cpu_possible_mask;
> +	priv->clkevt.features = CLOCK_EVT_FEAT_PERIODIC |
> +				CLOCK_EVT_FEAT_ONESHOT;
> +	priv->clkevt.set_state_shutdown = stm32_clkevent_lp_shutdown;
> +	priv->clkevt.set_state_periodic = stm32_clkevent_lp_set_periodic;
> +	priv->clkevt.set_state_oneshot = stm32_clkevent_lp_set_oneshot;
> +	priv->clkevt.set_next_event = stm32_clkevent_lp_set_next_event;
> +	priv->clkevt.rating = STM32_LP_RATING;
> +
> +	priv->clkevt.irq = irq_of_parse_and_map(np, 0);
> +	if (!priv->clkevt.irq)
> +		return -EINVAL;
> +
> +	ret = request_irq(priv->clkevt.irq, stm32_clkevent_lp_irq_handler,
> +			  IRQF_TIMER, np->full_name, &priv->clkevt);
> +	if (ret)
> +		return ret;

May be move the node parsing to the 'probe' function and use demv_request_irq
(or use timer-of)?

Pass the timer name as parameter to this function?

> +
> +	clockevents_config_and_register(&priv->clkevt, priv->rate, 0x1,
> +					TIMER_MAX_VAL);
> +
> +	return 0;
> +}
> +
> +static int stm32_clkevent_lp_probe(struct platform_device *pdev)
> +{
> +	struct stm32_lptimer *ddata = dev_get_drvdata(pdev->dev.parent);
> +	struct stm32_lp_private *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->reg = ddata->regmap;
> +	priv->clk = ddata->clk;
> +	ret = clk_prepare_enable(priv->clk);
> +	if (ret)
> +		return -EINVAL;
> +
> +	priv->rate = clk_get_rate(priv->clk);
> +	if (!priv->rate)
> +		goto out_clk_disable;
> +
> +	stm32_clkevent_lp_set_prescaler(priv);
> +
> +	ret = stm32_clkevent_lp_init(priv, pdev->dev.parent->of_node);
> +	if (ret)
> +		goto out_clk_disable;
> +
> +	platform_set_drvdata(pdev, priv);

See if this is needed given the comment below about the removal.

> +	return 0;
> +
> +out_clk_disable:
> +	clk_disable_unprepare(priv->clk);
> +
> +	return -EINVAL;
> +}
> +
> +static int stm32_clkevent_lp_remove(struct platform_device *pdev)
> +{
> +	struct stm32_lp_private *priv = platform_get_drvdata(pdev);
> +
> +	clk_disable_unprepare(priv->clk);
> +	free_irq(priv->clkevt.irq, &priv->clkevt);
> +
> +	return 0;
> +}

This is broken IMO, the time framework will continue considering the previously
registered clockevent as available. You should consider converting the mfd to a
bool instead of a tristate (and remove the dead code).

> +static const struct of_device_id stm32_clkevent_lp_of_match[] = {
> +	{ .compatible = "st,stm32-clkevent-lp", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, stm32_clkevent_lp_of_match);
> +
> +static struct platform_driver stm32_clkevent_lp_driver = {
> +	.probe	= stm32_clkevent_lp_probe,
> +	.remove = stm32_clkevent_lp_remove,
> +	.driver	= {
> +		.name = "stm32-clkevent-lp",
> +		.of_match_table = of_match_ptr(stm32_clkevent_lp_of_match),
> +	},
> +};
> +module_platform_driver(stm32_clkevent_lp_driver);
> +
> +MODULE_ALIAS("platform:stm32-clkevent-lp");
> +MODULE_DESCRIPTION("STMicroelectronics STM32 clockevent LP driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.15.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
