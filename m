Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82235C433E7
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 15:37:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EC4C20773
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 15:37:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729811AbgGMPhC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 11:37:02 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:35673 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729806AbgGMPg6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 11:36:58 -0400
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 7B534C0002;
        Mon, 13 Jul 2020 15:36:54 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] phy: armada-38x: fix NETA lockup when repeatedly switching speeds
In-Reply-To: <20200713061846.GE34333@vkoul-mobl>
References: <20200630160452.GD1551@shell.armlinux.org.uk> <E1jqIlO-0007rX-Tv@rmk-PC.armlinux.org.uk> <20200701065727.GY2599@vkoul-mobl> <20200710151921.GJ1551@shell.armlinux.org.uk> <20200713061846.GE34333@vkoul-mobl>
Date:   Mon, 13 Jul 2020 17:36:54 +0200
Message-ID: <87365v5svd.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

> On 10-07-20, 16:19, Russell King - ARM Linux admin wrote:
>> On Wed, Jul 01, 2020 at 12:27:27PM +0530, Vinod Koul wrote:
>> > On 30-06-20, 17:05, Russell King wrote:
>> > > The mvneta hardware appears to lock up in various random ways when
>> > > repeatedly switching speeds between 1G and 2.5G, which involves
>> > > reprogramming the COMPHY.  It is not entirely clear why this happens,
>> > > but best guess is that reprogramming the COMPHY glitches mvneta clocks
>> > > causing the hardware to fail.  It seems that rebooting resolves the
>> > > failure, but not down/up cycling the interface alone.
>> > > 
>> > > Various other approaches have been tried, such as trying to cleanly
>> > > power down the COMPHY and then take it back through the power up
>> > > initialisation, but this does not seem to help.
>> > > 
>> > > It was finally noticed that u-boot's last step when configuring a
>> > > COMPHY for "SGMII" mode was to poke at a register described as
>> > > "GBE_CONFIGURATION_REG", which is undocumented in any external
>> > > documentation.  All that we have is the fact that u-boot sets a bit
>> > > corresponding to the "SGMII" lane at the end of COMPHY initialisation.
>> > > 
>> > > Experimentation shows that if we clear this bit prior to changing the
>> > > speed, and then set it afterwards, mvneta does not suffer this problem
>> > > on the SolidRun Clearfog when switching speeds between 1G and 2.5G.
>> > > 
>> > > This problem was found while script-testing phylink.
>> > > 
>> > > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
>> > > ---
>> > >  arch/arm/boot/dts/armada-38x.dtsi          |  3 +-
>> > 
>> > lgtm, i need ack for dts parts before I can apply this
>> 
>> I'm not sure what the situation is for Bootlin, but they don't seem to
>> be very responsive right now (covid related?)
>> 
>> What I know from what I've been party to on netdev is that Bootlin
>> sent a patch for the MVPP2 driver, and the very next day someone
>> reported that the patch caused a bug.  Unfortunately, the patch got
>> picked up anyway, but there was no response from Bootlin.  After a
>> month or so, -final was released containing this patch, so now it
>> had become a regression - and still no response from Bootlin.
>> 
>> Eventually the bug got fixed - not because Bootlin fixed it, but
>> because I ended up spending the time researching how that part of
>> the network driver worked, diagnosing what was going on, and
>> eventually fixing it in the most obvious way - but it's not clear
>> that the fix was the right approach.  Bootlin never commented.  See
>> 3138a07ce219 ("net: mvpp2: fix RX hashing for non-10G ports").
>> 
>> So, I think we have to assume that Bootlin are struggling right now,
>> and as it's been over a week, it's unlikely that they are going to
>> respond soon.  What do you think we should do?
>> 
>> I also note that Rob has not responded to the DT binding change
>> either, despite me gently prodding, and Rob processing a whole raft
>> of DT binding stuff yesterday.
>> 
>> I can split the DTS change from the rest of the patch, but I don't
>> think that really helps without at least the binding change being
>> agreed.
>
> I would prefer splitting, you may sent the DTS to arm arch folks if no
> response from subarch folks

Yes please could you split the patch to put the dts apart ? And if the
binding is accepted we will apply it.

Thanks,

Gregory


>
> -- 
> ~Vinod

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
