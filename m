Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A43CC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 07:29:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4746B20771
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 07:29:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rFJ8lK/G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731518AbgFWH3K (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 23 Jun 2020 03:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730977AbgFWH3J (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 23 Jun 2020 03:29:09 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F20FC061573
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 00:29:09 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id u23so15595313otq.10
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 00:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3dK86lliqilxlnT1j+X/UKoKjGOBmN/8rGq1nOZ9OOI=;
        b=rFJ8lK/GfDcL3+VviKsfng5Eknh29Tmgxgcgj64B5qCcNtUUhA5cGltkmWsfUvMq2f
         lUxqyzmt+Nj9M2OCEzFwHfFjzsDHoQd+SYJ1OhhZj+h30oivHbAFJN9MnxGKRVTwQtwf
         nUug0qiKvcJZLHGTVfoV90VOAmgWGtPla/l5rGZNQIHvHdaAol39Kv1MHKj7xbZSkknp
         iwHaudLtfU56rdyFoAGIoEFq5J1c+7M4Ogv92c7+ItQYxFEHrtDZ8VtHpasmOj+uTqgS
         uI/zJ9cTUJSnHNPg60FiTIo+sqMktYkazfjUX7gjHQh/b+lAO1pSJ7uU8xXC7squm7+X
         hR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3dK86lliqilxlnT1j+X/UKoKjGOBmN/8rGq1nOZ9OOI=;
        b=tbNVEdQNA7I5qGoGR87mN/XrkV98F5PfhJ9/HPziwQtrlL93NW0mTQNrFFnXMTR/bN
         Ti4nrTEh4iXXKWOVPWUoJau+w9u6CMWYFxg/xGPTIyn0lk5w4vAzTLG5whsruLZntOu/
         WR8V4OSLg4ghPfFpne7ulaUn0w3c1N/x6ewy1hxiZeDVficNYK8kOnIIyGxTaxIGp2fJ
         v6AXYDApbeIQBrRB6ivEt76gVp9I9EKj1qFk84Q5p/SaeFzjUobICQwW6xyEknfvmgnm
         LYqep/Thoax568GC7kpFh8wNoJOlToNLXyRlmbWjzWaHtKBj4qJTvmDA7EYnUQNuDWmH
         DvPA==
X-Gm-Message-State: AOAM532sHIsaAbae3/UPLEWofOsshMWHyPyshlIoQKKFugbOm//0rFTr
        xdd58/5lG+IMMmiTGQY6+5T6gg==
X-Google-Smtp-Source: ABdhPJzphMaKHre+mibTwmytvd0pnWE76craUo6S3437jlhVLdsw90RaWAlSqnbl2g481NdT/tt2Kg==
X-Received: by 2002:a05:6830:134d:: with SMTP id r13mr17032299otq.264.1592897348617;
        Tue, 23 Jun 2020 00:29:08 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b32sm3865473otc.71.2020.06.23.00.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 00:29:08 -0700 (PDT)
Date:   Tue, 23 Jun 2020 00:26:24 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/7] pinctrl: qcom: spmi-gpio: Add pm660(l)
 compatibility
Message-ID: <20200623072624.GY128451@builder.lan>
References: <20200622192558.152828-1-konradybcio@gmail.com>
 <20200622192558.152828-2-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622192558.152828-2-konradybcio@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon 22 Jun 12:25 PDT 2020, Konrad Dybcio wrote:

> Add support for pm660(l) SPMI GPIOs. The PMICs feature
> 13 and 12 GPIOs respectively, though with a lot of
> holes inbetween.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Didn't I ack this change in v2? If so please remember to add such tags
when you resubmit the change...

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

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
