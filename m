Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A79C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 07:08:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30AB62073E
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 07:08:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cv498ppM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730649AbgF3HIc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 03:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgF3HIc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 03:08:32 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6EAC061755
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 00:08:32 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id w3so6028206wmi.4
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 00:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=23N3PD1zYKiJlQjoSFZFSqUybbWQSmtHguDgu99PEU8=;
        b=cv498ppMfYJE+lXeMujo9ianyHcIe+HquAh9138Py4bb12b9Z611l9iABZmUXtSCsy
         4hqMGaooxHdZqYYOTMbWH2gLCOnN2rFlSsH49cZnYwKaF8m7cWKMpHDyqMwth9jqOJz4
         mvrkiEmxvX3V7K2fuDzf4FrhpNXc8k9a23ITh3kLIXGgSwAZOxA+t1f/LD4DLnVYDrL8
         mE0k07CcN1D2eWf/Bjalm4YQ+Owc4iGmguTjauDkGOyEklov1Hi428MUAmaudpWVJInE
         yKTCO9FraE4q687k+DWRCvgk54WJ3BFfv5goqmKhptbbrlDWG6EqJhdLBD+UFFUJcnUv
         RgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=23N3PD1zYKiJlQjoSFZFSqUybbWQSmtHguDgu99PEU8=;
        b=XU+04JFpsP74ySIE9gFM9bOsdY2OwR+VXKURO+lQpvX4BGh/ilB5CAxjlRPpRuChma
         /mjHhvjzeJFIom2IHt25YxHaaOXqF41I2idecAswCwM8zdZYYom6Vii05stX5NTAR0FF
         vIT9C3n4m/1hJYx7bW6YhrinNXr8fAr2GQceDhiIHRAZBEIm+nlFJY1z39NbHtxRcv/T
         /M8kULeuoWREpTDhEVOfY/TYJq0TwkAPlDqHMA3+XEV/DA5w3T6nN91lZPsSE011B2eP
         UT265GT1mm4vsgQgCvP3WSeYScHIdLp1lHOOBIISVSRg+ThrvmsZzEIOgQ+spoTiWKM9
         oQ4Q==
X-Gm-Message-State: AOAM530fVI2Qs5mQjGsGBV3xdRHqZBqrU7IA231DkOFE5mFZsM5ln4QG
        H9VSoquTav5fENOoFifmSKg/xQ==
X-Google-Smtp-Source: ABdhPJxE0uRlw1BHrGZHphRrxopSZLNGJ39LLva4RCTcFLvGJM9h+w4u8HKR+ZlfGd4zK30+SKxSZg==
X-Received: by 2002:a1c:9acf:: with SMTP id c198mr20007906wme.172.1593500910731;
        Tue, 30 Jun 2020 00:08:30 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id 14sm2303314wmk.19.2020.06.30.00.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 00:08:30 -0700 (PDT)
Date:   Tue, 30 Jun 2020 08:08:28 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     robh+dt@kernel.org, benjamin.gaignard@st.com,
        devicetree@vger.kernel.org
Subject: Re: [RFC] dt-bindings: mfd: st,stmfx: Remove extra
 additionalProperties
Message-ID: <20200630070828.GE1179328@dell>
References: <20200629192335.24622-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200629192335.24622-1-festevam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 29 Jun 2020, Fabio Estevam wrote:

> The following build error is seen with 'make dt_binding_check':
> 
>   CHKDT   Documentation/devicetree/bindings/mfd/st,stmfx.yaml
> /home/fabio/linux-next/Documentation/devicetree/bindings/mfd/st,stmfx.yaml: properties:pinctrl:patternProperties: {'enum': ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'if', 'items', 'maxItems', 'maximum', 'minItems', 'minimum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'propertyNames', 'required', 'then', 'unevaluatedProperties']} is not allowed for 'additionalProperties'
> 
> Remove the extra 'additionalProperties' to pass the build.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/st,stmfx.yaml | 2 --
>  1 file changed, 2 deletions(-)

Any reason for not sending this to LKML?

> diff --git a/Documentation/devicetree/bindings/mfd/st,stmfx.yaml b/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
> index 0ce56a0da553..bed22d4abffb 100644
> --- a/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
> +++ b/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
> @@ -73,8 +73,6 @@ properties:
>            output-high: true
>            output-low: true
>  
> -      additionalProperties: false
> -
>      additionalProperties: false
>  
>      required:

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
