Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F90BC54E8D
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 11:06:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0779C20736
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 11:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728777AbgEKLGi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 07:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728341AbgEKLGi (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 May 2020 07:06:38 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02971C061A0C
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 04:06:38 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id EED0C2A0C74
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        robh+dt@kernel.org, xuwei5@hisilicon.com
Subject: [PATCH v2 2/6] ARM: dts: renesas: make hdmi encoder nodes compliant with DT bindings
Date:   Mon, 11 May 2020 13:06:07 +0200
Message-Id: <20200511110611.3142-3-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Small fixes to make these DTs compliant with the adi,adv7511w and
adiadv7513 bindings:

r8a7745-iwg22d-sodimm-dbhd-ca.dts
r8a7790-lager.dts
r8a7790-stout.dts
r8a7791-koelsch.dts
r8a7791-porter.dts
r8a7792-blanche.dts
r8a7793-gose.dts
r8a7794-silk.dts:
Remove the adi,input-style and adi,input-justification properties

r8a7792-wheat.dts:
Reorder the I2C slave addresses of hdmi@3d and hdmi@39 and remove the
adi,input-style and adi,input-justification properties.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
---
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts |  2 --
 arch/arm/boot/dts/r8a7790-lager.dts                 |  2 --
 arch/arm/boot/dts/r8a7790-stout.dts                 |  2 --
 arch/arm/boot/dts/r8a7791-koelsch.dts               |  2 --
 arch/arm/boot/dts/r8a7791-porter.dts                |  2 --
 arch/arm/boot/dts/r8a7792-blanche.dts               |  2 --
 arch/arm/boot/dts/r8a7792-wheat.dts                 | 12 ++++--------
 arch/arm/boot/dts/r8a7793-gose.dts                  |  2 --
 arch/arm/boot/dts/r8a7794-silk.dts                  |  2 --
 9 files changed, 4 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts
index 92aa26ba423c..b1f679da36b2 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts
@@ -84,8 +84,6 @@
 		adi,input-depth = <8>;
 		adi,input-colorspace = "rgb";
 		adi,input-clock = "1x";
-		adi,input-style = <1>;
-		adi,input-justification = "evenly";
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 69745def44d4..bfe778c4c47b 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -364,8 +364,6 @@
 			adi,input-depth = <8>;
 			adi,input-colorspace = "rgb";
 			adi,input-clock = "1x";
-			adi,input-style = <1>;
-			adi,input-justification = "evenly";
 
 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/r8a7790-stout.dts b/arch/arm/boot/dts/r8a7790-stout.dts
index 4138efb2766d..6a457bc9280a 100644
--- a/arch/arm/boot/dts/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/r8a7790-stout.dts
@@ -297,8 +297,6 @@
 		adi,input-depth = <8>;
 		adi,input-colorspace = "rgb";
 		adi,input-clock = "1x";
-		adi,input-style = <1>;
-		adi,input-justification = "evenly";
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 687167b70cb6..fc74c6cd6def 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -387,8 +387,6 @@
 			adi,input-depth = <8>;
 			adi,input-colorspace = "rgb";
 			adi,input-clock = "1x";
-			adi,input-style = <1>;
-			adi,input-justification = "evenly";
 
 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
index a8e0335148a5..114bf1c4199b 100644
--- a/arch/arm/boot/dts/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/r8a7791-porter.dts
@@ -181,8 +181,6 @@
 			adi,input-depth = <8>;
 			adi,input-colorspace = "rgb";
 			adi,input-clock = "1x";
-			adi,input-style = <1>;
-			adi,input-justification = "evenly";
 
 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/r8a7792-blanche.dts b/arch/arm/boot/dts/r8a7792-blanche.dts
index 248eb717eb35..9368ac2cf508 100644
--- a/arch/arm/boot/dts/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -289,8 +289,6 @@
 		adi,input-depth = <8>;
 		adi,input-colorspace = "rgb";
 		adi,input-clock = "1x";
-		adi,input-style = <1>;
-		adi,input-justification = "evenly";
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/r8a7792-wheat.dts b/arch/arm/boot/dts/r8a7792-wheat.dts
index bd2a63bdab3d..ba2d2a589012 100644
--- a/arch/arm/boot/dts/r8a7792-wheat.dts
+++ b/arch/arm/boot/dts/r8a7792-wheat.dts
@@ -249,14 +249,12 @@
 	 */
 	hdmi@3d {
 		compatible = "adi,adv7513";
-		reg = <0x3d>, <0x2d>, <0x4d>, <0x5d>;
-		reg-names = "main", "cec", "edid", "packet";
+		reg = <0x3d>, <0x4d>, <0x2d>, <0x5d>;
+		reg-names = "main", "edid", "cec", "packet";
 
 		adi,input-depth = <8>;
 		adi,input-colorspace = "rgb";
 		adi,input-clock = "1x";
-		adi,input-style = <1>;
-		adi,input-justification = "evenly";
 
 		ports {
 			#address-cells = <1>;
@@ -280,14 +278,12 @@
 
 	hdmi@39 {
 		compatible = "adi,adv7513";
-		reg = <0x39>, <0x29>, <0x49>, <0x59>;
-		reg-names = "main", "cec", "edid", "packet";
+		reg = <0x39>, <0x49>, <0x29>, <0x59>;
+		reg-names = "main", "edid", "cec", "packet";
 
 		adi,input-depth = <8>;
 		adi,input-colorspace = "rgb";
 		adi,input-clock = "1x";
-		adi,input-style = <1>;
-		adi,input-justification = "evenly";
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index cfe06a74ce89..79baf06019f5 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -366,8 +366,6 @@
 			adi,input-depth = <8>;
 			adi,input-colorspace = "rgb";
 			adi,input-clock = "1x";
-			adi,input-style = <1>;
-			adi,input-justification = "evenly";
 
 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index 9aaa96ea9943..b8b0941f677c 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -255,8 +255,6 @@
 			adi,input-depth = <8>;
 			adi,input-colorspace = "rgb";
 			adi,input-clock = "1x";
-			adi,input-style = <1>;
-			adi,input-justification = "evenly";
 
 			ports {
 				#address-cells = <1>;
-- 
2.18.0

