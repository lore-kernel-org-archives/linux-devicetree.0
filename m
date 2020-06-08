Return-Path: <SRS0=7QPV=7V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4D9C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 10:06:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9554F206D5
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 10:06:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729256AbgFHKGK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 8 Jun 2020 06:06:10 -0400
Received: from lucky1.263xmail.com ([211.157.147.135]:34740 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729232AbgFHKGJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 8 Jun 2020 06:06:09 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id 3FB5899930;
        Mon,  8 Jun 2020 18:04:42 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P760T139944424257280S1591610682251378_;
        Mon, 08 Jun 2020 18:04:43 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <06e4dcf5c69521c7a3a6e883f3ef39e7>
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
Subject: [PATCH v1 06/13] ARM: dts: rk3288: Add 'arm,pl330-periph-burst' for dmac
Date:   Mon,  8 Jun 2020 18:04:24 +0800
Message-Id: <1591610671-71238-2-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591602567-43788-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1591602567-43788-1-git-send-email-sugar.zhang@rock-chips.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch Add the quirk to specify to use burst transfer
for better compatible and higher performance.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

 arch/arm/boot/dts/rk3288.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 0cd8877..b0de4f4 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -168,6 +168,7 @@
 				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
 			arm,pl330-broken-no-flushp;
++			arm,pl330-periph-burst;
 			clocks = <&cru ACLK_DMAC2>;
 			clock-names = "apb_pclk";
 		};
@@ -179,6 +180,7 @@
 				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
 			arm,pl330-broken-no-flushp;
++			arm,pl330-periph-burst;
 			clocks = <&cru ACLK_DMAC1>;
 			clock-names = "apb_pclk";
 			status = "disabled";
@@ -191,6 +193,7 @@
 				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
 			arm,pl330-broken-no-flushp;
++			arm,pl330-periph-burst;
 			clocks = <&cru ACLK_DMAC1>;
 			clock-names = "apb_pclk";
 		};
-- 
2.7.4



