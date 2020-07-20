Return-Path: <SRS0=nYmw=A7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF06C433FC
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 09:23:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE6B42176B
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 09:23:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="obAnsss+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbgGTJX7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jul 2020 05:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728225AbgGTJX6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jul 2020 05:23:58 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E40C0619D2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 02:23:58 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id j18so21542359wmi.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 02:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nLaI7SKqPmkCBwaiQh58vRC+ysbWJDB3m7E0+rdbv3A=;
        b=obAnsss+nlP86FHUb5s8+uhL+5pjtkD9xG7fKn6GelmnWvgY5KoRp1oFKBAn6v7D+b
         g7DeUgSySgnCm60xJRk70mknhnE6CJ6o3xJau2iJKzn+AIHm20LUovbz3dceaOpxBh7I
         +cypOtf3PFEyOqirsvSURucYoXT/maPOH9uDyJML3pT/5eAfFwjBSmyzohUR3zJoZNvq
         MGMMgPTPamiXiczSfsPl+F6xNfyr6diNyM2/bvzOyO2ZGsp+QGXzcwNZlNDqFtgHMtjm
         WyZLRlV56zGG4G986rk93+Pt1WFwvB1d3eRcth5Ac0k99brZVLmR/pDPdvGsSFlEHPhY
         nyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nLaI7SKqPmkCBwaiQh58vRC+ysbWJDB3m7E0+rdbv3A=;
        b=RTsuXBXvTJAPqNJpgOhvPgW1gpuRyPc1FWH87/o333pe58ubJN7qZg0INtl391BZ6i
         iiVvA1CNdT1D0U1GtGV+yZHrw86GGWB278iDvH3ALl/w2yyszDMCkTEZVWD8Cxb/pLXl
         PzkUdutkH3kmoklK08rjRJzl+NOuO35fPZH5UjVgvHm9ncDnPswyOvd9Z1yKxq9CMefh
         +FVVSDsaOyCi9/N9Iwzqyq5O7iw665vteKwXI9TQJ5af3NC2cw6IxMHGKftm/tepB8eN
         PEqbTU+QO/SIXPg+voBJohl/sOX7T3XNYDfn9uHHiHrxwEiNQQgml3uHwWlKwc8Ut2Iu
         i2PQ==
X-Gm-Message-State: AOAM533VLmbpg7QMwqMATcFYMA+jJvaupHFv7/lo2UKozrssENz3GAVF
        dmgtxCOznDCTGMYppdcs1WYQdQ==
X-Google-Smtp-Source: ABdhPJzkFoxqVa8pR1mDs4a+spsOvWgEprH0ioCHkRabVmP8EVd/JeUsi1P9xaCGElP2GWdbnfXVag==
X-Received: by 2002:a1c:59c2:: with SMTP id n185mr21663373wmb.104.1595237037144;
        Mon, 20 Jul 2020 02:23:57 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id c17sm17623763wrc.42.2020.07.20.02.23.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 02:23:56 -0700 (PDT)
Subject: Re: [PATCH v4 06/16] dt-bindings: nvmem: SID: add binding for A100's
 SID controller
To:     Frank Lee <frank@allwinnertech.com>, robh+dt@kernel.org,
        mripard@kernel.org, wens@csie.org, devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        tiny.windzz@gmail.com, huangshuosheng@allwinnertech.com,
        liyong@allwinnertech.com
References: <cover.1594708863.git.frank@allwinnertech.com>
 <6899200489cb4236650ba90646057874b82ed6b7.1594708864.git.frank@allwinnertech.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <76773e96-7a63-1362-dcf9-8cc49e386603@linaro.org>
Date:   Mon, 20 Jul 2020 10:23:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6899200489cb4236650ba90646057874b82ed6b7.1594708864.git.frank@allwinnertech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 14/07/2020 08:08, Frank Lee wrote:
> From: Yangtao Li <frank@allwinnertech.com>
> 
> Add a binding for A100's SID controller.
> 
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> ---

Applied thanks,
srini
>   .../nvmem/allwinner,sun4i-a10-sid.yaml        | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> index daf1321d76ad..6687ab720304 100644
> --- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> @@ -15,14 +15,17 @@ allOf:
>   
>   properties:
>     compatible:
> -    enum:
> -      - allwinner,sun4i-a10-sid
> -      - allwinner,sun7i-a20-sid
> -      - allwinner,sun8i-a83t-sid
> -      - allwinner,sun8i-h3-sid
> -      - allwinner,sun50i-a64-sid
> -      - allwinner,sun50i-h5-sid
> -      - allwinner,sun50i-h6-sid
> +    oneOf:
> +      - const: allwinner,sun4i-a10-sid
> +      - const: allwinner,sun7i-a20-sid
> +      - const: allwinner,sun8i-a83t-sid
> +      - const: allwinner,sun8i-h3-sid
> +      - const: allwinner,sun50i-a64-sid
> +      - items:
> +          - const: allwinner,sun50i-a100-sid
> +          - const: allwinner,sun50i-a64-sid
> +      - const: allwinner,sun50i-h5-sid
> +      - const: allwinner,sun50i-h6-sid
>   
>     reg:
>       maxItems: 1
> 
