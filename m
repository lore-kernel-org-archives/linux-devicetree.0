Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B02C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:29:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 144E1206DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:29:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ZBimqe3Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgGIK3N (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 06:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgGIK3N (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jul 2020 06:29:13 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8D4C061A0B
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 03:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=JLP9vuUZgJF4vfIDO5Sksc0eKG106jzUub4CiM22AOI=; b=ZBimqe3Ym8NJlNPzjomxPxDGx
        EUy2IItrkhRm5FC39h74ART0BNXIV9vepBrC6QNVkMnCA4X/5MRFRfKLeSq9BqV2Ri3mk/o9U5nHA
        Xbl5Ei0WvjGYU4lSjqS0by07HuuYziPmUbbzxjKg1SCk9DgVGRqwEATJVkBS4FCZ/ZbV3upHVXX8f
        6jJyy8NFoPpDTTu5zBb2dqHhpDTmzsG2axtN217RnmjNhcSQk6tM54888U9xXmEb4QRE3LrVOigp/
        I9DB5/wmI5jTnSLcnma0U+r4fivFNM8ZYzCUvYI+4S70QRRawhTaq25wON6ZpxbKhOv0vQ1KKHXU9
        VayCn+Wvw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37266)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jtTnY-0000ax-5A; Thu, 09 Jul 2020 11:29:00 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jtTnX-0002A7-9a; Thu, 09 Jul 2020 11:28:59 +0100
Date:   Thu, 9 Jul 2020 11:28:59 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt: update Marvell Armada 38x COMPHY binding
Message-ID: <20200709102859.GG1551@shell.armlinux.org.uk>
References: <20200630160452.GD1551@shell.armlinux.org.uk>
 <E1jqIlJ-0007rM-Oe@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1jqIlJ-0007rM-Oe@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Rob?

On Tue, Jun 30, 2020 at 05:05:33PM +0100, Russell King wrote:
> Update the Marvell Armada 38x COMPHY binding with an additional
> optional register pair describing the location of an undocumented
> system register controlling something to do with the Gigabit Ethernet
> and COMPHY.  There is one bit for each COMPHY lane that may be using
> the serdes, but exactly what this register does is completely unknown.
> 
> This register only appears to exist on Armada 38x devices, and not
> other SoCs using the NETA ethernet block, so it seems logical that it
> should be part of the COMPHY.
> 
> This is also how u-boot groups this register; it is dealt with as part
> of the COMPHY initialisation there.
> 
> However, at the end of the day, due to the undocumented nature of this
> register, we can only guess.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  .../devicetree/bindings/phy/phy-armada38x-comphy.txt   | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt b/Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt
> index ad49e5c01334..8b5a7a28a35b 100644
> --- a/Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt
> +++ b/Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt
> @@ -12,6 +12,13 @@ PCIe...).
>  - #address-cells: should be 1.
>  - #size-cells: should be 0.
>  
> +Optional properties:
> +
> +- reg-names: must be "comphy" as the first name, and "conf".
> +- reg: must contain the comphy register location and length as the first
> +    pair, followed by an optional configuration register address and
> +    length pair.
> +
>  A sub-node is required for each comphy lane provided by the comphy.
>  
>  Required properties (child nodes):
> @@ -24,7 +31,8 @@ A sub-node is required for each comphy lane provided by the comphy.
>  
>  	comphy: phy@18300 {
>  		compatible = "marvell,armada-380-comphy";
> -		reg = <0x18300 0x100>;
> +		reg-names = "comphy", "conf";
> +		reg = <0x18300 0x100>, <0x18460 4>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -- 
> 2.20.1
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
