Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30579C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 12:45:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10B66206C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 12:45:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hziqfayj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbgETMp5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 08:45:57 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53432 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbgETMp5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 08:45:57 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KCjdak051436;
        Wed, 20 May 2020 07:45:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589978739;
        bh=g/d7UttYNv0jj4x5mrqzeDmdpfUmNfzi9Mfg6Jwjw6o=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hziqfayjzRQOj9rs6AHnz7VhQ41ypAUiPCLlH4qffNdPPKkfB+N+gIQ1zZuwYg/vD
         dhXI74Jxz4nt6uoi0qrf5mmcXmupNAPr0XihaTsLlJzicQwsNHvTJq0ownIUOu78qK
         X+XVOXe6b0AnPPfw1VHRCNjSKA/4JtBSthYkek2E=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04KCjdof104643
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 20 May 2020 07:45:39 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 07:45:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 07:45:39 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KCiuvU026764;
        Wed, 20 May 2020 07:45:35 -0500
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
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 10/12] arm64: dts: k3-j721e: ti-sci-inta/intr: Update to latest bindings
Date:   Wed, 20 May 2020 18:14:52 +0530
Message-ID: <20200520124454.10532-11-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200520124454.10532-1-lokeshvutla@ti.com>
References: <20200520124454.10532-1-lokeshvutla@ti.com>
MIME-Version: 1.0
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
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     | 41 ++++++++++---------
 .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      | 11 +++--
 3 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 98e5e17e3ff7..022aa64d2911 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -223,7 +223,7 @@
 };
 
 &mailbox0_cluster0 {
-	interrupts = <214 0>;
+	interrupts = <436>;
 
 	mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
 		ti,mbox-rx = <0 0 0>;
@@ -237,7 +237,7 @@
 };
 
 &mailbox0_cluster1 {
-	interrupts = <215 0>;
+	interrupts = <432>;
 
 	mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
 		ti,mbox-rx = <0 0 0>;
@@ -251,7 +251,7 @@
 };
 
 &mailbox0_cluster2 {
-	interrupts = <216 0>;
+	interrupts = <428>;
 
 	mbox_main_r5fss1_core0: mbox-main-r5fss1-core0 {
 		ti,mbox-rx = <0 0 0>;
@@ -265,7 +265,7 @@
 };
 
 &mailbox0_cluster3 {
-	interrupts = <217 0>;
+	interrupts = <424>;
 
 	mbox_c66_0: mbox-c66-0 {
 		ti,mbox-rx = <0 0 0>;
@@ -279,7 +279,7 @@
 };
 
 &mailbox0_cluster4 {
-	interrupts = <218 0>;
+	interrupts = <420>;
 
 	mbox_c71_0: mbox-c71-0 {
 		ti,mbox-rx = <0 0 0>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 0b9d14b838a1..2c643190ce0b 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -45,10 +45,10 @@
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
@@ -66,10 +66,12 @@
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
@@ -80,8 +82,7 @@
 			msi-controller;
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <209>;
-			ti,sci-rm-range-vint = <0xa>;
-			ti,sci-rm-range-global-event = <0xd>;
+			ti,interrupt-ranges = <0 0 256>;
 		};
 
 		secure_proxy_main: mailbox@32c00000 {
@@ -401,8 +402,8 @@
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
@@ -418,7 +419,7 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <106 0>, <106 1>, <106 2>;
+		interrupts = <288>, <289>, <290>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <36>;
@@ -434,8 +435,8 @@
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
@@ -451,7 +452,7 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <108 0>, <108 1>, <108 2>;
+		interrupts = <292>, <293>, <294>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <36>;
@@ -467,8 +468,8 @@
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
@@ -484,7 +485,7 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <110 0>, <110 1>, <110 2>;
+		interrupts = <296>, <297>, <298>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <36>;
@@ -500,8 +501,8 @@
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
@@ -517,7 +518,7 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <112 0>, <112 1>, <112 2>;
+		interrupts = <300>, <301>, <302>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <36>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
index 3d6064125b40..a17074c8a172 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
@@ -96,9 +96,10 @@
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
 
@@ -108,8 +109,7 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&wkup_gpio_intr>;
-		interrupts = <113 0>, <113 1>, <113 2>,
-			     <113 3>, <113 4>, <113 5>;
+		interrupts = <103>, <104>, <105>, <106>, <107>, <108>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <84>;
@@ -125,8 +125,7 @@
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
2.17.1

