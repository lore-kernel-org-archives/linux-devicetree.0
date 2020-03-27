Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D09C43331
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 13:50:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8374206F6
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 13:50:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="whqKtXpk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgC0Nuy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 09:50:54 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:34598 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgC0Nuy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Mar 2020 09:50:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ZmrosSOSmZxAWvgu57rbrPTBCBczlHI5pipwE1/4i5U=; b=whqKtXpkvWx0vaG3RjWgT3a4t
        h/WkrtH3PNnYtv6+wewbkDneaO+/jogZfgBBcLusiv4bio5P77BmsL7dFhweB4jpAeqe/hnGpYv+f
        OA6+y31O2Vs23//cktCvrF0Wvg3z6Vbcw0w/H86QnC0gDOf2CVxc58r/pFJZaqltyVAtVqGAbL6O/
        vDnFoYAwYQxyiP6XCV/FQQKA07QiEnbyGWtsaYmseZqq/Xznu5qTycL4Cax0ixvd/X+rd9VlaN5G5
        vdDj0DbTkpc7CPM/WP74rD5ttR08A8T8ZB28wjvXvUp3ocSAwXZ+4X0Cb7frLO4XxgxBGQKz12zSy
        Wk3pHi7FA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42074)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jHpNo-0001Ou-5t; Fri, 27 Mar 2020 13:50:48 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jHpNm-0004HG-RF; Fri, 27 Mar 2020 13:50:46 +0000
Date:   Fri, 27 Mar 2020 13:50:46 +0000
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
Message-ID: <20200327135046.GN25745@shell.armlinux.org.uk>
References: <E1jHoHy-0002Ep-IY@rmk-PC.armlinux.org.uk>
 <20200327134319.GD11004@lunn.ch>
 <20200327134651.GM25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327134651.GM25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 27, 2020 at 01:46:52PM +0000, Russell King - ARM Linux admin wrote:
> On Fri, Mar 27, 2020 at 02:43:19PM +0100, Andrew Lunn wrote:
> > On Fri, Mar 27, 2020 at 12:40:42PM +0000, Russell King wrote:
> > > Update the SolidRun Armada 8040 platforms phy interface types from the
> > > old 10gbase-kr to the newer and more correct 10gbase-r.
> > > 
> > > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > 
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > 
> > Can we add a fixes: tag to this? So it gets backported to the point
> > 10gbase-r was added.
> 
> I think "carefully" is the answer.  It's not just the point where
> 10gbase-r was added because there's a whole bunch of other patches
> that are also required to the various ethernet and PHY drivers, SFP
> and phylink.  It's probably going to take a bit to work that out,
> get it wrong and stuff will break.

... and actually there is no point.  It is _way_ too soon to even
start thinking of using 10GKR for its true purpose - the patches
to add 10GBASER were only merged for v5.6-rc1, so we're still waiting
for a kernel with that update to be released.  In other words, there's
no stable kernels to backport it to yet.

Do we want it to go into -rc?  If so, it also needs to be thoroughly
tested.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
