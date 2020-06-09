Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727D2C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 01:22:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59A98206A4
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 01:22:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgFIBWf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 8 Jun 2020 21:22:35 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:40416 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbgFIBWf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 8 Jun 2020 21:22:35 -0400
Received: from localhost (unknown [192.168.167.32])
        by lucky1.263xmail.com (Postfix) with ESMTP id 2066AC955E;
        Tue,  9 Jun 2020 09:22:33 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P3328T139697392834304S1591665750167995_;
        Tue, 09 Jun 2020 09:22:32 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <fc1771569418637d2198535d467e9844>
X-RL-SENDER: sugar.zhang@rock-chips.com
X-SENDER: zxg@rock-chips.com
X-LOGIN-NAME: sugar.zhang@rock-chips.com
X-FST-TO: heiko@sntech.de
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Sugar Zhang <sugar.zhang@rock-chips.com>
To:     heiko@sntech.de, vkoul@kernel.org
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: [PATCH v2 11/13] arm64: dts: rk3328: Add 'arm,pl330-periph-burst' for dmac
Date:   Tue,  9 Jun 2020 09:22:21 +0800
Message-Id: <1591665743-38416-2-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591665267-37713-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1591665267-37713-1-git-send-email-sugar.zhang@rock-chips.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch Add the quirk to specify to use burst transfer
for better compatible and higher performance.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>

---

Changes in v2:
- fix FATAL ERROR: Unable to parse input tree

 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index a4d591d..8a9ce1e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -156,6 +156,7 @@
 			clocks = <&cru ACLK_DMAC>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
+			arm,pl330-periph-burst;
 		};
 	};
 
-- 
2.7.4



