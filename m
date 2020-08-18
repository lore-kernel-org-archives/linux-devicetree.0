Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E3CC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 21:44:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E15CF206DA
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 21:43:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n2mYV4p9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgHRVn7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 17:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726372AbgHRVn4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 17:43:56 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3B4C061389
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 14:43:55 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y10so8266887plr.11
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 14:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ku6KRkFjfvYlI41FcPQR/35V9YSvyUi25iV14BtdfTo=;
        b=n2mYV4p9IDfmqgRCbcPjkKKpofadfqoeYOUODnu9wLy3BfSqePwJUViC/LWoyxN9kr
         mT05BiIcbp1/n4ERJw/glSMLMmofsfin9KK7EfX6eyNi5fkeuF/vF0uk3X4Ok76wOW2B
         EGQr7JL5zLQVgtRilrwXZ66vdZPS5pJdyqqp81X70Q/UaWva5XgoIHll37nSLopD5gC7
         sinZLqUerV84mEVE/Nk+10waDSu8uJSJUi1Brd4BrZskzzWRtee4mggIekT526wfJe27
         XrgghLiG3AQm60+mb13Qcl2h36JU32NSO4XZB+vonSWKiO8R9fN7StajWhAduSKXDqKv
         ke0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ku6KRkFjfvYlI41FcPQR/35V9YSvyUi25iV14BtdfTo=;
        b=QkbfEa+pnjT4GP5TdZGuQoDbPkA0ySKs4kqpRBbsIS7io6vqVIt9DMedi+f6xyaNtv
         XGC7ZK7avT4NWlJQEUjMmcNWuLLzbaIoC+5Gd6pGU6VBkEfN8/HQuE0RC16a4PcIbQ/H
         RcfY74O662YHIm+m4PTb48ZPAJDV8dGNoYdI+/LTMkT/930C+hRKFNAihb4fJM7CDC8r
         nhJbqYnZ3lkrMV3DwNdgqL6uTbu4gKRpycEYBsBGcp/5x59gu0kEYckj4nHq3v46CuxP
         h1zb2swD901WrEcw8O6d8qg5oYeo+uPQjTaUIQVcin8OwXRj4eKsCE+HM+HYnfzB/Puh
         Kjng==
X-Gm-Message-State: AOAM532kPJzIJlr6gDyZrKFvlYsy0uMdL7kU9IqYVv/8Wm3pyIM9Dyib
        bZSVFONlNa47tuEC123nwaYnCQ==
X-Google-Smtp-Source: ABdhPJwmdpgyw9mEmAXbMYiRDQ8V3OY0KY5mMDjghqQUNBoJNX0dpUf6Nixy/ZLbKq8JofeU879cpQ==
X-Received: by 2002:a17:90a:b88c:: with SMTP id o12mr1458935pjr.187.1597787033141;
        Tue, 18 Aug 2020 14:43:53 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id f3sm26170676pfj.206.2020.08.18.14.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 14:43:52 -0700 (PDT)
Date:   Tue, 18 Aug 2020 15:43:50 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     bjorn.andersson@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 04/10] remoteproc: imx_rproc: make syscon optional
Message-ID: <20200818214350.GA3822080@xps15>
References: <20200724080813.24884-1-peng.fan@nxp.com>
 <20200724080813.24884-5-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724080813.24884-5-peng.fan@nxp.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Peng,

On Fri, Jul 24, 2020 at 04:08:07PM +0800, Peng Fan wrote:
> Make syscon optional, since i.MX8QM/QXP/7ULP not have SRC to control M4.
> But currently i.MX8QM/QXP/7ULP not added, so still check regmap
> when start/stop to avoid unhappy things.

On the i.MX8QM/QXP/7ULP processors, the remote processors are not handled by the
remoteproc cores, as implemented in this patch.  In such a scenario how does the
remoteproc core know the remote processor has crashed and how does it recover
from such a condition?

Thanks,
Mathieu

> 
> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 82594a800a1b..4fad5c0b1c05 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -162,6 +162,9 @@ static int imx_rproc_start(struct rproc *rproc)
>  	struct device *dev = priv->dev;
>  	int ret;
>  
> +	if (!priv->regmap)
> +		return -EOPNOTSUPP;
> +
>  	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
>  				 dcfg->src_mask, dcfg->src_start);
>  	if (ret)
> @@ -177,6 +180,9 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	struct device *dev = priv->dev;
>  	int ret;
>  
> +	if (!priv->regmap)
> +		return -EOPNOTSUPP;
> +
>  	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
>  				 dcfg->src_mask, dcfg->src_stop);
>  	if (ret)
> @@ -325,9 +331,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	regmap = syscon_regmap_lookup_by_phandle(np, "syscon");
>  	if (IS_ERR(regmap)) {
>  		dev_err(dev, "failed to find syscon\n");
> -		return PTR_ERR(regmap);
> +		regmap = NULL;
> +	} else {
> +		regmap_attach_dev(dev, regmap, &config);
>  	}
> -	regmap_attach_dev(dev, regmap, &config);
>  
>  	/* set some other name then imx */
>  	rproc = rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
> -- 
> 2.16.4
> 
