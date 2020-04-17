Return-Path: <SRS0=b/Hz=6B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25435C3815B
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 09:34:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 024FC21D94
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 09:34:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XZlBkOcm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730317AbgDQJey (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Apr 2020 05:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730359AbgDQJex (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Apr 2020 05:34:53 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B0FC061A0C
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2020 02:34:52 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id t63so1233242wmt.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2020 02:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=OvjXVU28jbMJ/SyvS8SgkBEpU6urA9NsgGmyTGzgYIg=;
        b=XZlBkOcmPfU++GHBPKBCzjgE8At1p5iEXdXZO8uQxHzg5cP0lgLNuxmYeeLAqd9g+Y
         N112wp2gO2TAFGp8E9tzdwPdNoxAnwpd6e+ncVqFfZtitZ4CK3O8qOrTyq1MlM6y5a5d
         iT7iHu/SXKpwbb0+b2rtDc2MyoMJC50DoCRl93lSiPGIXFOTAv0SiHdQKxWgebwhpmiX
         nXXc+O5oGUtBpVDoRjcovUQrqJb9k5IhhszbHAp9we+FeogvdmgZH6be6JVD5Lznj7wF
         6xFpPaRQ0mFllWrMDhfe9CUyEqodwLbj+GeAZFuYqoS8M+qzmSD/HXTH04/xrBlKmfiR
         Z+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OvjXVU28jbMJ/SyvS8SgkBEpU6urA9NsgGmyTGzgYIg=;
        b=LUCjKGqXlG0wjrrr/8t5l1eOasSmmDX5sKjgxlfXRHsaTTIiWK5YY2ftdtGisAgvau
         tvZ/HSTo9gUjun5CrGjLU22tf8RJjEigL5cnEeEymuhUDk+u8OnHMDEbq7fVFK92D4qS
         s0OfYrMaAnxs3FkQsiK4GavraGAUf4qHHEHniW8y6QFQre8lbYI9LKWB2wptEZQreLzf
         K2trEuIh4B70G2HixlzKDHB1oIDVKEAX6E5NhHJ8mnBF2lb5CmgQRm87RUFBRDqM0Aby
         4MwgiA12AN/LABr4bH3beQtEjfPUdnL+SMBGr8yRc51+SrVGN0V4mwxYjjvr8ZCVJf3d
         RtTQ==
X-Gm-Message-State: AGi0PuZMCaHQduAa/AA0vGtb2Ge1t7E1Z/8QN18O4BtGI0zR3gx4or/s
        D6RkyF8Jb7CACaSh1tfyOKLUng==
X-Google-Smtp-Source: APiQypL3gn0kmqRxE640EjZxZt4w3qfgjHKCmqJqWewlFwuKoauiPY0DOfBYfLnnkXXMbHOssnHqLw==
X-Received: by 2002:a05:600c:210c:: with SMTP id u12mr2543730wml.135.1587116091155;
        Fri, 17 Apr 2020 02:34:51 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id j10sm7338895wmi.18.2020.04.17.02.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 02:34:50 -0700 (PDT)
Date:   Fri, 17 Apr 2020 10:35:51 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dilip Kota <eswara.kota@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, kishon@ti.com,
        devicetree@vger.kernel.org, arnd@arndb.de, robh@kernel.org,
        andriy.shevchenko@intel.com, cheol.yong.kim@intel.com,
        chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com,
        yixin.zhu@intel.com
Subject: Re: [RESEND PATCH v6 1/4] mfd: syscon: Add fwnode_to_regmap
Message-ID: <20200417093551.GH2167633@dell>
References: <cover.1585889042.git.eswara.kota@linux.intel.com>
 <9c58aeb1561f28f302921d54aee75942545c4971.1585889042.git.eswara.kota@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c58aeb1561f28f302921d54aee75942545c4971.1585889042.git.eswara.kota@linux.intel.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 06 Apr 2020, Dilip Kota wrote:

> Traverse regmap handle entry from firmware node handle.
> 
> Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
> ---
> Changes on v5:
>   No changes
>   
> Changes on v5:
>   No changes
> 
> Changes on v4:
>   No changes
> 
>  drivers/mfd/syscon.c       | 8 ++++++++
>  include/linux/mfd/syscon.h | 6 ++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index 3a97816d0cba..e085c50816b9 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -178,6 +178,14 @@ struct regmap *device_node_to_regmap(struct device_node *np)
>  }
>  EXPORT_SYMBOL_GPL(device_node_to_regmap);
>  
> +struct regmap *fwnode_to_regmap(struct fwnode_handle *fwnode)
> +{
> +	struct device_node *np = to_of_node(fwnode);

You are assuming that the fwnode was Device Tree pointer.

The point of a fwnode is that it could be one of multiple types.

What if it was a pointer to an ACPI property?

> +	return device_node_get_regmap(np, false);
> +}
> +EXPORT_SYMBOL_GPL(fwnode_to_regmap);
> +
>  struct regmap *syscon_node_to_regmap(struct device_node *np)
>  {
>  	if (!of_device_is_compatible(np, "syscon"))
> diff --git a/include/linux/mfd/syscon.h b/include/linux/mfd/syscon.h
> index 7f20e9b502a5..dacab0b4a091 100644
> --- a/include/linux/mfd/syscon.h
> +++ b/include/linux/mfd/syscon.h
> @@ -18,6 +18,7 @@ struct device_node;
>  
>  #ifdef CONFIG_MFD_SYSCON
>  extern struct regmap *device_node_to_regmap(struct device_node *np);
> +extern struct regmap *fwnode_to_regmap(struct fwnode_handle *fwnode);
>  extern struct regmap *syscon_node_to_regmap(struct device_node *np);
>  extern struct regmap *syscon_regmap_lookup_by_compatible(const char *s);
>  extern struct regmap *syscon_regmap_lookup_by_phandle(
> @@ -34,6 +35,11 @@ static inline struct regmap *device_node_to_regmap(struct device_node *np)
>  	return ERR_PTR(-ENOTSUPP);
>  }
>  
> +static inline struct regmap *fwnode_to_regmap(struct fwnode_handle *fwnode)
> +{
> +	return ERR_PTR(-ENOTSUPP);
> +}
> +
>  static inline struct regmap *syscon_node_to_regmap(struct device_node *np)
>  {
>  	return ERR_PTR(-ENOTSUPP);

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
