Return-Path: <SRS0=/QBj=55=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DAEC2BA2B
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Apr 2020 22:26:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6CDB20678
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Apr 2020 22:26:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="0vxERwYU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389528AbgDMW07 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Apr 2020 18:26:59 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:59120 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728187AbgDMW06 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Apr 2020 18:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=pf23kSC47Gjbx/Yw9MBAAWL+nbS2bp0s8L/O5T+/2jk=; b=0vxERwYUg7rVDNQ1IAqy1ipPz
        SH0s0xZLxNjdvKI3oKFYFRyL22qg92opGNUO9nczmto/wnmStVU1VXr3jO8IMlwLH2tNZtxAFOSqb
        CE1AvRXcrblaqhf5OgYG4cy+B+t49OGE3TFH/ee5ZHqMFk8LWhKE83hwd3Hjuw0BCR5RdjF5tRo+g
        A+Qo1s2KWtBafJEnAtoltbWvB/VPGY07Gx3WHNJjfNtmnC34BtzYi+Roc8m16SeO8A9TDGFpi1kNe
        jInqiTz5tjko4yuHe1NFPRxIg98xrBi+nv1tEA0ZA0AXZRQfnW2tbJiOR4s6jdLnS71ucowv0OrdU
        /NOILPROw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49674)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jO7XU-0004Jx-AL; Mon, 13 Apr 2020 23:26:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jO7XR-0007LI-Rp; Mon, 13 Apr 2020 23:26:45 +0100
Date:   Mon, 13 Apr 2020 23:26:45 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Sergey Matyukevich <geomatsi@gmail.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Baruch Siach <baruch@tkos.co.il>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [bug report] armada-8040-mcbin: 5.6-rc5 boot failure
Message-ID: <20200413222645.GT25745@shell.armlinux.org.uk>
References: <20200413220520.GA25917@curiosity>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413220520.GA25917@curiosity>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Apr 14, 2020 at 01:05:20AM +0300, Sergey Matyukevich wrote:
> Hi Russel, Miquel, and all,
> 
> MacchiatoBin Double-shot board fails to boot v5.6-rc5 kernel properly:
> USB, PCIe, and ethernet interfaces are not enabled. Before that I have
> been running v5.3 kernel w/o any noticeable issues.
> 
> In brief, USB and PCIe devices are not detected, ethernet PHY fails
> to initialize with the following warnings:
> [    2.444150] mvebu-comphy f4120000.phy: unsupported SMC call, try updating your firmware
> [    2.452191] mvebu-comphy f4120000.phy: Firmware could not configure PHY 0 with mode 15 (ret: -1), trying legacy method
> [    2.474615] mvpp2 f4000000.ethernet eth2: Using firmware node mac address ...
> [    2.484420] mvebu-comphy f4120000.phy: unsupported SMC call, try updating your firmware
> 
> After quick bisection of the board dts files, I came to the following results:
> 
> - USB works again after reverting the following two commits:
>   -- 96018a6fafb1 ("arm64: dts: marvell: Convert 7k/8k usb-phy properties to phy-supply")
>   -- 01d0deba28f6 ("arm64: dts: marvell: Add 7k/8k PHYs in USB3 nodes")
> 
> - PCIe works again after reverting armada-8040-mcbin.dtsi parts of the
>   following two commits:
>   -- 1399672e48b5 ("arm64: dts: marvell: Drop PCIe I/O ranges from CP11x file")
>   -- ce55522c035e ("arm64: dts: marvell: Add 7k/8k PHYs in PCIe nodes")
> 
> - ethernet: not yet...
> 
> However looking at firmware version complaints, I guess that the actual
> reason of all those issues could be in ATF version rather than in the
> latest DTS changes. Probably I am using ATF version which is too old
> to work with up-to-date kernel: armada-17.10.3 from atf-marvell
> repository on github. If this is indeed the actual root cause of all
> the issues, then could you please recommend a preferable ATF version
> to test with ?

I would strongly recommend upgrading the firmware in any case, because
of work I did (and submitted back through Jon @ SolidRun) to improve
the eye mask on the 10G Ethernet interfaces.  I'm using the 18.12
version.  Firmware build instructions can be found at:

https://developer.solid-run.com/knowledge-base/armada-8040-machiatobin-u-boot-and-atf/

I've booted 5.6 recently on a number of Armada 8040 based boards
without issue, likely all running the later firmware.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
