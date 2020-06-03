Return-Path: <SRS0=VnZl=7Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD21CC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 19:46:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F8DE20734
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 19:46:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBqZJTI/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgFCTqR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 15:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgFCTqR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 15:46:17 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4CC2C08C5C0
        for <devicetree@vger.kernel.org>; Wed,  3 Jun 2020 12:46:16 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f3so2241887pfd.11
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 12:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=o7dFferafHbA16Hif7YTAGiM27NsDHjPshBN8GtxSpQ=;
        b=ZBqZJTI/EqMGcNeOmAtpJerj9kuJN7gkWqA4WZKdm+FUPSDPLMxVZQcJBWEfE027o0
         TgPteJKXrccWIVn2ShcVKXH6cRGPnjNqv0eeZv79dKSI4PxExjQ2XEp9XUmMikZHbRKn
         bAvB1H9+SylEdfuy855HADDP7uqY5auLg2ks1dsWoQLqreqVF/TcJCU7pIxz7Oi3YlFB
         OTw6NUxwBj+uwMbm9ZrhIrBrYLSotFmunudN4o1/hi2q5Rz3aGfaKAcdhAWJ4gteE5/l
         enSy5mHzCHeOTiK1RooBGTc4qQOnrMK54cCY+lRD5Fj3Qfc5DHYTZQtxFNNGWLdeTZKc
         zmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=o7dFferafHbA16Hif7YTAGiM27NsDHjPshBN8GtxSpQ=;
        b=mepdHFHr2w+TnmXpK9Wowm3UsQcSUEmzkiLLPMeH6YEO+XAxJS52gmxvQmAA2i/sHz
         pUyExNnkAVPcet2NW8a+x+dEqzvdSol4K74LfNLG4dOP4JDmUDecRparWBt9ew0AzFO9
         1R8YfsXtEFR1vDkRLoVDcXg7bUG5Shns03rTpha2v2jz5ki1EsG3vWTUtgKGOQ58Kc7e
         OT9kIKu8rgao5PtckoD2EG9r/S3tUzUHbvwkVSZEvaE/K5pswXaWx7rz5pmfgxVX5P5x
         ZL37l6O3MbAnHP2OAPsu6EF0LT8Hqv1tyc3WU3Zurygc7CziySxbcYyLzsQsrwFATuBL
         kuHw==
X-Gm-Message-State: AOAM530Pd638Nnmidk4U8I+KGt05LFRhL2kCLVmPKSADeqpXZPM05S7d
        MmOMNPZNS0ArRn/pHEdXAfdSQ4jq
X-Google-Smtp-Source: ABdhPJxnJr48yRyW/hEf8WxrSjMwGJOdv2pu6rwsKDZMl/pHTB6294/TRP33rd3uXco1ZuY176oG8Q==
X-Received: by 2002:a62:6487:: with SMTP id y129mr755685pfb.198.1591213576344;
        Wed, 03 Jun 2020 12:46:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r8sm2593429pfq.16.2020.06.03.12.46.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 12:46:15 -0700 (PDT)
Date:   Wed, 3 Jun 2020 12:46:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm: dts: vexpress: Move mcc node back into motherboard
 node
Message-ID: <20200603194614.GA187107@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jun 03, 2020 at 05:22:37PM +0100, Andre Przywara wrote:
> Commit 	d9258898ad49 ("arm64: dts: arm: vexpress: Move fixed devices
> out of bus node") moved the "mcc" DT node into the root node, because
> it does not have any children using "reg" properties, so does violate
> some dtc checks about "simple-bus" nodes.
> However this broke the vexpress config-bus code, which walks up the
> device tree to find the first node with an "arm,vexpress,site" property.
> This gave the wrong result (matching the root node instead of the
> motherboard node), so broke the clocks and some other devices for
> VExpress boards.
> 
> Move the whole node back into its original position. This re-introduces
> the dtc warning, but is conceptually the right thing to do. The dtc
> warning seems to be overzealous here, there are discussions on fixing or
> relaxing this check instead.
> 
> Fixes: 	d9258898ad49 ("arm64: dts: arm: vexpress: Move fixed devices out of bus node")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
> P.S. The broken commit has not reached mainline yet, but is already in
> arm-soc/arm/dt.
> 
>  arch/arm/boot/dts/vexpress-v2m-rs1.dtsi | 146 ++++++++++++------------
>  1 file changed, 73 insertions(+), 73 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
> index e6308fb76183..a88ee5294d35 100644
> --- a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
> +++ b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
> @@ -100,79 +100,6 @@
>  		};
>  	};
>  
> -	mcc {
> -		compatible = "arm,vexpress,config-bus";
> -		arm,vexpress,config-bridge = <&v2m_sysreg>;
> -
> -		oscclk0 {
> -			/* MCC static memory clock */
> -			compatible = "arm,vexpress-osc";
> -			arm,vexpress-sysreg,func = <1 0>;
> -			freq-range = <25000000 60000000>;
> -			#clock-cells = <0>;
> -			clock-output-names = "v2m:oscclk0";
> -		};
> -
> -		v2m_oscclk1: oscclk1 {
> -			/* CLCD clock */
> -			compatible = "arm,vexpress-osc";
> -			arm,vexpress-sysreg,func = <1 1>;
> -			freq-range = <23750000 65000000>;
> -			#clock-cells = <0>;
> -			clock-output-names = "v2m:oscclk1";
> -		};
> -
> -		v2m_oscclk2: oscclk2 {
> -			/* IO FPGA peripheral clock */
> -			compatible = "arm,vexpress-osc";
> -			arm,vexpress-sysreg,func = <1 2>;
> -			freq-range = <24000000 24000000>;
> -			#clock-cells = <0>;
> -			clock-output-names = "v2m:oscclk2";
> -		};
> -
> -		volt-vio {
> -			/* Logic level voltage */
> -			compatible = "arm,vexpress-volt";
> -			arm,vexpress-sysreg,func = <2 0>;
> -			regulator-name = "VIO";
> -			regulator-always-on;
> -			label = "VIO";
> -		};
> -
> -		temp-mcc {
> -			/* MCC internal operating temperature */
> -			compatible = "arm,vexpress-temp";
> -			arm,vexpress-sysreg,func = <4 0>;
> -			label = "MCC";
> -		};
> -
> -		reset {
> -			compatible = "arm,vexpress-reset";
> -			arm,vexpress-sysreg,func = <5 0>;
> -		};
> -
> -		muxfpga {
> -			compatible = "arm,vexpress-muxfpga";
> -			arm,vexpress-sysreg,func = <7 0>;
> -		};
> -
> -		shutdown {
> -			compatible = "arm,vexpress-shutdown";
> -			arm,vexpress-sysreg,func = <8 0>;
> -		};
> -
> -		reboot {
> -			compatible = "arm,vexpress-reboot";
> -			arm,vexpress-sysreg,func = <9 0>;
> -		};
> -
> -		dvimode {
> -			compatible = "arm,vexpress-dvimode";
> -			arm,vexpress-sysreg,func = <11 0>;
> -		};
> -	};
> -
>  	bus@8000000 {
>  		motherboard-bus {
>  			model = "V2M-P1";
> @@ -435,6 +362,79 @@
>  						};
>  					};
>  				};
> +
> +				mcc {
> +					compatible = "arm,vexpress,config-bus";
> +					arm,vexpress,config-bridge = <&v2m_sysreg>;
> +
> +					oscclk0 {
> +						/* MCC static memory clock */
> +						compatible = "arm,vexpress-osc";
> +						arm,vexpress-sysreg,func = <1 0>;
> +						freq-range = <25000000 60000000>;
> +						#clock-cells = <0>;
> +						clock-output-names = "v2m:oscclk0";
> +					};
> +
> +					v2m_oscclk1: oscclk1 {
> +						/* CLCD clock */
> +						compatible = "arm,vexpress-osc";
> +						arm,vexpress-sysreg,func = <1 1>;
> +						freq-range = <23750000 65000000>;
> +						#clock-cells = <0>;
> +						clock-output-names = "v2m:oscclk1";
> +					};
> +
> +					v2m_oscclk2: oscclk2 {
> +						/* IO FPGA peripheral clock */
> +						compatible = "arm,vexpress-osc";
> +						arm,vexpress-sysreg,func = <1 2>;
> +						freq-range = <24000000 24000000>;
> +						#clock-cells = <0>;
> +						clock-output-names = "v2m:oscclk2";
> +					};
> +
> +					volt-vio {
> +						/* Logic level voltage */
> +						compatible = "arm,vexpress-volt";
> +						arm,vexpress-sysreg,func = <2 0>;
> +						regulator-name = "VIO";
> +						regulator-always-on;
> +						label = "VIO";
> +					};
> +
> +					temp-mcc {
> +						/* MCC internal operating temperature */
> +						compatible = "arm,vexpress-temp";
> +						arm,vexpress-sysreg,func = <4 0>;
> +						label = "MCC";
> +					};
> +
> +					reset {
> +						compatible = "arm,vexpress-reset";
> +						arm,vexpress-sysreg,func = <5 0>;
> +					};
> +
> +					muxfpga {
> +						compatible = "arm,vexpress-muxfpga";
> +						arm,vexpress-sysreg,func = <7 0>;
> +					};
> +
> +					shutdown {
> +						compatible = "arm,vexpress-shutdown";
> +						arm,vexpress-sysreg,func = <8 0>;
> +					};
> +
> +					reboot {
> +						compatible = "arm,vexpress-reboot";
> +						arm,vexpress-sysreg,func = <9 0>;
> +					};
> +
> +					dvimode {
> +						compatible = "arm,vexpress-dvimode";
> +						arm,vexpress-sysreg,func = <11 0>;
> +					};
> +				};
>  			};
>  		};
>  	};
> -- 
> 2.17.1
> 
