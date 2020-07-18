Return-Path: <SRS0=fiEU=A5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C3BC433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Jul 2020 20:57:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A861622CB1
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Jul 2020 20:57:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgGRU5d convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 18 Jul 2020 16:57:33 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:38613 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbgGRU5c (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 18 Jul 2020 16:57:32 -0400
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 83BAA20004;
        Sat, 18 Jul 2020 20:57:30 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Daniel =?utf-8?Q?Gonz=C3=A1lez?= Cabanelas <dgcbueu@gmail.com>,
        jason@lakedaemon.net
Cc:     andrew@lunn.ch, sebastian.hesselbarth@gmail.com,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: dlink-dns327l: fix reg-init PHY
In-Reply-To: <10150060.RLU44xrj3c@tool>
References: <10150060.RLU44xrj3c@tool>
Date:   Sat, 18 Jul 2020 22:57:30 +0200
Message-ID: <87pn8s35j9.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Daniel González Cabanelas <dgcbueu@gmail.com> writes:

> The marvell PHY reg-init registers for the D-Link DNS-327L are wrong.
> Currently the first field is used to set the page 2, but this is
> pointless. The usage is not correct, and we are setting the wrong
> registers.
>
> Fix it.
>
> Signed-off-by: Daniel González Cabanelas <dgcbueu@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/armada-370-dlink-dns327l.dts | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/armada-370-dlink-dns327l.dts b/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
> index baa459dd5..2008c6eaa 100644
> --- a/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
> +++ b/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
> @@ -247,9 +247,8 @@ &uart1 {
>  &mdio {
>  	phy0: ethernet-phy@0 { /* Marvell 88E1318 */
>  		reg = <0>;
> -		marvell,reg-init = <0x0 0x16 0x0 0x0002>,
> -				<0x0 0x19 0x0 0x0077>,
> -				<0x0 0x18 0x0 0x5747>;
> +		marvell,reg-init = <0x2 0x19 0x0 0x0077>,
> +				   <0x2 0x18 0x0 0x5747>;
>  	};
>  };
>  
> -- 
> 2.27.0
>
>
>
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
