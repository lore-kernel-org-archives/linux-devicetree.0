Return-Path: <SRS0=kUjg=BQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997DCC4727F
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:05:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D6D322D37
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:05:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UQlogHvP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728795AbgHFHuH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Aug 2020 03:50:07 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50456 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728827AbgHFHtr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Aug 2020 03:49:47 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0767nJF3108771;
        Thu, 6 Aug 2020 02:49:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596700159;
        bh=Tkf51fMJbeyuzPkovbPYNTCgRTiBoVoAzBpEKBTr2ks=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=UQlogHvPcy+cM3xnY2mXQb0oD5cUX1Wf976ppefKARmAsNlwM4MYRTPzrG8XjJkcZ
         PCON8cmtC4msD7ZmtUaGLKYRqeBP+8A3/HBYMsMGNMQmHec7grAZx7XmnzRom5pWQo
         WMqDvn1Btk8XTeCjy+M9gANzaHHKzuvQB1fC1HBE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0767nJMW079069
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 Aug 2020 02:49:19 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 6 Aug
 2020 02:49:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 6 Aug 2020 02:49:19 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0767mSZ0051454;
        Thu, 6 Aug 2020 02:49:15 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC:     Thomas Gleixner <tglx@linutronix.de>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v6 11/13] arm64: dts: k3-j721e: ti-sci-inta/intr: Update to latest bindings
Date:   Thu, 6 Aug 2020 13:18:24 +0530
Message-ID: <20200806074826.24607-12-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806074826.24607-1-lokeshvutla@ti.com>
References: <20200806074826.24607-1-lokeshvutla@ti.com>
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
index 8bc1e6ecc50e..e8fc01d97ada 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -287,7 +287,7 @@ &wkup_gpio1 {
 };
 
 &mailbox0_cluster0 {
-	interrupts = <214 0>;
+	interrupts = <436>;
 
 	mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
 		ti,mbox-rx = <0 0 0>;
@@ -301,7 +301,7 @@ mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
 };
 
 &mailbox0_cluster1 {
-	interrupts = <215 0>;
+	interrupts = <432>;
 
 	mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
 		ti,mbox-rx = <0 0 0>;
@@ -315,7 +315,7 @@ mbox_main_r5fss0_core1: mbox-main-r5fss0-core1 {
 };
 
 &mailbox0_cluster2 {
-	interrupts = <216 0>;
+	interrupts = <428>;
 
 	mbox_main_r5fss1_core0: mbox-main-r5fss1-core0 {
 		ti,mbox-rx = <0 0 0>;
@@ -329,7 +329,7 @@ mbox_main_r5fss1_core1: mbox-main-r5fss1-core1 {
 };
 
 &mailbox0_cluster3 {
-	interrupts = <217 0>;
+	interrupts = <424>;
 
 	mbox_c66_0: mbox-c66-0 {
 		ti,mbox-rx = <0 0 0>;
@@ -343,7 +343,7 @@ mbox_c66_1: mbox-c66-1 {
 };
 
 &mailbox0_cluster4 {
-	interrupts = <218 0>;
+	interrupts = <420>;
 
 	mbox_c71_0: mbox-c71-0 {
 		ti,mbox-rx = <0 0 0>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index d14060207f00..12ceea9b3c9a 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -80,10 +80,10 @@ main_gpio_intr: interrupt-controller0 {
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
@@ -101,10 +101,12 @@ main_navss_intr: interrupt-controller1 {
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
@@ -115,8 +117,7 @@ main_udmass_inta: interrupt-controller@33d00000 {
 			msi-controller;
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <209>;
-			ti,sci-rm-range-vint = <0xa>;
-			ti,sci-rm-range-global-event = <0xd>;
+			ti,interrupt-ranges = <0 0 256>;
 		};
 
 		secure_proxy_main: mailbox@32c00000 {
@@ -296,7 +297,7 @@ cpts@310d0000 {
 			reg-names = "cpts";
 			clocks = <&k3_clks 201 1>;
 			clock-names = "cpts";
-			interrupts-extended = <&main_navss_intr 201 0>;
+			interrupts-extended = <&main_navss_intr 391>;
 			interrupt-names = "cpts";
 			ti,cpts-periodic-outputs = <6>;
 			ti,cpts-ext-ts-inputs = <8>;
@@ -688,8 +689,8 @@ main_gpio0: gpio@600000 {
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
@@ -705,7 +706,7 @@ main_gpio1: gpio@601000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <106 0>, <106 1>, <106 2>;
+		interrupts = <288>, <289>, <290>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <36>;
@@ -721,8 +722,8 @@ main_gpio2: gpio@610000 {
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
@@ -738,7 +739,7 @@ main_gpio3: gpio@611000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <108 0>, <108 1>, <108 2>;
+		interrupts = <292>, <293>, <294>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <36>;
@@ -754,8 +755,8 @@ main_gpio4: gpio@620000 {
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
@@ -771,7 +772,7 @@ main_gpio5: gpio@621000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <110 0>, <110 1>, <110 2>;
+		interrupts = <296>, <297>, <298>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <36>;
@@ -787,8 +788,8 @@ main_gpio6: gpio@630000 {
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
@@ -804,7 +805,7 @@ main_gpio7: gpio@631000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <112 0>, <112 1>, <112 2>;
+		interrupts = <300>, <301>, <302>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <36>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
index 30a735bcd0c8..e00cf2a08e6d 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
@@ -101,9 +101,10 @@ wkup_gpio_intr: interrupt-controller2 {
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
 
@@ -113,8 +114,7 @@ wkup_gpio0: gpio@42110000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&wkup_gpio_intr>;
-		interrupts = <113 0>, <113 1>, <113 2>,
-			     <113 3>, <113 4>, <113 5>;
+		interrupts = <103>, <104>, <105>, <106>, <107>, <108>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <84>;
@@ -130,8 +130,7 @@ wkup_gpio1: gpio@42100000 {
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

