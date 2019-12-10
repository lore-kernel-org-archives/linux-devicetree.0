Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE5DC43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 08:52:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5CC5720726
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 08:52:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jpct3dZ7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfLJIwx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 03:52:53 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46702 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbfLJIwx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Dec 2019 03:52:53 -0500
Received: by mail-wr1-f67.google.com with SMTP id z7so18942157wrl.13
        for <devicetree@vger.kernel.org>; Tue, 10 Dec 2019 00:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wu72ZcmsFHLVkAALMmbmLhHmQQPjxMnxvhre6csNNNw=;
        b=Jpct3dZ79bLrJVYVAnUUlQlf9+z5GnfPRqxm1SCkWaAX4EzJW1DvJaHb1kwIoqbS2T
         x3iqypxU0qLYRpUk16PdsdbC7hDJMPnlljbS9sAmBEj7xerpWHSzo7Vu6DDioD2Sl0R/
         RtHnkO8jP0Q3zEAflyhfyb0U9435zmG0Eljeu26sigkMCO9Sy7QnwPBqlAfKiUYIq3mx
         UQYu4oKbrloYniRIIbNrvLgVazCm0gSj+KiZiExfq7Ky64IMfAD3qQkgDyB0ruTnNFZn
         xO8FOXbKKu4oIy1Y5a7i2yklkS6q0PkPaG/NcvXoMwjVUZPs2ju4LLfsLlMbvyMb/2Ad
         5qyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wu72ZcmsFHLVkAALMmbmLhHmQQPjxMnxvhre6csNNNw=;
        b=C0o7jvirbmRvJya9YxsWa30LAicjTOvNDjmThCTCcitbcEI1ou+kWHr4PfAO6CZMe/
         aTJQsRftq5toclfWsMnK5mp25OQWd+cwo4X/jgeIHF+ez1c6twEetsXwgKRG1bDQp+JR
         xD4S9SNEW75C7nuJxd2RcaGxxYUm7NtCC+uLQAPmChhjpiVGrrIeMEUZLj/lXh1wYhGz
         HUCsdzzAwCJlwhEL8o7qRDn1/vyA/Xz8GKN7IhpQ/pywG3W/LmbI+YVUhN4wcXj1VjUi
         rAXQPSlhmBVCf6mqIT1Y8SBKOBUWljQlwHL0IFGccIdw7cwWMF8jmLpHguldopRJaB69
         aIzw==
X-Gm-Message-State: APjAAAUiKGKuHuPlTRdguwVlzCNfSPXBpLnEJOO9ahp/syqSYjDsSw0O
        1SJ/NjgTp1glnITP08VB3Ou1Ig==
X-Google-Smtp-Source: APXvYqxNtdqEUf0ybgBiLfNWM/2TgJzzIP+gMMTyOVmPeFHLT7MsWwJUI/pg+ie8aPi1hMxoH7lPLg==
X-Received: by 2002:adf:f850:: with SMTP id d16mr1853669wrq.161.1575967971012;
        Tue, 10 Dec 2019 00:52:51 -0800 (PST)
Received: from dell (h185-20-99-176.host.redstation.co.uk. [185.20.99.176])
        by smtp.gmail.com with ESMTPSA id s15sm2518432wrp.4.2019.12.10.00.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 00:52:50 -0800 (PST)
Date:   Tue, 10 Dec 2019 08:52:43 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v3 1/6] dt-bindings: mfd: rn5t618: Document optional
 property interrupts
Message-ID: <20191210085243.GR3468@dell>
References: <20191129212045.18325-1-andreas@kemnade.info>
 <20191129212045.18325-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191129212045.18325-2-andreas@kemnade.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 29 Nov 2019, Andreas Kemnade wrote:

> These chips use interrupts for various things like rtc alarm.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  Documentation/devicetree/bindings/mfd/rn5t618.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rn5t618.txt b/Documentation/devicetree/bindings/mfd/rn5t618.txt
> index b74e5e94d1cb..05650e1ab28a 100644
> --- a/Documentation/devicetree/bindings/mfd/rn5t618.txt
> +++ b/Documentation/devicetree/bindings/mfd/rn5t618.txt
> @@ -15,6 +15,7 @@ Required properties:
>   - reg: the I2C slave address of the device
>  
>  Optional properties:
> + - interrupts: interrupt mapping for IRQ

Please link to the document that describes it, as below.

NB: Relative paths are usually preferred.

>   - system-power-controller:
>     See Documentation/devicetree/bindings/power/power-controller.txt
>  
> @@ -32,6 +33,8 @@ Example:
>  	pmic@32 {
>  		compatible = "ricoh,rn5t618";
>  		reg = <0x32>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
>  		system-power-controller;
>  
>  		regulators {

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
