Return-Path: <SRS0=LTWd=4A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE389C2BA83
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 16:51:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B30E42082F
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 16:51:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pI/Uj+Ng"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbgBLQvX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Feb 2020 11:51:23 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36245 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727264AbgBLQvX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Feb 2020 11:51:23 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so3339508wma.1
        for <devicetree@vger.kernel.org>; Wed, 12 Feb 2020 08:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=jcwPPW7Ev1718UkfNVS1QPUEtrgq4T5wb5lfvsIk75g=;
        b=pI/Uj+NgpJWyw/bZYwtPk+y/p3f+bjnqhsf8M+jreGoDwlvfSIp0kKgJ/NXDiB6E89
         Bu9Xt2W8awx7LY82+2OPhr5WoA6TZ7m1QAofSx6SSBeKEES0V3LOdiJWuon4eSRA8ADW
         teK/s6epYxohcYgvuHxiVdLZffI/QEUeA7dGy9191u8cCLVFHNOpSmcRj+kTazI4NAe/
         //1Q/7Xved6L7E2FLtgkbvg7BX+x1xil6Mo4LJY3SZWEvHX+wN/kdQtdXgCEpHMKjqul
         nTxLeGpGB4fxtrRa/ZxNDNeHreeN+1U2KzTXNocgLX1hRKRcNATOiTZ+Aw9PB7cKaa+u
         HI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=jcwPPW7Ev1718UkfNVS1QPUEtrgq4T5wb5lfvsIk75g=;
        b=QJzToFl4aOBU6N4PcIu+r4656NNauKL5KqCNdAK/zIT89r5lPK+N0uDXwhXkxF14Ru
         dKNFBf+c/pOwszL74QaePy4sS3eiOkzU05g70i3cmWyvDhViy7caQoqOWYTp1pZqUylO
         shye9B3FFxrGGMhW53fp4xnyRuloRPOKMzWhtTFRyqFsGNVDOGClwElfGEBt9oCZniZH
         NcNvYSwbHzlGMKPWZhi7H1IZ8wI8TNwI2v9VpMb4yD4r0wICLvFcbJ6TOli0A8Z5zZz5
         pAR3mNAy1Xi3E14oeoROvj4X47l5bkXnvDDuQJjp3W1/vZJ8eNmaB97xu/iPmcqwTB4i
         JaNw==
X-Gm-Message-State: APjAAAVs0y8gmGt8CB33mR01+DZ4cMtBnVM1QM/fxbGL3q1AWU2WbGWd
        wZCk/cw5LdMcB5yyfj2TI3ip3g==
X-Google-Smtp-Source: APXvYqy/kKObZd2NSS6kusayeRjgm+RKUhmrp/l8q6AIlEspwd/NpCOmscu5Kd/J+WQB2skteKA6PQ==
X-Received: by 2002:a1c:113:: with SMTP id 19mr14147384wmb.95.1581526280567;
        Wed, 12 Feb 2020 08:51:20 -0800 (PST)
Received: from linaro.org (14.red-88-14-208.dynamicip.rima-tde.net. [88.14.208.14])
        by smtp.gmail.com with ESMTPSA id a184sm1365854wmf.29.2020.02.12.08.51.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 08:51:19 -0800 (PST)
Date:   Wed, 12 Feb 2020 17:51:16 +0100
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux@armlinux.org.uk, p.paillet@st.com, linus.walleij@linaro.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, fabrice.gasnier@st.com
Subject: Re: [PATCH v3 1/2] dt-bindings: mfd: Document STM32 low power
 clkevent bindings
Message-ID: <20200212165116.GA2949@linaro.org>
References: <20200128120702.26166-1-benjamin.gaignard@st.com>
 <20200128120702.26166-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200128120702.26166-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jan 28, 2020 at 01:07:01PM +0100, Benjamin Gaignard wrote:
> Add a subnode to STM low power timer bindings to support clkevent driver

clkevent is Linux specific.

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/mfd/st,stm32-lptimer.yaml          | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> index 1a4cc5f3fb33..535e0b40cdf9 100644
> --- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> @@ -81,6 +81,16 @@ patternProperties:
>      required:
>        - compatible
>  
> +  clkevent:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: st,stm32-clkevent-lp
> +
> +    required:
> +      - compatible
> +
>  required:
>    - "#address-cells"
>    - "#size-cells"
> @@ -115,6 +125,10 @@ examples:
>        counter {
>          compatible = "st,stm32-lptimer-counter";
>        };
> +
> +      clkevent {
> +        compatible = "st,stm32-clkevent-lp";
> +      };
>      };
>  
>  ...
> -- 
> 2.15.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
