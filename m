Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE99C43603
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 00:56:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE7E124667
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 00:56:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dbEieWkw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbfLEA4t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 19:56:49 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:38081 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728098AbfLEA4t (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 19:56:49 -0500
Received: by mail-pj1-f67.google.com with SMTP id l4so542738pjt.5
        for <devicetree@vger.kernel.org>; Wed, 04 Dec 2019 16:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mkK1VbYU8pd8d1R2HwKoX7wARdH4Fdf+a3nqX6mf/A8=;
        b=dbEieWkwvw6WZSpP1x7bC4rsOw5teKRhgEYI1EgQL8Mw6TV1DHWZ3AHvhig8Gj59sY
         LYWUeilhVAielBO2XpkLLJrj/SG4ZABZgXwVppbT3ok1163wByjsemU6rq5Wqu02BFj8
         mQWIyIKJUuY1CwGc+0KWD6po2054VL91TfDls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mkK1VbYU8pd8d1R2HwKoX7wARdH4Fdf+a3nqX6mf/A8=;
        b=nPfx9Hn2T4JFUR7l1DFrs+ph94X1XiBDsxue8nxYE8qhil2xPJ8EWxDIeuG9krRjFT
         HyP0dJCxiCLEfDdZA0mnl9Ygqc4EUTn4jOrhOPfyIFBU+vh/JQ6fnoSa73etc70plcpO
         Q608SWSImnwF7fnolKXtG/wFfv+ttPBn6iZ0vgGoR7ymTHZpkHNBl24/r7g27n4IiWTf
         qWc1ZHIrF8W3557xc8HURbxY3FHDddHv7u6ksY92BfEdPw45GeGbe3lYS5YpX8OwzOTg
         CUWbdRvoJPkKXtnHQ51bUDbjO5+RX+D9YYVh3pTRtwJyIsFYrv8+AaDwrEhKAdRxm+6t
         ygjA==
X-Gm-Message-State: APjAAAVLHFeTKkLfBA0Ft/y2vQ/kPUprulDk6xXMoqlpSQ0yrtZvmG+C
        5YnDfvIQXQFHh0bu+byeTVbOyRwk9sPUSw==
X-Google-Smtp-Source: APXvYqxJ0zxJwZ22BShddeCBPYuInYIfGJ/UwK80td0CdFHYrbpSKP7c3zsMboM8VVVoF2a9Ix3HZw==
X-Received: by 2002:a17:90a:b009:: with SMTP id x9mr6338021pjq.124.1575507408713;
        Wed, 04 Dec 2019 16:56:48 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id u1sm9151663pfn.133.2019.12.04.16.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2019 16:56:48 -0800 (PST)
Date:   Wed, 4 Dec 2019 16:56:46 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Make MSA memory fixed for wifi
Message-ID: <20191205005646.GL228856@google.com>
References: <0101016ed035d185-20f04863-0f38-41b7-b88d-76bc36e4dcf9-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0101016ed035d185-20f04863-0f38-41b7-b88d-76bc36e4dcf9-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Dec 04, 2019 at 09:20:18AM +0000, Rakesh Pillai wrote:

> arm64: dts: qcom: sc7180: Make MSA memory fixed for wifi

This is not really done for sc7180, but only for the sc7180-idp,
which should be reflected in the subject (i.e. s/sc7180/sc7180-idp/)

> The MSA memory is at a fixed offset, which will be
> a part of reserved memory. Add this flag to indicate
> that wifi in sc7180 will use a fixed memory for MSA.

ditto, say it's the IDP

> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
> This patchet is dependent on the below changes
> arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device node (https://lore.kernel.org/patchwork/patch/1162434/)
> dt: bindings: add dt entry flag to skip SCM call for msa region (https://patchwork.ozlabs.org/patch/1192725/)
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 8a6a760..b2ca143f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -250,6 +250,7 @@
>  
>  &wifi {
>  	status = "okay";
> +	qcom,msa_fixed_perm;
>  };
>  
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
> -- 
> 2.7.4
> 
