Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFA0C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 12:24:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2990120781
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 12:24:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lkow4fJt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732516AbgFWMYS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 23 Jun 2020 08:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732542AbgFWMYS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 23 Jun 2020 08:24:18 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4162C061755
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 05:24:17 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h5so20329315wrc.7
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 05:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=++T8yoGkGRxx38VWQ3gyOTuSMcmswHmEWL3ZocVDNWk=;
        b=Lkow4fJtt0BRPWbiyfYj3mVy0BAbo+XzVkXopTpZ6F0bAFxi1QBH0+boQE0phOJ2OG
         5ZiJBUfg5ib7zXl6YEkBobiyIBmJNREpqb+qKFSALFMox8rNqYIKEMcguwGMbrYo9Hb7
         ZoYlTyHdtFD+VsT7x2lAJjxt5/wakqbk370A4HdqdsUb+ce40uymikWS2YuUdfppGQLR
         GgdW7S5GuUEdRviWyjuSLJyOHy2UYkvtm9mzffRqZT0eetFNaifFAUJrqCgoB5lH5hQs
         HwIVAf3Ir52H7qKTzyv8RPzAVXf1NYiniB6lJLyJ+tAUI8dSvhaxqc8zJYG6cWMw1781
         3WAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=++T8yoGkGRxx38VWQ3gyOTuSMcmswHmEWL3ZocVDNWk=;
        b=JAOH2R1Hp6Kk6NIpK9GuJqTyHZpY+UaZnZcMIOPuY6zO5JdjgdRAIdlkZDZtUW0UbR
         WJsN/tK3+RoAdST9ZksT8ZFjIWWdPf61kPdwMkyGRzAmLurvHjMbXHR9PR8VA+OHFTPW
         D/11BbK4TRaRzvS69oYoAtq46Y05WaLfjJJkF1QAVNcKpDTXWB6NB+/8nhGsvVGs+Ri7
         Ova1rdTGxDSgfQJnJlkH1pZ3W9hBVTUaH7npp+myD/yUbtTS5jF3KWInuasFxTOLRXFJ
         CEb+YPwgD0lrTYFpLVhGoBWCuu4WB2wTJDpWeL9WX1v68ebswmm6QHPDXYhW0mCR/H2o
         2LPA==
X-Gm-Message-State: AOAM533gOET4Yibb5bYb4axMTwIiISQYmhZw9qj6pK4z3q7U7BIQKfrh
        rS+EMHU+wNumQhZPS5DOE9vIGR6P544=
X-Google-Smtp-Source: ABdhPJx/HQDrBA+jX35kXwkrQ2leG+4O8B1oCB6K/K6s4IV+voC5Hx9AWpSSjpvNS0Enjrg8JhRoVg==
X-Received: by 2002:adf:e484:: with SMTP id i4mr14831422wrm.246.1592915056487;
        Tue, 23 Jun 2020 05:24:16 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id 133sm3995590wme.5.2020.06.23.05.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 05:24:15 -0700 (PDT)
Date:   Tue, 23 Jun 2020 13:24:13 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: uniphier: change support card to
 simple-mfd from simple-bus
Message-ID: <20200623122413.GA954398@dell>
References: <20200623114614.792648-1-yamada.masahiro@socionext.com>
 <20200623114614.792648-4-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200623114614.792648-4-yamada.masahiro@socionext.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 23 Jun 2020, Masahiro Yamada wrote:

> 'make ARCH=arm dtbs_check' emits the following warning:
> 
>   support-card@1,1f00000: $nodename:0: 'support-card@1,1f00000' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
> 
> Maybe, simple-mfd could be a better fit for this device.

The two should be equivalent.

What do you mean by "maybe"?  Does this squash the warning?

Isn't the issue caused by the ','?

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  arch/arm/boot/dts/uniphier-support-card.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/uniphier-support-card.dtsi b/arch/arm/boot/dts/uniphier-support-card.dtsi
> index 11e46e7de7c5..eedc10cbc6e6 100644
> --- a/arch/arm/boot/dts/uniphier-support-card.dtsi
> +++ b/arch/arm/boot/dts/uniphier-support-card.dtsi
> @@ -10,7 +10,7 @@ &system_bus {
>  	ranges = <1 0x00000000 0x42000000 0x02000000>;
>  
>  	support_card: support-card@1,1f00000 {
> -		compatible = "simple-bus";
> +		compatible = "simple-mfd";
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0x00000000 1 0x01f00000 0x00100000>;

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
