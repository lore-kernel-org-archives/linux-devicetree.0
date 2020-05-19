Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602D4C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 10:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E3062065F
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 10:37:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CLcZ236j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728672AbgESKhr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 06:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgESKhq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 06:37:46 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA64C05BD0A
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 03:37:45 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id n5so2948208wmd.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 03:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aXsJU44GCIYk2OgRQy7d759a/u1ue6myLJURyVBYd8A=;
        b=CLcZ236jj0tlYpqLtFL3ioPxwkbu37Ip4CxCdOnYn9axGgoRWAgEiXb7medhtvS0aw
         S8hfrC0JE0DYi3y30LTInIHDQfUDxzoII2CXXieMTgbi1b1gYcMUOpdhRR6fT2H3Bd4z
         9InwXKX+yA6Pgj5Mu5UVPY+nzaBFzQxntiWBtIW28S/h+WQAOi/KVfliYPqW+QiZru7P
         HHnBRRp0qgbgl0dABgTBbXxni+72y9ObnZH/ZW9Zh7bbV116bT8hmzG+Ml3Za9DbLzQS
         hZy8scnazhAh3wj7771MVayMozXxjHz47wvkYN+o+NoxKlD3sZ0x8v65BmuKr5/OAPPH
         n2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aXsJU44GCIYk2OgRQy7d759a/u1ue6myLJURyVBYd8A=;
        b=SU4ByPQuFq0T7Kfzo/mg+M5gJ0VQJu/Lh/UR7VSf5TjIRjYpkEQum2MCks0ypCEbM0
         EsaawUQ1K0U0GaOLca/Y04pY1cYgwXS1eeCs0y6UKKUbpczBqMZPw9ozRMD+1Wyv6BQr
         PJAaAz9iP6Zt/x2L7cFbLXl5LQZAvEh8D5OtjSEhTn2zoCDvGVcolxa2uc226BpvQzv2
         Y/ik2+7MCVIDRf/610ssgason9gx7XGgdQOIvQha2COTd3Mdz2RC0qTbdqUUFiyR3718
         P1FSpttnD+I4zMOHq26Dfe8KLG8FETsrEOb9tk3OZdCr5AzAYOZSPSzyWg8WEzPVIWHF
         BvPA==
X-Gm-Message-State: AOAM5308tIabo52BW/qRNNgy9MtE8igsLPV16UOepwsc4NQEeGMQdWr6
        Voz39wNEBxtZ71We0hQwRNxJSg==
X-Google-Smtp-Source: ABdhPJxiAzyUerOuMTk5FRcIW0Jcjoj2ZL7CECmIr6mC4isdh9wLpToG+AphXu0YHNWUccUjNP0TCw==
X-Received: by 2002:a1c:8094:: with SMTP id b142mr4859380wmd.61.1589884664183;
        Tue, 19 May 2020 03:37:44 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id q2sm3433181wmq.23.2020.05.19.03.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 03:37:43 -0700 (PDT)
Date:   Tue, 19 May 2020 11:37:41 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Saravanan Sekar <sravanhome@gmail.com>
Cc:     andy.shevchenko@gmail.com, robh+dt@kernel.org, jic23@kernel.org,
        knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net,
        sre@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v11 2/6] mfd: mp2629: Add support for mps battery charger
Message-ID: <20200519103741.GW271301@dell>
References: <20200430155810.21383-1-sravanhome@gmail.com>
 <20200430155810.21383-3-sravanhome@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200430155810.21383-3-sravanhome@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 30 Apr 2020, Saravanan Sekar wrote:

> mp2629 is a highly-integrated switching-mode battery charge management
> device for single-cell Li-ion or Li-polymer battery.
> 
> Add MFD core enables chip access for ADC driver for battery readings,
> and a power supply battery-charger driver
> 
> Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  drivers/mfd/Kconfig        |  9 +++++
>  drivers/mfd/Makefile       |  2 +
>  drivers/mfd/mp2629.c       | 79 ++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/mp2629.h | 17 ++++++++
>  4 files changed, 107 insertions(+)
>  create mode 100644 drivers/mfd/mp2629.c
>  create mode 100644 include/linux/mfd/mp2629.h

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
