Return-Path: <SRS0=byNV=46=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0CDC10DCE
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 20:13:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DC052074A
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 20:13:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbgCMUNk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Mar 2020 16:13:40 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:42831 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgCMUNk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Mar 2020 16:13:40 -0400
X-Originating-IP: 87.231.134.186
Received: from localhost (87-231-134-186.rev.numericable.fr [87.231.134.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 5E8881BF206;
        Fri, 13 Mar 2020 20:13:35 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Baruch Siach <baruch@tkos.co.il>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: clearfog-gt-8k: set gigabit PHY reset deassert delay
In-Reply-To: <E1j6YeG-00026g-08@rmk-PC.armlinux.org.uk>
References: <E1j6YeG-00026g-08@rmk-PC.armlinux.org.uk>
Date:   Fri, 13 Mar 2020 21:13:34 +0100
Message-ID: <87eetwypw1.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Russell,

> If the mv88e6xxx DSA driver is built as a module, it causes the
> ethernet driver to re-probe when it's loaded. This in turn causes
> the gigabit PHY to be momentarily reset and reprogrammed. However,
> we attempt to reprogram the PHY immediately after deasserting reset,
> and the PHY ignores the writes.
>
> This results in the PHY operating in the wrong mode, and the copper
> link states down.
>
> Set a reset deassert delay of 10ms for the gigabit PHY to avoid this.
>
> Fixes: babc5544c293 ("arm64: dts: clearfog-gt-8k: 1G eth PHY reset signal")
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>


Applied on mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> index bd881497b872..dc531d136273 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> @@ -367,6 +367,7 @@
>  		pinctrl-0 = <&cp0_copper_eth_phy_reset>;
>  		reset-gpios = <&cp0_gpio2 11 GPIO_ACTIVE_LOW>;
>  		reset-assert-us = <10000>;
> +		reset-deassert-us = <10000>;
>  	};
>  
>  	switch0: switch0@4 {
> -- 
> 2.20.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
