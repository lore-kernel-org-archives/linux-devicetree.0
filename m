Return-Path: <SRS0=YFsx=BV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE86DC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Aug 2020 11:53:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABF832075D
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Aug 2020 11:53:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728469AbgHKLxW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Aug 2020 07:53:22 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:15959 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728326AbgHKLxV (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 11 Aug 2020 07:53:21 -0400
X-IronPort-AV: E=Sophos;i="5.75,461,1589209200"; 
   d="scan'208";a="54154637"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Aug 2020 20:53:20 +0900
Received: from localhost.localdomain (unknown [172.29.52.148])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7D648422546B;
        Tue, 11 Aug 2020 20:53:17 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4] ARM: dts: iwg20d-q7-common: Fix touch controller probe failure
Date:   Tue, 11 Aug 2020 12:53:14 +0100
Message-Id: <20200811115314.4074-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

As per the iWave RZ/G1M schematic, the signal LVDS_PPEN controls supply
voltage for touch panel, LVDS receiver and RGB LCD panel. Add regulator
for these device nodes and remove powerdown-gpios property from
lvds-receiver node as it results in touch controller driver probe failure.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This patch depend on below patches

1) https://patchwork.kernel.org/patch/11707595/
2) https://patchwork.kernel.org/patch/11707593/

v3->v4 : Incorporated Laurent's review comments(https://patchwork.kernel.org/patch/11707887/)
         Added Laurent's Reviewed-by tag
v2->v3 : Added the missing part from the patch. removal of powerdown-gpios property.
v1->v2 : Add regulator in touch panel, LVDS receiver and RGB LCD panel device nodes
           (Ref: https://patchwork.kernel.org/patch/11707559/)
v1 : https://patchwork.kernel.org/patch/11705819/
---
 arch/arm/boot/dts/iwg20d-q7-common.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index ebbe1518ef8a..afb7f0de9c7e 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -57,7 +57,7 @@
 
 	lvds-receiver {
 		compatible = "ti,ds90cf384a", "lvds-decoder";
-		powerdown-gpios = <&gpio7 25 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vcc_3v3_tft1>;
 
 		ports {
 			#address-cells = <1>;
@@ -81,6 +81,7 @@
 	panel {
 		compatible = "edt,etm0700g0dh6";
 		backlight = <&lcd_backlight>;
+		power-supply = <&vcc_3v3_tft1>;
 
 		port {
 			panel_in: endpoint {
@@ -113,6 +114,17 @@
 		};
 	};
 
+	vcc_3v3_tft1: regulator-panel {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vcc-3v3-tft1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		startup-delay-us = <500>;
+		gpio = <&gpio7 25 GPIO_ACTIVE_HIGH>;
+	};
+
 	vcc_sdhi1: regulator-vcc-sdhi1 {
 		compatible = "regulator-fixed";
 
@@ -207,6 +219,7 @@
 		reg = <0x38>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vcc_3v3_tft1>;
 	};
 };
 
-- 
2.17.1

