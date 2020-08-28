Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFA3C433E2
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 15:02:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BD2E2075B
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 15:02:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mPq8tCUi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgH1PC1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Aug 2020 11:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgH1PCU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Aug 2020 11:02:20 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B39C06121B
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 08:01:50 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id v12so868160lfo.13
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 08:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6ORqEBn3MQVjfqHgaJlncWKBp1Osp1LWkDwguAMB8RA=;
        b=mPq8tCUi0dIQrdG29c8UfphLhSnIkHJhnkkcnjJZQTUl1LuDWx8KtEV7yDOFPU0fqF
         v4l3EpgDsjbMJSPRoOfnHSABi3bcSMiNB/F9T/MaqQfy+xjPIgrQJ1dmVDcCckOevHC6
         92RmMRrF042iFBqI0RRphUWLHmL+aCBuX0IrbiS/W8vyU9t6sGXKCOiCthIIOw7JQrRH
         m8j0NOwTLnJAoNeMb5SwN6LkYliy95h0wMuagQARSqxorOE2zuCzmvqg4+pRvRi3P0dh
         T8rOURl5TTQgFQwFfBKgxbM8o8qmawR0iFN2LbmeKNP93nxNp3+JjB93inct7yc/5c6c
         YmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6ORqEBn3MQVjfqHgaJlncWKBp1Osp1LWkDwguAMB8RA=;
        b=Z55HPPdG9+lKnjUv3/HEww2sr3Tl0l5GKjbGUsBzqEgPwqwv8NRZxlZZOQl5Ap9VFn
         /WCqu3kq2jJLvziZghLwczs2zAubshFao7oD0EPWSQauFHvMCmJ1z8aIui++NIlTDadV
         Wz0ohR56JjFtnUmv/glnoW2GkoEGD+N44+RZBaUDD9kZhB/qSnpsidQcR7dNOnsFHpZc
         OrDJYAqa1PWt2goozfFWiPkG9awAf4RKcYQ/iRl0eI2iQoStKZwpaHGIqXVUWknHrf1v
         qbf4UYNSzxUh+Xw6BlG2ReL/OKlJouJOur26YZFlrLSgJt1iC5ksqQe6ifiVktRnRSxQ
         VK3A==
X-Gm-Message-State: AOAM530WC8oVwd1lk3/QULMOk0RCU5kbvT5FCSfb5EOdqOpXHsRyAJXz
        fK28+dQninpq4+J7OqCeKFNwWQ==
X-Google-Smtp-Source: ABdhPJzZj4EU+C53WrVm3puMlke4NYSKHE83tyvJQxfUAoQwWK/xY6ai+1okc7Ccixt5ZD0X8L3Q9A==
X-Received: by 2002:a19:ae0a:: with SMTP id f10mr999042lfc.100.1598626908397;
        Fri, 28 Aug 2020 08:01:48 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.62])
        by smtp.gmail.com with ESMTPSA id s127sm246691lja.119.2020.08.28.08.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2020 08:01:47 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] drm: bridge: add support for lontium LT9611UXC
 bridge
To:     Vinod Koul <vkoul@kernel.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>
References: <20200828120431.1636402-1-dmitry.baryshkov@linaro.org>
 <20200828120431.1636402-3-dmitry.baryshkov@linaro.org>
 <20200828141848.GX2639@vkoul-mobl>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <d2afbd86-eb53-e273-6de6-dfae64624b37@linaro.org>
Date:   Fri, 28 Aug 2020 18:01:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828141848.GX2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 28/08/2020 17:18, Vinod Koul wrote:
> On 28-08-20, 15:04, Dmitry Baryshkov wrote:
>> +static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
>> +				enum drm_bridge_attach_flags flags)
>> +{
>> +	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
>> +	int ret;
>> +
>> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
>> +		dev_err(lt9611uxc->dev, "Fix bridge driver to make connector optional!");
> 
> Can we support both modes as I have done in lt9611, that way once the
> conversion is done we can drop the init part and support conversion.
> 
> I have patch for msm driver to set DRM_BRIDGE_ATTACH_NO_CONNECTOR, you
> can use that to test

Probably the message text is misleading. The driver as is does not work 
w/o DRM_BRIDGE_ATTACH_NO_CONNECTOR. Do you plan to push that patch into 
upstream tree?

>> +static int lt9611uxc_hdmi_hw_params(struct device *dev, void *data,
>> +				 struct hdmi_codec_daifmt *fmt,
>> +				 struct hdmi_codec_params *hparms)
>> +{
>> +	/*
>> +	 * LT9611UXC will automatically detect rate and sample size, so no need
>> +	 * to setup anything here.
>> +	 */
>> +	return 0;
>> +}
> 
> Do we need dummy function?

Yes, this callback is mandatory (and audio_shutdown).


-- 
With best wishes
Dmitry
