Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0
	tests=BUG6152_INVALID_DATE_TZ_ABSURD,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,INVALID_DATE_TZ_ABSURD,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED792C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 14:04:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C187C21D7F
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 14:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573567450;
	bh=TmY+qsSMpzlCCEtmpHgFWaXzq8/jnnhDJGUXwwXaP1g=;
	h=To:Subject:Date:From:Cc:In-Reply-To:References:List-ID:From;
	b=RQkH61KqaK1C+uZbiQn0KMu05abM9ce/5na2yCYcH7TALXRpFXQM52n75cB8COtrR
	 D8pAtl6sOdjjp25OA0Uf+KSPfIj8Ep8Q1HgOcM6Fw7LLCNptGb8YnXJuStpIG+ABJG
	 OD0nZzSH2u1Pt9Wzf0XgLn7704jz8iMfpYnzZqY8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbfKLOEK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 09:04:10 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:60331 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726912AbfKLOEK (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 Nov 2019 09:04:10 -0500
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1iUWm5-0008Hj-04; Tue, 12 Nov 2019 15:04:05 +0100
To:     Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: ls1021a-tsn: Use interrupts for the SGMII  PHYs
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 12 Nov 2019 15:13:25 +0109
From:   Marc Zyngier <maz@kernel.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>
In-Reply-To: <CA+h21hpE-Nu_Sh1fRizUoEs082ev=9nzuumSXDrk-QTXdnEbzg@mail.gmail.com>
References: <20191112132010.18274-1-linux@rasmusvillemoes.dk>
 <20191112132010.18274-3-linux@rasmusvillemoes.dk>
 <CA+h21hqw16o0TqOV1WWYYcOs3YWJe=xq_K0=miU+BFTA31OTmQ@mail.gmail.com>
 <6d4292fcb0cf290837306388bdfe9b0f@www.loen.fr>
 <CA+h21hpE-Nu_Sh1fRizUoEs082ev=9nzuumSXDrk-QTXdnEbzg@mail.gmail.com>
Message-ID: <aee81d64979bb72b63a8889fb7193c3f@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: olteanv@gmail.com, linux@rasmusvillemoes.dk, shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, andrew@lunn.ch
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2019-11-12 15:03, Vladimir Oltean wrote:
> On Tue, 12 Nov 2019 at 15:49, Marc Zyngier <maz@kernel.org> wrote:
>>
>> On 2019-11-12 14:53, Vladimir Oltean wrote:
>> > On Tue, 12 Nov 2019 at 15:20, Rasmus Villemoes
>> > <linux@rasmusvillemoes.dk> wrote:
>> >>
>> >> From: Vladimir Oltean <olteanv@gmail.com>
>> >>
>> >> On the LS1021A-TSN board, the 2 Atheros AR8031 PHYs for eth0 and
>> >> eth1
>> >> have interrupt lines connected to the shared IRQ2_B LS1021A pin.
>> >>
>> >> Switching to interrupts offloads the PHY library from the task of
>> >> polling the MDIO status and AN registers (1, 4, 5) every second.
>> >>
>> >> Unfortunately, the BCM5464R quad PHY connected to the switch does
>> >> not
>> >> appear to have an interrupt line routed to the SoC.
>> >>
>> >> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
>> >> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
>> >> ---
>> >>  arch/arm/boot/dts/ls1021a-tsn.dts | 4 ++++
>> >>  1 file changed, 4 insertions(+)
>> >>
>> >> diff --git a/arch/arm/boot/dts/ls1021a-tsn.dts
>> >> b/arch/arm/boot/dts/ls1021a-tsn.dts
>> >> index 5b7689094b70..135d36461af4 100644
>> >> --- a/arch/arm/boot/dts/ls1021a-tsn.dts
>> >> +++ b/arch/arm/boot/dts/ls1021a-tsn.dts
>> >> @@ -203,11 +203,15 @@
>> >>         /* AR8031 */
>> >>         sgmii_phy1: ethernet-phy@1 {
>> >>                 reg = <0x1>;
>> >> +               /* SGMII1_PHY_INT_B: connected to IRQ2, active 
>> low
>> >> */
>> >> +               interrupts-extended = <&extirq 2
>> >> IRQ_TYPE_EDGE_FALLING>;
>> >>         };
>> >>
>> >>         /* AR8031 */
>> >>         sgmii_phy2: ethernet-phy@2 {
>> >>                 reg = <0x2>;
>> >> +               /* SGMII2_PHY_INT_B: connected to IRQ2, active 
>> low
>> >> */
>> >> +               interrupts-extended = <&extirq 2
>> >> IRQ_TYPE_EDGE_FALLING>;
>> >>         };
>> >>
>> >>         /* BCM5464 quad PHY */
>> >> --
>> >> 2.23.0
>> >>
>> >
>> > +netdev and Andrew for this patch, since the interrupt polarity
>> > caught
>> > his attention in v1.
>>
>> Certainly, the comments and the interrupt specifier do not match.
>> Which one is true?
>>
>>          M.
>> --
>> Jazz is not dead. It just smells funny...
>
> The interrupt specifier certainly works. So that points to an issue
> with the description. What do you mean, exactly? Does "active low"
> mean "level-triggered"? How would you have described this?

Active Low definitely implies level triggered. And if that's how it
is described in the TRM, than the interrupt specifier is wrong, and
just *seem to work* because the level goes back to high between two
interrupts.

Also, shared *edge* interrupts do not work, full stop. So I'm pretty
convinced that what you have here is just wrong.

         M.
-- 
Jazz is not dead. It just smells funny...
