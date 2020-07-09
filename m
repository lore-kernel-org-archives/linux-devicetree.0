Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960E2C433E2
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 09:27:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7234620663
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 09:27:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C70Q1X38"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgGIJ1D (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 05:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbgGIJ1C (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jul 2020 05:27:02 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3486C08C5DC
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 02:27:01 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g75so1071379wme.5
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 02:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FMsIKqz0TQneom1juHBrnPr4+LEkvs5/fxv1IIE3XgY=;
        b=C70Q1X38U223aCxs3FuOSpOTlYanEEPYXT0t+3DaQrYJWv09II/lPp5kqQs7gQ2VcN
         uN2igTC0DKNVTINBl+iTe2eiZIrOVoDJU47iAHJB1cEdHgJerHBzasRcCR6Ck/Cwss2o
         49uYuYdqW2tnrw7c94AbG7DSmTxaROH+jwViikAJfdNJFiQ0aIQvQWiBTR5mAPTC9vvT
         P8akeXqEr8JZ/5Gysl0VTyvZJewLN/pebHicUXKXKalBV/Xn5Q19HnoZ6v+PvtIoRx+/
         HyD0QfsBAIlQwElCRFFWr2fIyZvM8NTZgpeMvSb5K+Ey2WqJOH4khwPyNb2zxVjHzebp
         B79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FMsIKqz0TQneom1juHBrnPr4+LEkvs5/fxv1IIE3XgY=;
        b=earmsvrmEzFbBuCO4Pv0VhXV9UTwQJwTpVOnDLUn/CVPT92eAX/+YhIC0VplFkgMMY
         qF+Zdu9JjuFEW+YGsYSRw9cSF3Siz2ezieoO6im6WDzmD/qxkLJ/3rWkghe5leXl4z99
         LHNTEa9K8i/F96nBpdVDLXtgCjsPJCTjg56U4MuDxZWvOxEDcHZCUuHfel3CCu5zQ+5v
         df7rkCzoOkSJVSyMTSiXSkoCC4yyBpU6D6lDRJVft5usAzxIO0SO3Ka+FjjjHXocR8NM
         1Ph7ytyb8JhCpPW1SmECDa6cKlaG5Fl/3vRgJNXwsoZbY4nEQ800avgi2pqpyrihBaPl
         A6vg==
X-Gm-Message-State: AOAM530rh4lPnwhJiZQghiI1kLtZeXBil9qXBAThSeqdok1VAFwf0rPX
        HTXS6otAl97VbX7c2bdk92a0dg==
X-Google-Smtp-Source: ABdhPJx87vQ0PwnhiI1ahJoRP9NqWJA8+wddTTJt2k6+Vxk0Mt82SqkDwaPOMXauL4B2pMFUp5h+rQ==
X-Received: by 2002:a7b:c4d6:: with SMTP id g22mr13843098wmk.170.1594286820618;
        Thu, 09 Jul 2020 02:27:00 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id 65sm4081184wmd.20.2020.07.09.02.26.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 02:27:00 -0700 (PDT)
Subject: Re: [PATCH v3 5/8] ASoC: qcom: lpass-platform: Replace card->dev with
 component->dev
To:     Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-6-git-send-email-rohitkr@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <61b45372-2e84-9695-b99f-4839d507bb4e@linaro.org>
Date:   Thu, 9 Jul 2020 10:26:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1594184896-10629-6-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 08/07/2020 06:08, Rohit kumar wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> We are allocating dma memory for component->dev but trying to mmap
> such memory for substream->pcm->card->dev. Replace device argument
> in mmap with component->dev to fix this.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-platform.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 445ca193..f9424cc 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -472,9 +472,8 @@ static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
>   {
>   	struct snd_pcm_runtime *runtime = substream->runtime;
>   
> -	return dma_mmap_coherent(substream->pcm->card->dev, vma,
> -			runtime->dma_area, runtime->dma_addr,
> -			runtime->dma_bytes);
> +	return dma_mmap_coherent(component->dev, vma, runtime->dma_area,
> +				 runtime->dma_addr, runtime->dma_bytes);
>   }
>   
>   static irqreturn_t lpass_dma_interrupt_handler(
> 
