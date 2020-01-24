Return-Path: <SRS0=u7up=3N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD0DC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 20:54:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 419092081E
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 20:54:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzPWHzc+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgAXUy1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jan 2020 15:54:27 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39162 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgAXUy1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Jan 2020 15:54:27 -0500
Received: by mail-wm1-f65.google.com with SMTP id c84so766798wme.4
        for <devicetree@vger.kernel.org>; Fri, 24 Jan 2020 12:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=opkZhz5duR9Fq5DdteTxdcCMw2LLGvVz5ld2quduWCU=;
        b=VzPWHzc+9AwICXQCpK8UFlEJx29WP+RQDUYAl4ZuwJ4ZT2A1UF6z8gLniJgwqwpbOw
         mjdDBi8NAMffhnJUnyYsUVgUwChGfGltqilmpPejqCf+h83mrdgSWvL7Se4glrFWRFR/
         doPYqnQeAZnV9WfOru4+U9kJXiy2clVjczUdvZn30tbpMvRsiPTolySL1t5YBrctpOnG
         zKn31xaqN0vUCHaKvLzbJRm2KWdYiscbmpwAowj21krQ8duow1MsxMLaUIYPuSSekHx/
         ucmcbeLyHgqan4yp1/soISTooRIzL6shEsDtfCxNNRVgjESDIlMYp3kdHvYKHWXqQy0x
         BPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=opkZhz5duR9Fq5DdteTxdcCMw2LLGvVz5ld2quduWCU=;
        b=kmhqMWSk+WsP8FvjTviMKsAvnyIty5VYSXUPROEombYMvdeeK1WLSg/1dLyq/E57kt
         vS9Ezl7X6vBm4ulPZOkYsBNrBaBVv4K9qEioaOLO7vnw1QjowFcOAaM+UZxj5OlQ+WkK
         3N8KH1jtBk70tm12WtYrEfXLu1bZG1vLsN0XbdFnH4XtZvqFYAOuxpaACkRS7CZR85I+
         e8hrI5rYsuPfQr/29yfdbU69JmECSTUOw/fQb73sI0QIMz3gAAcwV+4/2DDFVF65IR+4
         8cwPwxo3Ay+vm0kT11fqmk8L4X6rRkr8p8jjyL5/DMBELSlMFmI2ExldMmwcY8sZ2Hww
         s93Q==
X-Gm-Message-State: APjAAAWtc3e+9vkk4RtxghoUF5ZnpfIUoOwGr/pthpXJjANzZEbKbQWq
        Cw2BCeyIWUSTcQHvYc71S98=
X-Google-Smtp-Source: APXvYqxM4IdIrgE2Yh8Co6XoPZAg6AxqlyYVfJQBW2cGptnFKjuymJgPm0Zl+D27Czd2RqPrFOMCVA==
X-Received: by 2002:a1c:80d4:: with SMTP id b203mr957857wmd.102.1579899266075;
        Fri, 24 Jan 2020 12:54:26 -0800 (PST)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net. [194.152.20.232])
        by smtp.gmail.com with ESMTPSA id h8sm9812977wrx.63.2020.01.24.12.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 12:54:25 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        Maxime Ripard <maxime@cerno.tech>,
        linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: h6: Add IOMMU
Date:   Fri, 24 Jan 2020 21:54:23 +0100
Message-ID: <5320339.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <54e22e25c2c13cb1b73cc7ecb645b5d62f325b63.1579696927.git-series.maxime@cerno.tech>
References: <cover.b2a9e1507135d81e726fcbb65137665a7f0ab74f.1579696927.git-series.maxime@cerno.tech> <54e22e25c2c13cb1b73cc7ecb645b5d62f325b63.1579696927.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi!

Dne sreda, 22. januar 2020 ob 13:44:09 CET je Maxime Ripard napisal(a):
> Now that we have a driver for the IOMMU, let's start using it.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi index
> 29824081b43b..8608bcf1c52c 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -53,6 +53,7 @@
>  	de: display-engine {
>  		compatible = "allwinner,sun50i-h6-display-engine";
>  		allwinner,pipelines = <&mixer0>;
> +		iommus = <&iommu 0>;
>  		status = "disabled";
>  	};

Isn't iommu property of the mixer node? After all, mixer is the one which 
reads one or more framebuffers. Once second mixer is defined, would you put 
another iommu phandle here?

Best regards,
Jernej

> 
> @@ -122,6 +123,7 @@
>  				clock-names = "bus",
>  					      "mod";
>  				resets = <&display_clocks 
RST_MIXER0>;
> +				iommus = <&iommu 0>;
> 
>  				ports {
>  					#address-cells = <1>;
> @@ -345,6 +347,15 @@
>  			#interrupt-cells = <3>;
>  		};
> 
> +		iommu: iommu@30f0000 {
> +			compatible = "allwinner,sun50i-h6-iommu";
> +			reg = <0x030f0000 0x10000>;
> +			interrupts = <GIC_SPI 57 
IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_IOMMU>;
> +			resets = <&ccu RST_BUS_IOMMU>;
> +			#iommu-cells = <1>;
> +		};
> +
>  		mmc0: mmc@4020000 {
>  			compatible = "allwinner,sun50i-h6-mmc",
>  				     "allwinner,sun50i-a64-mmc";




