Return-Path: <SRS0=QTuQ=ZD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC71AC43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 11:29:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8227E2067B
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 11:29:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rt0hKZf8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfKKL27 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 Nov 2019 06:28:59 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46710 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfKKL27 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Nov 2019 06:28:59 -0500
Received: by mail-wr1-f65.google.com with SMTP id b3so14172099wrs.13
        for <devicetree@vger.kernel.org>; Mon, 11 Nov 2019 03:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=VCIU/ruaYoPrO6tp9vJ9FadSx4Mgkcrp/rqcgWyosK4=;
        b=rt0hKZf8KBrscbpSv+fqIleKs28btBwXk5Dvhzd7aPfW6psShTE5FTBv1mwp08YNYb
         H2EP6L7Ke9t/OMWMjHoWD6oMoigiNhUXGrlLtM2n7322seTdWsDcige5HkKumIyNsU5P
         yaNTiNmVXGLnBzGQ/k6vo2L2dZpu//WA+wKkXwmzku0FQnpZeH9+ETc62vZr9AHrt66y
         L71y5gKugg1Ke73hs3iEryZY78WMuTUaVME8ncaUff5J7L3DwK3z06AYUgnrVgGghSqW
         EFp+dAIecAK/rVPgpzHoz5sTHSD7CAe/Dti1JlRuUMpR0WyiWGwtIHi2sVOp/uHPZqSD
         dOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=VCIU/ruaYoPrO6tp9vJ9FadSx4Mgkcrp/rqcgWyosK4=;
        b=gvHZChXqnC83ovb6i/MUIQb0eROmHovsi6uleONq1ebI/i+xb/bF3XdcjgDjV2x2NT
         1kmiJfk40d1d9XVZHcuOYg6gcmx3W0Ct8llVxHOF7w0OmsNg9nbhWiCekMzDc4mtS5LY
         7lXkHTUE1h8dDHsUw+Svg9oOJ+IYmrqoLNOr17PIXSoR/IEOm12KvgFCYxyPLWnmsYRO
         /swppyH4+OH6f5Qeadhud6up+OHEaO0qeGiWF8GnJMSWWiTv7+yEsbPek0pg4UhTLgdI
         QX+PfeMY3H76FjgAitx4znZpPGznLIVo3Jz+CeqwWy1KI8fDHCPARPaSMNEFZaSrZq0M
         xXbg==
X-Gm-Message-State: APjAAAUQuCdvHDXsiWcSfyV935XL0GDobozSeGNdkQDv+O1WrcLao/wd
        6XHyG/1HtIktnrOG0oy4v78knw==
X-Google-Smtp-Source: APXvYqyMJgtgV0bLvBkQaySmSbtMQNWN+rcf6xUT/gS+40mNdpwznf/9DJgGBm2Sw5a5ebr8gKkBww==
X-Received: by 2002:a05:6000:343:: with SMTP id e3mr21544323wre.20.1573471735373;
        Mon, 11 Nov 2019 03:28:55 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id m3sm17705312wrb.67.2019.11.11.03.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 03:28:54 -0800 (PST)
Date:   Mon, 11 Nov 2019 11:28:42 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org
Subject: Re: [PATCH V2] mfd: qcom-spmi-pmic: Add support for pm6150 and
 pm6150l
Message-ID: <20191111112842.GK3218@dell>
References: <1572931309-16250-1-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1572931309-16250-1-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 05 Nov 2019, Kiran Gunda wrote:

> Add the compatibles and PMIC ids for pm6150 and pm6150l PMICs
> found on SC7180 based platforms.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---
>  - Changes from V1:
>    Sorted the macros and compatibles.
> 
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 2 ++
>  drivers/mfd/qcom-spmi-pmic.c                             | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> index 1437062..b5fc64e 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> @@ -32,6 +32,8 @@ Required properties:
>                     "qcom,pm8998",
>                     "qcom,pmi8998",
>                     "qcom,pm8005",
> +		   "qcom,pm6150",
> +		   "qcom,pm6150l",

Tabbing looks off.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
