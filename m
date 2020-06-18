Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D030EC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 18:46:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD987208DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 18:46:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P4LNQCpx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbgFRSqB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 14:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729118AbgFRSqA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Jun 2020 14:46:00 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE24EC0613ED
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 11:45:58 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g10so6162161wmh.4
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 11:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=om0q/0j+ZqIugQgaYYIuFIhrC2pXMmtAQ/IXYYyteLk=;
        b=P4LNQCpxRN8jCvdEjmGgNPLfQuIQ7KZuO5ExMbN7DTYZY2tsLbyMP2q0l0gYkSlD9u
         +p7svDC5EcuBVpD4M+r6rNupo6F/0dqcAa+2krVJTOePsmpmT+TF8f6R9Rupnvgk39Bv
         QlUvHpOz3JGN+Cm5foXSAvGMv59wReg1IuLMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=om0q/0j+ZqIugQgaYYIuFIhrC2pXMmtAQ/IXYYyteLk=;
        b=CuLmBJ2YSP5JchZl0TyjyDpg4UCAMBjGqSgD5aBMPTR1q76TJ107ZZHX6VFp3lyEGN
         4uTS31FSWz7tCL+n96Se4SG0ZjPDGMG0hUD8KYgT6d2V/paOrEH8f/4n7fdG/8VkBHnf
         YXax/c4kan1qEpdmewEMzKhryo6272dxkF7zeAFETcB+Ems32RcFcdRW2W7uZUm+kajw
         l/Nqx0LRc2KtS0kZ3TgAhOsdGH17VakNwDIdnN/y0t+Z5um3IWIezSXurwRJdt1WyPp4
         3UfzOd/r+FVuZpGMfnguxkH8R2Tw9FYZ9UW/T7eIsLEy1aWI48WSezfc5JUlEBNONul3
         bF0A==
X-Gm-Message-State: AOAM533ycRvoLBZWtQPF3HT+0+Mm7N9jD19b1AK+A5V4T1XSXxHH/j/F
        R+LtWGNJ5Wo5roHdbuKqMKxuSg==
X-Google-Smtp-Source: ABdhPJxsKDOMgOezBCKzn3QqTjUHEzvRe1U6V8whyLVhKxoQ3O7dQu/6dQjOFtvoke2We8fHAwb8Xw==
X-Received: by 2002:a1c:f301:: with SMTP id q1mr5480382wmq.110.1592505957214;
        Thu, 18 Jun 2020 11:45:57 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id g18sm4511520wme.17.2020.06.18.11.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 11:45:56 -0700 (PDT)
Date:   Thu, 18 Jun 2020 18:45:54 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH V8 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200618184554.GA68039@chromium.org>
References: <20200616125531.31671-1-dongchun.zhu@mediatek.com>
 <20200616125531.31671-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616125531.31671-3-dongchun.zhu@mediatek.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 16, 2020 at 08:55:31PM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for DW9768 voice coil motor,
> providing control to set the desired focus via IIC serial interface.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                |   1 +
>  drivers/media/i2c/Kconfig  |  12 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/dw9768.c | 553 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 567 insertions(+)
>  create mode 100644 drivers/media/i2c/dw9768.c
[snip]
> +static int dw9768_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct dw9768 *dw9768;
> +	unsigned int i;
> +	int ret;
> +
> +	dw9768 = devm_kzalloc(dev, sizeof(*dw9768), GFP_KERNEL);
> +	if (!dw9768)
> +		return -ENOMEM;
> +
> +	/* Initialize subdev */
> +	v4l2_i2c_subdev_init(&dw9768->sd, client, &dw9768_ops);
> +
> +	dw9768->aac_mode = DW9768_AAC_MODE_DEFAULT;
> +	dw9768->aac_timing = DW9768_AAC_TIME_DEFAULT;
> +	dw9768->clock_presc = DW9768_CLOCK_PRE_SCALE_DEFAULT;
> +
> +	/* Optional indication of AAC mode select */
> +	fwnode_property_read_u32(dev_fwnode(dev), "dongwoon,aac-mode",
> +				 &dw9768->aac_mode);
> +
> +	/* Optional indication of clock pre-scale select */
> +	fwnode_property_read_u32(dev_fwnode(dev), "dongwoon,clock-presc",
> +				 &dw9768->clock_presc);
> +
> +	/* Optional indication of AAC Timing */
> +	fwnode_property_read_u32(dev_fwnode(dev), "dongwoon,aac-timing",
> +				 &dw9768->aac_timing);
> +
> +	dw9768->move_delay_us = dw9768_cal_move_delay(dw9768->aac_mode,
> +						      dw9768->clock_presc,
> +						      dw9768->aac_timing) / 100;

nit: Could we make the function return the value in us already? One would
expect the function to return the value in a standard unit, so this
division by 100 here is confusing.

> +
> +	for (i = 0; i < ARRAY_SIZE(dw9768_supply_names); i++)
> +		dw9768->supplies[i].supply = dw9768_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(dw9768_supply_names),
> +				      dw9768->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to get regulators\n");
> +		return ret;
> +	}
> +
> +	/* Initialize controls */
> +	ret = dw9768_init_controls(dw9768);
> +	if (ret)
> +		goto err_free_handler;
> +
> +	/* Initialize subdev */
> +	dw9768->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	dw9768->sd.internal_ops = &dw9768_int_ops;
> +
> +	ret = media_entity_pads_init(&dw9768->sd.entity, 0, NULL);
> +	if (ret < 0)
> +		goto err_free_handler;
> +
> +	dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
> +
> +	pm_runtime_enable(dev);
> +	if (!pm_runtime_enabled(dev)) {
> +		ret = dw9768_runtime_resume(dev);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to power on: %d\n", ret);
> +			goto err_clean_entity;
> +		}
> +	}
> +
> +	ret = v4l2_async_register_subdev(&dw9768->sd);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> +		goto err_power_off;
> +	}
> +
> +	return 0;
> +
> +err_power_off:
> +	pm_runtime_disable(dev);
> +	if (!pm_runtime_enabled(dev))

We just disabled runtime PM in the line above, so this check would be
always true. Need to call pm_runtime_disable() after this if.

> +		dw9768_runtime_suspend(dev);
> +err_clean_entity:
> +	media_entity_cleanup(&dw9768->sd.entity);
> +err_free_handler:
> +	v4l2_ctrl_handler_free(&dw9768->ctrls);
> +
> +	return ret;
> +}
> +
> +static int dw9768_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct dw9768 *dw9768 = sd_to_dw9768(sd);
> +
> +	v4l2_async_unregister_subdev(&dw9768->sd);
> +	v4l2_ctrl_handler_free(&dw9768->ctrls);
> +	media_entity_cleanup(&dw9768->sd.entity);
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_suspended(&client->dev))

Oops, I just realized that my suggestion about the function to use here
was incorrect. pm_runtime_status_suspended() should be the correct function
here. Sorry for the confusion.

This is because we only have 2 cases here:
 - runtime PM compiled out - the stubs function is used, which returns
   false, so the condition is true,
 - runtime PM compiled in - we enabled runtime PM in probe, so here we
   don't need to consider the enable state.

Best regards,
Tomasz
