Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBA3C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 02:03:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AF092065D
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 02:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0UhxI61"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgF2CDW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 28 Jun 2020 22:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgF2CDW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 28 Jun 2020 22:03:22 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4597FC03E97A
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2020 19:03:22 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id a14so2658404pfi.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2020 19:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QDZVkEGnIrKfbxBfohB8JpyHIKxziKsOzFFQJQW1Y2g=;
        b=B0UhxI61raVzv+EmENSz8VpoRV7j2xH27ETZQ52gSc61GH1r/h/ezXpRdNhwEbZHtK
         uBy8nUuY8AqprEoCZxvLTVbKPajt3AEutHfbdumpGqZF0QJpQ1Lrrjn0JqP2dW/V/vTp
         CKJkhzsPVPftyk8Su7NczWON8qvTBXgbq0dBHTeyMy9gGvsoENibT8lhswpFsBOfz3Yx
         N+4hBdcssVo/al2DqZvXi48JBD9Qk2UPSyY4Ann/JkDgP75TCf16LaXHVRTAdh0s4Jle
         KNFS1cDM1sqceGyjDPKA53I4oYdjBEode/i43sgesSCkXk1R8a2UZmdcGwphqJy6W2jR
         KmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QDZVkEGnIrKfbxBfohB8JpyHIKxziKsOzFFQJQW1Y2g=;
        b=GZ8GVVy5gw5eV7K1KwUoCCrgvqRjWc/cAeB3gI6edHkB5nLUwFF7sayePHIo7Ik42w
         WutVTynWG6Juo5yNAksEyXgg8qO06MHxQWkUKMDhCuiLujD3kkbRB++sG1z7VCOJqo//
         sw35wrQynYpY0LJugzss4gModKVCx+SFlZcteMMoPFVO7FOQRHbAtRSQGiCih3AvdbZ0
         gdEfSHRJsPno67dnWf6vVakmiTBvWOhNVH9cDQX3OKl7VdKPbvuOcIqFij0c3hRExO0H
         rfPUuBNDhUCFIgfW6DwLs3JGSWknrVnCVMuacx/ic/Ura5sDT14RZx+j3pSulVwbKyi4
         EyvA==
X-Gm-Message-State: AOAM531vCAXHg4lJXarJf4MqGQKUpd4J3ZvhGINH7CGiNonPk9eRm3S/
        rxYdD/XBryplDH4F0IlUJHeJYA==
X-Google-Smtp-Source: ABdhPJxxkJXjW4f5no0NjX84TxHnLzmVO8fiRUg6nyOW06GtGPhTBdBZIsVWaxOWXIxLMVXsL+WGCg==
X-Received: by 2002:aa7:9184:: with SMTP id x4mr12338959pfa.271.1593396201686;
        Sun, 28 Jun 2020 19:03:21 -0700 (PDT)
Received: from localhost ([122.172.127.76])
        by smtp.gmail.com with ESMTPSA id s10sm4726713pjf.3.2020.06.28.19.03.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Jun 2020 19:03:21 -0700 (PDT)
Date:   Mon, 29 Jun 2020 07:33:18 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: spear: Align L2 cache-controller nodename with
 dtschema
Message-ID: <20200629020318.etzz3xsju7shcglr@vireshk-i7>
References: <20200626080557.3680-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626080557.3680-1-krzk@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 26-06-20, 10:05, Krzysztof Kozlowski wrote:
> Fix dtschema validator warnings like:
>     l2-cache: $nodename:0: 'l2-cache' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/spear13xx.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/spear13xx.dtsi b/arch/arm/boot/dts/spear13xx.dtsi
> index f187da4485f4..c87b881b2c8b 100644
> --- a/arch/arm/boot/dts/spear13xx.dtsi
> +++ b/arch/arm/boot/dts/spear13xx.dtsi
> @@ -43,7 +43,7 @@
>  			      0 7 0x04>;
>  	};
>  
> -	L2: l2-cache {
> +	L2: cache-controller {
>  		    compatible = "arm,pl310-cache";
>  		    reg = <0xed000000 0x1000>;
>  		    cache-unified;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
