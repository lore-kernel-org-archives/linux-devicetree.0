Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0BBC33C9E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 08:32:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1FC282070E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 08:32:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJNwDlL1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbgAHIca (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 03:32:30 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33733 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgAHIcZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 03:32:25 -0500
Received: by mail-ed1-f68.google.com with SMTP id r21so1905034edq.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 00:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EJq18jC7Zcz3jiw0XRo7+m7xE+YdVfNUh9ZReMPNKrQ=;
        b=DJNwDlL1OXItKz/ojVHNGLCZiQNC7yNY+dsK8FbSYlWnTs1cyL+qkedoxGsjqc3+fW
         ncrG3n2hfRJoaJXKssiN2a64aqYsJz7skH4erSYSHp+ukpUmJAvphLc+oedLvpFBnGti
         mN9NcltTeEmn5w5KzpyXlWqvurg2a13jcJknbN719hY8eHOoggCO3QW6yDH8AnUX1U/M
         SoZEGEnurhtEVNTgzHJOy5vLA1nAGvK7aKqpOwJ0owDCcvU3VvT9c86YhqYKb7OT4UYp
         upZ7mDQj+n+fPxfHUsxLD9hA4ArlDKcmd7UROcNceqpLZeu1UnLgX+hbfPCE7gCyj8PN
         q3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EJq18jC7Zcz3jiw0XRo7+m7xE+YdVfNUh9ZReMPNKrQ=;
        b=GruvgrzXJyroVuLcEwps5NAtQnB5RYViKBwZKJzzrBSeY1x2Rbjly97+KfAsl3VQz3
         1FHQibYz24AniX6sY/YxcObounJLKCUcHELaQQpkxaRnBW6wxSO05zGKRrOlWl1uC/4q
         M7wE03jWLihVXzr3m23sD/WCii+uNn0j2UUktVq4CLdEmCbdlloo2CZ040vFLdBJZOIy
         OQSgMw8dBw0NXxqj55EOchtatuKLp3PVC6jqBiVleYmL3lGRkyaNJF0Fxi+DLyyCap6Y
         nuzfcVKKWyRqowaRfvfVdogXUr+BcSTcl0HXfLcBlNveFAKMM19/IomOXUwZ2W7JA9KT
         f5Vw==
X-Gm-Message-State: APjAAAWThP+dqKnTZ/47Y2n0WYA1nifXrYys/eW2oHsjIUunxgKLzKhL
        ZGMVK3sfvZBT6R+viqE5k+hA8Q==
X-Google-Smtp-Source: APXvYqwI7JobTMRItpT6/lKFsQ/omg3dzT9QAyBjzuK9dcOB1hXL83guixIepLk5Eo5emXux/Kiimg==
X-Received: by 2002:a17:906:19ca:: with SMTP id h10mr3649690ejd.282.1578472343655;
        Wed, 08 Jan 2020 00:32:23 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id dd17sm61670edb.9.2020.01.08.00.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 00:32:22 -0800 (PST)
Subject: Re: [PATCH v2] arm64: dts: qcom: add Venus firmware node on Cheza
To:     Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200108032623.113921-1-acourbot@chromium.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <ab7bbed7-c4dc-8411-1267-5b1cb995581a@linaro.org>
Date:   Wed, 8 Jan 2020 10:32:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108032623.113921-1-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On 1/8/20 5:26 AM, Alexandre Courbot wrote:
> Cheza boards require this node to probe, so add it.
> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 6 ++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)

Thanks Alex.

Reviewed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index 9a4ff57fc877..8c2e3aeacac4 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -1279,3 +1279,9 @@ config {
>  		};
>  	};
>  };
> +
> +&venus {
> +	video-firmware {
> +		iommus = <&apps_smmu 0x10b2 0x0>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index ddb1f23c936f..8f1d19c5a098 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2567,7 +2567,7 @@ usb_2_dwc3: dwc3@a800000 {
>  			};
>  		};
>  
> -		video-codec@aa00000 {
> +		venus: video-codec@aa00000 {
>  			compatible = "qcom,sdm845-venus";
>  			reg = <0 0x0aa00000 0 0xff000>;
>  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> 

-- 
regards,
Stan
