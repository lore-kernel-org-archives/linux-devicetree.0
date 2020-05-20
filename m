Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0ABDC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 12:46:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7777F206C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 12:46:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xSF5SwwB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgETMqD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 08:46:03 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34392 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgETMqC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 08:46:02 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KCjlbs118861;
        Wed, 20 May 2020 07:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589978747;
        bh=ph+NrraTtxt19VvSc6u34tyYmVQvA+JzwETiqzuB5xI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=xSF5SwwByE84exuEhhAsyRKN7KUhbvHrCnSvsj0Jc2UHD8Xz//7QN6HzazAUGMxdw
         kgAIgcrvN27Kgvuqy7O6S5eHArqHRPnh4bTFHAKQhBPHigRajF9oKfRsrMOz+EuLN1
         YOARCcGTXwe5Y899uh00cUZrP6ggCfqn8AA2DdYE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KCjl7b050595;
        Wed, 20 May 2020 07:45:47 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 07:45:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 07:45:47 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KCiuvW026764;
        Wed, 20 May 2020 07:45:43 -0500
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
Subject: [PATCH 12/12] arm64: dts: k3-am65: Update the RM resource types
Date:   Wed, 20 May 2020 18:14:54 +0530
Message-ID: <20200520124454.10532-13-lokeshvutla@ti.com>
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

Update the ringacc and udma dt nodes to use the latest RM resource types
similar to the ones used in k3-j721e dt nodes.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 12 ++++++------
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi  | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 84fe71db7023..a3fb5c62d3bc 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -544,7 +544,7 @@
 				<0x0 0x33000000 0x0 0x40000>;
 			reg-names = "rt", "fifos", "proxy_gcfg", "proxy_target";
 			ti,num-rings = <818>;
-			ti,sci-rm-range-gp-rings = <0x2>; /* GP ring range */
+			ti,sci-rm-range-gp-rings = <0x1>; /* GP ring range */
 			ti,dma-ring-reset-quirk;
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <187>;
@@ -564,11 +564,11 @@
 			ti,sci-dev-id = <188>;
 			ti,ringacc = <&ringacc>;
 
-			ti,sci-rm-range-tchan = <0x1>, /* TX_HCHAN */
-						<0x2>; /* TX_CHAN */
-			ti,sci-rm-range-rchan = <0x4>, /* RX_HCHAN */
-						<0x5>; /* RX_CHAN */
-			ti,sci-rm-range-rflow = <0x6>; /* GP RFLOW */
+			ti,sci-rm-range-tchan = <0xf>, /* TX_HCHAN */
+						<0xd>; /* TX_CHAN */
+			ti,sci-rm-range-rchan = <0xb>, /* RX_HCHAN */
+						<0xa>; /* RX_CHAN */
+			ti,sci-rm-range-rflow = <0x0>; /* GP RFLOW */
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
index 353d1e2532a7..adc7e19194fc 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
@@ -134,7 +134,7 @@
 				<0x0 0x2a500000 0x0 0x40000>;
 			reg-names = "rt", "fifos", "proxy_gcfg", "proxy_target";
 			ti,num-rings = <286>;
-			ti,sci-rm-range-gp-rings = <0x2>; /* GP ring range */
+			ti,sci-rm-range-gp-rings = <0x1>; /* GP ring range */
 			ti,dma-ring-reset-quirk;
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <195>;
@@ -154,11 +154,11 @@
 			ti,sci-dev-id = <194>;
 			ti,ringacc = <&mcu_ringacc>;
 
-			ti,sci-rm-range-tchan = <0x1>, /* TX_HCHAN */
-						<0x2>; /* TX_CHAN */
-			ti,sci-rm-range-rchan = <0x3>, /* RX_HCHAN */
-						<0x4>; /* RX_CHAN */
-			ti,sci-rm-range-rflow = <0x5>; /* GP RFLOW */
+			ti,sci-rm-range-tchan = <0xf>, /* TX_HCHAN */
+						<0xd>; /* TX_CHAN */
+			ti,sci-rm-range-rchan = <0xb>, /* RX_HCHAN */
+						<0xa>; /* RX_CHAN */
+			ti,sci-rm-range-rflow = <0x0>; /* GP RFLOW */
 		};
 	};
 
-- 
2.17.1

