Return-Path: <SRS0=kxJ0=ZX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D4CC432C0
	for <linux-devicetree@archiver.kernel.org>; Sun,  1 Dec 2019 17:15:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50F122082E
	for <linux-devicetree@archiver.kernel.org>; Sun,  1 Dec 2019 17:15:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbfLARPE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 1 Dec 2019 12:15:04 -0500
Received: from unicorn.mansr.com ([81.2.72.234]:49546 "EHLO unicorn.mansr.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726393AbfLARPD (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 1 Dec 2019 12:15:03 -0500
X-Greylist: delayed 452 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Dec 2019 12:15:03 EST
Received: by unicorn.mansr.com (Postfix, from userid 51770)
        id EF74C15637; Sun,  1 Dec 2019 17:07:29 +0000 (GMT)
From:   Mans Rullgard <mans@mansr.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: am335x-sancloud-bbe: fix phy mode
Date:   Sun,  1 Dec 2019 17:07:06 +0000
Message-Id: <20191201170706.7173-1-mans@mansr.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The phy mode should be rgmii-id.  For some reason, it used to work with
rgmii-txid but doesn't any more.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 arch/arm/boot/dts/am335x-sancloud-bbe.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe.dts b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
index 8678e6e35493..e5fdb7abb0d5 100644
--- a/arch/arm/boot/dts/am335x-sancloud-bbe.dts
+++ b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
@@ -108,7 +108,7 @@
 
 &cpsw_emac0 {
 	phy-handle = <&ethphy0>;
-	phy-mode = "rgmii-txid";
+	phy-mode = "rgmii-id";
 };
 
 &i2c0 {
-- 
2.24.0

