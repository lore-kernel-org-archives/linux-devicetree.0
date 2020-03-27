Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9F8C2D0EC
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 15:17:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 75FE020774
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 15:17:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="VQGz0166"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgC0PRT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 11:17:19 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:35668 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgC0PRS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Mar 2020 11:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=i49b05giKAvuJdsFix/RQTI/KizwQbObzGwBctGXmQk=; b=VQGz0166n3sa4P4ziV7OV9IA/
        SuBxjVAQP79YeJkm6/8nwjnOBLBfRbUCMxBfkssnWPUIN32B3Ea7Y61Wa2NnY54O+gXIlvh7HkqaT
        8WP9O1dQcrj3L6ctDxQbLr/+gM64zTpxrSFMFBMBLYqnKvcSxWYzbDIYHwWyLPIcrx7kB13y0RdtN
        eEmnQU7bdTwW127Tysj6BJH7GgvWlOb9l0yjp6BlgRDXj1j9IHjip+unGAGhW8ER5k1dO571SL0uo
        Py1ecgiyVI26z7ZiwsavuroSBzm55LNQPm0GZT+CBdFSFcQJXBo5JmubEBldoP0qr0yhytAWr1TNk
        sIne2wZKA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42100)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jHqjR-0001nO-2g; Fri, 27 Mar 2020 15:17:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jHqjO-0004KV-0x; Fri, 27 Mar 2020 15:17:10 +0000
Date:   Fri, 27 Mar 2020 15:17:09 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Jason Cooper <jason@lakedaemon.net>,
        "Madalin Bucur (OSS)" <madalin.bucur@oss.nxp.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH] arm64: dts: update SolidRun Armada 8040 phy interface
 types
Message-ID: <20200327151709.GO25745@shell.armlinux.org.uk>
References: <E1jHoHy-0002Ep-IY@rmk-PC.armlinux.org.uk>
 <20200327134319.GD11004@lunn.ch>
 <20200327134651.GM25745@shell.armlinux.org.uk>
 <20200327135046.GN25745@shell.armlinux.org.uk>
 <20200327141538.GE11004@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327141538.GE11004@lunn.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 27, 2020 at 03:15:38PM +0100, Andrew Lunn wrote:
> > ... and actually there is no point.
> 
> O.K. lets merge these as normal, not as fixes.  It is probably too
> late for ARM SoC, so i guess they will get merged next cycle.

Yep, which means that the backplane patches from NXP will have to be
delayed about 20 weeks (about 10 weeks in the arm64 tree before being
merged into 5.8-rc1, and then another 10 weeks before 5.8 is released.)
That's probably not a bad thing, as it'll let us hash out the conflicts
between my PCS patch set and their backplane patches.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
