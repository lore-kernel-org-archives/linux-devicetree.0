Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB67EC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 16:05:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 939E720759
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 16:05:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="KkWOEGUo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389870AbgF3QFE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 12:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389869AbgF3QFD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 12:05:03 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A1CCC061755
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 09:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=/BZDcc2fv9mEw+e98OcONWpahvt8/yXYkA8zeLF1rMc=; b=KkWOEGUoxJshCV6lBA57r/hGx
        k61r4j4uazxmjr1WTGz1D0TZYbcVWRzFFoRGCP4GrRYwL3Aux1LIWy3aoB2howAeRALHYjZLTooo5
        AfGbDq7KvCPMwH+wRM1gq++k8PJyOanVswOlzXFlJmTsb/t9T7eu4w295cOlSsR9kf1NEk2WzZ/t4
        5Ppkx5TTfP8CH/MfweD+RhVB19fJcSxyHhngMd+e99G5AnY+JlurY+40aELbP4kJ2FAFRbPl4xlmp
        fCmqju8au2BYfFcs8mFqiPSkllYCyxSSUUKGYebDdi9c9AeA4lEA1dqOeV1CghIOXwUy1ptFo6Pjk
        TfQEEeDhQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33606)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jqIkf-0000kG-Fy; Tue, 30 Jun 2020 17:04:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jqIke-0008JI-Di; Tue, 30 Jun 2020 17:04:52 +0100
Date:   Tue, 30 Jun 2020 17:04:52 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Fix Armada 38x mvneta lockups when switching speeds
Message-ID: <20200630160452.GD1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

While testing phylink over the weekend, I found it was possible to
cause the mvneta hardware to lockup in various weird and wonderful
ways by switching the interface speed between 1G and 2.5G repeatedly.
It didn't require a rapid switching, but one switch every few seconds.

Symptoms included one or more of:
- Timeout while trying to stop transmit (seen once)
- 2500BASE-X link negotiation failure (fails to exchange link word.)
- Detects lack of sync, but fails to flag 10ms of sync failure.
- SyncOk bit randomly toggles.

Once the hardware gets into a "bad" state, trying to recover it by
using the mvneta GMAC port reset fails to resolve the issue.
Disabling the port also fails to recover it.  The only way to
recover seemed to be via a reboot.

Many solutions to solve this were tried in various combinations -
while changing the COMPHY configuration:
- putting the GMAC into reset
- disabling the GMAC port
- augmenting the COMPHY configuration to try to "cleanly" disable
  the COMPHY via phy_power_down() and reconfigure it via
  phy_power_up(), including resetting parts of the COMPHY and
  re-running the RX initialisation.

None of that worked.  It was then discovered from the u-boot sources
that there is an undocumented register that has a lane-specific bit
set at the end of COMPHY initialisation, once the loosely documented
COMPHY setup has completed.

Experimentation with that showed that if the lane specific bit is
cleared before changing the COMPHY "GEN" configuration, and set
afterwards, mvneta no longer locks up.

Unfortunately, this undocumented register is not part of the COMPHY
register set that we map - it is located in a region of "System
Registers" which are shared between multiple different devices.

Who should be responsible for mapping this register (mvneta or
COMPHY) was considered; the register is only present on Armada 38x
systems, and seemingly not on Armada 37x or Armada 37xx systems.
It seems that it is a system-level register.  The COMPHYs seem to
be system specific, so let's make it part of the COMPHY.

With no real information on this register, all we can do is guess
about it's function and how to fit it into the system.

I've mentioned this to Thomas Petazzoni on #mvlinux, but that has
not yet lead anywhere.

 .../bindings/phy/phy-armada38x-comphy.txt          | 10 ++++-
 arch/arm/boot/dts/armada-38x.dtsi                  |  3 +-
 drivers/phy/marvell/phy-armada38x-comphy.c         | 45 ++++++++++++++++++----
 3 files changed, 49 insertions(+), 9 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
