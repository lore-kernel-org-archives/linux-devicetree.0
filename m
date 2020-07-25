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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CD2C433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 16:55:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4054E206E3
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 16:55:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LeDQGNbv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbgGYQzh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jul 2020 12:55:37 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:48636 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbgGYQzh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Jul 2020 12:55:37 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06PGtXIJ065381;
        Sat, 25 Jul 2020 11:55:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595696133;
        bh=sShe0KjtSdQ43Z3VYVGtGnsjfPqKlxyx8TGszXHjAog=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=LeDQGNbvNEXmttkzxZf86xl9Lg6sFIcYfx4ZntkVgzUVPdDTt4NNS8iMAU5/uG8xi
         c5CBqsF/rAU55WbvE05/zt8UtGgiZhIr7hVym5C7C15mtGaLRaoj8nbZ1uGzOtQwS/
         3qfMsU/aGVwqw9h2nv1Ybp7uJYYx3iEeAYwy9Fu8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06PGtXhD013657;
        Sat, 25 Jul 2020 11:55:33 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 25
 Jul 2020 11:55:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 25 Jul 2020 11:55:32 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06PGtPLE026200;
        Sat, 25 Jul 2020 11:55:30 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>, Suman Anna <s-anna@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 1/3] arm64: dts: k3-j721e: ti-sci-inta/intr: Update to latest bindings
Date:   Sat, 25 Jul 2020 22:25:22 +0530
Message-ID: <20200725165524.22151-2-lokeshvutla@ti.com>
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
---
 .../dts/ti/k3-j721e-common-proc-board.dts     | 10 ++---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     | 43 ++++++++++---------
 .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      | 11 +++--
 3 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 6df823aaa37c..532e1ed4dfb4 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -223,7 +223,7 @@ &wkup_gpio1 {
 };
 
 &mailbox0_cluster0 {
-	interrupts = <214 0>;
+	interrupts = <436>;
 
 	mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
 		ti,mbox-rx = <0 0 0>;
@@ -237,7 +237,7 @@ mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
 };
 
 &mailbox0_cluster1 {
-	interrupts = <215 0>;
+	interrupts = <432>;
 
 	mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
 		ti,mbox-rx = <0 0 0>;
@@ -251,7 +251,7 @@ mbox_main_r5fss0_core1: mbox-main-r5fss0-core1 {
 };
 
 &mailbox0_cluster2 {
-	interrupts = <216 0>;
+	interrupts = <428>;
 
 	mbox_main_r5fss1_core0: mbox-main-r5fss1-core0 {
 		ti,mbox-rx = <0 0 0>;
@@ -265,7 +265,7 @@ mbox_main_r5fss1_core1: mbox-main-r5fss1-core1 {
 };
 
 &mailbox0_cluster3 {
-	interrupts = <217 0>;
+	interrupts = <424>;
 
 	mbox_c66_0: mbox-c66-0 {
 		ti,mbox-rx = <0 0 0>;
@@ -279,7 +279,7 @@ mbox_c66_1: mbox-c66-1 {
 };
 
 &mailbox0_cluster4 {
-	interrupts = <218 0>;
+	interrupts = <420>;
 
 	mbox_c71_0: mbox-c71-0 {
 		ti,mbox-rx = <0 0 0>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 96c929da639d..38bb352f8253 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -45,10 +45,10 @@ main_gpio_intr: interrupt-controller0 {
 		ti,intr-trigger-type = <1>;
 		interrupt-controller;
 		interrupt-parent = <&gic500>;
-		#interrupt-cells = <2>;
+		#interrupt-cells = <1>;
 		ti,sci = <&dmsc>;
-		ti,sci-dst-id = <14>;
-		ti,sci-rm-range-girq = <0x1>;
+		ti,sci-dev-id = <131>;
+		ti,interrupt-ranges = <8 392 56>;
 	};
 
 	main_navss {
@@ -66,10 +66,12 @@ main_navss_intr: interrupt-controller1 {
 			ti,intr-trigger-type = <4>;
 			interrupt-controller;
 			interrupt-parent = <&gic500>;
-			#interrupt-cells = <2>;
+			#interrupt-cells = <1>;
 			ti,sci = <&dmsc>;
-			ti,sci-dst-id = <14>;
-			ti,sci-rm-range-girq = <0>, <2>;
+			ti,sci-dev-id = <213>;
+			ti,interrupt-ranges = <0 64 64>,
+					      <64 448 64>,
+					      <128 672 64>;
 		};
 
 		main_udmass_inta: interrupt-controller@33d00000 {
@@ -80,8 +82,7 @@ main_udmass_inta: interrupt-controller@33d00000 {
 			msi-controller;
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <209>;
-			ti,sci-rm-range-vint = <0xa>;
-			ti,sci-rm-range-global-event = <0xd>;
+			ti,interrupt-ranges = <0 0 256>;
 		};
 
 		secure_proxy_main: mailbox@32c00000 {
@@ -261,7 +262,7 @@ cpts@310d0000 {
 			reg-names = "cpts";
 			clocks = <&k3_clks 201 1>;
 			clock-names = "cpts";
-			interrupts-extended = <&main_navss_intr 201 0>;
+			interrupts-extended = <&main_navss_intr 391>;
 			interrupt-names = "cpts";
 			ti,cpts-periodic-outputs = <6>;
 			ti,cpts-ext-ts-inputs = <8>;
@@ -413,8 +414,8 @@ main_gpio0: gpio@600000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <105 0>, <105 1>, <105 2>, <105 3>,
-			     <105 4>, <105 5>, <105 6>, <105 7>;
+		interrupts = <256>, <257>, <258>, <259>,
+			     <260>, <261>, <262>, <263>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <128>;
@@ -430,7 +431,7 @@ main_gpio1: gpio@601000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <106 0>, <106 1>, <106 2>;
+		interrupts = <288>, <289>, <290>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <36>;
@@ -446,8 +447,8 @@ main_gpio2: gpio@610000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <107 0>, <107 1>, <107 2>, <107 3>,
-			     <107 4>, <107 5>, <107 6>, <107 7>;
+		interrupts = <264>, <265>, <266>, <267>,
+			     <268>, <269>, <270>, <271>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <128>;
@@ -463,7 +464,7 @@ main_gpio3: gpio@611000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <108 0>, <108 1>, <108 2>;
+		interrupts = <292>, <293>, <294>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <36>;
@@ -479,8 +480,8 @@ main_gpio4: gpio@620000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <109 0>, <109 1>, <109 2>, <109 3>,
-			     <109 4>, <109 5>, <109 6>, <109 7>;
+		interrupts = <272>, <273>, <274>, <275>,
+			     <276>, <277>, <278>, <279>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <128>;
@@ -496,7 +497,7 @@ main_gpio5: gpio@621000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <110 0>, <110 1>, <110 2>;
+		interrupts = <296>, <297>, <298>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <36>;
@@ -512,8 +513,8 @@ main_gpio6: gpio@630000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <111 0>, <111 1>, <111 2>, <111 3>,
-			     <111 4>, <111 5>, <111 6>, <111 7>;
+		interrupts = <280>, <281>, <282>, <283>,
+			     <284>, <285>, <286>, <287>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <128>;
@@ -529,7 +530,7 @@ main_gpio7: gpio@631000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <112 0>, <112 1>, <112 2>;
+		interrupts = <300>, <301>, <302>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <36>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
index dc31bd0434cb..62b87fd6c555 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
@@ -96,9 +96,10 @@ wkup_gpio_intr: interrupt-controller2 {
 		ti,intr-trigger-type = <1>;
 		interrupt-controller;
 		interrupt-parent = <&gic500>;
-		#interrupt-cells = <2>;
+		#interrupt-cells = <1>;
 		ti,sci = <&dmsc>;
-		ti,sci-dst-id = <14>;
+		ti,sci-dev-id = <137>;
+		ti,interrupt-ranges = <16 960 16>;
 		ti,sci-rm-range-girq = <0x5>;
 	};
 
@@ -108,8 +109,7 @@ wkup_gpio0: gpio@42110000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&wkup_gpio_intr>;
-		interrupts = <113 0>, <113 1>, <113 2>,
-			     <113 3>, <113 4>, <113 5>;
+		interrupts = <103>, <104>, <105>, <106>, <107>, <108>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <84>;
@@ -125,8 +125,7 @@ wkup_gpio1: gpio@42100000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&wkup_gpio_intr>;
-		interrupts = <114 0>, <114 1>, <114 2>,
-			     <114 3>, <114 4>, <114 5>;
+		interrupts = <112>, <113>, <114>, <115>, <116>, <117>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <84>;
-- 
2.27.0

