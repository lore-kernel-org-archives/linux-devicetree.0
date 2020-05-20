Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76506C433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 12:45:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 553A8206C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 12:45:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PliXrfzw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgETMp7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 08:45:59 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53436 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgETMp6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 08:45:58 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KCjhxh051443;
        Wed, 20 May 2020 07:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589978743;
        bh=j1ayoQNTGfrKr/gCIdv4VMSuX/WqGSoPL0U2S+Ejmbc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=PliXrfzwOLyE/H0GDd3WCNMIPLZUu983NpvvlRcB2kAySFOxM7+40ho+OdYLqfz+p
         k/BbbUbG2bvJ8yftRqlQb9PQVGMMNcgZjqgtO/XH2xVGaDOZ7YzCq/aF51zyjtnVQe
         SV7MQTu6fr1VF4piBNfc46CySztJjABdejT/d1Qk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04KCjhwW001893
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 20 May 2020 07:45:43 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 07:45:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 07:45:43 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KCiuvV026764;
        Wed, 20 May 2020 07:45:39 -0500
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
        Lokesh Vutla <lokeshvutla@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 11/12] arm64: dts: k3-am65: ti-sci-inta/intr: Update to latest bindings
Date:   Wed, 20 May 2020 18:14:53 +0530
Message-ID: <20200520124454.10532-12-lokeshvutla@ti.com>
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
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 22 +++++++++----------
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi    |  8 +++----
 .../arm64/boot/dts/ti/k3-am654-base-board.dts |  4 ++--
 .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      |  1 -
 4 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 11887c72f23a..84fe71db7023 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -372,10 +372,10 @@
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
@@ -393,10 +393,11 @@
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
@@ -407,8 +408,7 @@
 			msi-controller;
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <179>;
-			ti,sci-rm-range-vint = <0x0>;
-			ti,sci-rm-range-global-event = <0x1>;
+			ti,interrupt-ranges = <0 0 256>;
 		};
 
 		secure_proxy_main: mailbox@32c00000 {
@@ -578,8 +578,7 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&intr_main_gpio>;
-		interrupts = <57 256>, <57 257>, <57 258>, <57 259>, <57 260>,
-				<57 261>;
+		interrupts = <192>, <193>, <194>, <195>, <196>, <197>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <96>;
@@ -594,8 +593,7 @@
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
index f4227e2743f2..72295fa64f0e 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
@@ -69,10 +69,10 @@
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
@@ -81,7 +81,7 @@
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
@@ -359,7 +359,7 @@
 };
 
 &mailbox0_cluster0 {
-	interrupts = <164 0>;
+	interrupts = <436>;
 
 	mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
 		ti,mbox-tx = <1 0 0>;
@@ -368,7 +368,7 @@
 };
 
 &mailbox0_cluster1 {
-	interrupts = <165 0>;
+	interrupts = <432>;
 
 	mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
 		ti,mbox-tx = <1 0 0>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
index a17074c8a172..cd1e782d08bd 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
@@ -100,7 +100,6 @@
 		ti,sci = <&dmsc>;
 		ti,sci-dev-id = <137>;
 		ti,interrupt-ranges = <16 960 16>;
-		ti,sci-rm-range-girq = <0x5>;
 	};
 
 	wkup_gpio0: gpio@42110000 {
-- 
2.17.1

