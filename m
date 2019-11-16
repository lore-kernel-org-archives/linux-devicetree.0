Return-Path: <SRS0=bipS=ZI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA35CC432C3
	for <linux-devicetree@archiver.kernel.org>; Sat, 16 Nov 2019 11:07:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A0ECC20728
	for <linux-devicetree@archiver.kernel.org>; Sat, 16 Nov 2019 11:07:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="WgV3OSCt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbfKPLHR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 16 Nov 2019 06:07:17 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:59640 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbfKPLHQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 16 Nov 2019 06:07:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=1ABfceJ8v9HVoFdZuVH2Lb3YMt4FTQFcIcYcGq5Usew=; b=WgV3OSCtufHCSOCuUZoXpRA94e
        PpWaLUCsnRUAe1X5UA7Wu3axSopVk9EEnDw8r6SbKtfnma5IQKejdgRwSBs9y44BbRiXP7ka5R6Mt
        A8Jo+dzBS27B6KByXv8MPiZE92TLkhsFRRCKPi73p81RupTi1TMVMci04IIJZGG+jmX/sbNToIvJ+
        erhMnbprp9rVysI8XaFN5OJ46htP31tW2vo3SsWeAe5PCeEXknJ6J8KHg05KGS4OUC1tabEy7lAns
        VRz7f+nbvRCDJeQoRlOVhi3g54+122CGrb9wF+6gZ3c3hYV0dQep+KQzihYrxE9+IXeKOLymXDh4L
        fHTMM91w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:37616 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1iVvur-000788-IY; Sat, 16 Nov 2019 11:06:57 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1iVvuq-0002sd-KR; Sat, 16 Nov 2019 11:06:56 +0000
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Gregory Clement <gregory.clement@bootlin.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>
Cc:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: uDPU: fix broken ethernet
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1iVvuq-0002sd-KR@rmk-PC.armlinux.org.uk>
Date:   Sat, 16 Nov 2019 11:06:56 +0000
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The uDPU uses both ethernet controllers, which ties up COMPHY 0 for
eth1 and COMPHY 1 for eth0, with no USB3 comphy.  The addition of
COMPHY support made the kernel override the setup by the boot loader
breaking this platform by assuming that COMPHY 0 was always used for
USB3.  Delete the USB3 COMPHY definition at platform level, and add
phy specifications for the ethernet channels.

Fixes: bd3d25b07342 ("arm64: dts: marvell: armada-37xx: link USB hosts with their PHYs")
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
index bd4aab6092e0..e31813a4f972 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
@@ -143,6 +143,7 @@
 	phy-mode = "sgmii";
 	status = "okay";
 	managed = "in-band-status";
+	phys = <&comphy1 0>;
 	sfp = <&sfp_eth0>;
 };
 
@@ -150,11 +151,14 @@
 	phy-mode = "sgmii";
 	status = "okay";
 	managed = "in-band-status";
+	phys = <&comphy0 1>;
 	sfp = <&sfp_eth1>;
 };
 
 &usb3 {
 	status = "okay";
+	phys = <&usb2_utmi_otg_phy>;
+	phy-names = "usb2-utmi-otg-phy";
 };
 
 &uart0 {
-- 
2.20.1

