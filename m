Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9B3C33C9E
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 21:59:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF9DA2192A
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 21:59:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="desFXdRa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729952AbgAQV7w (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jan 2020 16:59:52 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:53764 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729937AbgAQV7w (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jan 2020 16:59:52 -0500
Received: by mail-pj1-f68.google.com with SMTP id n96so3728158pjc.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jan 2020 13:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wH8/aRr7zW2lkMolzBnmu3ZhKRNwfO3YsG0yBHBthEk=;
        b=desFXdRa4EW0maDZW25KfYW6BMApAUk5B2ccp7iA5pSZaLzWyGyPvTzn5xdxeMGDCt
         148AKMVVUeryNxZ4TR53Gcar45Yr1zfzwBXDm8pl9iKVOz/Noaeho/lOLwgV5drJJVhM
         CDF8TXclk2RjOKFD1j4V6KcM8z7g+erMnzJhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wH8/aRr7zW2lkMolzBnmu3ZhKRNwfO3YsG0yBHBthEk=;
        b=pHjle7v0DzvaPWrA3nKv8xRM7NN+coHsJzptnIUvYUzQ7TwbPHxi9fqgCnIC2V8AZ8
         TrznjhsALIpypW0J8ddinn17T2lwnjiCvczlT/oAZKzbqbjYx99wKwoC36KlAwbpSgQV
         JCZg7ZRnd2O73mJC5u8a16kev1J6DKC330/aNUzeHbfKvRyif13YVF9c0G60kcltlAEU
         6bCySzOPG3DaA6DISqvfQ7tSpW6VoHB8a5rNalafBXXLwZ+AHP8ZM4PgzNg2L+l7KO2+
         O11AGlsFTNcqILjOCOd4vT4FevIKvoyQoxiPa9riZkat4pY8x1jq8+vcrXGPjNpmdyKX
         mSEA==
X-Gm-Message-State: APjAAAXDxERuf5BFBWJNkBOG8b+f9YlqJRO9eo9gSqFuf5kT2eIvvmG6
        KpsyBmaOkbSIkgB1RLvstZaneg==
X-Google-Smtp-Source: APXvYqx0q2JaM2Mv0/oQbuhdtZgLabKhjJirCj4B6jf+VA1qMGTzLhDDnLc+PpUM6Adq0fzqc2Dc4Q==
X-Received: by 2002:a17:902:6b4b:: with SMTP id g11mr1443287plt.26.1579298391678;
        Fri, 17 Jan 2020 13:59:51 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id m22sm30757146pgn.8.2020.01.17.13.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2020 13:59:51 -0800 (PST)
Date:   Fri, 17 Jan 2020 13:59:49 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sc7180: Update QUSB2 V2 Phy
 tuning params for SC7180
Message-ID: <20200117215949.GS89495@google.com>
References: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
 <1578658699-30458-6-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1578658699-30458-6-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 10, 2020 at 05:48:19PM +0530, Sandeep Maheswaram wrote:
> Overriding the QUSB2 V2 Phy tuning parameters for SC7180 SOC.

This patch doesn't set the PHY tuning parameters for the SC7180
SoC, but for the IDP board, which is based on the SC7180. Please
reflect this in the commit message (including subject) to avoid
confusion.

> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50a..826cf02 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -276,9 +276,11 @@
>  	vdda-pll-supply = <&vreg_l11a_1p8>;
>  	vdda-phy-dpdm-supply = <&vreg_l17a_3p0>;
>  	qcom,imp-res-offset-value = <8>;
> -	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
> -	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
> +	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_15_PERCENT>;
>  	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
> +	qcom,bias-ctrl-value = <0x22>;
> +	qcom,charge-ctrl-value = <3>;
> +	qcom,hsdisc-trim-value = <0>;
>  };
>  
>  &usb_1_qmpphy {
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
