Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C055C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 11:25:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31CD02072D
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 11:25:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgHULZU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 07:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728138AbgHULZR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Aug 2020 07:25:17 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1ED1C061343
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 04:24:39 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id JBQa2300E4C55Sk06BQaxw; Fri, 21 Aug 2020 13:24:34 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k959u-0002w1-EH; Fri, 21 Aug 2020 13:24:34 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k959u-0001Tt-Cf; Fri, 21 Aug 2020 13:24:34 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: Fix pin controller node names
Date:   Fri, 21 Aug 2020 13:24:33 +0200
Message-Id: <20200821112433.5652-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

According to Devicetree Specification v0.2 and later, Section "Generic
Names Recommendation", the node name for a pin controller device node
should be "pinctrl".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.10.

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index ed99863f1dd09fd0..0806446228ec8f14 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -408,7 +408,7 @@
 			resets = <&cpg 905>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a774a1";
 			reg = <0 0xe6060000 0 0x50c>;
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 1c76de24d3ea4844..40d87baa2431edfe 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -282,7 +282,7 @@
 			resets = <&cpg 905>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a774b1";
 			reg = <0 0xe6060000 0 0x50c>;
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 9fdca4c55ba95608..f2a93f83781dba04 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -256,7 +256,7 @@
 			resets = <&cpg 906>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a774c0";
 			reg = <0 0xe6060000 0 0x508>;
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 415727c9f23200dd..c4cd05470ed7e19d 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -427,7 +427,7 @@
 			resets = <&cpg 905>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a774e1";
 			reg = <0 0xe6060000 0 0x50c>;
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 1b1a014c829a2e2a..644308dd886c4baa 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -490,7 +490,7 @@
 			resets = <&cpg 905>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7795";
 			reg = <0 0xe6060000 0 0x50c>;
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index e6c88a748692b212..53b9aa26c9b13fa7 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -459,7 +459,7 @@
 			resets = <&cpg 905>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7796";
 			reg = <0 0xe6060000 0 0x50c>;
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 6fdc28a6d2cf0354..3ff2729528aeaeab 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -448,7 +448,7 @@
 			resets = <&cpg 905>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a77961";
 			reg = <0 0xe6060000 0 0x50c>;
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 6206e28f37efae73..bfffc5b6104e2dfc 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -329,7 +329,7 @@
 			resets = <&cpg 905>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a77965";
 			reg = <0 0xe6060000 0 0x50c>;
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 7be8ad1ca4646d79..5a5d5649332a8b1d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -204,7 +204,7 @@
 			resets = <&cpg 907>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a77970";
 			reg = <0 0xe6060000 0 0x504>;
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index f573dc0552272195..ec7ca72399ec4d54 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -234,7 +234,7 @@
 			resets = <&cpg 907>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a77980";
 			reg = <0 0xe6060000 0 0x50c>;
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 07c35e9b049ae151..d1615474be67bac3 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -282,7 +282,7 @@
 			resets = <&cpg 906>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a77990";
 			reg = <0 0xe6060000 0 0x508>;
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 624aaa6d7f20d6d4..e1af7c4782f4d768 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -188,7 +188,7 @@
 			resets = <&cpg 906>;
 		};
 
-		pfc: pin-controller@e6060000 {
+		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a77995";
 			reg = <0 0xe6060000 0 0x508>;
 		};
-- 
2.17.1

