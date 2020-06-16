Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C0EC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 18:24:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C4E3208D5
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 18:24:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730077AbgFPSYV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 14:24:21 -0400
Received: from v6.sk ([167.172.42.174]:47662 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730133AbgFPSYR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 16 Jun 2020 14:24:17 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 58BD961632;
        Tue, 16 Jun 2020 18:24:16 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 12/13] ARM: dts: mmp3: Add the GPU
Date:   Tue, 16 Jun 2020 20:23:40 +0200
Message-Id: <20200616182341.944473-13-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200616182341.944473-1-lkundrak@v3.sk>
References: <20200616182341.944473-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

There's a GC2000 3D core accompanied by a GC300 2D core.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp3.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/mmp3.dtsi b/arch/arm/boot/dts/mmp3.dtsi
index 57231d49d9386..cc4efd0efabd2 100644
--- a/arch/arm/boot/dts/mmp3.dtsi
+++ b/arch/arm/boot/dts/mmp3.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/marvell,mmp2.h>
+#include <dt-bindings/power/marvell,mmp2.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -310,6 +311,30 @@ camera1: camera@d420a800 {
 				clock-output-names = "mclk";
 				status = "disabled";
 			};
+
+			gpu_3d: gpu@d420d000 {
+				compatible = "vivante,gc";
+				reg = <0xd420d000 0x2000>;
+				interrupt-parent = <&gpu_mux>;
+				interrupts = <0>;
+				status = "disabled";
+				clocks = <&soc_clocks MMP3_CLK_GPU_3D>,
+					 <&soc_clocks MMP3_CLK_GPU_BUS>;
+				clock-names = "core", "bus";
+				power-domains = <&soc_clocks MMP2_POWER_DOMAIN_GPU>;
+			};
+
+			gpu_2d: gpu@d420f000 {
+				compatible = "vivante,gc";
+				reg = <0xd420f000 0x2000>;
+				interrupt-parent = <&gpu_mux>;
+				interrupts = <2>;
+				status = "disabled";
+				clocks = <&soc_clocks MMP3_CLK_GPU_2D>,
+					 <&soc_clocks MMP3_CLK_GPU_BUS>;
+				clock-names = "core", "bus";
+				power-domains = <&soc_clocks MMP2_POWER_DOMAIN_GPU>;
+			};
 		};
 
 		apb@d4000000 {
-- 
2.26.2

