Return-Path: <SRS0=YFsx=BV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FABC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Aug 2020 08:02:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3744C20656
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Aug 2020 08:02:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbgHKICs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Aug 2020 04:02:48 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:37203 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728064AbgHKICs (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 11 Aug 2020 04:02:48 -0400
X-IronPort-AV: E=Sophos;i="5.75,460,1589209200"; 
   d="scan'208";a="54142527"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Aug 2020 17:02:45 +0900
Received: from localhost.localdomain (unknown [172.29.52.148])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7C7444007529;
        Tue, 11 Aug 2020 17:02:43 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/5] arm64: dts: renesas: cat874: Move connector node out of hd3ss3220 device
Date:   Tue, 11 Aug 2020 09:02:26 +0100
Message-Id: <20200811080227.3170-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811080227.3170-1-biju.das.jz@bp.renesas.com>
References: <20200811080227.3170-1-biju.das.jz@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Move connector node out of hd3ss3220 device in order to comply with usb
connector bindings.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2: No Change
---
 .../boot/dts/renesas/r8a774c0-cat874.dts      | 67 ++++++++++++++-----
 1 file changed, 50 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 26aee004a44e..ea87cb5a459c 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -129,6 +129,29 @@
 		#clock-cells = <0>;
 		clock-frequency = <74250000>;
 	};
+
+	connector {
+		compatible = "usb-c-connector";
+		label = "USB-C";
+		data-role = "dual";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				hs_ep: endpoint {
+					remote-endpoint = <&usb3_hs_ep>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				ss_ep: endpoint {
+					remote-endpoint = <&hd3ss3220_in_ep>;
+				};
+			};
+		};
+	};
 };
 
 &audio_clk_a {
@@ -186,20 +209,19 @@
 		interrupt-parent = <&gpio6>;
 		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 
-		connector {
-			compatible = "usb-c-connector";
-			label = "USB-C";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@1 {
-					reg = <1>;
-					hd3ss3220_ep: endpoint {
-						remote-endpoint = <&usb3_role_switch>;
-					};
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				hd3ss3220_in_ep: endpoint {
+					remote-endpoint = <&ss_ep>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				hd3ss3220_out_ep: endpoint {
+					remote-endpoint = <&usb3_role_switch>;
 				};
 			};
 		};
@@ -405,9 +427,20 @@
 	status = "okay";
 	usb-role-switch;
 
-	port {
-		usb3_role_switch: endpoint {
-			remote-endpoint = <&hd3ss3220_ep>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			usb3_hs_ep: endpoint {
+				remote-endpoint = <&hs_ep>;
+			};
+		};
+		port@1 {
+			reg = <1>;
+			usb3_role_switch: endpoint {
+				remote-endpoint = <&hd3ss3220_out_ep>;
+			};
 		};
 	};
 };
-- 
2.17.1

