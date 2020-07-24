Return-Path: <SRS0=+aE9=BD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D261EC433EC
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 07:57:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB05F2073E
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 07:57:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgGXH5T (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jul 2020 03:57:19 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:36227 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGXH5T (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Jul 2020 03:57:19 -0400
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id CE2A21C0018;
        Fri, 24 Jul 2020 07:57:16 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Russell King <rmk+kernel@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>,
        Jason Cooper <jason@lakedaemon.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v2 2/3] ARM: dts: armada-38x: fix NETA lockup when repeatedly switching speeds
In-Reply-To: <E1jxtRe-0003Tn-8Z@rmk-PC.armlinux.org.uk>
References: <20200721143756.GT1605@shell.armlinux.org.uk> <E1jxtRe-0003Tn-8Z@rmk-PC.armlinux.org.uk>
Date:   Fri, 24 Jul 2020 09:57:16 +0200
Message-ID: <87r1t11h2b.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Russell King <rmk+kernel@armlinux.org.uk> writes:

> To support the change in "phy: armada-38x: fix NETA lockup when
> repeatedly switching speeds" we need to update the DT with the
> additional register.
>
> Fixes: 14dc100b4411 ("phy: armada38x: add common phy support")
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applied on mvebu/fixes

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/armada-38x.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
> index e038abc0c6b4..420ae26e846b 100644
> --- a/arch/arm/boot/dts/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/armada-38x.dtsi
> @@ -344,7 +344,8 @@
>  
>  			comphy: phy@18300 {
>  				compatible = "marvell,armada-380-comphy";
> -				reg = <0x18300 0x100>;
> +				reg-names = "comphy", "conf";
> +				reg = <0x18300 0x100>, <0x18460 4>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> -- 
> 2.20.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
