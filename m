Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111A7C2D0E7
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 23:02:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0CD12073B
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 23:02:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wDv27M1c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbgC0XC0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 19:02:26 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39360 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727719AbgC0XC0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Mar 2020 19:02:26 -0400
Received: by mail-pg1-f195.google.com with SMTP id b22so5303461pgb.6
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2020 16:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pko9nAhDt6mwlgRfyc6XKtINQbmF/ebYK6c/ZMMljOI=;
        b=wDv27M1cr1T04ee69Hy1SrhA+XbdaY3eDftXg2xB8lJQ8inMOhdeEXNJXrEo7q7t3t
         6eB9zC8/Bv9mLJ2bOewXKTZ2FkwX64sHSQPnYtvFoLj3WC2vPLJHxv4pPOXi3nodaSqs
         A94S3RD7J4kxfu7L3w+pl6x+HKDrV2M6vOWGZjfiXENOjFzAN/7ncjOC36Y72p99DEF7
         QZXYRKrTMl7vlATbTTVdSjSNYb76CqTou39S/h0lGX8LIJGloZ4sglWuDm32ljv0HURf
         IIVnTU0FzO+NSXPtkboaIM7yz80aPuDUQD424YANs9bLogatUBmIYjXG/XZ0fRlPvmfB
         xRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pko9nAhDt6mwlgRfyc6XKtINQbmF/ebYK6c/ZMMljOI=;
        b=VgLqGeJazqtKm+bYdzxUWFMtCmp+Yrnslt0Q6L25bEieYaMyKk/4b8qkNc2dpEWJDS
         L4LJ6JOmLXYLbhQfBwhaufkh8TI63k4XwSmABGw3BeKpUjdEuY2wOzSXj0oUBl9xmcf6
         q6ZiFMqgyYprwJfebe7ZXRwqo8RMoIxfbm7I1Q1iDxsn4SqxyjXcm3ewSyfx7/Aoa1zI
         PQRWFp0Oy/WyhvsE99TLw1iR37ioW1q5HoO2mEWsO/XkqcM1pclbvv2XIqYpmWU3WZeL
         rUqLdlWw2M87peZLT1A3kGHom8KejOkVyAtdhPyWewcVhyOfub9hr+22teaYJsGw23dE
         +GXg==
X-Gm-Message-State: ANhLgQ0bCECSwt59u8Xz2uHgpRMCzDKq/JOkEeVNcX2RPCjd+sU7ZGNN
        kltxzeZlM0zZ1hAAj4bhRf/AiA==
X-Google-Smtp-Source: ADFU+vsjmqswulmh3XPk28yPydYs/4jXf/b13hstJ4o6GS/qxxeJWxQ8s40fIIu+VnhFkLkIkKOoHg==
X-Received: by 2002:a63:161e:: with SMTP id w30mr1655585pgl.110.1585350144395;
        Fri, 27 Mar 2020 16:02:24 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y142sm4983301pfc.53.2020.03.27.16.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 16:02:23 -0700 (PDT)
Date:   Fri, 27 Mar 2020 16:02:21 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org, wsa@the-dreams.de,
        broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org
Subject: Re: [PATCH V2 1/8] interconnect: Add devm_of_icc_get() as exported
 API for users
Message-ID: <20200327230221.GK5063@builder>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-2-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584105134-13583-2-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri 13 Mar 06:12 PDT 2020, Akash Asthana wrote:

> Users can use devm version of of_icc_get() to benefit from automatic
> resource release.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/interconnect/core.c  | 25 +++++++++++++++++++++++++
>  include/linux/interconnect.h |  7 +++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
> index 2c6515e..f5699ed 100644
> --- a/drivers/interconnect/core.c
> +++ b/drivers/interconnect/core.c
> @@ -350,6 +350,31 @@ static struct icc_node *of_icc_get_from_provider(struct of_phandle_args *spec)
>  	return node;
>  }
>  
> +static void devm_icc_release(struct device *dev, void *res)
> +{
> +	icc_put(*(struct icc_path **)res);
> +}
> +
> +struct icc_path *devm_of_icc_get(struct device *dev, const char *name)
> +{
> +	struct icc_path **ptr, *path;
> +
> +	ptr = devres_alloc(devm_icc_release, sizeof(**ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	path = of_icc_get(dev, name);
> +	if (!IS_ERR(path)) {
> +		*ptr = path;
> +		devres_add(dev, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}
> +
> +	return path;
> +}
> +EXPORT_SYMBOL_GPL(devm_of_icc_get);
> +
>  /**
>   * of_icc_get() - get a path handle from a DT node based on name
>   * @dev: device pointer for the consumer device
> diff --git a/include/linux/interconnect.h b/include/linux/interconnect.h
> index d70a914..7706924 100644
> --- a/include/linux/interconnect.h
> +++ b/include/linux/interconnect.h
> @@ -28,6 +28,7 @@ struct device;
>  struct icc_path *icc_get(struct device *dev, const int src_id,
>  			 const int dst_id);
>  struct icc_path *of_icc_get(struct device *dev, const char *name);
> +struct icc_path *devm_of_icc_get(struct device *dev, const char *name);
>  void icc_put(struct icc_path *path);
>  int icc_set_bw(struct icc_path *path, u32 avg_bw, u32 peak_bw);
>  void icc_set_tag(struct icc_path *path, u32 tag);
> @@ -46,6 +47,12 @@ static inline struct icc_path *of_icc_get(struct device *dev,
>  	return NULL;
>  }
>  
> +static inline struct icc_path *devm_of_icc_get(struct device *dev,
> +						const char *name)
> +{
> +	return NULL;
> +}
> +
>  static inline void icc_put(struct icc_path *path)
>  {
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
