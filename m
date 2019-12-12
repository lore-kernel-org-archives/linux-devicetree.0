Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7831C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 06:43:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88BD921655
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 06:43:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JCXq7As0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbfLLGnD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 01:43:03 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:40723 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbfLLGnD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 01:43:03 -0500
Received: by mail-pj1-f68.google.com with SMTP id s35so602319pjb.7
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 22:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gqSv0O4Jb2rJI/j1QKP0HTNOP+/liesGa8Pn0aNdars=;
        b=JCXq7As0h3xDPxU/1A4Mwru5TAHokaxtSPhkGsaqZlGrPIL/pZu129xEd0OOZm9UKp
         gZeCbiY8s8KA6Lk9JGeT8VvNciHyOYbx1F/TZ5PsKhNOdotoMjYppXMK7pwn7+B1fReB
         4HOwkTP5FAh8sQ2XxF+2IYfUkKFQpdhzaUo7LVfE/OT2wldESxbDefbD1pFEpSwlfQc8
         Xz4TX3iKLmgGBYG5wDwsItuowLaI/PrdjDlCxPo2Svx8iTFUhGF6QqH1ikDrf0RQ64A/
         2bnvmk640Yiwd1BMEGiRvPnbFQJigvbh/cMcwyNLwYREXY21S5syosvsnibxW83wVeTD
         eOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gqSv0O4Jb2rJI/j1QKP0HTNOP+/liesGa8Pn0aNdars=;
        b=FDvOe5P/44hvD577Q9NPCMRRCuZSoFDCdHBPxZrapgSbUyFiUGsTV19qe7cu1VvtHZ
         IN7MbX1zDmndFCUTvl7/2X6ONB6JOAccsg1J0eGbSAUehZO0xLcaNz9unWSUg2RycLCW
         w6UfRSSs58+B6d7/8onMjNwq1QaCY5VrExnuVY7chNG4Fs4yUTruWxL7nCEgYL5pcJbZ
         tNk9Pfvx/jlvQXx2bBmzNFsIM/JCThiWawhdki1KVSQZMWSzKIoII2FfB/DAL6Bkr5AH
         9FqEehDEBruesUQJr8Ip5FiJMbNvtaR91tUyftYHx/O33kw+UMfOUlxXyjyQc89kqDd0
         8w3w==
X-Gm-Message-State: APjAAAVhdO0pEioFqN6cahk2TxytCw+OL+xj0jMrjHX2QRGXSIzhi5fK
        oJbV2QTNbRyYb5oGnL98RTTgSg==
X-Google-Smtp-Source: APXvYqw8BTiKW99DlPj2SrfMZfGsqUZhWDftoDK4ljjclrWQ8969eDnphdqtzC+imZfj4KuXi61DYQ==
X-Received: by 2002:a17:902:7c83:: with SMTP id y3mr7901906pll.34.1576132982164;
        Wed, 11 Dec 2019 22:43:02 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z14sm3642476pfg.57.2019.12.11.22.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 22:43:01 -0800 (PST)
Date:   Wed, 11 Dec 2019 22:42:59 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Damien Riegel <damien.riegel@savoirfairelinux.com>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: pm8916: Add vibration motor node
Message-ID: <20191212064259.GJ3143381@builder>
References: <20191211192906.56638-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211192906.56638-1-stephan@gerhold.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed 11 Dec 11:29 PST 2019, Stephan Gerhold wrote:

> PM8916 has one vibration motor driver that is already supported
> by the pm8xxx-vibrator driver.
> 
> Add a node describing it to pm8916.dtsi.
> Keep it disabled by default since not all devices make use of it.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Applied, please also send a defconfig patch that enables the associated
driver (=m)

Thanks,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/pm8916.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> index 9dd2df1cbf47..0bcdf0471107 100644
> --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> @@ -111,6 +111,12 @@ pm8916_1: pm8916@1 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		pm8916_vib: vibrator@c000 {
> +			compatible = "qcom,pm8916-vib";
> +			reg = <0xc000>;
> +			status = "disabled";
> +		};
> +
>  		wcd_codec: codec@f000 {
>  			compatible = "qcom,pm8916-wcd-analog-codec";
>  			reg = <0xf000 0x200>;
> -- 
> 2.24.0
> 
