Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06283C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 17:28:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D846E2068F
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 17:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595352492;
	bh=YF4nPnFDznHPW2MW5uypg9cVqrtkKdwCBtlzagc+f2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KFidkBi/LeoIKHopw8aYwLHJ6P2VDu2alOTplvUGx+RT9no5wW8D5evachtW3Cgqr
	 qqUpAyyHTN0GAQOLbCXbxDoWwnlFX978tmpQTLBhbHktV5jDIVVYUyBxa9/x0e38lK
	 CHhvvsJZqc1IhDK+5ij5MGzjvBEt7Y7Fi43gFDz8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729396AbgGUR2M (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 13:28:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:59466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728368AbgGUR2L (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jul 2020 13:28:11 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41B302065D;
        Tue, 21 Jul 2020 17:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595352491;
        bh=YF4nPnFDznHPW2MW5uypg9cVqrtkKdwCBtlzagc+f2k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GYzhbEZxz26TtxCK9ZuVFVZP9GQaJioiufy3WmmEu3Wq7FdtzC2HA2UB7LZmMD9HK
         BBKGQo5EIk1Uii16I00PXLCEPtaMfwQMha6bDowXr2fz3aqj+pwboq9OZ4Uo+3o2Ae
         o8zbx0kERanOxW/F+Z09QdwfofyRz2REfdlkCoHY=
Date:   Tue, 21 Jul 2020 22:58:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Fix Armada 38x mvneta lockups when switching
 speeds
Message-ID: <20200721172807.GN12965@vkoul-mobl>
References: <20200721143756.GT1605@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721143756.GT1605@shell.armlinux.org.uk>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 21-07-20, 15:37, Russell King - ARM Linux admin wrote:
> Hi,
> 
> While testing phylink over the weekend, I found it was possible to
> cause the mvneta hardware to lockup in various weird and wonderful
> ways by switching the interface speed between 1G and 2.5G repeatedly.
> It didn't require a rapid switching, but one switch every few seconds.
> 
> Symptoms included one or more of:
> - Timeout while trying to stop transmit (seen once)
> - 2500BASE-X link negotiation failure (fails to exchange link word.)
> - Detects lack of sync, but fails to flag 10ms of sync failure.
> - SyncOk bit randomly toggles.
> 
> Once the hardware gets into a "bad" state, trying to recover it by
> using the mvneta GMAC port reset fails to resolve the issue.
> Disabling the port also fails to recover it.  The only way to
> recover seemed to be via a reboot.
> 
> Many solutions to solve this were tried in various combinations -
> while changing the COMPHY configuration:
> - putting the GMAC into reset
> - disabling the GMAC port
> - augmenting the COMPHY configuration to try to "cleanly" disable
>   the COMPHY via phy_power_down() and reconfigure it via
>   phy_power_up(), including resetting parts of the COMPHY and
>   re-running the RX initialisation.
> 
> None of that worked.  It was then discovered from the u-boot sources
> that there is an undocumented register that has a lane-specific bit
> set at the end of COMPHY initialisation, once the loosely documented
> COMPHY setup has completed.
> 
> Experimentation with that showed that if the lane specific bit is
> cleared before changing the COMPHY "GEN" configuration, and set
> afterwards, mvneta no longer locks up.
> 
> Unfortunately, this undocumented register is not part of the COMPHY
> register set that we map - it is located in a region of "System
> Registers" which are shared between multiple different devices.
> 
> Who should be responsible for mapping this register (mvneta or
> COMPHY) was considered; the register is only present on Armada 38x
> systems, and seemingly not on Armada 37x or Armada 37xx systems.
> It seems that it is a system-level register.  The COMPHYs seem to
> be system specific, so let's make it part of the COMPHY.
> 
> With no real information on this register, all we can do is guess
> about it's function and how to fit it into the system.

Applied 1 & 3, thanks
-- 
~Vinod
