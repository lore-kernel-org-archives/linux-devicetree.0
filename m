Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DB0C43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 12:34:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EFE4D206CB
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 12:34:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="dljlnK4F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727542AbfLPMev (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 07:34:51 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:38826 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727512AbfLPMev (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 07:34:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=mXT8PBeEReMSOgHvnBy5MAfeGjDb/CwmY3oTPLFEi0w=; b=dljlnK4FFsG7hCEolR4dDdxeZ
        uM6HJ7j1Xg3OJUqaWpOYGz44Xf9vuRPwr8vA7vlqusydLlfDwJGVfECnqSKOR4eDI4gF5pwFegnM8
        ZMvxtDoOnqEEs7gJPxj3JmuZJhH3fPuhYxnZP5MUyNH6EVDRYiouUBYWHD20VHi4QjBIOBkGZlxti
        MkTtrlNNe/n+1wJX73P4OnybhD/Vv4ncfALdKFB/Cg7laO77mIVmqgi6x1TWVXf5PkVqqsK6g3Hpz
        OgmxtxOgL8WTuGmIwlC8ryrX2DZqBhhahKo0kKzbs/OVn69WFsKDuntLAhdya9e5cosGtkleMXHFp
        J2ddif37w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53760)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1igpaI-0007NN-2K; Mon, 16 Dec 2019 12:34:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1igpaE-0002O5-SD; Mon, 16 Dec 2019 12:34:42 +0000
Date:   Mon, 16 Dec 2019 12:34:42 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Jon Nettleton <jon@solid-run.com>,
        Rabeeh Khoury <rabeeh@solid-run.com>,
        Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: lx2160a: add MDIO descriptions
Message-ID: <20191216123442.GG25745@shell.armlinux.org.uk>
References: <20191209120010.GG25745@shell.armlinux.org.uk>
 <E1ieHiP-0004wT-2O@rmk-PC.armlinux.org.uk>
 <20191211073330.GO15858@dragon>
 <20191216110253.GE25745@shell.armlinux.org.uk>
 <20191216113455.GF25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191216113455.GF25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 16, 2019 at 11:34:56AM +0000, Russell King - ARM Linux admin wrote:
> On Mon, Dec 16, 2019 at 11:02:53AM +0000, Russell King - ARM Linux admin wrote:
> > On Wed, Dec 11, 2019 at 03:33:31PM +0800, Shawn Guo wrote:
> > > On Mon, Dec 09, 2019 at 12:00:37PM +0000, Russell King wrote:
> > > > Add MDIO descriptions to the lx2160a dtsi file, so we can use them in
> > > > the SolidRun Clearfog CX platform.
> > > > 
> > > > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > > > ---
> > > >  .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 20 +++++++++++++++++++
> > > >  1 file changed, 20 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > > > index 0bd98f179bfa..617e1f1a2339 100644
> > > > --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > > > @@ -863,6 +863,26 @@
> > > >  			fsl,extts-fifo;
> > > >  		};
> > > >  
> > > > +		emdio1: mdio@8b96000 {
> > > > +			compatible = "fsl,fman-memac-mdio";
> > > > +			reg = <0x00 0x8b96000 0x00 0x1000>;
> > > > +			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> > > > +			little-endian;
> > > > +			#address-cells = <0x01>;
> > > > +			#size-cells = <0x00>;
> > > > +			status = "disabled";
> > > > +		};
> > > > +
> > > > +		emdio2: mdio@8b97000 {
> > > > +			compatible = "fsl,fman-memac-mdio";
> > > > +			reg = <0x00 0x8b97000 0x00 0x1000>;
> > > > +			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> > > > +			little-endian;
> > > > +			#address-cells = <0x01>;
> > > > +			#size-cells = <0x00>;
> > > > +			status = "disabled";
> > > > +		};
> > > > +
> > > 
> > > Ioana Ciornei already had a patch [1] adding emdio1, but unfortunately,
> > > emdio2 was missing from there.
> > > 
> > > Shawn
> > > 
> > > [1] https://lkml.org/lkml/2019/12/4/675
> > 
> > Okay, I'll wait until after the next merge window before resubmitting.
> > Thanks.
> 
> Just to be clear: the reasons are:
> 1) Ioana's patch was _not_ copied to linux-arm-kernel as it should have
>    been.
> 2) I can't download the patch off lkml.org to sanely rebase on top of it
> 3) I'm not hunting around to try and find it on another archive site
> 4) I'm not digging about in random git trees trying to find it.
> 
> This makes it unnecessarily difficult to progress these patches.

Okay, I finally found it at:

https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/patch/?id=6e1b8fae892daa7ffb48570264b8e43b3f807e9a

Note that that was unnecessarily difficult - google was unable to find
it.  Ioana's patch should have been copied to linux-arm-kernel as per
MAINTAINERS, but wasn't.  Is copying the appropriate mailing lists for
a patch now optional?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
