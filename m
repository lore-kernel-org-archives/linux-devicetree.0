Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74F2C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:56:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3A91214AF
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:56:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="jmoyuXDy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391540AbgDNQ4P (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 12:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388039AbgDNQ4H (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 12:56:07 -0400
X-Greylist: delayed 66550 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 14 Apr 2020 09:56:06 PDT
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D56FCC061A0C
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 09:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=DFng2zEQhZiSk08ixA4j2g0MhkEE7yI+dH1GknnzSZk=; b=jmoyuXDyTWpxwakI8fcCaqWaq
        wTovPCgU6r0w4ORyo29f44cg1XJnm2qmhR9YwEVNJK39qgICulPnfa9VK8t9yToPOConMoru2VxKM
        VQ8l6aCOmOh6U2BCkPj8xd3H5iEuQ/0hMJgPJJsxOK+EmMdmZyFTtSLJCrwXVEIGmWgO9tl0162LY
        jZIoVHtspoXUj1jE3igLT0NqJJZuB00BvmoEHNfurm6sV3A+n3O6t7bNBOFLVfcdvsuHQRpt8BMu1
        zbaYUlDALiNpZvvj2KDIp46Fbc8m6hytp7vgIdT7wHnDhyHkyU5Q2dX/d1Vx8aqFz1t0152Ub4kBy
        th8/S3ugw==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:38372)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jOOqg-0000oG-OG; Tue, 14 Apr 2020 17:55:46 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jOOqT-0008HG-TB; Tue, 14 Apr 2020 17:55:33 +0100
Date:   Tue, 14 Apr 2020 17:55:33 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Willy Tarreau <w@1wt.eu>
Cc:     Sergey Matyukevich <geomatsi@gmail.com>,
        devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [bug report] armada-8040-mcbin: 5.6-rc5 boot failure
Message-ID: <20200414165533.GX25745@shell.armlinux.org.uk>
References: <20200413220520.GA25917@curiosity>
 <20200413222645.GT25745@shell.armlinux.org.uk>
 <20200414160354.GA463339@curiosity>
 <20200414160838.GA21435@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414160838.GA21435@1wt.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Apr 14, 2020 at 06:08:38PM +0200, Willy Tarreau wrote:
> Hi,
> 
> On Tue, Apr 14, 2020 at 07:03:54PM +0300, Sergey Matyukevich wrote:
> > I have not changed configuration since 5.3, so all the marvell phy
> > drivers are in place. Is there anything in configuration that could
> > be missed after moving from 5.3 to 5.6 kernel ?
> 
> FWIW mine works perfectly fine with 5.4 at 1G/2.5G/10G. From what I can
> quickly check here are the relevant parts in my config for ethernet (not
> sure all are needed though):
> 
> CONFIG_NET_VENDOR_MARVELL=y
> CONFIG_MVMDIO=y
> CONFIG_MVPP2=y
> CONFIG_MDIO_DEVICE=y
> CONFIG_MDIO_BUS=y
> CONFIG_MDIO_BITBANG=y

Macchiatobin doesn't bitbang the MDIO bus.

> CONFIG_MDIO_BUS_MUX=y
> CONFIG_MDIO_BUS_MUX_MMIOREG=y
> CONFIG_MDIO_BUS_MUX_MULTIPLEXER=y

There's no MDIO bus muxing on Macchiatobin.

> CONFIG_MDIO_I2C=y
> CONFIG_PHYLINK=y
> CONFIG_PHYLIB=y
> CONFIG_SWPHY=y
> CONFIG_SFP=y
> CONFIG_FIXED_PHY=y

CONFIG_FIXED_PHY should no longer be required.

> CONFIG_MARVELL_PHY=y
> CONFIG_MARVELL_10G_PHY=y
> 
> Not tested 5.6 yet.
> 
> Hoping this helps,
> Willy
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
