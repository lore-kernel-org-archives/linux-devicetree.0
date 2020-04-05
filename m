Return-Path: <SRS0=YuQm=5V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93A9C2D0E8
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Apr 2020 06:51:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8052D206C3
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Apr 2020 06:51:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QA76mSat"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgDEGvt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 5 Apr 2020 02:51:49 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:56061 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgDEGvs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 5 Apr 2020 02:51:48 -0400
Received: by mail-pj1-f67.google.com with SMTP id fh8so5070491pjb.5
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2020 23:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=TGy9rnxZk9+7y7aCTCI01iy1QvV1657xHryoXzYxu+w=;
        b=QA76mSat7GkAycz9Ix+QUyd+J9fKzqc/h5WIAYN1rHB/m9fsk4aL0+Ls2u8RkVKaPV
         zF/dg9pfZm3Rbwe0v9hn2baF768y2hk7a69JUJqtagpLreDXirQyxZXvyBIe7bXEeDVc
         fw6yX6G2Z8fUTsCZiPTQ9kSX6pYb3FSvM9kAsEP/3P38ya/98AuRlk0l9ChaBUh/7m7j
         F6Tx8A9k9J+QnSndiXGhBw+YqNoSZOGSVzrp6N2jBz12xu4bw9YyLa3BBh+RBPPcAzog
         77Kh2moc+T3yLKb3zXVpEBKIteYcftCn2P7wo5xtO4GH7aRmpRK2JlQivQnYDcWq+O+F
         5e6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=TGy9rnxZk9+7y7aCTCI01iy1QvV1657xHryoXzYxu+w=;
        b=p2z/vS0h6EjiZkA8xpDR2AQajpEpQeWMzFopbZpOk/Dlb2natdwLx+a3FayqrzrsyU
         uBqurQkq0crjWzdLqduE8DyE2GwTJb/P6ruCzesICO2pqeXzzV5vW+wh7AYWzzJF/SfE
         l8hRf82VhT8N+ZJm689i0GFuDbDghGbg6OL3wd7ulcgrHpKL8AWczEFhjkzAuF8V8zkY
         sil66A4/pmBuaCUN0hSJDPBc7gAdVVQfBhInFRxDMHxxZx/6o+iC5km1EL1FGWocW/GQ
         N3fGT65Mz23c8FnN+JGMrOWOf2DZ7QE1fyfGOnV8kMCal4p9jYwbRErMc1ElL5/JpP33
         dwwg==
X-Gm-Message-State: AGi0PuYE4fWtab+X2KmhaYSdbOIrkGJMyD0TIRWKXvu2ycXU/u0+/sjY
        WxZXpPtN2QxAZMxy4TKndojM
X-Google-Smtp-Source: APiQypKhtqT6m4dUjC/jKfp/a1KE2PyeMsGxvd4RbU9eb/JrQOMjCpNyqmpFkHp9h9iWB4Q5RqSoWA==
X-Received: by 2002:a17:902:342:: with SMTP id 60mr15873346pld.29.1586069505517;
        Sat, 04 Apr 2020 23:51:45 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e83:b2ab:75aa:fbdc:e9da:9d96])
        by smtp.gmail.com with ESMTPSA id h198sm8842662pfe.76.2020.04.04.23.51.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Apr 2020 23:51:44 -0700 (PDT)
Date:   Sun, 5 Apr 2020 12:21:37 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Matheus Castello <matheus@castello.eng.br>
Cc:     afaerber@suse.de, mark.rutland@arm.com, robh+dt@kernel.org,
        edgar.righi@lsitec.org.br, igor.lima@lsitec.org.br,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: Re: [PATCH v3 3/3] ARM: dts: Add Caninos Loucos Labrador
Message-ID: <20200405065137.GC8912@Mani-XPS-13-9360>
References: <20200229104358.GB19610@mani>
 <20200320035104.26139-1-matheus@castello.eng.br>
 <20200320035104.26139-4-matheus@castello.eng.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200320035104.26139-4-matheus@castello.eng.br>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 20, 2020 at 12:51:04AM -0300, Matheus Castello wrote:
> Add Device Trees for Caninos Loucos Labrador CoM and base board.
> Based on the work of Andreas Färber on Lemaker Guitar device tree.
> 
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Will queue the series for v5.8 once Andreas is happy with it.

Nit: Please keep linux-actions@lists.infradead.org in CC for all future
patches/replies.

Thanks,
Mani

> ---
>  arch/arm/boot/dts/Makefile                  |  1 +
>  arch/arm/boot/dts/owl-s500-labrador-bb.dts  | 34 +++++++++++++++++++++
>  arch/arm/boot/dts/owl-s500-labrador-v2.dtsi | 21 +++++++++++++
>  3 files changed, 56 insertions(+)
>  create mode 100644 arch/arm/boot/dts/owl-s500-labrador-bb.dts
>  create mode 100644 arch/arm/boot/dts/owl-s500-labrador-v2.dtsi
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index d6546d2676b9..99f633460833 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -842,6 +842,7 @@ dtb-$(CONFIG_ARCH_ORION5X) += \
>  dtb-$(CONFIG_ARCH_ACTIONS) += \
>  	owl-s500-cubieboard6.dtb \
>  	owl-s500-guitar-bb-rev-b.dtb \
> +	owl-s500-labrador-bb.dtb \
>  	owl-s500-sparky.dtb
>  dtb-$(CONFIG_ARCH_PRIMA2) += \
>  	prima2-evb.dtb
> diff --git a/arch/arm/boot/dts/owl-s500-labrador-bb.dts b/arch/arm/boot/dts/owl-s500-labrador-bb.dts
> new file mode 100644
> index 000000000000..91012b4a4c30
> --- /dev/null
> +++ b/arch/arm/boot/dts/owl-s500-labrador-bb.dts
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Caninos Labrador Base Board
> + *
> + * Copyright (c) 2019-2020 Matheus Castello
> + */
> +
> +/dts-v1/;
> +
> +#include "owl-s500-labrador-v2.dtsi"
> +
> +/ {
> +	compatible = "caninos,labrador-bb", "caninos,labrador", "actions,s500";
> +	model = "Caninos Labrador Base Board M v1.0";
> +
> +	aliases {
> +		serial3 = &uart3;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial3:115200n8";
> +	};
> +
> +	uart3_clk: uart3-clk {
> +		compatible = "fixed-clock";
> +		clock-frequency = <921600>;
> +		#clock-cells = <0>;
> +	};
> +};
> +
> +&uart3 {
> +	status = "okay";
> +	clocks = <&uart3_clk>;
> +};
> diff --git a/arch/arm/boot/dts/owl-s500-labrador-v2.dtsi b/arch/arm/boot/dts/owl-s500-labrador-v2.dtsi
> new file mode 100644
> index 000000000000..0b54f1ef3ec0
> --- /dev/null
> +++ b/arch/arm/boot/dts/owl-s500-labrador-v2.dtsi
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Caninos Labrador CoM V2
> + *
> + * Copyright (c) 2019-2020 Matheus Castello
> + */
> +
> +#include "owl-s500.dtsi"
> +
> +/ {
> +	compatible = "caninos,labrador", "actions,s500";
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000>;
> +	};
> +};
> +
> +&timer {
> +	clocks = <&hosc>;
> +};
> --
> 2.25.0
> 
