Return-Path: <SRS0=x5QR=37=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF31C352A3
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 17:33:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 758E020848
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 17:33:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RH32kiQs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729513AbgBKRd0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Feb 2020 12:33:26 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43250 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729132AbgBKRd0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 11 Feb 2020 12:33:26 -0500
Received: by mail-pf1-f196.google.com with SMTP id s1so5800961pfh.10
        for <devicetree@vger.kernel.org>; Tue, 11 Feb 2020 09:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lH4EbrzVbu3CvaS8sns78JlEG0bpnC0mv7bE+liJ2nA=;
        b=RH32kiQsCKo1Gs+FkFdDvj1Kq3PKeLTjbRXjVS542Tg6Gb8IzEOXCl8KrAydPkosHL
         SYGwlAdLYd5do6FGm6AtvSvYjLsBhTB3Zd2J02IAI1lWNxUZQ/5+ah4appWH9FO9tCfN
         4dmS1PhdaopzWfZZudmSODT/lwSAYlGW8ZyJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lH4EbrzVbu3CvaS8sns78JlEG0bpnC0mv7bE+liJ2nA=;
        b=ncUeSu7vvhCuosgG7uP258KGxWV2hPH221ioYu7s4+VGCibGJTFFmycZ6AThtxmKhg
         Tw13m192gad6eVQNx1AJnFBj8g06iHfC7Xp2BDddvdniD03v5uIioAxqSWKUiTrtZGmb
         g1xowPxKak087tDtexQ2TqWowjoOs/w269s0hQFZLmnkwDXG9wad3K0we+xMdfD2SW/c
         Fv48H613UzK9qA0/OaegijvFHPTACN3cANTp5U8S4aiRVsWGh/g//itv6bo3My+xJKSY
         6iSvYwf8L/tIkYg2ANGg5xfp9USF6AcXwAQYThDDJGkRcsjV0NgDMsXGogkSBZKWJFOf
         MyWA==
X-Gm-Message-State: APjAAAVJiwrsDaibZ/cTh8NYV5Hf8PEA/eWzRyAPv4jCxiSiBY3rPfLk
        oE4iWIRjQBD950FtGTJslTdLsQ==
X-Google-Smtp-Source: APXvYqxk99B0t8EHkrjFPb34havVNfFdZ7CHuqxMGO1VQir/2llQ9LuL+WBmfTO4aiFx3jXiqWC3cg==
X-Received: by 2002:a63:6c82:: with SMTP id h124mr7923471pgc.328.1581442405558;
        Tue, 11 Feb 2020 09:33:25 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id c26sm5104896pfj.8.2020.02.11.09.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2020 09:33:25 -0800 (PST)
Date:   Tue, 11 Feb 2020 09:33:23 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, hemantg@codeaurora.org,
        robh+dt@kernel.org, mark.rutland@arm.com, gubbaven@codeaurora.org
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7180: Add node for bluetooth soc
 wcn3990
Message-ID: <20200211173323.GE18972@google.com>
References: <20200211121612.29075-1-bgodavar@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200211121612.29075-1-bgodavar@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Feb 11, 2020 at 05:46:12PM +0530, Balakrishna Godavarthi wrote:

> subject: arm64: dts: qcom: sc7180: Add node for bluetooth soc wcn3990

Preferably say in the subjct that the node is added for the IDP board.

> Add node for bluetooth soc wcn3990.
> 
> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50ad4fde..19f82ddc1f09 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -19,6 +19,7 @@
>  	aliases {
>  		hsuart0 = &uart3;
>  		serial0 = &uart8;
> +		bluetooth0 = &bluetooth;
>  	};
>  
>  	chosen {
> @@ -256,6 +257,16 @@
>  
>  &uart3 {
>  	status = "okay";

nit: add a blank line

> +	bluetooth: wcn3990-bt {
> +		compatible = "qcom,wcn3990-bt";
> +		vddio-supply = <&vreg_l10a_1p8>;
> +		vddxo-supply = <&vreg_l1c_1p8>;
> +		vddrf-supply = <&vreg_l2c_1p3>;
> +		vddch0-supply = <&vreg_l10c_3p3>;
> +		max-speed = <3200000>;
> +		clocks = <&rpmhcc RPMH_RF_CLK2>;
> +		status = "okay";

status is not needed here AFAIK.
