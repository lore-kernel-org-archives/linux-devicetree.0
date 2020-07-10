Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2D8C433F2
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 15:20:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A28782065D
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 15:20:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="htsOdPA0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgGJPUQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 11:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbgGJPTj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 11:19:39 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 238CBC08C5DC
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=m2mF24K7LscLtR40pVBv3aocC9vyfFMSah5juMJyYWs=; b=htsOdPA0UdU7nVoHiDj140Rea
        fAkzwaBhqOGbRH0Y5FGSAXOQMxXmJZfMZfpd3AUB8JGD+2YQx4xksgLzNFXsfmKEk6LPLLaMZ/Ein
        lh9a7XqJS7JHNLGsUMo6F4A9Wx9tUnHXtlDEjxFmASgAPKckIxPfCZVJO2yfMGvr0ZbX7MjEFs/2I
        Q6IgSCbyr74LWiHxBvUNAZzkF1tsoWFeTPbhfwKr9A/PfJ6LZ4jLgHiq7J1S1gjCOpTFPlpwYIQrO
        jWHxGZkWSpFnOE7HANRuc4I5745nM7EMbumquD/z47DGNJlnONuFO8Bk+62wZm6N/f4PtCU6TEOC4
        n5uxcc+Mg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37766)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jtuo6-0001px-Qr; Fri, 10 Jul 2020 16:19:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jtuo5-0003Ll-OY; Fri, 10 Jul 2020 16:19:21 +0100
Date:   Fri, 10 Jul 2020 16:19:21 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] phy: armada-38x: fix NETA lockup when repeatedly
 switching speeds
Message-ID: <20200710151921.GJ1551@shell.armlinux.org.uk>
References: <20200630160452.GD1551@shell.armlinux.org.uk>
 <E1jqIlO-0007rX-Tv@rmk-PC.armlinux.org.uk>
 <20200701065727.GY2599@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701065727.GY2599@vkoul-mobl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jul 01, 2020 at 12:27:27PM +0530, Vinod Koul wrote:
> On 30-06-20, 17:05, Russell King wrote:
> > The mvneta hardware appears to lock up in various random ways when
> > repeatedly switching speeds between 1G and 2.5G, which involves
> > reprogramming the COMPHY.  It is not entirely clear why this happens,
> > but best guess is that reprogramming the COMPHY glitches mvneta clocks
> > causing the hardware to fail.  It seems that rebooting resolves the
> > failure, but not down/up cycling the interface alone.
> > 
> > Various other approaches have been tried, such as trying to cleanly
> > power down the COMPHY and then take it back through the power up
> > initialisation, but this does not seem to help.
> > 
> > It was finally noticed that u-boot's last step when configuring a
> > COMPHY for "SGMII" mode was to poke at a register described as
> > "GBE_CONFIGURATION_REG", which is undocumented in any external
> > documentation.  All that we have is the fact that u-boot sets a bit
> > corresponding to the "SGMII" lane at the end of COMPHY initialisation.
> > 
> > Experimentation shows that if we clear this bit prior to changing the
> > speed, and then set it afterwards, mvneta does not suffer this problem
> > on the SolidRun Clearfog when switching speeds between 1G and 2.5G.
> > 
> > This problem was found while script-testing phylink.
> > 
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > ---
> >  arch/arm/boot/dts/armada-38x.dtsi          |  3 +-
> 
> lgtm, i need ack for dts parts before I can apply this

I'm not sure what the situation is for Bootlin, but they don't seem to
be very responsive right now (covid related?)

What I know from what I've been party to on netdev is that Bootlin
sent a patch for the MVPP2 driver, and the very next day someone
reported that the patch caused a bug.  Unfortunately, the patch got
picked up anyway, but there was no response from Bootlin.  After a
month or so, -final was released containing this patch, so now it
had become a regression - and still no response from Bootlin.

Eventually the bug got fixed - not because Bootlin fixed it, but
because I ended up spending the time researching how that part of
the network driver worked, diagnosing what was going on, and
eventually fixing it in the most obvious way - but it's not clear
that the fix was the right approach.  Bootlin never commented.  See
3138a07ce219 ("net: mvpp2: fix RX hashing for non-10G ports").

So, I think we have to assume that Bootlin are struggling right now,
and as it's been over a week, it's unlikely that they are going to
respond soon.  What do you think we should do?

I also note that Rob has not responded to the DT binding change
either, despite me gently prodding, and Rob processing a whole raft
of DT binding stuff yesterday.

I can split the DTS change from the rest of the patch, but I don't
think that really helps without at least the binding change being
agreed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
