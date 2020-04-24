Return-Path: <SRS0=9zIi=6I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4148FC55186
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 07:18:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F6D620700
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 07:18:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B5WpYfbH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgDXHS3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Apr 2020 03:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726008AbgDXHS1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Apr 2020 03:18:27 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB37C09B047
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2020 00:18:27 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k1so9500505wrx.4
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2020 00:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=TJ5Xz/v3Hc30cuvJyJGs5IX6MWAAzYb1YSZtC9xjqEU=;
        b=B5WpYfbHEkVWSsubr3ytIZmD80f2ymgSmPsDIYveL2XaNgSqwjVg5HE8672wb26WCH
         ECVm0dw6k8PO+Y/V5FsXQV8XS4lSIPRCd6CR/5NdYaRb8YnZqtTQPatj64L7nf1H/fgQ
         eUnEGsco0MLm8U9RSEkbxlGD9jBW24n36keMWvdFdlksYoRfLey0bg+tNasdD4S3pSYL
         zJAaeLOY7kK2T7V2eCM+Xk/GBkYjTDuJUIAHBrE+9rsSbdAIi2y4Z+Rpb035FFHwfAJR
         SgWOPRSUbfiqy9uAesl+JOMXd4T+WTBArO2sOyKM4itUEtm+Yza1E8ldJeypF8m06lym
         hzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TJ5Xz/v3Hc30cuvJyJGs5IX6MWAAzYb1YSZtC9xjqEU=;
        b=o4p+r4Ak0CfalrDv7RyTk/lqLHu1r1EuEHJnU7QfYhWgLCAmwUC9KD+axHteLeJEwH
         8bqR3JRHcC5EiPjZFWAYHsZZCjwlEj2dq/3a2mEFKfwu3OiieUuAUqo/CY3Y/DJSgGjS
         ktk4SWekAbUC0nxzVwAAh1kxeaHKD7PwxfN5xa0ViqZhGo0v3Pbj2WGSwnr7YMdtp3w4
         tiswYe2B+76JjDW7hGR+gAQ9/yhgIJkqmZYSndyeyC0lHbsGnMM90DU1vNJ/jM1w3w3T
         zsQnHijw1enY7ZEpZB+BTCRrdy7VN1bL2esMdsKxKRiEvDY8CbyZHIWOCQz/ji5qbwno
         vgJQ==
X-Gm-Message-State: AGi0PuYZKKk5JmAiF8kbepQITiR995hODrwmtsvEQlZKRv6F6J84Jy52
        rIGlbuyWzeLkTbtDMK5BtCcPbg==
X-Google-Smtp-Source: APiQypLwPG8ELo0NdJrmqJobPxrMbsP0hvOgYGuVOmP8pw5UhAZiBUyKPCJyFd2ve2lS88LTSoWcsw==
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr9941757wrr.247.1587712705585;
        Fri, 24 Apr 2020 00:18:25 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id t20sm1578651wmi.2.2020.04.24.00.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 00:18:24 -0700 (PDT)
Date:   Fri, 24 Apr 2020 08:18:22 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Saravanan Sekar <sravanhome@gmail.com>
Cc:     andy.shevchenko@gmail.com, robh+dt@kernel.org, jic23@kernel.org,
        knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net,
        sre@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v9 2/6] mfd: mp2629: Add support for mps battery charger
Message-ID: <20200424071822.GM3612@dell>
References: <20200415162030.16414-1-sravanhome@gmail.com>
 <20200415162030.16414-3-sravanhome@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200415162030.16414-3-sravanhome@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 15 Apr 2020, Saravanan Sekar wrote:

> mp2629 is a highly-integrated switching-mode battery charge management
> device for single-cell Li-ion or Li-polymer battery.
> 
> Add MFD core enables chip access for ADC driver for battery readings,
> and a power supply battery-charger driver
> 
> Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
> ---
>  drivers/mfd/Kconfig        |  9 ++++
>  drivers/mfd/Makefile       |  2 +
>  drivers/mfd/mp2629.c       | 86 ++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/mp2629.h | 19 +++++++++
>  4 files changed, 116 insertions(+)
>  create mode 100644 drivers/mfd/mp2629.c
>  create mode 100644 include/linux/mfd/mp2629.h

How is this driver registered?

Looks like it has device tree support.  Is there another way?

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 3c547ed575e6..85be799795aa 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -434,6 +434,15 @@ config MFD_MC13XXX_I2C
>  	help
>  	  Select this if your MC13xxx is connected via an I2C bus.
>  
> +config MFD_MP2629
> +	tristate "Monolithic power system MP2629 ADC and Battery charger"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  Select this option to enable support for monolithic power system
> +	  battery charger. This provides ADC, thermal, battery charger power
> +	  management functions on the systems.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
