Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86677C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 05:46:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BFAA20760
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 05:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594878388;
	bh=BmH10cHhH27muVWxBAjM/i7/M0wR1VcvJZxuw0jFn18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Rus7EUlfWn2Qfp40AG75N0VpCY9txUVCPAJwYAsCH0saByfUZkTmTjDuT1yKffFiX
	 KilO/0n49QDECg4E4YzKLD91p+Hhamhn8hu+dmI25B824HNtMwYUaUtBWTq0bwp8Ln
	 MzX9W5piWCwfl6cL1vMs3nWiD9xrfhJSDuurr6xA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgGPFq2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 01:46:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:39224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726696AbgGPFq1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jul 2020 01:46:27 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D77C320720;
        Thu, 16 Jul 2020 05:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594878386;
        bh=BmH10cHhH27muVWxBAjM/i7/M0wR1VcvJZxuw0jFn18=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zycc29BNsdTPucbeDp4pg2RnV9yK8wPrIsqi09c0bOwnIcrso8M05Zh2zy1vfIzgj
         ZRFBlVS1d4nYI6y3O3/5u12Ymr4snshoDpCYCLBc3LvWqFjYN4keFfHA1MYHS489Yz
         XWkvEvifJxWRODCFlsXJeq5WjozoY+0D+ydxjEk4=
Date:   Thu, 16 Jul 2020 11:16:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Jason Cooper <jason@lakedaemon.net>,
        devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 2/2] phy: armada-38x: fix NETA lockup when repeatedly
 switching speeds
Message-ID: <20200716054622.GD55478@vkoul-mobl>
References: <20200630160452.GD1551@shell.armlinux.org.uk>
 <E1jqIlO-0007rX-Tv@rmk-PC.armlinux.org.uk>
 <20200701065727.GY2599@vkoul-mobl>
 <20200710151921.GJ1551@shell.armlinux.org.uk>
 <20200713061846.GE34333@vkoul-mobl>
 <87365v5svd.fsf@FE-laptop>
 <20200713172140.GT1551@shell.armlinux.org.uk>
 <20200713180737.GU1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713180737.GU1551@shell.armlinux.org.uk>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 13-07-20, 19:07, Russell King - ARM Linux admin wrote:
> On Mon, Jul 13, 2020 at 06:21:40PM +0100, Russell King - ARM Linux admin wrote:
> > On Mon, Jul 13, 2020 at 05:36:54PM +0200, Gregory CLEMENT wrote:
> > > Hello,
> > > 
> > > > On 10-07-20, 16:19, Russell King - ARM Linux admin wrote:
> > > >> On Wed, Jul 01, 2020 at 12:27:27PM +0530, Vinod Koul wrote:
> > > >> > On 30-06-20, 17:05, Russell King wrote:
> > > >> > > The mvneta hardware appears to lock up in various random ways when
> > > >> > > repeatedly switching speeds between 1G and 2.5G, which involves
> > > >> > > reprogramming the COMPHY.  It is not entirely clear why this happens,
> > > >> > > but best guess is that reprogramming the COMPHY glitches mvneta clocks
> > > >> > > causing the hardware to fail.  It seems that rebooting resolves the
> > > >> > > failure, but not down/up cycling the interface alone.
> > > >> > > 
> > > >> > > Various other approaches have been tried, such as trying to cleanly
> > > >> > > power down the COMPHY and then take it back through the power up
> > > >> > > initialisation, but this does not seem to help.
> > > >> > > 
> > > >> > > It was finally noticed that u-boot's last step when configuring a
> > > >> > > COMPHY for "SGMII" mode was to poke at a register described as
> > > >> > > "GBE_CONFIGURATION_REG", which is undocumented in any external
> > > >> > > documentation.  All that we have is the fact that u-boot sets a bit
> > > >> > > corresponding to the "SGMII" lane at the end of COMPHY initialisation.
> > > >> > > 
> > > >> > > Experimentation shows that if we clear this bit prior to changing the
> > > >> > > speed, and then set it afterwards, mvneta does not suffer this problem
> > > >> > > on the SolidRun Clearfog when switching speeds between 1G and 2.5G.
> > > >> > > 
> > > >> > > This problem was found while script-testing phylink.
> > > >> > > 
> > > >> > > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > > >> > > ---
> > > >> > >  arch/arm/boot/dts/armada-38x.dtsi          |  3 +-
> > > >> > 
> > > >> > lgtm, i need ack for dts parts before I can apply this
> > > >> 
> > > >> I'm not sure what the situation is for Bootlin, but they don't seem to
> > > >> be very responsive right now (covid related?)
> > > >> 
> > > >> What I know from what I've been party to on netdev is that Bootlin
> > > >> sent a patch for the MVPP2 driver, and the very next day someone
> > > >> reported that the patch caused a bug.  Unfortunately, the patch got
> > > >> picked up anyway, but there was no response from Bootlin.  After a
> > > >> month or so, -final was released containing this patch, so now it
> > > >> had become a regression - and still no response from Bootlin.
> > > >> 
> > > >> Eventually the bug got fixed - not because Bootlin fixed it, but
> > > >> because I ended up spending the time researching how that part of
> > > >> the network driver worked, diagnosing what was going on, and
> > > >> eventually fixing it in the most obvious way - but it's not clear
> > > >> that the fix was the right approach.  Bootlin never commented.  See
> > > >> 3138a07ce219 ("net: mvpp2: fix RX hashing for non-10G ports").
> > > >> 
> > > >> So, I think we have to assume that Bootlin are struggling right now,
> > > >> and as it's been over a week, it's unlikely that they are going to
> > > >> respond soon.  What do you think we should do?
> > > >> 
> > > >> I also note that Rob has not responded to the DT binding change
> > > >> either, despite me gently prodding, and Rob processing a whole raft
> > > >> of DT binding stuff yesterday.
> > > >> 
> > > >> I can split the DTS change from the rest of the patch, but I don't
> > > >> think that really helps without at least the binding change being
> > > >> agreed.
> > > >
> > > > I would prefer splitting, you may sent the DTS to arm arch folks if no
> > > > response from subarch folks
> > > 
> > > Yes please could you split the patch to put the dts apart ? And if the
> > > binding is accepted we will apply it.
> > 
> > I don't see any sign that Rob will ever review the DTS part, so I'm
> > at the point of just not caring about this anymore. I will carry it
> > in my tree, but I'm going to do nothing further.
> > 
> > That means that switching speed on mvneta on the Armada 38x is can
> > cause the network to die, but hey, if people can't be bothered to
> > review, and wish to impose rules such as "you can't change anything
> > with DT without my express say so" which have the effect of blocking
> > fixes, that's really not my problem.
> > 
> > So, shrug, I'm giving up with these patches.  Sorry.
> 
> To be clear, this is not aimed at either Vinod or Gregory.

Rob has acked, so if you can respin and split, I can apply

-- 
~Vinod
