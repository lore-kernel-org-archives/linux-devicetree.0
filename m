Return-Path: <SRS0=kUjg=BQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF92C4727D
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:05:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40DF722DD6
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:05:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LZbolm5E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbgHFHuD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Aug 2020 03:50:03 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34666 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728808AbgHFHtc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Aug 2020 03:49:32 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0767nNh8006061;
        Thu, 6 Aug 2020 02:49:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596700163;
        bh=/T8EzDdxuZG0N3E9FMOLlEz6HKFhWOs4DWZ0wgJjJQM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=LZbolm5E6W7qImv/2sPs/jKsDFDioaAMtXBsXFCnLP1x7mlDrNmV23T1nGpy350mY
         p8xL3uVrKCDSbs2X4gSEyDM96OReliKQ1Z5xpPrDNTtxcaeaqto+cTnG1r8ZH23vjY
         trdBYhHtxlaJDZuBAOe7Z4u4S+cemA+kMGTQLd3Y=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0767nNTt018553
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 Aug 2020 02:49:23 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 6 Aug
 2020 02:49:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 6 Aug 2020 02:49:23 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0767mSZ1051454;
        Thu, 6 Aug 2020 02:49:19 -0500
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
Subject: [PATCH v6 12/13] arm64: dts: k3-am65: ti-sci-inta/intr: Update to latest bindings
Date:   Thu, 6 Aug 2020 13:18:25 +0530
Message-ID: <20200806074826.24607-13-lokeshvutla@ti.com>
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
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 24 +++++++++----------
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi    |  8 +++----
 .../arm64/boot/dts/ti/k3-am654-base-board.dts |  4 ++--
 .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      |  1 -
 4 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 9edfae5944f7..996a82ff983e 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -417,10 +417,10 @@ intr_main_gpio: interrupt-controller0 {
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
@@ -438,10 +438,11 @@ intr_main_navss: interrupt-controller1 {
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
@@ -452,8 +453,7 @@ inta_main_udmass: interrupt-controller@33d00000 {
 			msi-controller;
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <179>;
-			ti,sci-rm-range-vint = <0x0>;
-			ti,sci-rm-range-global-event = <0x1>;
+			ti,interrupt-ranges = <0 0 256>;
 		};
 
 		secure_proxy_main: mailbox@32c00000 {
@@ -622,7 +622,7 @@ cpts@310d0000 {
 			reg-names = "cpts";
 			clocks = <&main_cpts_mux>;
 			clock-names = "cpts";
-			interrupts-extended = <&intr_main_navss 163 0>;
+			interrupts-extended = <&intr_main_navss 391>;
 			interrupt-names = "cpts";
 			ti,cpts-periodic-outputs = <6>;
 			ti,cpts-ext-ts-inputs = <8>;
@@ -645,8 +645,7 @@ main_gpio0:  main_gpio0@600000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&intr_main_gpio>;
-		interrupts = <57 256>, <57 257>, <57 258>, <57 259>, <57 260>,
-				<57 261>;
+		interrupts = <192>, <193>, <194>, <195>, <196>, <197>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <96>;
@@ -661,8 +660,7 @@ main_gpio1:  main_gpio1@601000 {
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
index 5f55b9e82cf1..a1ffe88d9664 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
@@ -74,10 +74,10 @@ intr_wkup_gpio: interrupt-controller2 {
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
@@ -86,7 +86,7 @@ wkup_gpio0: wkup_gpio0@42110000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&intr_wkup_gpio>;
-		interrupts = <59 128>, <59 129>, <59 130>, <59 131>;
+		interrupts = <60>, <61>, <62>, <63>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		ti,ngpio = <56>;
diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index 611e66207010..b8a8a0fcb8af 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -384,7 +384,7 @@ &pcie1_ep {
 };
 
 &mailbox0_cluster0 {
-	interrupts = <164 0>;
+	interrupts = <436>;
 
 	mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
 		ti,mbox-tx = <1 0 0>;
@@ -393,7 +393,7 @@ mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
 };
 
 &mailbox0_cluster1 {
-	interrupts = <165 0>;
+	interrupts = <432>;
 
 	mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
 		ti,mbox-tx = <1 0 0>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
index e00cf2a08e6d..c4a48e8d420a 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
@@ -105,7 +105,6 @@ wkup_gpio_intr: interrupt-controller2 {
 		ti,sci = <&dmsc>;
 		ti,sci-dev-id = <137>;
 		ti,interrupt-ranges = <16 960 16>;
-		ti,sci-rm-range-girq = <0x5>;
 	};
 
 	wkup_gpio0: gpio@42110000 {
-- 
2.27.0

