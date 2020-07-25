Return-Path: <SRS0=7Os6=BE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2958C433E3
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 16:55:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD59F206D7
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 16:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NBBurCHQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgGYQzk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jul 2020 12:55:40 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43160 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGYQzk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Jul 2020 12:55:40 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06PGtab6092455;
        Sat, 25 Jul 2020 11:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595696136;
        bh=C5bREt6ICTWBNX37BVjDl/uKruMfEc18QygGp/DI6xc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=NBBurCHQpckKg5NEitDR/5t036LKO1pxRiFtCMSdBihOVu5EI/XKXW5OAw5NrHocP
         tNAsuxTwVIa0SH6evKQZ1f4r2giaYppo/0IPNbBJ4cpsgCm/E77llruuRbQPKN3LDc
         wmr2BKMGsbHWj6p5aFOhSemdNgHHQWNOY1f98yig=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06PGta4i058295
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 25 Jul 2020 11:55:36 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 25
 Jul 2020 11:55:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 25 Jul 2020 11:55:36 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06PGtPLF026200;
        Sat, 25 Jul 2020 11:55:33 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>, Suman Anna <s-anna@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 2/3] arm64: dts: k3-am65: ti-sci-inta/intr: Update to latest bindings
Date:   Sat, 25 Jul 2020 22:25:23 +0530
Message-ID: <20200725165524.22151-3-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725165524.22151-1-lokeshvutla@ti.com>
References: <20200725165524.22151-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Update the INTA and INTR dt nodes to the latest DT bindings.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 24 +++++++++----------
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi    |  8 +++----
 .../arm64/boot/dts/ti/k3-am654-base-board.dts |  4 ++--
 .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      |  1 -
 4 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 61815228e230..0af4ebacf939 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -383,10 +383,10 @@ intr_main_gpio: interrupt-controller0 {
 		ti,intr-trigger-type = <1>;
 		interrupt-controller;
 		interrupt-parent = <&gic500>;
-		#interrupt-cells = <2>;
+		#interrupt-cells = <1>;
 		ti,sci = <&dmsc>;
-		ti,sci-dst-id = <56>;
-		ti,sci-rm-range-girq = <0x1>;
+		ti,sci-dev-id = <100>;
+		ti,interrupt-ranges = <0 392 32>;
 	};
 
 	main_navss {
@@ -404,10 +404,11 @@ intr_main_navss: interrupt-controller1 {
 			ti,intr-trigger-type = <4>;
 			interrupt-controller;
 			interrupt-parent = <&gic500>;
-			#interrupt-cells = <2>;
+			#interrupt-cells = <1>;
 			ti,sci = <&dmsc>;
-			ti,sci-dst-id = <56>;
-			ti,sci-rm-range-girq = <0x0>, <0x2>;
+			ti,sci-dev-id = <182>;
+			ti,interrupt-ranges = <0 64 64>,
+					      <64 448 64>;
 		};
 
 		inta_main_udmass: interrupt-controller@33d00000 {
@@ -418,8 +419,7 @@ inta_main_udmass: interrupt-controller@33d00000 {
 			msi-controller;
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <179>;
-			ti,sci-rm-range-vint = <0x0>;
-			ti,sci-rm-range-global-event = <0x1>;
+			ti,interrupt-ranges = <0 0 256>;
 		};
 
 		secure_proxy_main: mailbox@32c00000 {
@@ -588,7 +588,7 @@ cpts@310d0000 {
 			reg-names = "cpts";
 			clocks = <&main_cpts_mux>;
 			clock-names = "cpts";
-			interrupts-extended = <&intr_main_navss 163 0>;
+			interrupts-extended = <&intr_main_navss 391>;
 			interrupt-names = "cpts";
 			ti,cpts-periodic-outputs = <6>;
 			ti,cpts-ext-ts-inputs = <8>;
@@ -611,8 +611,7 @@ main_gpio0:  main_gpio0@600000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&intr_main_gpio>;
-		interrupts = <57 256>, <57 257>, <57 258>, <57 259>, <57 260>,
-				<57 261>;
+		interrupts = <192>, <193>, <194>, <195>, <196>, <197>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <96>;
@@ -627,8 +626,7 @@ main_gpio1:  main_gpio1@601000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&intr_main_gpio>;
-		interrupts = <58 256>, <58 257>, <58 258>, <58 259>, <58 260>,
-				<58 261>;
+		interrupts = <200>, <201>, <202>, <203>, <204>, <205>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <90>;
diff --git a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
index 54a133fa1bf2..e1cb8a1196ea 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
@@ -69,10 +69,10 @@ intr_wkup_gpio: interrupt-controller2 {
 		ti,intr-trigger-type = <1>;
 		interrupt-controller;
 		interrupt-parent = <&gic500>;
-		#interrupt-cells = <2>;
+		#interrupt-cells = <1>;
 		ti,sci = <&dmsc>;
-		ti,sci-dst-id = <56>;
-		ti,sci-rm-range-girq = <0x4>;
+		ti,sci-dev-id = <156>;
+		ti,interrupt-ranges = <0 712 16>;
 	};
 
 	wkup_gpio0: wkup_gpio0@42110000 {
@@ -81,7 +81,7 @@ wkup_gpio0: wkup_gpio0@42110000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&intr_wkup_gpio>;
-		interrupts = <59 128>, <59 129>, <59 130>, <59 131>;
+		interrupts = <60>, <61>, <62>, <63>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <56>;
diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index 2f3d3316a1cf..e58668f9fb59 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -359,7 +359,7 @@ &pcie1_ep {
 };
 
 &mailbox0_cluster0 {
-	interrupts = <164 0>;
+	interrupts = <436>;
 
 	mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
 		ti,mbox-tx = <1 0 0>;
@@ -368,7 +368,7 @@ mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
 };
 
 &mailbox0_cluster1 {
-	interrupts = <165 0>;
+	interrupts = <432>;
 
 	mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
 		ti,mbox-tx = <1 0 0>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
index 62b87fd6c555..e778a7e80ce7 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
@@ -100,7 +100,6 @@ wkup_gpio_intr: interrupt-controller2 {
 		ti,sci = <&dmsc>;
 		ti,sci-dev-id = <137>;
 		ti,interrupt-ranges = <16 960 16>;
-		ti,sci-rm-range-girq = <0x5>;
 	};
 
 	wkup_gpio0: gpio@42110000 {
-- 
2.27.0

