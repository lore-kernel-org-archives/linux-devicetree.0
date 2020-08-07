Return-Path: <SRS0=8zDs=BR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F99FC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Aug 2020 15:20:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0752421744
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Aug 2020 15:20:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgHGPUq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 7 Aug 2020 11:20:46 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:62225 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725815AbgHGPUp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Aug 2020 11:20:45 -0400
X-IronPort-AV: E=Sophos;i="5.75,446,1589209200"; 
   d="scan'208";a="54144737"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Aug 2020 00:20:44 +0900
Received: from localhost.localdomain (unknown [172.29.53.112])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AAC974006C6A;
        Sat,  8 Aug 2020 00:20:41 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] ARM: dts: iwg20d-q7-common: Fix touch controller probe failure
Date:   Fri,  7 Aug 2020 16:20:38 +0100
Message-Id: <20200807152039.10961-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Remove powerdown-gpios property from lvds-receiver node as it results in
touch controller driver probe failure.
As per the iWave RZ/G1M schematic, the signal LVDS_PPEN controls supply
voltage for touch panel, LVDS receiver and RGB LCD panel.

Fixes: 6f89dd9e9325 ("ARM: dts: iwg20d-q7-common: Add LCD support")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm/boot/dts/iwg20d-q7-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index ebbe1518ef8a..4c8b9a6b0125 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -57,7 +57,6 @@
 
 	lvds-receiver {
 		compatible = "ti,ds90cf384a", "lvds-decoder";
-		powerdown-gpios = <&gpio7 25 GPIO_ACTIVE_LOW>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.17.1

