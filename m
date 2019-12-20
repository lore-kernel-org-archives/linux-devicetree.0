Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAB9C2D0C1
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 00:56:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E399624672
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 00:56:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfLTA4F (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 19:56:05 -0500
Received: from gloria.sntech.de ([185.11.138.130]:42144 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726952AbfLTA4F (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Dec 2019 19:56:05 -0500
Received: from ip5f5a5f74.dynamic.kabel-deutschland.de ([95.90.95.116] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1ii6aF-00061N-6O; Fri, 20 Dec 2019 01:55:59 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-rockchip@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Describe PX30 caches
Date:   Fri, 20 Dec 2019 01:55:58 +0100
Message-ID: <1982322.8UTTk47u2F@diego>
In-Reply-To: <20191204103940.22050-1-miquel.raynal@bootlin.com>
References: <20191204103940.22050-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Am Mittwoch, 4. Dezember 2019, 11:39:40 CET schrieb Miquel Raynal:
> PX30 SoCs feature 4 Cortex-A35 CPUs with each of them a L1 data and
> instruction cache. Both are 32kiB wide (PX30 TRM) and made of 64-bit
> lines (ARM Cortex-A35 manual). I-cache is 2-way set associative (ARM
> Cortex-A35 manual), D-cache is 4-way set associative (ARM
> Cortex-A35manual).
> 
> An L2 cache is placed after these 4 L1 caches (PX30 TRM), is 256kiB
> wide (PX30 TRM) and made of 64-bit lines (ARM Cortex-A35 manual) and
> is 8-way set associative (ARM Cortex-A35 manual).
> 
> Describe all of them in the PX30 DTSI.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  arch/arm64/boot/dts/rockchip/px30.dtsi | 35 ++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
> index 1fd12bd09e83..0e10a224a84b 100644
> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> @@ -48,6 +48,13 @@
>  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
>  			dynamic-power-coefficient = <90>;
>  			operating-points-v2 = <&cpu0_opp_table>;
> +			i-cache-size = <0x8000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2>;
>  		};
>  
>  		cpu1: cpu@1 {
> @@ -60,6 +67,13 @@
>  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
>  			dynamic-power-coefficient = <90>;
>  			operating-points-v2 = <&cpu0_opp_table>;
> +			i-cache-size = <0x8000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2>;
>  		};
>  
>  		cpu2: cpu@2 {
> @@ -72,6 +86,13 @@
>  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
>  			dynamic-power-coefficient = <90>;
>  			operating-points-v2 = <&cpu0_opp_table>;
> +			i-cache-size = <0x8000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2>;
>  		};
>  
>  		cpu3: cpu@3 {
> @@ -84,6 +105,13 @@
>  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
>  			dynamic-power-coefficient = <90>;
>  			operating-points-v2 = <&cpu0_opp_table>;
> +			i-cache-size = <0x8000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2>;
>  		};
>  
>  		idle-states {
> @@ -107,6 +135,13 @@
>  				min-residency-us = <2000>;
>  			};
>  		};
> +
> +		l2: l2-cache {
> +			compatible = "cache";
> +			cache-size = <0x40000>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +		};
>  	};

Looks like Rob did answer my unspoken question, citing his reply to
	"arm64: dts: amazon: add Amazon's Annapurna Labs Alpine v3 support" [0]

"We only define cache attributes if not discoverable or the cache ID 
registers are wrong and you need to override what's discoverable."

So unless the cache information read during boot is wrong, it looks
like we don't need this.

Heiko


[0] https://patchwork.kernel.org/patch/11279705/



