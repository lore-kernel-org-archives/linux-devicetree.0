Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B379C4BA3B
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 12:09:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 243972467B
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 12:09:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="y9HLVnwe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728996AbgB0MJP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 07:09:15 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:36770 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728932AbgB0MJP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 07:09:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5B4D6mpsYsGTW/sG+nlpg8ge6vrS2Mwsuc7+EH4Q6pM=; b=y9HLVnwepohpL+nei0WwI4LB3e
        pMI0dHtVkOCWFbpezYvMe9Xuj0ffIKgUDx95aVX2mLxK6k9n2rtqGQquBrU01uLS80BL47PF7Dd8i
        GkrIsycFL7QyvTE8q8fM/mF7SUvPTkRVPXM0VZ3E6vVDXUF6FhSdO1QJJC+AXJXlE4aeCs/P+Y4wN
        TcodWT8ephDdcczAbt7XIqTlCGmnnkx5449Fbd0CH8FJ6663m5sLUdb2fgAg957zyzG7HkSdNzmAw
        ham6850blAjvIpkwRSwWypB29qv6ocbGmDve7Q2izPuaGXl0Toe7CnSGc5nmiSC7ly+qYaoteTUI0
        ZOLJw9+w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:58338 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1j7HyN-0005PT-7F; Thu, 27 Feb 2020 12:08:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1j7HyM-0004Zc-HY; Thu, 27 Feb 2020 12:08:58 +0000
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Gregory Clement <gregory.clement@bootlin.com>
Cc:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: mcbin: support 2W SFP modules
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1j7HyM-0004Zc-HY@rmk-PC.armlinux.org.uk>
Date:   Thu, 27 Feb 2020 12:08:58 +0000
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Allow the SFP cages to be used with 2W SFP modules.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
index 8a39908e584f..ba25650730c3 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -71,6 +71,7 @@
 		tx-fault-gpio  = <&cp1_gpio1 26 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cp1_sfpp0_pins>;
+		maximum-power-milliwatt = <2000>;
 	};
 
 	sfp_eth1: sfp-eth1 {
@@ -83,6 +84,7 @@
 		tx-fault-gpio = <&cp0_gpio2 30 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cp1_sfpp1_pins &cp0_sfpp1_pins>;
+		maximum-power-milliwatt = <2000>;
 	};
 
 	sfp_eth3: sfp-eth3 {
@@ -95,6 +97,7 @@
 		tx-fault-gpio = <&cp0_gpio2 19 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cp0_sfp_1g_pins &cp1_sfp_1g_pins>;
+		maximum-power-milliwatt = <2000>;
 	};
 };
 
-- 
2.20.1

