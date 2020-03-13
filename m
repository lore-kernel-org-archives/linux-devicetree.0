Return-Path: <SRS0=byNV=46=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5307C10DCE
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 20:17:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A80A120751
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 20:17:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgCMURq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Mar 2020 16:17:46 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:45833 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgCMURq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Mar 2020 16:17:46 -0400
X-Originating-IP: 87.231.134.186
Received: from localhost (87-231-134-186.rev.numericable.fr [87.231.134.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1D65920005;
        Fri, 13 Mar 2020 20:17:40 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: mcbin: support 2W SFP modules
In-Reply-To: <E1j7HyM-0004Zc-HY@rmk-PC.armlinux.org.uk>
References: <E1j7HyM-0004Zc-HY@rmk-PC.armlinux.org.uk>
Date:   Fri, 13 Mar 2020 21:17:40 +0100
Message-ID: <87blp0ypp7.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Russell,

> Allow the SFP cages to be used with 2W SFP modules.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applied on mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> index 8a39908e584f..ba25650730c3 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> @@ -71,6 +71,7 @@
>  		tx-fault-gpio  = <&cp1_gpio1 26 GPIO_ACTIVE_HIGH>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&cp1_sfpp0_pins>;
> +		maximum-power-milliwatt = <2000>;
>  	};
>  
>  	sfp_eth1: sfp-eth1 {
> @@ -83,6 +84,7 @@
>  		tx-fault-gpio = <&cp0_gpio2 30 GPIO_ACTIVE_HIGH>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&cp1_sfpp1_pins &cp0_sfpp1_pins>;
> +		maximum-power-milliwatt = <2000>;
>  	};
>  
>  	sfp_eth3: sfp-eth3 {
> @@ -95,6 +97,7 @@
>  		tx-fault-gpio = <&cp0_gpio2 19 GPIO_ACTIVE_HIGH>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&cp0_sfp_1g_pins &cp1_sfp_1g_pins>;
> +		maximum-power-milliwatt = <2000>;
>  	};
>  };
>  
> -- 
> 2.20.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
