Return-Path: <SRS0=wYQk=7F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C25C433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 23 May 2020 05:40:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 965C12067B
	for <linux-devicetree@archiver.kernel.org>; Sat, 23 May 2020 05:40:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NpzpEoKH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387612AbgEWFk3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 23 May 2020 01:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387459AbgEWFk3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 23 May 2020 01:40:29 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F01F1C061A0E
        for <devicetree@vger.kernel.org>; Fri, 22 May 2020 22:40:28 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id q24so5970517pjd.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2020 22:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Jxqs63Z1KDKQGpOdOeQMTViZZkGnReSqlh+zqFpbleQ=;
        b=NpzpEoKHZnmldpoPMkE+bzHJ8AFM3iTtY/iE5mkL1vDY50VUOrfKjd5gNaVtnOTlYl
         sMm3Lsly+RCq/jcCZIgneJXFg3cxvGAMX9Fuw3b/sfc0jgJoEQw7ZUNcuBEGAWuTKV9y
         W6t//DvWTOky7bm6ofj60Me4iszhpqG7zHs0PputqOWVYAZq4Eh910LHpYktU7aMDH5R
         P4Pjsl7KGL7evuGTo+s3GFfOvp4R9aTBAuuncQd7yo1GTkayDyAmZU05qET54wygA2K2
         jqjx+Hpx2nfdM85Ga85d6wO/WJRWE7KylRwZS56KjtsnffzSDaWPhtUEVXKG28naajR+
         9iYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jxqs63Z1KDKQGpOdOeQMTViZZkGnReSqlh+zqFpbleQ=;
        b=lw9lV+55nKHIYPvfu4ml7IBSjV9hENWfGXUhVeQ+S9P7g2sOSWiTD6/OOVXPi2y0EN
         CUmqDJAJqCJoJT885aMiePetWclBs+o9o3y06+LJ/ZWaSxIlluNKMQ7OtYiPSEXX5lA/
         vTaiYec3nKzLImZ+SESnwHHkWyUadlFbmNA8EN8VE11Y8I8r8nWSPNRRKgji5aQ+E1Xm
         yzoDoIcD7KxQPT11hrINsREhVrJ3jYFFYFlRRIPi/MwM0XpupdzQwMtLaZJ+BPQW+6qg
         PePTG/sHDw2tg2IIsLIgG8SJnhp5RAQxzmsroYS/KH3jTaoLeZnTFKSAWoGpS5cwLfWZ
         KhNg==
X-Gm-Message-State: AOAM5320G7urE6rMAuPJ5w25hTUjR80SxvgYtvBLTE74wPe2+cSC3Xg3
        1HZlJg4pRz7rtulsyJ4f4hG5tQ==
X-Google-Smtp-Source: ABdhPJzrIIxev5YLq7j06KRiNYHqrMaVzvotEBa13813oXSRwPO34UqHwh/8/IsfG3JFW0nxQhyE8Q==
X-Received: by 2002:a17:90a:8c85:: with SMTP id b5mr8201260pjo.187.1590212428371;
        Fri, 22 May 2020 22:40:28 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l3sm8426994pjb.39.2020.05.22.22.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 22:40:27 -0700 (PDT)
Date:   Fri, 22 May 2020 22:40:25 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: enable pm8150 rtc
Message-ID: <20200523054025.GL11847@yoga>
References: <20200523041201.32065-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200523041201.32065-1-jonathan@marek.ca>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri 22 May 21:12 PDT 2020, Jonathan Marek wrote:

> I don't see any reason for it to be disabled by default.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  arch/arm64/boot/dts/qcom/pm8150.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> index c0b197458665..b738c263f9d1 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> @@ -64,8 +64,6 @@ rtc@6000 {
>  			reg = <0x6000>;
>  			reg-names = "rtc", "alarm";
>  			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
> -
> -			status = "disabled";
>  		};
>  
>  		pm8150_gpios: gpio@c000 {
> -- 
> 2.26.1
> 
