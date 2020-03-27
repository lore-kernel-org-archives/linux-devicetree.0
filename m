Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7AFC43331
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 17:16:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B770C20714
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 17:16:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbgC0RQY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 13:16:24 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:52839 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727548AbgC0RQY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Mar 2020 13:16:24 -0400
Received: from localhost (87-231-134-186.rev.numericable.fr [87.231.134.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id C9E01240002;
        Fri, 27 Mar 2020 17:16:19 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Jason Cooper <jason@lakedaemon.net>,
        "Madalin Bucur \(OSS\)" <madalin.bucur@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH] arm64: dts: update SolidRun Armada 8040 phy interface types
In-Reply-To: <20200327151709.GO25745@shell.armlinux.org.uk>
References: <E1jHoHy-0002Ep-IY@rmk-PC.armlinux.org.uk> <20200327134319.GD11004@lunn.ch> <20200327134651.GM25745@shell.armlinux.org.uk> <20200327135046.GN25745@shell.armlinux.org.uk> <20200327141538.GE11004@lunn.ch> <20200327151709.GO25745@shell.armlinux.org.uk>
Date:   Fri, 27 Mar 2020 18:16:19 +0100
Message-ID: <87imip4t24.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

> On Fri, Mar 27, 2020 at 03:15:38PM +0100, Andrew Lunn wrote:
>> > ... and actually there is no point.
>> 
>> O.K. lets merge these as normal, not as fixes.  It is probably too
>> late for ARM SoC, so i guess they will get merged next cycle.
>
> Yep, which means that the backplane patches from NXP will have to be
> delayed about 20 weeks (about 10 weeks in the arm64 tree before being
> merged into 5.8-rc1, and then another 10 weeks before 5.8 is released.)
> That's probably not a bad thing, as it'll let us hash out the conflicts
> between my PCS patch set and their backplane patches.

None of my pull request has been merged yet, so I can make an other one
ontop of the existing ones with this patch, and I will let decide the
ARM SoC maintainer if they can take it or not.

Gregory

>
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
