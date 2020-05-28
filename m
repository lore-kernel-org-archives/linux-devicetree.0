Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFB7C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 21:46:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA90F208DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 21:46:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aNNmYmnx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436659AbgE1VqZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 17:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436630AbgE1VqX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 17:46:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69837C08C5C6
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 14:46:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF5BB2A8;
        Thu, 28 May 2020 23:46:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590702381;
        bh=2kQLJ6ihq2PvrAL0aFkV0qdd4HEG8jQjlPEKzcWA4zI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aNNmYmnx/YtiaQVF0zhm6NKUhO6tyxYre9WWwiDlNS9QeKkblOPHKa6HLKEXjG+4j
         lNUPQzPegoZeRz0wrGN3ySSpAhmrl3OfbCK8+SDVn8I76Sr/WH83NJZ3j3uohoSBvM
         OYwD8YwyTzk36wLhNTnG1MiavALmhYO0KitlmpBg=
Date:   Fri, 29 May 2020 00:46:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
        tomi.valkeinen@ti.com, robh+dt@kernel.org, airlied@linux.ie,
        shawnguo@kernel.org
Subject: Re: [PATCH v2 4/4] drm/bridge: tfp410: Fix setup and hold time
 calculation
Message-ID: <20200528214607.GB14756@pendragon.ideasonboard.com>
References: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
 <20200514143612.2094-5-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200514143612.2094-5-ricardo.canuelo@collabora.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Thu, May 14, 2020 at 04:36:12PM +0200, Ricardo Cañuelo wrote:
> The tfp410 has a data de-skew feature that allows the user to compensate
> the skew between IDCK and the pixel data and control signals.
> 
> In the driver, the setup and hold times are calculated from the de-skew
> value. This retrieves the deskew value from the DT using the proper
> datatype and range check as described by the binding (u32 from 0 to 7)
> and fixes the calculation of the setup and hold times.

How about mentioning that the fix results from a change in the DT
bindings ? Otherwise it sounds it was a bug in the driver.

I would also mention that the patch fixes the min() calculation, which
was clearly wrong. I think I would have split this in two patches.

With this addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> ---
>  drivers/gpu/drm/bridge/ti-tfp410.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index e3eb6364c0f7..21d99b4ea0c9 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -220,7 +220,7 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
>  	struct device_node *ep;
>  	u32 pclk_sample = 0;
>  	u32 bus_width = 24;
> -	s32 deskew = 0;
> +	u32 deskew = 0;
>  
>  	/* Start with defaults. */
>  	*timings = tfp410_default_timings;
> @@ -274,12 +274,12 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
>  	}
>  
>  	/* Get the setup and hold time from vendor-specific properties. */
> -	of_property_read_u32(dvi->dev->of_node, "ti,deskew", (u32 *)&deskew);
> -	if (deskew < -4 || deskew > 3)
> +	of_property_read_u32(dvi->dev->of_node, "ti,deskew", &deskew);
> +	if (deskew > 7)
>  		return -EINVAL;
>  
> -	timings->setup_time_ps = min(0, 1200 - 350 * deskew);
> -	timings->hold_time_ps = min(0, 1300 + 350 * deskew);
> +	timings->setup_time_ps = 1200 - 350 * ((s32)deskew - 4);
> +	timings->hold_time_ps = max(0, 1300 + 350 * ((s32)deskew - 4));
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
