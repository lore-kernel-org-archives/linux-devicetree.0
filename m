Return-Path: <SRS0=EOmc=AX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A10CC433E1
	for <linux-devicetree@archiver.kernel.org>; Sun, 12 Jul 2020 17:24:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6689020702
	for <linux-devicetree@archiver.kernel.org>; Sun, 12 Jul 2020 17:24:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W1e4YFxe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729217AbgGLRYl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 12 Jul 2020 13:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728844AbgGLRYk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 12 Jul 2020 13:24:40 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29EB0C08C5DB
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2020 10:24:40 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k5so5008965pjg.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2020 10:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jXvUEBZgpkO+P69YYCsNp6E0a2jqqRvR9VPcHoqgAh0=;
        b=W1e4YFxe4gMwig6FEgO7xRK5kr0ZpjyXtWwdEfv07EIjwl7IFXdBCxrWNYsKuGJHOl
         ke06cMnFdY+hWo2Yd4eN3GMbCnIgg4QWDf8zlc7wZaz+skHxAgxF/885y4CL3yP5GAYD
         PgEp8Bti+OKdwuqqby6iioEIcTR20kTr2jgG1Z4l8BEcHQ5vAb5eYvHNIqNhH5Lb+IV2
         /sf3JXY51rJQb+7ULv14nxZ4EQy0W4dVmfYHKwdbqlzXjzk+GV8x0rrLF9yL2b9Fm81k
         v/0JI0KBvM9zd/dK4PRVcqgCPrtqdHCaMId6+rWHtBS/RNu5baDj1Epzwu4m3AROO1FW
         o1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jXvUEBZgpkO+P69YYCsNp6E0a2jqqRvR9VPcHoqgAh0=;
        b=IE9Tg+PhXo5ZRvukL/ht6rZTEoR28PQpspoBrKZgLNpJywruOuBqxNnjtLnG2k8O//
         ojDMb5W3VHFWTurE7qGa20WQYlaxsVBvCMZyQKaa2wFIPCpkmNVyaW9gfgdNw4VzZ1Hy
         PJYYXy2KQZSqr40T9vHnbVEftktKCCZbsaR6z9GgGhyzQ2cm2AQdyBj4jfq5uyzK+YM1
         ELIW4n0/VPMk0syUtEv4fXBgs14Sq8JcN+NQhpS6QYaus1jMWEs8ahDmRDzMdFx6ShQ/
         abEFzRaf1RCqgQXXgDweVkTZCkkX+HRWNOLo5GULONzKYOrrZAF/2DcaitKv3Jehiy7V
         LRHw==
X-Gm-Message-State: AOAM5311l1XtZ04zAc7chPT6eZuC8GuJJibzK0BaNw1Q+sx5m1ubrd0m
        wVCjIYM+5kgohz3Enc9E00jN
X-Google-Smtp-Source: ABdhPJzSiPDqSZkR7Q902BHv5S7tX3GGO/r9hKDXCaygRzojpuylfvd+bIZAaPKWDPkTPj2q/i0MHg==
X-Received: by 2002:a17:90a:2d83:: with SMTP id p3mr16633374pjd.124.1594574679660;
        Sun, 12 Jul 2020 10:24:39 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6c81:c187:70f5:3123:b5de:e77f])
        by smtp.gmail.com with ESMTPSA id w2sm3242107pjt.19.2020.07.12.10.24.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jul 2020 10:24:39 -0700 (PDT)
Date:   Sun, 12 Jul 2020 22:54:32 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Amit Singh Tomar <amittomer25@gmail.com>
Cc:     andre.przywara@arm.com, afaerber@suse.de, vkoul@kernel.org,
        robh+dt@kernel.org, dan.j.williams@intel.com,
        cristian.ciocaltea@gmail.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 06/10] arm64: dts: actions: Add DMA Controller for S700
Message-ID: <20200712172432.GH6110@Mani-XPS-13-9360>
References: <1593701576-28580-1-git-send-email-amittomer25@gmail.com>
 <1593701576-28580-7-git-send-email-amittomer25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593701576-28580-7-git-send-email-amittomer25@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 02, 2020 at 08:22:52PM +0530, Amit Singh Tomar wrote:
> This commit adds DMA controller present on Actions S700, it differs from
> S900 in terms of number of dma channels and requests.
> 
> Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> Changes since v4:
> 	* No change.
> Changes since v3:
>         * Fixed typo in commit message.
>         * Placed owl-s700-powergate.h in alphabetical order.
> Changes since v2:
>         * added power-domain property as sps
>           is enabled now and DMA needs it.
> Changes since v1:
>         * No Change.
> Changes since RFC:
>         * No Change.
> ---
>  arch/arm64/boot/dts/actions/s700.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
> index f8eb72bb4125..2c78caebf515 100644
> --- a/arch/arm64/boot/dts/actions/s700.dtsi
> +++ b/arch/arm64/boot/dts/actions/s700.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/clock/actions,s700-cmu.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/owl-s700-powergate.h>
>  #include <dt-bindings/reset/actions,s700-reset.h>
>  
>  / {
> @@ -244,5 +245,19 @@
>  				     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> +
> +		dma: dma-controller@e0230000 {
> +			compatible = "actions,s700-dma";
> +			reg = <0x0 0xe0230000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			dma-channels = <10>;
> +			dma-requests = <44>;
> +			clocks = <&cmu CLK_DMAC>;
> +			power-domains = <&sps S700_PD_DMA>;
> +		};
>  	};
>  };
> -- 
> 2.7.4
> 
