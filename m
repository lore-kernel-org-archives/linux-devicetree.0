Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63843C35646
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 10:41:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3585324650
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 10:41:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YfODzCNo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbgBUKl3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 05:41:29 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33694 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbgBUKl3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Feb 2020 05:41:29 -0500
Received: by mail-wr1-f66.google.com with SMTP id u6so1467100wrt.0
        for <devicetree@vger.kernel.org>; Fri, 21 Feb 2020 02:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=vbdL14wqd+TXUD1iwQ6ZI35nUpnOaOq+sk6GuqOnbiE=;
        b=YfODzCNoQjL+RoLE6G4sgkjuvQVwbC1wGb/3uuoOAX+cZ+vm57ycU5Sc+QVisCixDa
         r/040sq+Uk40zYsNSm7wFoNnJHRoPnIhcpT1S7SEwyrPUvhwNbdZ9P+8GT4CZx42KErf
         X9XrtzP9Pg+SjqKYBE2T1DlSTsPVowfyOnrVzh6L1Fl/cRoaEg4WnnUw4g2y+CCSAR41
         fbyyJzg6sNZhmzCRl3w5DcbOLuyjgmkBmnsKjGHOznHgXteWEQfSQdGXhUMAKira8Fnq
         HP/hvYn7UA6H+yJAhTy8ytah0Mvmfm/7L0P3DOr3Msnxh+hB9A0/E8Q4pNJqPf3MLVMa
         8XtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=vbdL14wqd+TXUD1iwQ6ZI35nUpnOaOq+sk6GuqOnbiE=;
        b=KHVHtCqlb7u3JivTu4gxX+sG/FqgTq2Sq/AcUZNSK2WTKmdqVeaV+3q/gXzbHve1JA
         oquDwS1N1bnAKMJvD4f4j4SxGujRK0Q52e1UYtcIeEww0yLWXjIFKxLyefoDmX1sFvGf
         0ximc0I/EnPMSn20t829P8QWs6AgWjGqDhdn0BnCbb3QBhm0T/FUFI7aIb5MgwqKJbKP
         RImTZZPqrLMo4bCQJbiRtKPyREpbrq7m94isFZKd+IU2U9c+WRoP68eVnoAExndG74Du
         qw74mF0fu1U3lhuASV2igZX1x4cjz8anBO3msxObm0H6K6l1+IDYJOZkmB4FTjgi4nlb
         h0xg==
X-Gm-Message-State: APjAAAUBmfJZGXgIZUxzLtYorWJkiYcg/HQvw5ZMqF3Bi3jjzGvP/j0M
        NYMCjqFMCG2XN1M0lwMS+Wk16Q==
X-Google-Smtp-Source: APXvYqyoHnkyxs6lUkgFkTdeB46dWH5MVKdPDqMKHGWBBWrmCgoMEtbFZmYRbm2shz9WS4nVuZDt2Q==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr49219802wru.398.1582281686837;
        Fri, 21 Feb 2020 02:41:26 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b67sm3501249wmc.38.2020.02.21.02.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 02:41:26 -0800 (PST)
References: <20200220205711.77953-1-martin.blumenstingl@googlemail.com> <20200220205711.77953-3-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Cc:     lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] ASoC: meson: aiu: introduce a struct for platform specific information
In-reply-to: <20200220205711.77953-3-martin.blumenstingl@googlemail.com>
Date:   Fri, 21 Feb 2020 11:41:25 +0100
Message-ID: <1jsgj42pey.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Thu 20 Feb 2020 at 21:57, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Introduce a struct aiu_platform_data to make the driver aware of
> platform specific information. Convert the existing check for the
> internal stereo audio codec (only available on GXL) to this new struct.
> Support for the 32-bit SoCs will need this as well because the
> AIU_CLK_CTRL_MORE register doesn't have the I2S divider bits (and we
> need to use the I2S divider from AIU_CLK_CTRL instead).
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/aiu.c | 19 ++++++++++++++++---
>  sound/soc/meson/aiu.h |  5 +++++
>  2 files changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index d3e2d40e9562..38209312a8c3 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -273,6 +273,11 @@ static int aiu_probe(struct platform_device *pdev)
>  	aiu = devm_kzalloc(dev, sizeof(*aiu), GFP_KERNEL);
>  	if (!aiu)
>  		return -ENOMEM;
> +
> +	aiu->platform = device_get_match_data(dev);
> +	if (!aiu->platform)
> +		return -ENODEV;
> +
>  	platform_set_drvdata(pdev, aiu);
>  
>  	ret = device_reset(dev);
> @@ -322,7 +327,7 @@ static int aiu_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Register the internal dac control component on gxl */
> -	if (of_device_is_compatible(dev->of_node, "amlogic,aiu-gxl")) {
> +	if (aiu->platform->has_acodec) {
>  		ret = aiu_acodec_ctrl_register_component(dev);
>  		if (ret) {
>  			dev_err(dev,
> @@ -344,9 +349,17 @@ static int aiu_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct aiu_platform_data aiu_gxbb_pdata = {
> +	.has_acodec = false,
> +};
> +
> +static const struct aiu_platform_data aiu_gxl_pdata = {
> +	.has_acodec = true,
> +};
> +
>  static const struct of_device_id aiu_of_match[] = {
> -	{ .compatible = "amlogic,aiu-gxbb", },
> -	{ .compatible = "amlogic,aiu-gxl", },
> +	{ .compatible = "amlogic,aiu-gxbb", .data = &aiu_gxbb_pdata },
> +	{ .compatible = "amlogic,aiu-gxl", .data = &aiu_gxl_pdata },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, aiu_of_match);
> diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
> index 06a968c55728..ab003638d5e5 100644
> --- a/sound/soc/meson/aiu.h
> +++ b/sound/soc/meson/aiu.h
> @@ -27,11 +27,16 @@ struct aiu_interface {
>  	int irq;
>  };
>  
> +struct aiu_platform_data {
> +	bool has_acodec;
> +};
> +
>  struct aiu {
>  	struct clk *pclk;
>  	struct clk *spdif_mclk;
>  	struct aiu_interface i2s;
>  	struct aiu_interface spdif;
> +	const struct aiu_platform_data *platform;
>  };
>  
>  #define AIU_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |	\

