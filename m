Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA8CC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 20:33:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52D43207E8
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 20:33:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgFZUdc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 16:33:32 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:34586 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbgFZUdc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 26 Jun 2020 16:33:32 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1jov2J-002PkS-VC; Fri, 26 Jun 2020 22:33:23 +0200
Date:   Fri, 26 Jun 2020 22:33:23 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Daniel =?iso-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
Cc:     jason@lakedaemon.net, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: dlink-dns327l: fix reg-init PHY
Message-ID: <20200626203323.GH535869@lunn.ch>
References: <10150060.RLU44xrj3c@tool>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10150060.RLU44xrj3c@tool>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 26, 2020 at 08:39:05PM +0200, Daniel González Cabanelas wrote:
> The marvell PHY reg-init registers for the D-Link DNS-327L are wrong.
> Currently the first field is used to set the page 2, but this is
> pointless. The usage is not correct, and we are setting the wrong
> registers.
> 
> Fix it.
> 
> Signed-off-by: Daniel González Cabanelas <dgcbueu@gmail.com>
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

Interesting. That is writing to the page register, to change to page
2! So this might of worked with an earlier implementation. But not
now.

> -				<0x0 0x19 0x0 0x0077>,
> -				<0x0 0x18 0x0 0x5747>;
> +		marvell,reg-init = <0x2 0x19 0x0 0x0077>,
> +				   <0x2 0x18 0x0 0x5747>;

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
