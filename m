Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4683C433E6
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 14:18:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96F5F208C9
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 14:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598624334;
	bh=leHLGjg8aOzdRJPBC4ekk4kQDiYmjF+OUvMLO0aEJMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=td5Zh6In/Wg4tPf1XvjyBuIZVtwG0styM2+6wKoD8iyd88GbiJJCBpKUdAUQJyEW/
	 RaON4Njwe0A6lq0RbsIgjSnfY37E31Maj3S9mL0zbPooIsHy9iNU0NseFGz12A3/51
	 /B43ZbIV6hHRoMJWvxqdl1ThRuJY84Z2f7CMuxM0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgH1OSx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Aug 2020 10:18:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:39644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbgH1OSw (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 28 Aug 2020 10:18:52 -0400
Received: from localhost (unknown [122.171.38.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 65C8D20848;
        Fri, 28 Aug 2020 14:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598624332;
        bh=leHLGjg8aOzdRJPBC4ekk4kQDiYmjF+OUvMLO0aEJMM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wKM/gEClCHdIWfiBdSgaynHkOvikRn9ZyW9iCvIffNgZ8+gvbzUJiXB2kU2JyQgUL
         qPy2HGNe6q6QjT01Sj1aI9AmkW+OVKFadPKrNbojfqCtzk6QJEHHkNNivM4k53EGS1
         z7XwkM2n4g0lF1YNQAf6QHvX1Nmlioqmfnitc92w=
Date:   Fri, 28 Aug 2020 19:48:48 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH v1 2/2] drm: bridge: add support for lontium LT9611UXC
 bridge
Message-ID: <20200828141848.GX2639@vkoul-mobl>
References: <20200828120431.1636402-1-dmitry.baryshkov@linaro.org>
 <20200828120431.1636402-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828120431.1636402-3-dmitry.baryshkov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 28-08-20, 15:04, Dmitry Baryshkov wrote:

> +#define EDID_BLOCK_SIZE	128
> +#define EDID_NUM_BLOCKS 2

tab or space either one, not both ;)

> +static struct mipi_dsi_device *lt9611uxc_attach_dsi(struct lt9611uxc *lt9611uxc,
> +						 struct device_node *dsi_node)

Please align this with open parenthesis of preceding line (checkpatch
with --strict option will check this)

> +static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
> +				enum drm_bridge_attach_flags flags)
> +{
> +	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
> +	int ret;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		dev_err(lt9611uxc->dev, "Fix bridge driver to make connector optional!");

Can we support both modes as I have done in lt9611, that way once the
conversion is done we can drop the init part and support conversion.

I have patch for msm driver to set DRM_BRIDGE_ATTACH_NO_CONNECTOR, you
can use that to test

> +static int lt9611uxc_hdmi_hw_params(struct device *dev, void *data,
> +				 struct hdmi_codec_daifmt *fmt,
> +				 struct hdmi_codec_params *hparms)
> +{
> +	/*
> +	 * LT9611UXC will automatically detect rate and sample size, so no need
> +	 * to setup anything here.
> +	 */
> +	return 0;
> +}

Do we need dummy function?

-- 
~Vinod
