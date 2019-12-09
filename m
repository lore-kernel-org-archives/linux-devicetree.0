Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A7BC3F68F
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 14:38:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D17692080D
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 14:38:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbfLIOip (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 09:38:45 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:50645 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727742AbfLIOio (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 09:38:44 -0500
Received: from localhost (lfbn-1-1480-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9A5F224000A;
        Mon,  9 Dec 2019 14:38:41 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Russell King <rmk+kernel@armlinux.org.uk>,
        Vladimir Vid <vladimir.vid@sartura.hr>
Cc:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: uDPU: SFP cages support 3W modules
In-Reply-To: <E1iXCMq-00040q-Bm@rmk-PC.armlinux.org.uk>
References: <E1iXCMq-00040q-Bm@rmk-PC.armlinux.org.uk>
Date:   Mon, 09 Dec 2019 15:38:41 +0100
Message-ID: <87immph8cu.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Russell King <rmk+kernel@armlinux.org.uk> writes:

> The SFP cages are designed to support up to 3W modules, such as G.hn,
> G.fast and MoCA modules. Although there is no way for such modules to
> declare to software that they consume 3W, we document in DT that this
> is the designed power level for these cages.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applied on mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
> index 2ac1d9ae1e25..7eb6c1796cef 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
> @@ -69,6 +69,7 @@
>  		mod-def0-gpio = <&gpiosb 3 GPIO_ACTIVE_LOW>;
>  		tx-disable-gpio = <&gpiosb 4 GPIO_ACTIVE_HIGH>;
>  		tx-fault-gpio = <&gpiosb 5 GPIO_ACTIVE_HIGH>;
> +		maximum-power-milliwatt = <3000>;
>  	};
>  
>  	sfp_eth1: sfp-eth1 {
> @@ -78,6 +79,7 @@
>  		mod-def0-gpio = <&gpiosb 8 GPIO_ACTIVE_LOW>;
>  		tx-disable-gpio = <&gpiosb 9 GPIO_ACTIVE_HIGH>;
>  		tx-fault-gpio = <&gpiosb 10 GPIO_ACTIVE_HIGH>;
> +		maximum-power-milliwatt = <3000>;
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
