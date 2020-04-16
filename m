Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F90C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:56:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 624D6206E9
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:56:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+92JQII"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440672AbgDPH4h (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 03:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2439745AbgDPH43 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Apr 2020 03:56:29 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 079AAC061A0C
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 00:56:29 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id y24so3713619wma.4
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 00:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kox1QxtahOd3osgWGMNatL/3WlQIWrSz32253M5/lF0=;
        b=V+92JQIIZjdcgco4btvgFG/iteh1q+0MLX70rPI2MGIuuDVP3vVQReGKfMarxs+Zta
         C5CQG5qoCn3eIgicA17GU2C9WDKmoL80EmGMBpU1/LUvdZwASEN95FstsDrQopoTuNtU
         3i9E9Dyfk6Wpx1xGAL7NfoYq7EclvZumOHRPwoBbIUHpqZpEr08EUVVu4y1zQOYvq5ju
         FTaoVpYkmqtpq+lp+Oi4b2Q/p17S146c52E4qOC5KnjlPTtm7sjj3lLqM0VGYgdly4Go
         ztIxXGmG+gVvETvZ/IBzNn6dM71b0ZCuXzh8Zrwyf2OnSCDVwnGRyqwzHyh+pooLiAru
         IuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kox1QxtahOd3osgWGMNatL/3WlQIWrSz32253M5/lF0=;
        b=LGb+RqcfmQ1RdGbQVqwL/Sytz1z3Jmtt6Cn4drn+my1UUMG/+JiqLrZeiz76Ebll0z
         TqPYgn7xFyN10TXpIApMgUKRxP04oyN5WcsZI/F4C5SnKrhP7xZEZPdIY7rs9vb4Ejvy
         hoKJtD/pIyCtbwtlU7XTs6+gE/F6VfauK0fOqRntIhC+rul8gXpyof+7q/WHo0WT7g/t
         Cmry/baZ0cpf2fd+77c9yU6s5s+SRUY9MAu/MwS3v5ozvF+W8ECpJ+jJGgGIkbAl0P3a
         IRzqdsP3+rw9E44Hgy0zYu9/L7+E9OhSXr6XT0atQyjVtB6NnZ7WETSRgdfUOXcFzV0p
         vHww==
X-Gm-Message-State: AGi0PuaH8o+Bj3z42cL1IxdRIS9YTaqzhLpN2jdiTuOhAqlbh60vb6gJ
        tFABvkz+6/vZZdFiAPKf33vzog==
X-Google-Smtp-Source: APiQypLjmf5r74x3HUYZnkW/IPjGxXrvT2N38yPWo5rdm9IEUQaAASgf3S69VUg0RsMZ+W2jo4ynZg==
X-Received: by 2002:a1c:9e42:: with SMTP id h63mr3297924wme.115.1587023787696;
        Thu, 16 Apr 2020 00:56:27 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id c17sm26766247wrp.28.2020.04.16.00.56.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Apr 2020 00:56:27 -0700 (PDT)
Subject: Re: [PATCH 04/11] ASoC: qcom: lpass-cpu: Make "ahbix-clk" an optional
 clock.
To:     Ajit Pandey <ajitp@codeaurora.org>, alsa-devel@alsa-project.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        plai@codeaurora.org, bgoswami@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, tiwai@suse.com
References: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
 <1586592171-31644-5-git-send-email-ajitp@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <090b1b81-3c33-7d37-e0bb-a5f73ab76ad0@linaro.org>
Date:   Thu, 16 Apr 2020 08:56:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1586592171-31644-5-git-send-email-ajitp@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 11/04/2020 09:02, Ajit Pandey wrote:
> AHB-I/X bus clocks inside LPASS coreis not a mandatory clocks for
s/coreis/core is/
> newer lpass variants, hence make it an optional one.
> 

Can you add more detail on which version of IP would not have this clk.

> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-cpu.c | 31 ++++++++++++++++++-------------
>   1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 492f27b..f177932 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -504,26 +504,31 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	drvdata->ahbix_clk = devm_clk_get(&pdev->dev, "ahbix-clk");
> +	drvdata->ahbix_clk = devm_clk_get_optional(&pdev->dev, "ahbix-clk");
>   	if (IS_ERR(drvdata->ahbix_clk)) {
>   		dev_err(&pdev->dev, "error getting ahbix-clk: %ld\n",
>   			PTR_ERR(drvdata->ahbix_clk));
>   		return PTR_ERR(drvdata->ahbix_clk);
>   	}
>   
> -	ret = clk_set_rate(drvdata->ahbix_clk, LPASS_AHBIX_CLOCK_FREQUENCY);
> -	if (ret) {
> -		dev_err(&pdev->dev, "error setting rate on ahbix_clk: %d\n",
> -			ret);
> -		return ret;
> -	}
> -	dev_dbg(&pdev->dev, "set ahbix_clk rate to %lu\n",
> -		clk_get_rate(drvdata->ahbix_clk));
> +	if (drvdata->ahbix_clk != NULL) {

No need for NULL checks here, clk apis already have checks.

--srini

> +		ret = clk_set_rate(drvdata->ahbix_clk,
> +				   LPASS_AHBIX_CLOCK_FREQUENCY);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"error setting rate on ahbix_clk: %d\n", ret);
> +			return ret;
> +		}
>   
> -	ret = clk_prepare_enable(drvdata->ahbix_clk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "error enabling ahbix_clk: %d\n", ret);
> -		return ret;
> +		dev_dbg(&pdev->dev, "set ahbix_clk rate to %lu\n",
> +			clk_get_rate(drvdata->ahbix_clk));
> +
> +		ret = clk_prepare_enable(drvdata->ahbix_clk);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"error enabling ahbix_clk: %d\n", ret);
> +			return ret;
> +		}
>   	}
>   
>   	ret = devm_snd_soc_register_component(&pdev->dev,
> 
