Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29868C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 14:37:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EFD512080D
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 14:37:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbfLIOhy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 09:37:54 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:34791 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727268AbfLIOhy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 09:37:54 -0500
Received: from localhost (lfbn-1-1480-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id BFCC1200024;
        Mon,  9 Dec 2019 14:37:50 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Russell King <rmk+kernel@armlinux.org.uk>,
        Vladimir Vid <vladimir.vid@sartura.hr>
Cc:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: uDPU: fix broken ethernet
In-Reply-To: <E1iVvuq-0002sd-KR@rmk-PC.armlinux.org.uk>
References: <E1iVvuq-0002sd-KR@rmk-PC.armlinux.org.uk>
Date:   Mon, 09 Dec 2019 15:37:50 +0100
Message-ID: <87o8whh8e9.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Russell King <rmk+kernel@armlinux.org.uk> writes:

> The uDPU uses both ethernet controllers, which ties up COMPHY 0 for
> eth1 and COMPHY 1 for eth0, with no USB3 comphy.  The addition of
> COMPHY support made the kernel override the setup by the boot loader
> breaking this platform by assuming that COMPHY 0 was always used for
> USB3.  Delete the USB3 COMPHY definition at platform level, and add
> phy specifications for the ethernet channels.
>
> Fixes: bd3d25b07342 ("arm64: dts: marvell: armada-37xx: link USB hosts with their PHYs")
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applied on mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
> index bd4aab6092e0..e31813a4f972 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
> @@ -143,6 +143,7 @@
>  	phy-mode = "sgmii";
>  	status = "okay";
>  	managed = "in-band-status";
> +	phys = <&comphy1 0>;
>  	sfp = <&sfp_eth0>;
>  };
>  
> @@ -150,11 +151,14 @@
>  	phy-mode = "sgmii";
>  	status = "okay";
>  	managed = "in-band-status";
> +	phys = <&comphy0 1>;
>  	sfp = <&sfp_eth1>;
>  };
>  
>  &usb3 {
>  	status = "okay";
> +	phys = <&usb2_utmi_otg_phy>;
> +	phy-names = "usb2-utmi-otg-phy";
>  };
>  
>  &uart0 {
> -- 
> 2.20.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
