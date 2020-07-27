Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C1BC433EC
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 09:52:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57D0F2074F
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 09:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yc6ZgWRJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbgG0JwD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 05:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbgG0JwB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 05:52:01 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB637C061794
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 02:52:00 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a15so14194154wrh.10
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 02:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8Ivb7WRSFvNF43LLMwjK3O6NfSzTie0Usw8vsOB8K/4=;
        b=yc6ZgWRJ/53Yo92nHnUPBVnW4enDw7a6skJxpmxscMSJzPJNlbhe7b1lhbmOSQTww0
         bx84EEiszpuMK+73taVdH8TbPYjfVOlgjQ/7Lej+9MWigX7MJDHPHfXSkXJ2rFk65ZQI
         1qVpwis22BlfJQlMOC3QFwMc4DEQtlmdHLAxnKQdo5H9EGt6tw6A+HtipFcxEEIjt3Ab
         kKzB5sHGBcz2wlKy53TVdKm/+aCesfo6+U0BIN1FHEzaOECzQv7QsVe2eKrXp4/ohRfZ
         dwJbkViS4BM1PUJyG8WIuu08PfbFfF80I9tBON9rF6LKthiEGKALCiYEgPIfN4LA5vOY
         181Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8Ivb7WRSFvNF43LLMwjK3O6NfSzTie0Usw8vsOB8K/4=;
        b=ZPhRF0HycB43WzaCzCSzeLlztpfnTISOuJ0HicQ2rxWRNK3t9ZUEJlzDT3kDCAe6Eh
         BE5LdyXBKh3PRHiVZMV2eY4XIinr3sW7pgdGDAha+FQK1APs30kp3oJr5VjB7Kq9k2N8
         v+kL+sTFCg7gkK0j3rsN6H2TCk5iP468cMrHk7TjIq5X5PbGG31XGbRvYh9PrrPaOc75
         AparNZYmQzHfjc4Z2sW99HaSVhR/hBxlzaSVdBjGfl+ptdcdHprKABLs39/qKEEyA2HT
         nLrlKxS/QE062ySV+z3hBufOihPWflL/6QdxtPYBqAPO8zb9D7xYrYLxVoxTdaRycafl
         5o7A==
X-Gm-Message-State: AOAM532MHD3VtMcOvTwOKDwIHYRqLn9AeJ6yK3e9mmrrwVIJPpidatM+
        nryvxPpacRjlntmn7u6kcPuVxiJnYgE=
X-Google-Smtp-Source: ABdhPJwhPIZQCTIJ+3loH/6xoZ01cRZGkhu4qj//nMV7LcEL1bSw0YMqFBIIjUqluK4a+7ikv9P90g==
X-Received: by 2002:adf:94a1:: with SMTP id 30mr18721409wrr.37.1595843519166;
        Mon, 27 Jul 2020 02:51:59 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id 88sm12413747wrk.43.2020.07.27.02.51.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 02:51:58 -0700 (PDT)
Subject: Re: [PATCH] ASoC: dt-bindings: q6asm: Add Q6ASM_DAI_{TX_RX,TX,RX}
 defines
To:     Stephan Gerhold <stephan@gerhold.net>,
        Mark Brown <broonie@kernel.org>
Cc:     Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
References: <20200727082502.2341-1-stephan@gerhold.net>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <880a0748-b347-acff-2393-2e864ace5b72@linaro.org>
Date:   Mon, 27 Jul 2020 10:51:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200727082502.2341-1-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 27/07/2020 09:25, Stephan Gerhold wrote:
> Right now the direction of a DAI has to be specified as a literal
> number in the device tree, e.g.:
> 
> 	dai@0 {
> 		reg = <0>;
> 		direction = <2>;
> 	};
> 
> but this does not make it immediately clear that this is a
> playback/RX-only DAI.
> 
> Actually, q6asm-dai.c has useful defines for this. Move them to the
> dt-bindings header to allow using them in the dts(i) files.
> The example above then becomes:
> 
> 	dai@0 {
> 		reg = <0>;
> 		direction = <Q6ASM_DAI_RX>;
> 	};
> 
> which is immediately recognizable as playback/RX-only DAI.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Thanks Stephan,

Looks good to me,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
> ---
>   Documentation/devicetree/bindings/sound/qcom,q6asm.txt | 9 +++++----
>   include/dt-bindings/sound/qcom,q6asm.h                 | 4 ++++
>   sound/soc/qcom/qdsp6/q6asm-dai.c                       | 3 ---
>   3 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt b/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
> index 6b9a88d0ea3f..8c4883becae9 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
> @@ -39,9 +39,9 @@ configuration of each dai. Must contain the following properties.
>   	Usage: Required for Compress offload dais
>   	Value type: <u32>
>   	Definition: Specifies the direction of the dai stream
> -			0 for both tx and rx
> -			1 for only tx (Capture/Encode)
> -			2 for only rx (Playback/Decode)
> +			Q6ASM_DAI_TX_RX (0) for both tx and rx
> +			Q6ASM_DAI_TX (1) for only tx (Capture/Encode)
> +			Q6ASM_DAI_RX (2) for only rx (Playback/Decode)
>   
>   - is-compress-dai:
>   	Usage: Required for Compress offload dais
> @@ -50,6 +50,7 @@ configuration of each dai. Must contain the following properties.
>   
>   
>   = EXAMPLE
> +#include <dt-bindings/sound/qcom,q6asm.h>
>   
>   apr-service@7 {
>   	compatible = "qcom,q6asm";
> @@ -62,7 +63,7 @@ apr-service@7 {
>   
>   		dai@0 {
>   			reg = <0>;
> -			direction = <2>;
> +			direction = <Q6ASM_DAI_RX>;
>   			is-compress-dai;
>   		};
>   	};
> diff --git a/include/dt-bindings/sound/qcom,q6asm.h b/include/dt-bindings/sound/qcom,q6asm.h
> index 1eb77d87c2e8..f59d74f14395 100644
> --- a/include/dt-bindings/sound/qcom,q6asm.h
> +++ b/include/dt-bindings/sound/qcom,q6asm.h
> @@ -19,4 +19,8 @@
>   #define	MSM_FRONTEND_DAI_MULTIMEDIA15	14
>   #define	MSM_FRONTEND_DAI_MULTIMEDIA16	15
>   
> +#define Q6ASM_DAI_TX_RX	0
> +#define Q6ASM_DAI_TX	1
> +#define Q6ASM_DAI_RX	2
> +
>   #endif /* __DT_BINDINGS_Q6_ASM_H__ */
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index a2acb7564eb8..9b7b218f2a20 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -37,9 +37,6 @@
>   #define COMPR_PLAYBACK_MAX_FRAGMENT_SIZE (128 * 1024)
>   #define COMPR_PLAYBACK_MIN_NUM_FRAGMENTS (4)
>   #define COMPR_PLAYBACK_MAX_NUM_FRAGMENTS (16 * 4)
> -#define Q6ASM_DAI_TX_RX	0
> -#define Q6ASM_DAI_TX	1
> -#define Q6ASM_DAI_RX	2
>   
>   #define ALAC_CH_LAYOUT_MONO   ((101 << 16) | 1)
>   #define ALAC_CH_LAYOUT_STEREO ((101 << 16) | 2)
> 
