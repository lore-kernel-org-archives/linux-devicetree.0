Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7317C10F27
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 18:59:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8388B20873
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 18:59:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbgCIS7u (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 14:59:50 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:59902 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbgCIS7u (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Mar 2020 14:59:50 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 6977E2003B;
        Mon,  9 Mar 2020 19:59:41 +0100 (CET)
Date:   Mon, 9 Mar 2020 19:59:40 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Phong LE <ple@baylibre.com>
Cc:     airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        mark.rutland@arm.com, a.hajda@samsung.com, narmstrong@baylibre.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, mripard@kernel.org,
        heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
        stephan@gerhold.net, broonie@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] drm: bridge: add it66121 driver
Message-ID: <20200309185939.GC4841@ravnborg.org>
References: <20200309153654.11481-1-ple@baylibre.com>
 <20200309153654.11481-4-ple@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309153654.11481-4-ple@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=IpJZQVW2AAAA:8
        a=p2OuynlV9XyZfWcvv0gA:9 a=CjuIK1q_8ugA:10 a=IawgGOuG5U0WyFbmm1f5:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Phong.

On Mon, Mar 09, 2020 at 04:36:54PM +0100, Phong LE wrote:
> This commit is a simple driver for bridge HMDI it66121.
> The input format is RBG and there is no color conversion.
> Audio, HDCP and CEC are not supported yet.

Nice driver. Some few comments below.

Patch fails to apply/build on top of drm-misc-next.
Please patch next version so it applies and works on top of
drm-misc-next, as this is where this patch will go in.

Who will maintain the driver?
Maybe update MAINTAINERS?

	Sam

> @@ -0,0 +1,983 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2020 BayLibre, SAS
> + * Author: Phong LE <ple@baylibre.com>
> + * Copyright (C) 2018-2019, Artem Mygaiev
> + * Copyright (C) 2017, Fresco Logic, Incorporated.
> + *
> + */
> +
> +#include <linux/device.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_gpio.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
Sort alphabetically (almost done), and remove duplicate.

> +
> +static int ite66121_power_off(struct it66121_ctx *ctx)
> +{
> +	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +}
> +
> +static inline int it66121_preamble_ddc(struct it66121_ctx *ctx)
Let the compiler do the inline decision - no need to specify it here.

> +{
> +	return regmap_write(ctx->regmap, IT66121_MASTER_SEL_REG,
> +				IT66121_MASTER_SEL_HOST);
> +}
> +
> +static inline int it66121_fire_afe(struct it66121_ctx *ctx)
> +{
> +	return regmap_write(ctx->regmap, IT66121_AFE_DRV_REG, 0);
> +}
> +
> +static int it66121_configure_input(struct it66121_ctx *ctx)
> +{
> +	int ret;
> +
> +	ret = regmap_write(ctx->regmap, IT66121_INPUT_MODE_REG,
> +			   ctx->conf->input_mode_reg);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(ctx->regmap, IT66121_INPUT_CSC_REG,
> +			    ctx->conf->input_conversion_reg);
> +}
> +

Maybe a small comment:
/* Configure analog front end */
So readers do not have to second guess the "afe" abbreavation.
Or spell it out.

> +static int it66121_configure_afe(struct it66121_ctx *ctx,
> +				 const struct drm_display_mode *mode)
> +{
> +	int ret;
> +
> +	ret = regmap_write(ctx->regmap, IT66121_AFE_DRV_REG,
> +			   IT66121_AFE_DRV_RST);
> +	if (ret)
> +		return ret;
> +
> +	if (mode->clock > IT66121_AFE_CLK_HIGH) {
> +		ret = regmap_write_bits(ctx->regmap, IT66121_AFE_XP_REG,
> +					IT66121_AFE_XP_GAINBIT |
> +					IT66121_AFE_XP_ENO,
> +					IT66121_AFE_XP_GAINBIT);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
> +					IT66121_AFE_IP_GAINBIT |
> +					IT66121_AFE_IP_ER0 |
> +					IT66121_AFE_IP_EC1,
> +					IT66121_AFE_IP_GAINBIT);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write_bits(ctx->regmap, IT66121_AFE_XP_EC1_REG,
> +					IT66121_AFE_XP_EC1_LOWCLK, 0x80);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = regmap_write_bits(ctx->regmap, IT66121_AFE_XP_REG,
> +					IT66121_AFE_XP_GAINBIT |
> +					IT66121_AFE_XP_ENO,
> +					IT66121_AFE_XP_ENO);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
> +					IT66121_AFE_IP_GAINBIT |
> +					IT66121_AFE_IP_ER0 |
> +					IT66121_AFE_IP_EC1, IT66121_AFE_IP_ER0 |
> +					IT66121_AFE_IP_EC1);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write_bits(ctx->regmap, IT66121_AFE_XP_EC1_REG,
> +					IT66121_AFE_XP_EC1_LOWCLK,
> +					IT66121_AFE_XP_EC1_LOWCLK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Clear reset flags */
> +	ret = regmap_write_bits(ctx->regmap, IT66121_SW_RST_REG,
> +				IT66121_SW_RST_REF | IT66121_SW_RST_VID,
> +				~(IT66121_SW_RST_REF | IT66121_SW_RST_VID) &
> +				0xFF);
> +	if (ret)
> +		return ret;
> +
> +	return it66121_fire_afe(ctx);
> +}
> +
> +static inline int it66121_wait_ddc_ready(struct it66121_ctx *ctx)
Drop inline

> +{
> +	int ret, val;
> +
> +	ret = regmap_read_poll_timeout(ctx->regmap, IT66121_DDC_STATUS_REG,
> +				       val, true,
> +				       IT66121_EDID_SLEEP,
> +				       IT66121_EDID_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	if (val & (IT66121_DDC_STATUS_NOACK | IT66121_DDC_STATUS_WAIT_BUS |
> +	    IT66121_DDC_STATUS_ARBI_LOSE))
> +		return -EAGAIN;
> +
> +	return 0;
> +}
> +
> +static int it66121_clear_ddc_fifo(struct it66121_ctx *ctx)
> +{
> +	int ret;
> +
> +	ret = it66121_preamble_ddc(ctx);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(ctx->regmap, IT66121_DDC_COMMAND_REG,
> +			    IT66121_DDC_COMMAND_FIFO_CLR);
> +}
> +
> +
> +static int it66121_get_edid_block(void *context, u8 *buf,
> +				  unsigned int block, size_t len)
> +{
> +	unsigned int val;
> +	struct it66121_ctx *ctx = context;
> +	int ret, remain = len, offset = 0, cnt;
Personal taste..
I prefer to split it up so it is not mixed with or without
initialisation.

> +
> +	offset = (block % 2) * len;
> +	block = block / 2;
> +
> +	ret = regmap_read(ctx->regmap, IT66121_INT_STATUS1_REG, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val & IT66121_INT_STATUS1_DDC_BUSHANG) {
> +		ret = it66121_abort_ddc_ops(ctx);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = it66121_clear_ddc_fifo(ctx);
> +	if (ret)
> +		return ret;
> +
> +	while (remain > 0) {
> +		cnt = (remain > IT66121_EDID_FIFO_SIZE) ?
> +				IT66121_EDID_FIFO_SIZE : remain;
> +		ret = it66121_preamble_ddc(ctx);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write(ctx->regmap, IT66121_DDC_COMMAND_REG,
> +				   IT66121_DDC_COMMAND_FIFO_CLR);
> +		if (ret)
> +			return ret;
> +
> +		ret = it66121_wait_ddc_ready(ctx);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_read(ctx->regmap, IT66121_INT_STATUS1_REG, &val);
> +		if (ret)
> +			return ret;
> +
> +		if (val & IT66121_INT_STATUS1_DDC_BUSHANG) {
> +			ret = it66121_abort_ddc_ops(ctx);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		ret = it66121_preamble_ddc(ctx);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write(ctx->regmap, IT66121_DDC_HEADER_REG,
> +				   IT66121_DDC_HEADER_EDID);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write(ctx->regmap, IT66121_DDC_OFFSET_REG, offset);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write(ctx->regmap, IT66121_DDC_BYTE_REG, cnt);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write(ctx->regmap, IT66121_DDC_SEGMENT_REG, block);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write(ctx->regmap, IT66121_DDC_COMMAND_REG,
> +				   IT66121_DDC_COMMAND_EDID_READ);
> +		if (ret)
> +			return ret;
> +
> +		offset += cnt;
> +		remain -= cnt;
> +		msleep(20);
> +
> +		ret = it66121_wait_ddc_ready(ctx);
> +		if (ret)
> +			return ret;
> +
> +		do {
> +			ret = regmap_read(ctx->regmap,
> +					  IT66121_DDC_RD_FIFO_REG, &val);
> +			if (ret)
> +				return ret;
> +			*(buf++) = val;
> +			cnt--;
> +		} while (cnt > 0);
> +	}
> +
> +	return 0;
> +}
> +

...

> +static struct drm_connector_helper_funcs it66121_connector_helper_funcs = {
> +	.get_modes = it66121_connector_get_modes,
> +	.detect_ctx = it66121_connector_detect_ctx,
> +	.mode_valid = it66121_connector_mode_valid,
> +};
> +
> +static const struct drm_connector_funcs it66121_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int it66121_bridge_attach(struct drm_bridge *bridge)
> +{
In drm-misc-next this function has received a flags in the signature.
Please implement and add support for the flag that makes connector
creation optional.


> +	int ret;
> +	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx,
> +			bridge);
> +
> +	if (!bridge->encoder) {
> +		DRM_ERROR("Parent encoder object not found");
> +		return -ENODEV;
> +	}
> +
> +	ret = regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
> +				IT66121_CLK_BANK_PWROFF_RCLK, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write_bits(ctx->regmap, IT66121_INT_REG,
> +				IT66121_INT_TX_CLK_OFF, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write_bits(ctx->regmap, IT66121_AFE_DRV_REG,
> +				IT66121_AFE_DRV_PWD, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write_bits(ctx->regmap, IT66121_AFE_XP_REG,
> +				IT66121_AFE_XP_PWDI | IT66121_AFE_XP_PWDPLL, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
> +				IT66121_AFE_IP_PWDPLL, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write_bits(ctx->regmap, IT66121_AFE_DRV_REG,
> +				IT66121_AFE_DRV_RST, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write_bits(ctx->regmap, IT66121_AFE_XP_REG,
> +				IT66121_AFE_XP_RESETB, IT66121_AFE_XP_RESETB);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
> +				IT66121_AFE_IP_RESETB, IT66121_AFE_IP_RESETB);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write_bits(ctx->regmap, IT66121_SW_RST_REG,
> +				IT66121_SW_RST_REF,
> +				IT66121_SW_RST_REF);
> +	if (ret)
> +		return ret;
> +
> +	msleep(50);
> +
> +	ret = drm_connector_init(bridge->dev, &ctx->connector,
> +				 &it66121_connector_funcs,
> +				 DRM_MODE_CONNECTOR_HDMIA);
> +	if (ret)
> +		return ret;
> +
> +	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
> +	drm_connector_helper_add(&ctx->connector,
> +				 &it66121_connector_helper_funcs);
> +
> +	ret = drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_connector_register(&ctx->connector);
> +	if (ret)
> +		return ret;
> +
> +	/* Start interrupts */
> +	return regmap_write_bits(ctx->regmap, IT66121_INT_MASK1_REG,
> +				 IT66121_INT_MASK1_DDC_NOACK |
> +				 IT66121_INT_MASK1_HPD |
> +				 IT66121_INT_MASK1_DDC_FIFOERR |
> +				 IT66121_INT_MASK1_DDC_BUSHANG,
> +				 ~(IT66121_INT_MASK1_DDC_NOACK |
> +				 IT66121_INT_MASK1_HPD |
> +				 IT66121_INT_MASK1_DDC_FIFOERR |
> +				 IT66121_INT_MASK1_DDC_BUSHANG) & 0xFF);
> +}
> +
> +static int it66121_set_mute(struct it66121_ctx *ctx, bool mute)
> +{
> +	int ret;
> +	unsigned int val;
> +
> +	val = mute ? IT66121_AV_MUTE_ON : (~IT66121_AV_MUTE_ON & 0xFF);
> +	ret = regmap_write_bits(ctx->regmap, IT66121_AV_MUTE_REG,
> +				IT66121_AV_MUTE_ON, val);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(ctx->regmap, IT66121_PKT_GEN_CTRL_REG,
> +			    IT66121_PKT_GEN_CTRL_ON |
> +			    IT66121_PKT_GEN_CTRL_RPT);
> +}
> +
> +static void it66121_bridge_enable(struct drm_bridge *bridge)
> +{
> +	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx,
> +			bridge);
> +
> +	it66121_set_mute(ctx, false);
> +}
> +
> +static void it66121_bridge_disable(struct drm_bridge *bridge)
> +{
> +	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx,
> +			bridge);
> +
> +	it66121_set_mute(ctx, true);
> +}
> +
> +static
> +void it66121_bridge_mode_set(struct drm_bridge *bridge,
> +			     const struct drm_display_mode *mode,
> +			     const struct drm_display_mode *adjusted_mode)
> +{
> +	int ret, i;
> +	u8 buf[HDMI_INFOFRAME_SIZE(AVI)];
> +	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx,
> +			bridge);
> +	const u16 aviinfo_reg[HDMI_AVI_INFOFRAME_SIZE] = {
> +		IT66121_AVIINFO_DB1_REG,
> +		IT66121_AVIINFO_DB2_REG,
> +		IT66121_AVIINFO_DB3_REG,
> +		IT66121_AVIINFO_DB4_REG,
> +		IT66121_AVIINFO_DB5_REG,
> +		IT66121_AVIINFO_DB6_REG,
> +		IT66121_AVIINFO_DB7_REG,
> +		IT66121_AVIINFO_DB8_REG,
> +		IT66121_AVIINFO_DB9_REG,
> +		IT66121_AVIINFO_DB10_REG,
> +		IT66121_AVIINFO_DB11_REG,
> +		IT66121_AVIINFO_DB12_REG,
> +		IT66121_AVIINFO_DB13_REG
> +	};
> +
> +	mutex_lock(&ctx->lock);
> +
> +	hdmi_avi_infoframe_init(&ctx->hdmi_avi_infoframe);
> +
> +	ret = drm_hdmi_avi_infoframe_from_display_mode(&ctx->hdmi_avi_infoframe,
> +						       &ctx->connector,
> +						       adjusted_mode);
> +	if (ret) {
> +		DRM_ERROR("Failed to setup AVI infoframe: %d\n", ret);
> +		goto unlock;
> +	}
> +
> +	ret = hdmi_avi_infoframe_pack(&ctx->hdmi_avi_infoframe, buf,
> +				      sizeof(buf));
> +	if (ret < 0) {
> +		DRM_ERROR("Failed to pack infoframe: %d\n", ret);
> +		goto unlock;
> +	}
> +
> +	/* Write new AVI infoframe packet */
> +	for (i = 0; i < HDMI_AVI_INFOFRAME_SIZE; i++) {
> +		if (regmap_write(ctx->regmap, aviinfo_reg[i],
> +				 buf[i + HDMI_INFOFRAME_HEADER_SIZE]))
> +			goto unlock;
> +	}
> +	if (regmap_write(ctx->regmap, IT66121_AVIINFO_CSUM_REG, buf[3]))
> +		goto unlock;
> +
> +	/* Enable AVI infoframe */
> +	if (regmap_write(ctx->regmap, IT66121_AVI_INFO_PKT_REG,
> +			 IT66121_AVI_INFO_PKT_ON |
> +			 IT66121_AVI_INFO_PKT_RPT))
> +		goto unlock;
> +
> +	/* Set TX mode to HDMI */
> +	if (regmap_write(ctx->regmap, IT66121_HDMI_MODE_REG,
> +			 IT66121_HDMI_MODE_HDMI))
> +		goto unlock;
> +
> +	if (regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
> +			      IT66121_CLK_BANK_PWROFF_TXCLK,
> +			      IT66121_CLK_BANK_PWROFF_TXCLK))
> +		goto unlock;
> +
> +	if (it66121_configure_input(ctx))
> +		goto unlock;
> +
> +	if (it66121_configure_afe(ctx, adjusted_mode))
> +		goto unlock;
> +
> +	regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
> +			  IT66121_CLK_BANK_PWROFF_TXCLK,
> +			  ~IT66121_CLK_BANK_PWROFF_TXCLK & 0xFF);
> +
> +unlock:
> +	mutex_unlock(&ctx->lock);
> +}
> +
> +static const struct drm_bridge_funcs it66121_bridge_funcs = {
> +	.attach = it66121_bridge_attach,
> +	.enable = it66121_bridge_enable,
> +	.disable = it66121_bridge_disable,
> +	.mode_set = it66121_bridge_mode_set,
> +};
> +
> +static irqreturn_t it66121_irq_threaded_handler(int irq, void *dev_id)
> +{
> +	int ret;
> +	unsigned int val;
> +	struct it66121_ctx *ctx = dev_id;
> +	struct device *dev = ctx->dev;
> +	bool event = false;
> +
> +	mutex_lock(&ctx->lock);
> +
> +	ret = regmap_read(ctx->regmap, IT66121_SYS_STATUS_REG, &val);
> +	if (ret)
> +		goto unlock;
> +
> +	if (val & IT66121_SYS_STATUS_ACTIVE_IRQ) {
> +		ret = regmap_read(ctx->regmap, IT66121_INT_STATUS1_REG, &val);
> +		if (ret) {
> +			dev_err(dev, "Cannot read STATUS1_REG %d\n", ret);
> +		} else {
> +			if (val & IT66121_INT_STATUS1_DDC_FIFOERR)
> +				it66121_clear_ddc_fifo(ctx);
> +			if (val & (IT66121_INT_STATUS1_DDC_BUSHANG |
> +					IT66121_INT_STATUS1_DDC_NOACK))
> +				it66121_abort_ddc_ops(ctx);
> +			if (val & IT66121_INT_STATUS1_HPD_STATUS) {
> +				regmap_write_bits(ctx->regmap,
> +						  IT66121_INT_CLR1_REG,
> +						  IT66121_INT_CLR1_HPD,
> +						  IT66121_INT_CLR1_HPD);
> +
> +				if (!it66121_is_hpd_detect(ctx)) {
> +					kfree(ctx->edid);
> +					ctx->edid = NULL;
> +				}
> +				event = true;
> +			}
> +		}
> +
> +		regmap_write_bits(ctx->regmap, IT66121_SYS_STATUS_REG,
> +				  IT66121_SYS_STATUS_CLEAR_IRQ,
> +				  IT66121_SYS_STATUS_CLEAR_IRQ);
> +	}
> +
> +unlock:
> +	mutex_unlock(&ctx->lock);
> +
> +	if (event)
> +		drm_helper_hpd_irq_event(ctx->bridge.dev);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int it66121_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
> +{
> +	u8 ids[4];
> +	int i, ret;
> +	struct it66121_ctx *ctx;
> +	struct device *dev = &client->dev;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +		dev_err(dev, "I2C check functionality failed.\n");
> +		return -ENXIO;
> +	}
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->dev = dev;
> +	ctx->client = client;
> +	i2c_set_clientdata(client, ctx);
> +	mutex_init(&ctx->lock);
> +	ctx->conf = (struct it66121_conf *)of_device_get_match_data(dev);
> +	if (!ctx->conf)
> +		return -ENODEV;
> +
> +	ctx->supplies[0].supply = "vcn33";
> +	ctx->supplies[1].supply = "vcn18";
> +	ctx->supplies[2].supply = "vrf12";
> +	ret = devm_regulator_bulk_get(ctx->dev, 3, ctx->supplies);
> +	if (ret) {
> +		dev_err(ctx->dev, "regulator_bulk failed\n");
> +		return ret;
> +	}
> +
> +	ctx->dual_edge = of_property_read_bool(dev->of_node, "pclk-dual-edge");
> +
> +	ret = ite66121_power_on(ctx);
> +	if (ret)
> +		return ret;
> +
> +	it66121_hw_reset(ctx);
> +
> +	ctx->regmap = devm_regmap_init_i2c(client, &it66121_regmap_config);
> +	if (IS_ERR(ctx->regmap)) {
> +		ite66121_power_off(ctx);
> +		return PTR_ERR(ctx);
> +	}
> +
> +	for (i = 0; i < 4; i++) {
> +		regmap_read(ctx->regmap, i, &ret);
> +		ids[i] = ret;
> +	}
> +
> +	if (ids[0] != IT66121_VENDOR_ID0 ||
> +	    ids[1] != IT66121_VENDOR_ID1 ||
> +	    ids[2] != IT66121_DEVICE_ID0 ||
> +	    ((ids[3] & IT66121_DEVICE_MASK) != IT66121_DEVICE_ID1)) {
> +		ite66121_power_off(ctx);
> +		return -ENODEV;
> +	}
> +
> +	ctx->bridge.funcs = &it66121_bridge_funcs;
> +	ctx->bridge.of_node = dev->of_node;
> +
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +					it66121_irq_threaded_handler,
> +					IRQF_SHARED | IRQF_TRIGGER_LOW |
> +					IRQF_ONESHOT,
> +					dev_name(dev),
> +					ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to request irq %d:%d\n", client->irq, ret);
> +		ite66121_power_off(ctx);
> +		return ret;
> +	}
> +
> +	drm_bridge_add(&ctx->bridge);
> +
> +	return 0;
> +}
> +
> +static int it66121_remove(struct i2c_client *client)
> +{
> +	struct it66121_ctx *ctx = i2c_get_clientdata(client);
> +
> +	ite66121_power_off(ctx);
> +	drm_bridge_remove(&ctx->bridge);
> +	kfree(ctx->edid);
> +	mutex_destroy(&ctx->lock);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id it66121_dt_match[] = {
> +	{ .compatible = "ite,it66121",
> +	  .data = &it66121_conf_simple,
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, it66121_dt_match);
> +
> +static const struct i2c_device_id it66121_id[] = {
> +	{ "it66121", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, it66121_id);
> +
> +static struct i2c_driver it66121_driver = {
> +	.driver = {
> +		.name	= "it66121",
> +		.of_match_table = it66121_dt_match,
> +	},
> +	.probe = it66121_probe,
> +	.remove = it66121_remove,
> +	.id_table = it66121_id,
> +};
> +
> +module_i2c_driver(it66121_driver);
> +
> +MODULE_AUTHOR("Phong LE");
> +MODULE_DESCRIPTION("IT66121 HDMI transmitter driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
