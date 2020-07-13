Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FA7C433EC
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 06:18:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 314D72075F
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 06:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594621132;
	bh=hXHCtXD4RJbWVedvu6u9jHc3/dLrfcFLZ/u3QlppIXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=aFt3hLA+MQBk/e3KtmoWkOP4YoVt1hQ78NiWidS1guo9y3u1HzGMp4T9YQ53kASCB
	 LxDWosGH9spNt/THRmpj0mzjbwSGT1kUHykB4pOEfMr518wNyuxE5hRe+t8dYkpchF
	 qcRiJFhaJ/uOlsMXoRNEPQZd1z09jU+MoWf9eVK4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgGMGSv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 02:18:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:48680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729211AbgGMGSv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 Jul 2020 02:18:51 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BFA412065F;
        Mon, 13 Jul 2020 06:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594621130;
        bh=hXHCtXD4RJbWVedvu6u9jHc3/dLrfcFLZ/u3QlppIXs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D4+1yQRpJHH7xk0Cxq1yFppBnw2P2siD6Fzor2gxKeAFxi53s93i5mZcjFqw03GK3
         XI701noqf23ekCWpTOHfNvzG8mnJs4jcwYhibApH1a/ihUdzjkoLKqEQ5QoD/XZoWL
         m33wml+mnE9hAMxIm2IMTy3LpfxOxOdzFliyFl10=
Date:   Mon, 13 Jul 2020 11:48:46 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] phy: armada-38x: fix NETA lockup when repeatedly
 switching speeds
Message-ID: <20200713061846.GE34333@vkoul-mobl>
References: <20200630160452.GD1551@shell.armlinux.org.uk>
 <E1jqIlO-0007rX-Tv@rmk-PC.armlinux.org.uk>
 <20200701065727.GY2599@vkoul-mobl>
 <20200710151921.GJ1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200710151921.GJ1551@shell.armlinux.org.uk>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 10-07-20, 16:19, Russell King - ARM Linux admin wrote:
> On Wed, Jul 01, 2020 at 12:27:27PM +0530, Vinod Koul wrote:
> > On 30-06-20, 17:05, Russell King wrote:
> > > The mvneta hardware appears to lock up in various random ways when
> > > repeatedly switching speeds between 1G and 2.5G, which involves
> > > reprogramming the COMPHY.  It is not entirely clear why this happens,
> > > but best guess is that reprogramming the COMPHY glitches mvneta clocks
> > > causing the hardware to fail.  It seems that rebooting resolves the
> > > failure, but not down/up cycling the interface alone.
> > > 
> > > Various other approaches have been tried, such as trying to cleanly
> > > power down the COMPHY and then take it back through the power up
> > > initialisation, but this does not seem to help.
> > > 
> > > It was finally noticed that u-boot's last step when configuring a
> > > COMPHY for "SGMII" mode was to poke at a register described as
> > > "GBE_CONFIGURATION_REG", which is undocumented in any external
> > > documentation.  All that we have is the fact that u-boot sets a bit
> > > corresponding to the "SGMII" lane at the end of COMPHY initialisation.
> > > 
> > > Experimentation shows that if we clear this bit prior to changing the
> > > speed, and then set it afterwards, mvneta does not suffer this problem
> > > on the SolidRun Clearfog when switching speeds between 1G and 2.5G.
> > > 
> > > This problem was found while script-testing phylink.
> > > 
> > > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > > ---
> > >  arch/arm/boot/dts/armada-38x.dtsi          |  3 +-
> > 
> > lgtm, i need ack for dts parts before I can apply this
> 
> I'm not sure what the situation is for Bootlin, but they don't seem to
> be very responsive right now (covid related?)
> 
> What I know from what I've been party to on netdev is that Bootlin
> sent a patch for the MVPP2 driver, and the very next day someone
> reported that the patch caused a bug.  Unfortunately, the patch got
> picked up anyway, but there was no response from Bootlin.  After a
> month or so, -final was released containing this patch, so now it
> had become a regression - and still no response from Bootlin.
> 
> Eventually the bug got fixed - not because Bootlin fixed it, but
> because I ended up spending the time researching how that part of
> the network driver worked, diagnosing what was going on, and
> eventually fixing it in the most obvious way - but it's not clear
> that the fix was the right approach.  Bootlin never commented.  See
> 3138a07ce219 ("net: mvpp2: fix RX hashing for non-10G ports").
> 
> So, I think we have to assume that Bootlin are struggling right now,
> and as it's been over a week, it's unlikely that they are going to
> respond soon.  What do you think we should do?
> 
> I also note that Rob has not responded to the DT binding change
> either, despite me gently prodding, and Rob processing a whole raft
> of DT binding stuff yesterday.
> 
> I can split the DTS change from the rest of the patch, but I don't
> think that really helps without at least the binding change being
> agreed.

I would prefer splitting, you may sent the DTS to arm arch folks if no
response from subarch folks

-- 
~Vinod
