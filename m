Return-Path: <SRS0=kwC1=3S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA52C35240
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 21:35:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB10C2071E
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 21:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SFaUekPr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgA2Vfb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jan 2020 16:35:31 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:52264 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgA2Vfb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jan 2020 16:35:31 -0500
Received: by mail-pj1-f66.google.com with SMTP id ep11so364369pjb.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jan 2020 13:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dvPgIbtVjNT3qNnslTkNlu2F+beG3Bg1A9NE04yXqNg=;
        b=SFaUekPrqF2WeNsid+UsjmdsePUY0CTkeFMFHuBwYJhWWMLKbZXBPJt4DFRRCeH//W
         UOQH2ZEwbNvjCIc6PiTW0D13E3FEneTbsFxuhINI+TnBSbpT0v41U2fqFOQw0ml68Rpq
         L6aXbPPPbCgjuI+ht+3wZo/DpzfYM+yOXzMxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dvPgIbtVjNT3qNnslTkNlu2F+beG3Bg1A9NE04yXqNg=;
        b=ArChVYltB9MznNkLH+u806vQTwyg4Nk1V2G45VSHa8MLbj/D5Ng0B6quwKiPEltVS9
         X8hHUS2FLopGf/o/HzE+DBqt9JvAbNibRw30wsLrZf7GA/5cGmYCXoXK1aU7nERwfCI6
         xzLGjfOIvDtFqK9nrPCrw6qoFBFIbNi+fkTvK/ycaH0Je2DgW1zV0Xpak5q2OalUt2qm
         7yu1Gbjtr2I4hCbrxNEpb/ukujWNjKC1rpaDwpP4bDOrmgQzGMOJNnccdwkA2Yhakb94
         ZlYeSO+BmA9an6Vjk5edt3/EbdU4XuKZ4RQ3Yl0J+giHcOKoN6zIcspQWJWIhycT0Vnf
         /pmg==
X-Gm-Message-State: APjAAAWhdaqlJ+duI1e+5Bp0BbUwThOwMbdkvXonYG0A79PjmMbI6RV9
        tYDGAi8utIghN5LsE0aLrTW2Yg==
X-Google-Smtp-Source: APXvYqwoQGyL/LSOFNX8EZGmxxQ8vniTsrmWJFxMJDOznZHXb9e/9vV6cchQiqCiPGWKh1cICNmGjQ==
X-Received: by 2002:a17:902:d90f:: with SMTP id c15mr1437585plz.248.1580333730310;
        Wed, 29 Jan 2020 13:35:30 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id w25sm3620973pfi.106.2020.01.29.13.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2020 13:35:29 -0800 (PST)
Date:   Wed, 29 Jan 2020 13:35:28 -0800
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
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 7/8] arm64: dts: qcom: sdm845: Add generic QUSB2 V2
 Phy compatible
Message-ID: <20200129213528.GJ71044@google.com>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
 <1580305919-30946-8-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1580305919-30946-8-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jan 29, 2020 at 07:21:58PM +0530, Sandeep Maheswaram wrote:
> Use generic QUSB2 V2 Phy configuration for sdm845.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index d42302b..317347a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2387,7 +2387,7 @@
>  		};
>  
>  		usb_1_hsphy: phy@88e2000 {
> -			compatible = "qcom,sdm845-qusb2-phy";
> +			compatible = "qcom,sdm845-qusb2-phy", "qcom,qusb2-v2-phy";
>  			reg = <0 0x088e2000 0 0x400>;
>  			status = "disabled";
>  			#phy-cells = <0>;
> @@ -2402,7 +2402,7 @@
>  		};
>  
>  		usb_2_hsphy: phy@88e3000 {
> -			compatible = "qcom,sdm845-qusb2-phy";
> +			compatible = "qcom,sdm845-qusb2-phy", "qcom,qusb2-v2-phy";
>  			reg = <0 0x088e3000 0 0x400>;
>  			status = "disabled";
>  			#phy-cells = <0>;

FWIW

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
