Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA3BC35E04
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 15:53:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 090F92072D
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 15:53:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730736AbgBYPxK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 10:53:10 -0500
Received: from guitar.tcltek.co.il ([192.115.133.116]:48852 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730309AbgBYPxK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 25 Feb 2020 10:53:10 -0500
X-Greylist: delayed 586 seconds by postgrey-1.27 at vger.kernel.org; Tue, 25 Feb 2020 10:53:10 EST
Received: from sapphire.tkos.co.il (unknown [192.168.100.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id E92B9440869;
        Tue, 25 Feb 2020 17:43:21 +0200 (IST)
Date:   Tue, 25 Feb 2020 17:43:20 +0200
From:   Baruch Siach <baruch@tkos.co.il>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: clearfog-gt-8k: set gigabit PHY reset
 deassert delay
Message-ID: <20200225154320.rvmidavleu7ar4km@sapphire.tkos.co.il>
References: <E1j6YeG-00026g-08@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1j6YeG-00026g-08@rmk-PC.armlinux.org.uk>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Russell,

On Tue, Feb 25, 2020 at 11:45:12AM +0000, Russell King wrote:
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

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

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

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
