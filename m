Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A7CC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 13:36:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DBA422173E
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 13:36:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlmzucKR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729395AbfLLNgu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 08:36:50 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36660 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729393AbfLLNgu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 08:36:50 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so2321723ljg.3;
        Thu, 12 Dec 2019 05:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7c1qu0SvcUZSUFUURu9LxpNbTF8Occs+/PTX73tOBZ0=;
        b=rlmzucKRy1yQs+UO0rxxLBcAl/u6J/VfieF8buFOZ7I/6LR7O0qPv57GUAoDEi9eWR
         6kKEIb7uK8aE6v2oX4yEQwbke3cF1ISIthp0gXcXC6HKGXYMan51aMpAyH0U7zzNp1TZ
         e8GBH3+O5s9Sc6Cn4rWoTQuD20JS8phuDalW26mI4VAECYLFaIVTO3187zLSMixK59nm
         tmMX3rnTPfrP4uNi5owm6Q1MvdAQtDqBgENeLLkUkLN9TfuUw68KF+EEsYr+uQbSSgW5
         3EEVg+ztdgB7fuE5Yqp5ABxiHvwVKb1RPQImx/oYnUbIFqyVq4QfM97HN/wJt9T2MeNE
         ywUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7c1qu0SvcUZSUFUURu9LxpNbTF8Occs+/PTX73tOBZ0=;
        b=RtVZMcQIHdgx1q4SC/ooa/Bb+Pgre03LLMU0wOEG+pJe4S7en5UQctx+1M5V75RT2s
         jYtvBMCXpKtk0oZvywQUGJZnldPeJ3QxaWuGdWB6MlIj7Fo6wPAL8NYxx1D3GeXypJ54
         ruqQPSE5arn87c9PlSzPWj6jROpaqUIvP7C0KM0r/YkKYE2PWSjKmSHujM8Y2tliUMh2
         IcZkq9UyZJ7bJ63L5daJX6NCVSWe16j3Xz+i+BbdpQRTPzuzNZK/lnmvECDD/rn4aIhJ
         tWPvMVK/WpTD+xH/WOvkJ3BOnoGj8Rri0y37qQUjJQ6jFBvr4v4PPqtp+GT9e9+SJxU/
         N1Mw==
X-Gm-Message-State: APjAAAUVQtkG4cnWf3SyWRfz0CRlLKbKiLbAVYohMjj+nXgOpmP+YWX7
        hwtVC44owriA4DBXf95bHA9ptrJS
X-Google-Smtp-Source: APXvYqy+m/6WkdV7LlnxUnOLocCoWK84+TS/lYoiCUUhknMyo1AnYSSuL53kRJA53+c5wDVZmigzWA==
X-Received: by 2002:a2e:9987:: with SMTP id w7mr5889604lji.107.1576157806908;
        Thu, 12 Dec 2019 05:36:46 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id t2sm2996167ljj.11.2019.12.12.05.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 05:36:45 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: memory-controllers: tegra: Fix type
 references
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
References: <20191211163210.9778-1-robh@kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <099dcb4e-265c-7789-1b10-d8aa6f1d6922@gmail.com>
Date:   Thu, 12 Dec 2019 16:36:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191211163210.9778-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

11.12.2019 19:32, Rob Herring пишет:
> Json-schema requires a $ref to be under an 'allOf' if there are
> additional constraints otherwise the additional constraints are
> ignored. (Note that this behavior will be changed in draft8.)
> 
> Fixes: 641262f5e1ed ("dt-bindings: memory: Add binding for NVIDIA Tegra30 External Memory Controller")
> Fixes: 785685b7a106 ("dt-bindings: memory: Add binding for NVIDIA Tegra30 Memory Controller")
> Fixes: 8da65c377b21 ("dt-bindings: memory: tegra30: Convert to Tegra124 YAML")
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I'll take this via the DT tree for rc2.
> 
>  .../bindings/memory-controllers/nvidia,tegra124-mc.yaml  | 3 ++-
>  .../bindings/memory-controllers/nvidia,tegra30-emc.yaml  | 9 ++++++---
>  .../bindings/memory-controllers/nvidia,tegra30-mc.yaml   | 3 ++-
>  3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
> index 30d9fb193d7f..22a94b6fdbde 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
> @@ -60,7 +60,8 @@ patternProperties:
>              maximum: 1066000000
>  
>            nvidia,emem-configuration:
> -            $ref: /schemas/types.yaml#/definitions/uint32-array
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32-array
>              description: |
>                Values to be written to the EMEM register block. See section
>                "15.6.1 MC Registers" in the TRM.
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
> index 7fe0ca14e324..e4135bac6957 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
> @@ -56,7 +56,8 @@ patternProperties:
>              maximum: 900000000
>  
>            nvidia,emc-auto-cal-interval:
> -            $ref: /schemas/types.yaml#/definitions/uint32
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
>              description:
>                Pad calibration interval in microseconds.
>              minimum: 0
> @@ -78,7 +79,8 @@ patternProperties:
>                Mode Register 0.
>  
>            nvidia,emc-zcal-cnt-long:
> -            $ref: /schemas/types.yaml#/definitions/uint32
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
>              description:
>                Number of EMC clocks to wait before issuing any commands after
>                sending ZCAL_MRW_CMD.
> @@ -96,7 +98,8 @@ patternProperties:
>                FBIO "read" FIFO periodic resetting enabled.
>  
>            nvidia,emc-configuration:
> -            $ref: /schemas/types.yaml#/definitions/uint32-array
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32-array
>              description:
>                EMC timing characterization data. These are the registers
>                (see section "18.13.2 EMC Registers" in the TRM) whose values
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
> index 84fd57bcf0dc..4b9196c83291 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
> @@ -77,7 +77,8 @@ patternProperties:
>              maximum: 900000000
>  
>            nvidia,emem-configuration:
> -            $ref: /schemas/types.yaml#/definitions/uint32-array
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32-array
>              description: |
>                Values to be written to the EMEM register block. See section
>                "18.13.1 MC Registers" in the TRM.
> 

But the "nvidia,emem-configuration" doesn't have any extra constraints.
Or you just added the "allOf" for consistency to avoid possible future
copy-paste bugs?

Otherwise LGTM, thanks!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

