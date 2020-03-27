Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A646C43331
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 13:47:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1290C208E4
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 13:47:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="PM/scxa6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbgC0NrK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 09:47:10 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:34550 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgC0NrK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Mar 2020 09:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=8bdaiEleZDnY2jvecPdTFVipYBcD9bf+hHnaxTR7WMM=; b=PM/scxa6DXSEByzJZ+fpLmeVR
        ZvZgYZe8WqO/jtQvnhmw7qBwSnXn/ysicANeJezykGVcl66PhyaewFUXFhh9T8vUnb+ltpj546wpP
        GiqMTU0qUpCFO63UDCRGvWR0CyB9hqswrMHmSm1yeuaSa7ajEN0Yh9rF31w6eBfnE3a+i7AmDEiND
        j5lbSBxQXfQrG1ph8Wk0TQEE8afQ1UvNVz4JaYPo+2eB2Xmrlf2k/0Cj6H56PVmP1S1L4G3CU8E7D
        Pa3gEGoSOItwC3GzJin9VyfjRo0dAHN/aUbFVz3M0wo49ezBQSL6tMj88xTqEqcirl4NtjheVTlD7
        6e5NYiV+g==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:37932)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jHpK2-0001Nk-GI; Fri, 27 Mar 2020 13:46:54 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jHpK0-0004H6-3H; Fri, 27 Mar 2020 13:46:52 +0000
Date:   Fri, 27 Mar 2020 13:46:52 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Gregory Clement <gregory.clement@bootlin.com>,
        "Madalin Bucur (OSS)" <madalin.bucur@oss.nxp.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: update SolidRun Armada 8040 phy interface
 types
Message-ID: <20200327134651.GM25745@shell.armlinux.org.uk>
References: <E1jHoHy-0002Ep-IY@rmk-PC.armlinux.org.uk>
 <20200327134319.GD11004@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327134319.GD11004@lunn.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 27, 2020 at 02:43:19PM +0100, Andrew Lunn wrote:
> On Fri, Mar 27, 2020 at 12:40:42PM +0000, Russell King wrote:
> > Update the SolidRun Armada 8040 platforms phy interface types from the
> > old 10gbase-kr to the newer and more correct 10gbase-r.
> > 
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
> Can we add a fixes: tag to this? So it gets backported to the point
> 10gbase-r was added.

I think "carefully" is the answer.  It's not just the point where
10gbase-r was added because there's a whole bunch of other patches
that are also required to the various ethernet and PHY drivers, SFP
and phylink.  It's probably going to take a bit to work that out,
get it wrong and stuff will break.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
