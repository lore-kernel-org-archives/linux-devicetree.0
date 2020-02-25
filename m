Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345A6C35DF5
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 11:45:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06DD320CC7
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 11:45:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="NQnKopOB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729178AbgBYLpZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 06:45:25 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:57278 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730248AbgBYLpZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 06:45:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+8uEyiDuXgwEwXT3F4LBRm2h4wV2hN5ik+MVsbEAZb4=; b=NQnKopOB0tdoLSVESX9gA60cwH
        AmCCBvvEyHSzaaT5C6ShBG83OSwsSlWy89eVFyv1Gd/J82qvmUBJA9N4xkW+QkCXX/w0vo1df1H1a
        s1SzkUa/0qdqgmSHabMhDNvYNdftQLXFkims3lYnfczQCeFj7c42tyvXA+wz/T61j1MdA6tr3qo6A
        Pz6VPz75b2RLj8R+49ZWDxIaXtQVpJadbco3IxQGDRdLdprJc+aFKvpJ74jdkHZbv1NQv64NZxbk4
        iboDodqc+cKi4XfxOuBdLXcABrAUqR2o44Aqtl2X98WJR8HQkE9mSZCeYQ7qtdDdytg1oIYuzyDOH
        UhRZImXg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38958 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1j6YeG-0000d4-Jk; Tue, 25 Feb 2020 11:45:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1j6YeG-00026g-08; Tue, 25 Feb 2020 11:45:12 +0000
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Baruch Siach <baruch@tkos.co.il>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: clearfog-gt-8k: set gigabit PHY reset deassert
 delay
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1j6YeG-00026g-08@rmk-PC.armlinux.org.uk>
Date:   Tue, 25 Feb 2020 11:45:12 +0000
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

If the mv88e6xxx DSA driver is built as a module, it causes the
ethernet driver to re-probe when it's loaded. This in turn causes
the gigabit PHY to be momentarily reset and reprogrammed. However,
we attempt to reprogram the PHY immediately after deasserting reset,
and the PHY ignores the writes.

This results in the PHY operating in the wrong mode, and the copper
link states down.

Set a reset deassert delay of 10ms for the gigabit PHY to avoid this.

Fixes: babc5544c293 ("arm64: dts: clearfog-gt-8k: 1G eth PHY reset signal")
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index bd881497b872..dc531d136273 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -367,6 +367,7 @@
 		pinctrl-0 = <&cp0_copper_eth_phy_reset>;
 		reset-gpios = <&cp0_gpio2 11 GPIO_ACTIVE_LOW>;
 		reset-assert-us = <10000>;
+		reset-deassert-us = <10000>;
 	};
 
 	switch0: switch0@4 {
-- 
2.20.1

