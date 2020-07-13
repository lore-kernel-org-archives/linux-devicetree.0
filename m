Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA58C433E3
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 17:21:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B576206F5
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 17:21:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="KVdbz0ot"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729764AbgGMRVx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 13:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729644AbgGMRVx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 13:21:53 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ECAFC061755
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 10:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=irLg2kwLfnd1AVN3uGYYu+WIu9zLFDYpdJ0aLsjfhQk=; b=KVdbz0ot4zsgtEMQYPeLh6dgZ
        2v3/8IOinqYoqETZnHHjDP6yltDIHrV99uiMTkOxPZcRp1z87H4L26o006gzvkcnhjmyYiC5i1yx2
        b6h7t8yz8qXZ3HLtCPiDo3fo0ECBJ2ZxGsNHWUdi5lHacIGmgAMY48PQpM5YbRzGsJGyZYFeSNk3X
        qFDne7/WvOVs2rWOV6a1oZJ9SdURUGCP0vaXQG3SYa0UenfEzZBWy03TsLuwHOU46nY13SbyU5gJh
        mqbXHr4sPvO1/4e4Ffvvoc+3y+Vy3Z3FB2cvMWaHS38O1X35XMQLtqfvp925L0Wn8qgBWVu17+Zm+
        15kXZyBcg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39048)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jv297-0004BH-Fk; Mon, 13 Jul 2020 18:21:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jv296-0006SB-Nn; Mon, 13 Jul 2020 18:21:40 +0100
Date:   Mon, 13 Jul 2020 18:21:40 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Jason Cooper <jason@lakedaemon.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] phy: armada-38x: fix NETA lockup when repeatedly
 switching speeds
Message-ID: <20200713172140.GT1551@shell.armlinux.org.uk>
References: <20200630160452.GD1551@shell.armlinux.org.uk>
 <E1jqIlO-0007rX-Tv@rmk-PC.armlinux.org.uk>
 <20200701065727.GY2599@vkoul-mobl>
 <20200710151921.GJ1551@shell.armlinux.org.uk>
 <20200713061846.GE34333@vkoul-mobl>
 <87365v5svd.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87365v5svd.fsf@FE-laptop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jul 13, 2020 at 05:36:54PM +0200, Gregory CLEMENT wrote:
> Hello,
> 
> > On 10-07-20, 16:19, Russell King - ARM Linux admin wrote:
> >> On Wed, Jul 01, 2020 at 12:27:27PM +0530, Vinod Koul wrote:
> >> > On 30-06-20, 17:05, Russell King wrote:
> >> > > The mvneta hardware appears to lock up in various random ways when
> >> > > repeatedly switching speeds between 1G and 2.5G, which involves
> >> > > reprogramming the COMPHY.  It is not entirely clear why this happens,
> >> > > but best guess is that reprogramming the COMPHY glitches mvneta clocks
> >> > > causing the hardware to fail.  It seems that rebooting resolves the
> >> > > failure, but not down/up cycling the interface alone.
> >> > > 
> >> > > Various other approaches have been tried, such as trying to cleanly
> >> > > power down the COMPHY and then take it back through the power up
> >> > > initialisation, but this does not seem to help.
> >> > > 
> >> > > It was finally noticed that u-boot's last step when configuring a
> >> > > COMPHY for "SGMII" mode was to poke at a register described as
> >> > > "GBE_CONFIGURATION_REG", which is undocumented in any external
> >> > > documentation.  All that we have is the fact that u-boot sets a bit
> >> > > corresponding to the "SGMII" lane at the end of COMPHY initialisation.
> >> > > 
> >> > > Experimentation shows that if we clear this bit prior to changing the
> >> > > speed, and then set it afterwards, mvneta does not suffer this problem
> >> > > on the SolidRun Clearfog when switching speeds between 1G and 2.5G.
> >> > > 
> >> > > This problem was found while script-testing phylink.
> >> > > 
> >> > > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> >> > > ---
> >> > >  arch/arm/boot/dts/armada-38x.dtsi          |  3 +-
> >> > 
> >> > lgtm, i need ack for dts parts before I can apply this
> >> 
> >> I'm not sure what the situation is for Bootlin, but they don't seem to
> >> be very responsive right now (covid related?)
> >> 
> >> What I know from what I've been party to on netdev is that Bootlin
> >> sent a patch for the MVPP2 driver, and the very next day someone
> >> reported that the patch caused a bug.  Unfortunately, the patch got
> >> picked up anyway, but there was no response from Bootlin.  After a
> >> month or so, -final was released containing this patch, so now it
> >> had become a regression - and still no response from Bootlin.
> >> 
> >> Eventually the bug got fixed - not because Bootlin fixed it, but
> >> because I ended up spending the time researching how that part of
> >> the network driver worked, diagnosing what was going on, and
> >> eventually fixing it in the most obvious way - but it's not clear
> >> that the fix was the right approach.  Bootlin never commented.  See
> >> 3138a07ce219 ("net: mvpp2: fix RX hashing for non-10G ports").
> >> 
> >> So, I think we have to assume that Bootlin are struggling right now,
> >> and as it's been over a week, it's unlikely that they are going to
> >> respond soon.  What do you think we should do?
> >> 
> >> I also note that Rob has not responded to the DT binding change
> >> either, despite me gently prodding, and Rob processing a whole raft
> >> of DT binding stuff yesterday.
> >> 
> >> I can split the DTS change from the rest of the patch, but I don't
> >> think that really helps without at least the binding change being
> >> agreed.
> >
> > I would prefer splitting, you may sent the DTS to arm arch folks if no
> > response from subarch folks
> 
> Yes please could you split the patch to put the dts apart ? And if the
> binding is accepted we will apply it.

I don't see any sign that Rob will ever review the DTS part, so I'm
at the point of just not caring about this anymore. I will carry it
in my tree, but I'm going to do nothing further.

That means that switching speed on mvneta on the Armada 38x is can
cause the network to die, but hey, if people can't be bothered to
review, and wish to impose rules such as "you can't change anything
with DT without my express say so" which have the effect of blocking
fixes, that's really not my problem.

So, shrug, I'm giving up with these patches.  Sorry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
