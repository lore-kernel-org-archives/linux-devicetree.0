Return-Path: <SRS0=ig8w=Y5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0A2C5DF66
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 18:35:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99C5720656
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 18:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390736AbfKESfL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 13:35:11 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:46782 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390694AbfKESfL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Nov 2019 13:35:11 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id NJb62100P5USYZQ01Jb6j9; Tue, 05 Nov 2019 19:35:08 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iS3fW-0002sO-Ln; Tue, 05 Nov 2019 19:35:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iS3fW-0005aq-Km; Tue, 05 Nov 2019 19:35:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] arm64: dts: renesas: rcar-gen3: Replace "vsps" by "renesas,vsps"
Date:   Tue,  5 Nov 2019 19:35:04 +0100
Message-Id: <20191105183504.21447-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105183504.21447-1-geert+renesas@glider.be>
References: <20191105183504.21447-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Renesas-specific "vsps" property lacks a vendor prefix.
Add a "renesas," prefix to comply with DT best practises.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on '[PATCH 2/3] drm: rcar-du: Recognize "renesas,vsps" in
addition to "vsps"'.
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi    | 3 ++-
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 3 ++-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi     | 2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi    | 3 ++-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi    | 3 ++-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi    | 2 +-
 11 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 34a9f472fbb43072..0a48b53c3f9dcd69 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -2640,7 +2640,7 @@
 			clock-names = "du.0", "du.1", "du.2";
 			status = "disabled";
 
-			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
+			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
 
 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index fe78387e4bb866ec..2ef0e136c84dcd25 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -2486,7 +2486,7 @@
 			clock-names = "du.0", "du.1", "du.3";
 			status = "disabled";
 
-			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
+			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
 
 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index c7bdc3606323fc97..40aceb6681474f0d 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1813,7 +1813,8 @@
 			clocks = <&cpg CPG_MOD 724>,
 				 <&cpg CPG_MOD 723>;
 			clock-names = "du.0", "du.1";
-			vsps = <&vspd0 0>, <&vspd1 0>;
+			renesas,vsps = <&vspd0 0>, <&vspd1 0>;
+
 			status = "disabled";
 
 			ports {
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 14d8513d2a47336f..29b20e8aca5863e4 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -30,7 +30,7 @@
 };
 
 &du {
-	vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd3 0>;
+	renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd3 0>;
 };
 
 &fcpvb1 {
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index fde6ec122d3b4006..c7b4ece0ab3ee03f 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -3184,7 +3184,8 @@
 			clock-names = "du.0", "du.1", "du.2", "du.3";
 
 			renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>, <&cmm3>;
-			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
+			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>,
+				       <&vspd0 1>;
 
 			status = "disabled";
 
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index b9db882b0351155c..95fa1608add896bf 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -2824,7 +2824,7 @@
 			clock-names = "du.0", "du.1", "du.2";
 
 			renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>;
-			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
+			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
 
 			status = "disabled";
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index bdbe197774d2f659..fb48dabb25adaf77 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2500,7 +2500,7 @@
 			clock-names = "du.0", "du.1", "du.3";
 
 			renesas,cmms = <&cmm0>, <&cmm1>, <&cmm3>;
-			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
+			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
 
 			status = "disabled";
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 0d0558e53533f0dc..c47608c3e0fa066f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -1121,7 +1121,8 @@
 			clock-names = "du.0";
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
 			resets = <&cpg 724>;
-			vsps = <&vspd0 0>;
+			renesas,vsps = <&vspd0 0>;
+
 			status = "disabled";
 
 			ports {
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 4d86669af819f089..53a01265233901fe 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1496,7 +1496,8 @@
 			clock-names = "du.0";
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 724>;
-			vsps = <&vspd0 0>;
+			renesas,vsps = <&vspd0 0>;
+
 			status = "disabled";
 
 			ports {
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 67a6824a962c57a1..8283eb311eac6334 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1791,7 +1791,7 @@
 			reset-names = "du.0";
 
 			renesas,cmms = <&cmm0>, <&cmm1>;
-			vsps = <&vspd0 0>, <&vspd1 0>;
+			renesas,vsps = <&vspd0 0>, <&vspd1 0>;
 
 			status = "disabled";
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index e6ee2b709ba61bd3..d969d7347cf872a4 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1024,7 +1024,7 @@
 			reset-names = "du.0";
 
 			renesas,cmms = <&cmm0>, <&cmm1>;
-			vsps = <&vspd0 0>, <&vspd1 0>;
+			renesas,vsps = <&vspd0 0>, <&vspd1 0>;
 
 			status = "disabled";
 
-- 
2.17.1

