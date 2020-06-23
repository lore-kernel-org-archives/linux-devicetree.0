Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88252C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 23:07:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66B6720874
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 23:07:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S1bCy5X0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388221AbgFWXHe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 23 Jun 2020 19:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387634AbgFWXHd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 23 Jun 2020 19:07:33 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561A8C061573
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 16:07:32 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ne5so149559pjb.5
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 16:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H5tzGK8Ul6tfg3isVDLVBRlbu5v0xvfY4n3qpqbH1NI=;
        b=S1bCy5X06OFaFFNIdeDnS6CSjZ0Kdws9KkQcI1YuKKPPow3kSalVMW4MVN0P19JhbB
         AwyXcbyYpdsEM0IJwO0xPhelwzn2W7jASJZYkOexxveaAuXUaOQ7uOYC3epePjn9jltI
         lQOHuHv2T0gtLYpuYpMD6zRC+9vwL20ElP5Wzq6u7sgW+9JZYRzA8J0252oDhAIqlTQV
         YGRG+RAWmh862PZuA9ECrmEd/GEZgSIvuOXjdL/U4x/3CEVNmrgL4lE7cP9xCS4wPU+4
         l/3Gd7jY+5Jwg2evxhfuSRirITpsFdi1WghwcFzvGhDy3v8kxAQYLm5j4qYs3m/BeTlR
         POJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H5tzGK8Ul6tfg3isVDLVBRlbu5v0xvfY4n3qpqbH1NI=;
        b=YTw9G944JqDAmc8vzKFAezrflYAXUBH/FwZjbZ2OwmcqF7hDTxO7LsF/l/+xB/ph+p
         DK9bHpvmC72f5BAo5+Q6LRCXjOQ7whkXJsNgo43RW19IIhsD8jnANPZLbpT7utBcm/vS
         DDutjxY9aUi5jeBSMN1Ke8J3NxxZYli+G4G0hXv29AhSby0N8wc2iwuOOOWSsZqkd3Q+
         P+BV4rU1BXC69MisIRrdM6rB39tB/D5gCow2Y/r6k5+3V4wpWzDt5ZvReEdyT5T76sm4
         e3w78PSNT1OMwIqZQ9CWhFqndwuNxpOrN5r025he/DoqvnCRQFT4NpBh6FEeQaOy+OYD
         MIcA==
X-Gm-Message-State: AOAM532RadITjI6iN0+b5kTTwMDUdH54iLrMavWuY/0QfpfoU5kth0M7
        JN4UUMlILDMAr3PF9tYPiC7vAQ==
X-Google-Smtp-Source: ABdhPJyJrZ0h4pT6D7zRuXMtMqWbxZWmhLKSGmNzOwnfxEQyboY/eJWM4/LcweJZjH+HF/v0xL4zQw==
X-Received: by 2002:a17:902:ac94:: with SMTP id h20mr2016739plr.197.1592953651691;
        Tue, 23 Jun 2020 16:07:31 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b5sm3307716pjz.34.2020.06.23.16.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 16:07:31 -0700 (PDT)
Date:   Tue, 23 Jun 2020 16:04:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/12] arm64: dts: qcom: msm8994: Modernize the DTS
 style
Message-ID: <20200623230448.GG128451@builder.lan>
References: <20200623224813.297077-1-konradybcio@gmail.com>
 <20200623224813.297077-2-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623224813.297077-2-konradybcio@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue 23 Jun 15:48 PDT 2020, Konrad Dybcio wrote:
[..]
> diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
[..]
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <1 2 0xff08>,
> +					<1 3 0xff08>,
> +					<1 4 0xff08>,
> +					<1 1 0xff08>;

Indentation is off here and these are supposed to be GIC_PPI. So I fixed
this and applied the patch.

Thanks,
Bjorn
