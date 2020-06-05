Return-Path: <SRS0=PVp5=7S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9973AC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 13:10:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72585206DB
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 13:10:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F4Lgik0u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgFENKR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 5 Jun 2020 09:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbgFENKQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Jun 2020 09:10:16 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B002FC08C5C2
        for <devicetree@vger.kernel.org>; Fri,  5 Jun 2020 06:10:15 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id l11so9733230wru.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2020 06:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ONcVi0Nh167uW5jvnDAvvL/9nwO9qJvjZBb+j6gK/m0=;
        b=F4Lgik0u6LwAU6Xf/6ApIw5It56BB+9tgE/OPpOJgLbUAtNYveMx4QPaScdOxL1Thc
         RpJYQRZYjDuW2mc+1HKFtdJ9+uQlGvj0JhsyXDCKzS0WP9TCv/B+IOzx0DhE1GbQZlJj
         FNwuohFAfHvUMOI8uAtrUY7s4RV6bFNs2MGic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ONcVi0Nh167uW5jvnDAvvL/9nwO9qJvjZBb+j6gK/m0=;
        b=D4G0iYe6zfmf4IcKdVHL5FErfWnB6qqS18LqlayQlbvoGNyIR1gVIa9xre4oEqCEg4
         iPpVd4Uf/WLzFU9dQMjrA6iy0UqvxjtsUimjwiIryGUSdIAxPf5O1G6PAZkWUGJq0Zh7
         N912SXfXUKG80t4fUXf9HzskIJe06BkGfQYnnXulie3M/3I0NCuxv4SDIutFRwivbRBh
         VeWYNaDWsoPfnrrulDbo+nACAV9KJe8Mezn6ItQaTKoNRHif1JH/sAH/tGwp5/vrpaQp
         RtqNeOYCCEUXoPdL9+ySMAmifq43FCeQiG4ws/pCVMJxDsoXU65UxJuRZ9ohUv4Es1pm
         gB4g==
X-Gm-Message-State: AOAM530749j6BL2X3tl37MWlqRr8jz7fYVU7+9f7kEVS4M+HPhpGHrqv
        gXEjktHWosKVWEpjIXYT+GN+pXbRVAwkrw==
X-Google-Smtp-Source: ABdhPJxJLqnn0pRDZBM6sQWKB2YTytCBH8ALuyDGR/E1riv2Tvgz1fQv5KSxHLfxrKw0SsgRZUUGkQ==
X-Received: by 2002:adf:ec0a:: with SMTP id x10mr9431590wrn.130.1591362614372;
        Fri, 05 Jun 2020 06:10:14 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id b14sm11311111wmj.47.2020.06.05.06.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 06:10:13 -0700 (PDT)
Date:   Fri, 5 Jun 2020 13:10:12 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, sakari.ailus@linux.intel.com,
        drinkcat@chromium.org, matthias.bgg@gmail.com,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200605131012.GB6303@chromium.org>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-3-dongchun.zhu@mediatek.com>
 <20200605124643.GG2428291@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605124643.GG2428291@smile.fi.intel.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Andy,

On Fri, Jun 05, 2020 at 03:46:43PM +0300, Andy Shevchenko wrote:
> On Fri, Jun 05, 2020 at 06:54:12PM +0800, Dongchun Zhu wrote:
> > Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> > control to set the desired focus via IIC serial interface.
> 
> ...
> 
> > +config VIDEO_DW9768
> > +	tristate "DW9768 lens voice coil support"
> > +	depends on I2C && VIDEO_V4L2
> 
> No compile test?
> 
> > +	depends on PM
> 
> This is very strange dependency for ordinary driver.
> 
> > +	select MEDIA_CONTROLLER
> > +	select VIDEO_V4L2_SUBDEV_API
> > +	select V4L2_FWNODE
> 
> ...
> 
> > +/*
> > + * DW9768 requires waiting time (delay time) of t_OPR after power-up,
> > + * or in the case of PD reset taking place.
> > + */
> > +#define DW9768_T_OPR_US				1000
> > +#define DW9768_Tvib_MS_BASE10			(64 - 1)
> > +#define DW9768_AAC_MODE_DEFAULT			2
> 
> > +#define DW9768_AAC_TIME_DEFAULT			0x20
> 
> Hex? Why not decimal?
> 
> > +#define DW9768_CLOCK_PRE_SCALE_DEFAULT		1
> 
> ...
> 
> > +static int dw9768_mod_reg(struct dw9768 *dw9768, u8 reg, u8 mask, u8 val)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> > +	int ret;
> > +
> > +	ret = i2c_smbus_read_byte_data(client, reg);
> > +	if (ret < 0)
> > +		return ret;
> > +
> 
> > +	val = ((unsigned char)ret & ~mask) | (val & mask);
> 
> This cast is weird.
> 
> > +
> > +	return i2c_smbus_write_byte_data(client, reg, val);
> > +}
> 
> ...
> 
> > +			dev_err(&client->dev, "%s I2C failure: %d",
> > +				__func__, ret);
> 
> One line?
> 
> ...
> 
> > +static int dw9768_release(struct dw9768 *dw9768)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> > +	u32 move_delay_us = dw9768_cal_move_delay(dw9768->aac_mode,
> > +						  dw9768->clock_presc,
> > +						  dw9768->aac_timing) / 100;
> > +	int ret, val;
> > +
> > +	val = round_down(dw9768->focus->val, DW9768_MOVE_STEPS);
> > +	for ( ; val >= 0; val -= DW9768_MOVE_STEPS) {
> > +		ret = dw9768_set_dac(dw9768, val);
> > +		if (ret) {
> > +			dev_err(&client->dev, "I2C write fail: %d", ret);
> > +			return ret;
> > +		}
> > +		usleep_range(move_delay_us, move_delay_us + 1000);
> > +	}
> 
> 
> It will look more naturally in the multiplier kind of value.
> 
> 	unsigned int steps = DIV_ROUND_UP(...);
> 
> 	while (steps--) {
> 		...(..., steps * ..._MOVE_STEPS);
> 		...
> 	}
> 
> but double check arithmetics.
> 

First of all, thank for the review!

As for this particular change suggestion, I suspect this could be a
subjective thing, because for me the current code looks more naturally
and it's what the other VCM drivers do.

> > +	return 0;
> > +}
> 
> 
> Also it seems we need to have writex_poll_timeout() implementation (see
> iopoll.h).

What would it be supposed to do? readx_poll_timeout() repeats reading
the same registers and sleeping until a condition becomes true, which is
basically "polling". In this case we're not polling anything and we're
not writing the same value, but it's an explicit algorithm of this
driver to power down the VCM corectly.

However, given that it's quite common among VCMs to require this kind of
phased power down - we could indeed provide some V4L2 VCM helpers for open
and release.

Best regards,
Tomasz
