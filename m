Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615E6C43331
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 12:40:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3287F2082D
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 12:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="hblUMp10"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgC0Mkz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 08:40:55 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:33602 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgC0Mkz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Mar 2020 08:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jO3AEOHGLWCsFDNf6cHqRj7CpekldajyoJG25hdAXKs=; b=hblUMp10vf3hrNbow4vhnqFa7B
        u3+7EV+riwDjv8mAv7dEqMTPFlgbrQgh+P859RR3Sxkm3cKbkDlMFIB0WJ5kYShQCSGJJ2piOXlA0
        QLo6NfXeflc9dzLjHXO8PdSYbLFnvHkbiV+1no7x4ShYZ3d37YUfBDkiyN9AVtxB34rgq38DliyKd
        RMtQKpoIP+Tf4QZ3OW/JGcwGFr6rzebj7/szEOG8bYSjH1NbipkgqcGzq/gJ9sczzErJymz7p4/D9
        SOsy4uVUAX7Mtt6GCYHdIwXbzlbcM0WPErVbNLoVcwMHpM8NDwFSfE5TDN9TJyk8Op7DlzKXmDFmP
        pL9qasvw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:54840 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jHoHz-000149-B7; Fri, 27 Mar 2020 12:40:43 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jHoHy-0002Ep-IY; Fri, 27 Mar 2020 12:40:42 +0000
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Gregory Clement <gregory.clement@bootlin.com>
Cc:     "Madalin Bucur (OSS)" <madalin.bucur@oss.nxp.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: update SolidRun Armada 8040 phy interface types
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jHoHy-0002Ep-IY@rmk-PC.armlinux.org.uk>
Date:   Fri, 27 Mar 2020 12:40:42 +0000
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Update the SolidRun Armada 8040 platforms phy interface types from the
old 10gbase-kr to the newer and more correct 10gbase-r.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts   | 2 +-
 arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dts | 4 ++--
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts            | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index 1e7b47affe26..006666272489 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -401,7 +401,7 @@
 /* SFP */
 &cp0_eth0 {
 	status = "okay";
-	phy-mode = "10gbase-kr";
+	phy-mode = "10gbase-r";
 	managed = "in-band-status";
 	phys = <&cp0_comphy2 0>;
 	sfp = <&sfp_cp0_eth0>;
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dts b/arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dts
index 26114d96d637..b44f4c029b78 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dts
@@ -16,14 +16,14 @@
 
 &cp0_eth0 {
 	status = "okay";
-	phy-mode = "10gbase-kr";
+	phy-mode = "10gbase-r";
 	managed = "in-band-status";
 	sfp = <&sfp_eth0>;
 };
 
 &cp1_eth0 {
 	status = "okay";
-	phy-mode = "10gbase-kr";
+	phy-mode = "10gbase-r";
 	managed = "in-band-status";
 	sfp = <&sfp_eth1>;
 };
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
index 087a5502631e..42741adf867b 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
@@ -63,14 +63,14 @@
 	status = "okay";
 	/* Network PHY */
 	phy = <&phy0>;
-	phy-mode = "10gbase-kr";
+	phy-mode = "10gbase-r";
 };
 
 &cp1_eth0 {
 	status = "okay";
 	/* Network PHY */
 	phy = <&phy8>;
-	phy-mode = "10gbase-kr";
+	phy-mode = "10gbase-r";
 };
 
 &cp1_pinctrl {
-- 
2.20.1

