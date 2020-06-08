Return-Path: <SRS0=7QPV=7V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD36C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 10:08:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 116C8206D5
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 10:08:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729357AbgFHKIE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 8 Jun 2020 06:08:04 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:48874 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729328AbgFHKID (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 8 Jun 2020 06:08:03 -0400
Received: from localhost (unknown [192.168.167.32])
        by lucky1.263xmail.com (Postfix) with ESMTP id 0AC30C8614;
        Mon,  8 Jun 2020 18:08:01 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P3328T139695958783744S1591610878452365_;
        Mon, 08 Jun 2020 18:08:00 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <c6abcc5ae2a173f482e997efdc293d51>
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
Subject: [PATCH v1 13/13] arm64: dts: rk3399: Add 'arm,pl330-periph-burst' for dmac
Date:   Mon,  8 Jun 2020 18:07:42 +0800
Message-Id: <1591610862-71359-4-git-send-email-sugar.zhang@rock-chips.com>
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

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 1448f35..569e199 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -211,6 +211,7 @@
 			#dma-cells = <1>;
 			clocks = <&cru ACLK_DMAC0_PERILP>;
 			clock-names = "apb_pclk";
++			arm,pl330-periph-burst;
 		};
 
 		dmac_peri: dma-controller@ff6e0000 {
@@ -221,6 +222,7 @@
 			#dma-cells = <1>;
 			clocks = <&cru ACLK_DMAC1_PERILP>;
 			clock-names = "apb_pclk";
++			arm,pl330-periph-burst;
 		};
 	};
 
-- 
2.7.4



