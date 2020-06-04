Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB58AC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 06:47:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7249207DA
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 06:47:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zl2aZthW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgFDGri (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 02:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbgFDGrh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jun 2020 02:47:37 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894DDC03E96D
        for <devicetree@vger.kernel.org>; Wed,  3 Jun 2020 23:47:37 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t18so4797306wru.6
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 23:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=VXWuc3acfN5ShHd6vrfkl/0I+q0bP7rAYqkXwWwUYns=;
        b=Zl2aZthWUNH2LE30gnjjE0uKjkUi2uVMRg18sdyUg/70mHMVe1wiP9jIKG0maz9fFp
         mR+++xw/PBLqFP/i0JgzMwaO1vi+gROG9XzoLOp3QhTxhjc1G7sIE5W48fjq7qmoKlB+
         u3DWH0GM82npEhMKjz5iO4ldgdON+fIPzWmiAiyTsACihIxb3jsTeNPxILSp0ZtGwJaY
         5zoVxlGHUn80bq10kkYQKkfaISpePg9VMSrJBT/bLeT+w1C9YDkVvW23Jx6/wfhlMjr5
         fQqFrnMxc1YkafXZWP7Lq1HYCw8Xgv05txiPckOQ4J3kawh2s/9VAJ9zbu8CtgOjgELI
         Yong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VXWuc3acfN5ShHd6vrfkl/0I+q0bP7rAYqkXwWwUYns=;
        b=TcPChSIHWARg45tdt2Q8rZ5ab6QIVjwrPZrQ1w/zH+KvSZckBrrhI+2qJQh2aU1NhM
         vp1bcn9B80BZv79wJl3a0P1w1ibN2VatZD7xrTUQ1x4KnE2oKCoDZ/Ld0Wnf4OL2bYXY
         H1XQt/7xPOzRuwD1iSLChnnoBBREBLCAex7Tz5Y5aD+eNtcR18hRmPXktWrWNEbwZKWu
         VZiDTLulmGk0do3oxg8Hm6J+sr/Mm1+29q3GQXQJHFLHBNjSxfWFFK7hzMzkn2iiGbXM
         FXlxyMtcTmZqadwhpiPdct07Y7Bq+ciU0MF/zDsawPmuIukC8UwV+SOPS90MMG0N2NLz
         TmUA==
X-Gm-Message-State: AOAM532mBH0l5DUmgKYaKnU6oS1S0LekBIxHVPpwKW0zadbYmtL4Abuw
        1Z/tx55WXjcTIuL79wD4HntvAw==
X-Google-Smtp-Source: ABdhPJwqTdrJ/z7s+BjLjkIXpv3lZj668hWy9pLg2vWSkiz7Ttn5Z3cHrAmX7wYGyvzymxhq2IvqQw==
X-Received: by 2002:adf:f84d:: with SMTP id d13mr2658231wrq.99.1591253256261;
        Wed, 03 Jun 2020 23:47:36 -0700 (PDT)
Received: from dell ([95.147.198.92])
        by smtp.gmail.com with ESMTPSA id g18sm5855948wme.17.2020.06.03.23.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 23:47:35 -0700 (PDT)
Date:   Thu, 4 Jun 2020 07:47:34 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Keerthy <j-keerthy@ti.com>, Axel Lin <axel.lin@ingics.com>
Subject: Re: [RFC 2/4] regulator: lp87565: dt: remove duplicated section
Message-ID: <20200604064734.GS3714@dell>
References: <20200603200319.16184-1-luca@lucaceresoli.net>
 <20200603200319.16184-3-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200603200319.16184-3-luca@lucaceresoli.net>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 03 Jun 2020, Luca Ceresoli wrote:

> The "Required properties:" section is copied verbatim for each of the two
> supported chips. In preparation to add a new chip variant make it a common
> section and keep the two examples to differentiate between the two chips.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  .../devicetree/bindings/mfd/lp87565.txt       | 21 ++++---------------
>  1 file changed, 4 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/lp87565.txt b/Documentation/devicetree/bindings/mfd/lp87565.txt
> index 41671e0dc26b..b75ae23a1ef3 100644
> --- a/Documentation/devicetree/bindings/mfd/lp87565.txt
> +++ b/Documentation/devicetree/bindings/mfd/lp87565.txt
> @@ -1,7 +1,7 @@
>  TI LP87565 PMIC MFD driver
>  
>  Required properties:
> -  - compatible:	"ti,lp87565", "ti,lp87565-q1"
> +  - compatible:		one of "ti,lp87565", "ti,lp87565-q1", "ti,lp87561-q1"

What happened to your tabbing here?

All the other entries start with a capital letter.  So should this.

>    - reg:		I2C slave address.
>    - gpio-controller:	Marks the device node as a GPIO Controller.
>    - #gpio-cells:	Should be two.  The first cell is the pin number and
> @@ -10,7 +10,8 @@ Required properties:
>    - xxx-in-supply:	Phandle to parent supply node of each regulator
>  			populated under regulators node. xxx should match
>  			the supply_name populated in driver.
> -Example:
> +
> +Example for the TI LP87565-Q1 PMIC (dual 2-phase output configuration):
>  
>  lp87565_pmic: pmic@60 {
>  	compatible = "ti,lp87565-q1";
> @@ -42,21 +43,7 @@ lp87565_pmic: pmic@60 {
>  	};
>  };
>  
> -TI LP87561 PMIC:
> -
> -This is a single output 4-phase regulator configuration
> -
> -Required properties:
> -  - compatible:	"ti,lp87561-q1"
> -  - reg:		I2C slave address.
> -  - gpio-controller:	Marks the device node as a GPIO Controller.
> -  - #gpio-cells:	Should be two.  The first cell is the pin number and
> -			the second cell is used to specify flags.
> -			See ../gpio/gpio.txt for more information.
> -  - xxx-in-supply:	Phandle to parent supply node of each regulator
> -			populated under regulators node. xxx should match
> -			the supply_name populated in driver.
> -Example:
> +Example for the TI LP87561 PMIC (single 4-phase output configuration):
>  
>  lp87561_pmic: pmic@62 {
>  	compatible = "ti,lp87561-q1";

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
