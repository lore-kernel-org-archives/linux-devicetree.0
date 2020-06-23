Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1695C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 23:25:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F51A208A9
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 23:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E7GeDhst"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388310AbgFWXZQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 23 Jun 2020 19:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387947AbgFWXZJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 23 Jun 2020 19:25:09 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3279FC061573
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 16:25:09 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id u128so338051pgu.13
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 16:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O693aBUZA0/02GeteSwkznapNiqCdk4fR4JfhAjgavc=;
        b=E7GeDhstIFhfU6UMSXEXnw12+uANnkkg6BPkJQ1DeVXe/HPH78nR/zlVv4a9+C4z/3
         iFsAk0aky/OE/pjiWRSP9ml8X35XD3eQ/ZEAxJ/LFBrtV420T/R6QHdwKVt1XIACJ7hb
         n7SFRrWjS3pvX2sVcqmg+/myPCMlW/kXNEFes6RqGMpQW3MFSvLSiOxXZCFoaTzI0Mzq
         v8B7MiLSZ0cgU2BM7H35D7ac16DBSl6nKNLWbCahFh9Iq2tK35UWMgUUAwaKNXuqqfsJ
         Qdb2MC+KdIpp9aUy9qqq55CwnOT5LGVeU5v4Sq4lYKUIpHJ4WRw4Lu5qWfHIUMkMpDUX
         CWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O693aBUZA0/02GeteSwkznapNiqCdk4fR4JfhAjgavc=;
        b=Ncp49CiZOi+IbpBfUgpWgcWlr5zn9zQBYLdMqFi2ZjHloWjs3fmjRzcY2z2sCTius5
         tmMC5UXcrAvtjjZFCFfQegWMrhpv/qWXdU00wLqT94d2e/qcXHnjMvwHcEWr73UwKzCW
         M90BGPWoDUybXicgJKc+39gcFqsdv+o73aA8JAyDD6poof1uTEdGe3CHAIXMf3e+N1G5
         jy/Nidz79OybdDZylD7CLUc5Tefcrqo0C4k3m67PWVj4pQD3PYnWKcsVVKwHcA4zrQEL
         uZCrW5QsOFnhlAsNrwjKG4PiHtuzGxPvT7sdIzw75ozFuyGQvtd5ZhdA6OXQ3jACSDFT
         zD9w==
X-Gm-Message-State: AOAM532ssX8fWKT+IaJDuGMCwmFFG8l1NwgN2NFruWHaYJzzW1udzc8B
        Vt6chQ0ercUXXw62ATytFHjWhA==
X-Google-Smtp-Source: ABdhPJxrhbnAFdFw9+anuE/yWe/CReucVHYYbY2Ub9iSuabkIhcI+U3Lx0tcNQdgrhacKhQjcgUS+w==
X-Received: by 2002:aa7:96af:: with SMTP id g15mr27462110pfk.75.1592954708697;
        Tue, 23 Jun 2020 16:25:08 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w124sm17656423pfc.213.2020.06.23.16.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 16:25:08 -0700 (PDT)
Date:   Tue, 23 Jun 2020 16:22:25 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/12] arm64: dts: qcom: msm8994: Add PSCI node
Message-ID: <20200623232225.GO128451@builder.lan>
References: <20200623224813.297077-1-konradybcio@gmail.com>
 <20200623224813.297077-10-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623224813.297077-10-konradybcio@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue 23 Jun 15:48 PDT 2020, Konrad Dybcio wrote:

> Add PSCI node to enable multi-processor startup.
> 
> Note that not every 8994 device firmware supports PSCI,
> and even if, then it can only start the cores and not
> shut them down.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Applied, thanks.

> ---
>  arch/arm64/boot/dts/qcom/msm8994.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> index b3c01ebc5c67..9eec8ab6bf2c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> @@ -159,6 +159,11 @@ pmu {
>  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4)| IRQ_TYPE_LEVEL_HIGH)>;
>  	};
>  
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "hvc";
> +	};
> +
>  	reserved-memory {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> -- 
> 2.27.0
> 
