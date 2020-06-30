Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5103BC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 02:02:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2439E20780
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 02:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593482549;
	bh=JQBoPiW48a/Quyn5TE2ZAuiPZOmCVn8hPPh7sw1k52k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=uCKagM/QOnj8si8N/FUDZl/1bACkBj6WwuQnazaYxw44LWaN4/YhbiQp4fWMX8UY7
	 hAjSA7cciQWEwq9U24WerZKzUS6j1gpkcXAiifoKG6mqp5cVH3YHUCfYYqClJIZccz
	 ltIgt2wKBd51J45Zxyxo83UXvF9S331eC8v2pj5s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgF3CC2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 22:02:28 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:33689 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgF3CC2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 22:02:28 -0400
Received: by mail-io1-f45.google.com with SMTP id i25so19415394iog.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 19:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1UY5frEkiMmqLahJcRPJI2S/07SkjxHiGSILsgbD4WY=;
        b=YGh54McVBHITgwe5Vy/nkptAUNdFtnMkOca6+H7jaW2KMIe7gpZzhfhGAGWpGchcBi
         Ez+c0FOugVcxmRvZvrBGl5dOREciZN231T9ZdcqiUvdADd9J/OGOjA09aKJtf21YmF7x
         WVoujOA6FNTHOqexG8Ker/E1ps/1K1mwF5JxMoyoererzqBQQRT66yH9MiOq7i2O2s5v
         jQVJdKc1QwscuOXRkB48DgC5a+UMsgcuvH8QwYACptuAB5tdwIJV2mmfCNVod13Avbdr
         JF9NQ3ZGex2rkJribQlPOXrLsrZqmQSSVcsuesSQVYkLuNWb/2tFy2xXzTt8URsZXxka
         LHTg==
X-Gm-Message-State: AOAM530i3ap2fUrdYugXjUgEsCr9v4YdVkfvL47pO8ukTItfHXni/Z45
        xSoAFVglex2DH9n0kq2cZg==
X-Google-Smtp-Source: ABdhPJzm8nLa34A0lKTNPAEodEtkow5htEduZq1oUxIB4mKefxUvCzPdkTIL1SyylWllWQubS+BHpA==
X-Received: by 2002:a02:2a44:: with SMTP id w65mr21694954jaw.110.1593482547545;
        Mon, 29 Jun 2020 19:02:27 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
        by smtp.gmail.com with ESMTPSA id y20sm791956ioc.30.2020.06.29.19.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 19:02:26 -0700 (PDT)
Received: (nullmailer pid 3465056 invoked by uid 1000);
        Tue, 30 Jun 2020 02:02:26 -0000
Date:   Mon, 29 Jun 2020 20:02:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     benjamin.gaignard@st.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, lee.jones@linaro.org
Subject: Re: [RFC] dt-bindings: mfd: st,stmfx: Remove extra
 additionalProperties
Message-ID: <20200630020226.GA3465001@bogus>
References: <20200629192335.24622-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629192335.24622-1-festevam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 29 Jun 2020 16:23:35 -0300, Fabio Estevam wrote:
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
> 

Reviewed-by: Rob Herring <robh@kernel.org>
