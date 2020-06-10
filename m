Return-Path: <SRS0=7bfi=7X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EA3C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Jun 2020 19:45:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 326E6206F7
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Jun 2020 19:45:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GePbnpgV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgFJTpA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 10 Jun 2020 15:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727773AbgFJTpA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 10 Jun 2020 15:45:00 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DF3C03E96B
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2020 12:44:59 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t18so3659597wru.6
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2020 12:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w/E0PqZ4JUvsVPhjJCpIt9CihS3XGANL6AWqhjUQMiM=;
        b=GePbnpgV0HFsJk15OEyOs+JIFBYByLXFhcFn9SLwDZxbtzCmuF3HL0aMeBlh4M7rrU
         59HtOEH4vhneOyuuPBg+LZIhJXXxw8E+WDpDdsMq7nSAT18EjeZv0QIAwwciVPGWRJvF
         Vyuf1tcwbaR3DFgeV5GsxW9saxagNMpwvSLm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w/E0PqZ4JUvsVPhjJCpIt9CihS3XGANL6AWqhjUQMiM=;
        b=Ud+6tpGcpVPMwekPTtEwh/DSstR/oqokBPQrNwvDt0ByD/EjLcigsRIOA0O5s3dfSO
         SZiqw8nafLOH3cbnxl7qvVb2zpK13Ex43aXin4JMBUdfNef7pCMWC2RyPfY/Plzi8hAu
         NwquQMcqHVlQJJZbDzwOokypGtTGc3w88nv2LENCaEPH8vPLBHX+psY0SETDjkjLujj7
         TsQmy6P7Bx9cpcice37dqmKP8fZ9Lbumwk8oKEZUdvqnP2lciH6EkEaFe0IEggLSvkv1
         ZiaD1jLcEPEQGePGR9y5ql3xDk5uigO2mYNINdNR99QV/5GMygXUS3cYULnwBWQqXEdv
         4f0A==
X-Gm-Message-State: AOAM531wRPdGNxI9t3yxBcfAdzuxg4Mv5ZS47wD1oH/A7xffEnBA4L1K
        Qa+2Zuo0PTMH9JCZCTK0fg6QAw==
X-Google-Smtp-Source: ABdhPJz56Mg1sFhBY6OHgtYaL4srEb/iLokXny55C/qT/LARZkNQ2vp3NirR+I0nb5Ducr+EwK7hGg==
X-Received: by 2002:adf:c385:: with SMTP id p5mr5534468wrf.409.1591818297823;
        Wed, 10 Jun 2020 12:44:57 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id u9sm959760wme.16.2020.06.10.12.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 12:44:57 -0700 (PDT)
Date:   Wed, 10 Jun 2020 19:44:55 +0000
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
Subject: Re: [V9, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
Message-ID: <20200610194455.GK201868@chromium.org>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200523084103.31276-3-dongchun.zhu@mediatek.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Dongchun,

On Sat, May 23, 2020 at 04:41:03PM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for OV02A10 image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                 |    1 +
>  drivers/media/i2c/Kconfig   |   13 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/ov02a10.c | 1025 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1040 insertions(+)
>  create mode 100644 drivers/media/i2c/ov02a10.c
> 

Thank you for the patch. Please see my comments inline.

[snip]
> diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> new file mode 100644
> index 0000000..160a0b5
> --- /dev/null
> +++ b/drivers/media/i2c/ov02a10.c
[snip]
> +static const char * const ov02a10_test_pattern_menu[] = {
> +	"Disabled",
> +	"Color Bar",

nit: We should normalize this to one of the standard names. What is the
pattern on this sensor? Is it perhaps "Eight Vertical Colour Bars"?

> +};
[snip]
> +static int ov02a10_set_fmt(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_pad_config *cfg,
> +			   struct v4l2_subdev_format *fmt)
> +{
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> +
> +	mutex_lock(&ov02a10->mutex);
> +


Don't we need to handle the case when fmt->which is V4L2_SUBDEV_FORMAT_TRY,
which is used for trying the format, but not applying it to the hardware?

> +	if (ov02a10->streaming) {
> +		mutex_unlock(&ov02a10->mutex);
> +		return -EBUSY;
> +	}
> +
> +	/* Only one sensor mode supported */
> +	mbus_fmt->code = ov02a10->fmt.code;
> +	ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> +	ov02a10->fmt = fmt->format;
> +
> +	mutex_unlock(&ov02a10->mutex);
> +
> +	return 0;
> +}
> +
> +static int ov02a10_get_fmt(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_pad_config *cfg,
> +			   struct v4l2_subdev_format *fmt)
> +{
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> +
> +	mutex_lock(&ov02a10->mutex);
> +
> +	fmt->format = ov02a10->fmt;

Ditto.

> +	mbus_fmt->code = ov02a10->fmt.code;
> +	ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> +
> +	mutex_unlock(&ov02a10->mutex);
> +
> +	return 0;
> +}
> +
> +static int ov02a10_enum_mbus_code(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_pad_config *cfg,
> +				  struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +
> +	if (code->index >= ARRAY_SIZE(supported_modes))
> +		return -EINVAL;

Hmm, supported_modes[] doesn't seem to hold the information about mbus
codes. Should this just perhaps be "!= 0"?

> +
> +	code->code = ov02a10->fmt.code;
> +
> +	return 0;
> +}
[snip]
> +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg)
> +{
> +	struct v4l2_subdev_format fmt = {
> +		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.format = {
> +			.width = 1600,
> +			.height = 1200,
> +		}
> +	};
> +
> +	ov02a10_set_fmt(sd, cfg, &fmt);
> +
> +	return 0;
> +}
> +

I'm not familiar with this init_cfg operation and the documentation is very
sparse about it. Sakari, is this a correct implementation?

[snip]
> +static int ov02a10_set_test_pattern(struct ov02a10 *ov02a10, int pattern)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_TEST_PATTERN,
> +					pattern);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> +					REG_ENABLE);
> +	if (ret < 0)
> +		return ret;
> +
> +	return i2c_smbus_write_byte_data(client, REG_SC_CTRL_MODE,
> +					 SC_CTRL_MODE_STREAMING);

Why is this needed? Does writing the test pattern register stop streaming?

[snip]
> +static int ov02a10_initialize_controls(struct ov02a10 *ov02a10)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	const struct ov02a10_mode *mode;
> +	struct v4l2_ctrl_handler *handler;
> +	struct v4l2_ctrl *ctrl;
> +	u64 exposure_max;
> +	u32 pixel_rate;
> +	int ret;
> +
> +	handler = &ov02a10->ctrl_handler;
> +	mode = ov02a10->cur_mode;
> +	ret = v4l2_ctrl_handler_init(handler, 7);
> +	if (ret)
> +		return ret;
> +
> +	handler->lock = &ov02a10->mutex;
> +
> +	ctrl = v4l2_ctrl_new_int_menu(handler, NULL, V4L2_CID_LINK_FREQ, 0, 0,
> +				      link_freq_menu_items);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	pixel_rate = to_pixel_rate(0);
> +	v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE, 0, pixel_rate, 1,
> +			  pixel_rate);
> +
> +	exposure_max = mode->vts_def - 4;
> +	ov02a10->exposure = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> +					      V4L2_CID_EXPOSURE,
> +					      OV02A10_EXPOSURE_MIN,
> +					      exposure_max,
> +					      OV02A10_EXPOSURE_STEP,
> +					      mode->exp_def);
> +
> +	v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> +			  V4L2_CID_ANALOGUE_GAIN,
> +			  OV02A10_GAIN_MIN,
> +			  OV02A10_GAIN_MAX,
> +			  OV02A10_GAIN_STEP,
> +			  OV02A10_GAIN_DEFAULT);
> +
> +	v4l2_ctrl_new_std_menu_items(handler, &ov02a10_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(ov02a10_test_pattern_menu) - 1,
> +				     0, 0, ov02a10_test_pattern_menu);
> +

I can see that we're missing some controls here now, VBLANK and HBLANK if I
remember correctly. Even though read-only, some userspace need those to
get information about how the sensor operates.

> +	if (handler->error) {
> +		ret = handler->error;
> +		dev_err(&client->dev, "failed to init controls(%d)\n", ret);
> +		goto err_free_handler;
> +	}
> +
> +	ov02a10->subdev.ctrl_handler = handler;
> +
> +	return 0;
> +
> +err_free_handler:
> +	v4l2_ctrl_handler_free(handler);
> +
> +	return ret;
> +}
[snip]
> +	pm_runtime_enable(dev);
> +	if (!pm_runtime_enabled(dev)) {
> +		ret = ov02a10_power_on(dev);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to power on: %d\n", ret);
> +			goto err_free_handler;
> +		}
> +	}
> +
> +	ret = v4l2_async_register_subdev(&ov02a10->subdev);
> +	if (ret) {
> +		dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> +		if (!pm_runtime_enabled(dev))
> +			ov02a10_power_off(dev);

Please don't mix inline and error-path error handling, as it makes it
difficult to tell if it's correct. Please move this below the appropriate
err label instead.

> +		goto err_clean_entity;
> +	}
> +
> +	return 0;
> +
> +err_clean_entity:

If one calls pm_runtime_enable() in the probe path, one needs to call
pm_runtime_disable() on the error and remove paths.

> +	media_entity_cleanup(&ov02a10->subdev.entity);
> +err_free_handler:
> +	v4l2_ctrl_handler_free(ov02a10->subdev.ctrl_handler);
> +err_destroy_mutex:
> +	mutex_destroy(&ov02a10->mutex);
> +
> +	return ret;
> +}
> +

Best regards,
Tomasz
