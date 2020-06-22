Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12D0C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 08:05:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDA5020857
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 08:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RhFsPNv8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgFVIFC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 04:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgFVIFA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 04:05:00 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46460C061796
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 01:04:59 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id p70so14801092oic.12
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oFg5A+95pM59/qGFEv+Fs7c2uxP7PZPlwZ9Sb7/zk9o=;
        b=RhFsPNv8B+mzzAxIfzD6FKEz/gq9Fwmn7AGf8zVUZRQ227r+d/K4M70J5tHUXJS1W0
         QCWcrxnTyu1XtydKQfNajv0NTS+u8BpDKBpUef5/BcLR819uy5cKUkxe2v0U6pnc94eb
         QNqhIULYUEFblQWnXjtjw+nnBXKtNAtWn7yIwDO2t45Y2Lu/yneDxyq9PfVUOQycbHvk
         jt+PgHePheU7dl1tqkA07kYJYV7vWmEMLj5nwX8ER48e7lszG3Sw35k2rlY06jFmQrRW
         AWUIO3cuDvtwwqaQRAdTyjCnvR4wZUWjvpl8zx1CV1dh+jEhFXb1vEHBYvCVf6vSP9nz
         OpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oFg5A+95pM59/qGFEv+Fs7c2uxP7PZPlwZ9Sb7/zk9o=;
        b=V3QN1ZduKaVXWXWDfyLdvLf11tEohxph2Ord+cMKjUjrXYmy/FdcEXeW1bB/UizX7f
         wk2GWR5uAnwiDU64MaLvSDfXZLF5r9+Y0bHxf5g2pMsj4onUO0PF/64YFIKcixVgo8t5
         sKs1sspeT1kt2+dE9DKFpQgIu32tSmQ4q7CaGmBEbFiSJjPLPjtJju/FSY8nDemPTDQ1
         64UD4c4kbQw7NNtw2YHwdmSXOcaju6DCWFrKXSjZ2cNAePAjzsVg3N5M+6dIWgWe3e32
         Os2tZukY1sZTiXQqRU1t1+N0ppz8e2e13IyLgcXB+BOJaq3XJRMYXCEr/iv4w8UiRVuK
         8spA==
X-Gm-Message-State: AOAM532fDDZUZoKryw39DyfS9SyJI5xar0yIWF0QRtbbj8mqg4LGXQmH
        r45iU8eOVGiSXkE7qgQjVzMpbA==
X-Google-Smtp-Source: ABdhPJzWmAtYUs+hLvmFl+xyB/KStphIquf59zpASuse0m4EtYM0ug+al52Voj78F6w81Roqgeub3g==
X-Received: by 2002:aca:300e:: with SMTP id w14mr11852313oiw.45.1592813098520;
        Mon, 22 Jun 2020 01:04:58 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t18sm3150802otk.42.2020.06.22.01.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 01:04:57 -0700 (PDT)
Date:   Mon, 22 Jun 2020 01:02:12 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/8] pinctrl: qcom: spmi-gpio: Add pm660(l)
 compatibility
Message-ID: <20200622080212.GC2421@builder.lan>
References: <20200622075749.21925-1-konradybcio@gmail.com>
 <20200622075749.21925-2-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622075749.21925-2-konradybcio@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon 22 Jun 00:57 PDT 2020, Konrad Dybcio wrote:

> Add support for pm660(l) SPMI GPIOs. The PMICs feature
> 13 and 12 GPIOs respectively, though with a lot of
> holes inbetween.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index fe0be8a6ebb7..95ca66e24e7c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1118,6 +1118,10 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
>  	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
>  	{ .compatible = "qcom,pms405-gpio", .data = (void *) 12 },
> +	/* pm660 has 13 GPIOs with holes on 1, 5, 6, 7, 8 and 10 */
> +	{ .compatible = "qcom,pm660-gpio", .data = (void *) 13 },
> +	/* pm660l has 12 GPIOs with holes on 1, 2, 10, 11 and 12 */
> +	{ .compatible = "qcom,pm660l-gpio", .data = (void *) 12 },
>  	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
>  	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },
>  	/* pm8150b has 12 GPIOs with holes on 3, r and 7 */
> -- 
> 2.27.0
> 
