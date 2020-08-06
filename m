Return-Path: <SRS0=kUjg=BQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFC1C4741F
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:05:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAEF123109
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:05:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LxgWQGsz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbgHFHuJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Aug 2020 03:50:09 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44698 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728854AbgHFHuD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Aug 2020 03:50:03 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0767nRbR122997;
        Thu, 6 Aug 2020 02:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596700167;
        bh=Alebcq5Jit6SRLm/gcvv/0T3Yjn5e4SkvPMZHW+i1Hc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=LxgWQGsztDp9H9swoLD+ASjOCBq80fgKeejaAsoctSggEvVm40vSMRy3RLH2nFhxs
         UuPCeYF/+q1QCQBFiZTezgpgXGuYEHH0XeRPNPx+NmOze3u85qg8DxDTLxy3E1tLHP
         sIRlVFJ94oXtx/2jQLSnP4jp5TeMK1jBCmZnrWDw=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0767nRmL054057;
        Thu, 6 Aug 2020 02:49:27 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 6 Aug
 2020 02:49:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 6 Aug 2020 02:49:27 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0767mSZ2051454;
        Thu, 6 Aug 2020 02:49:23 -0500
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
Subject: [PATCH v6 13/13] arm64: dts: k3-am65: Update the RM resource types
Date:   Thu, 6 Aug 2020 13:18:26 +0530
Message-ID: <20200806074826.24607-14-lokeshvutla@ti.com>
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

Update the ringacc and udma dt nodes to use the latest RM resource types
similar to the ones used in k3-j721e dt nodes.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 12 ++++++------
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi  | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 996a82ff983e..24ef18fe77df 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -589,7 +589,7 @@ ringacc: ringacc@3c000000 {
 				<0x0 0x33000000 0x0 0x40000>;
 			reg-names = "rt", "fifos", "proxy_gcfg", "proxy_target";
 			ti,num-rings = <818>;
-			ti,sci-rm-range-gp-rings = <0x2>; /* GP ring range */
+			ti,sci-rm-range-gp-rings = <0x1>; /* GP ring range */
 			ti,dma-ring-reset-quirk;
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <187>;
@@ -609,11 +609,11 @@ main_udmap: dma-controller@31150000 {
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
 
 		cpts@310d0000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
index 8c1abcfe0860..51ca4b4d4c21 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
@@ -134,7 +134,7 @@ mcu_ringacc: ringacc@2b800000 {
 				<0x0 0x2a500000 0x0 0x40000>;
 			reg-names = "rt", "fifos", "proxy_gcfg", "proxy_target";
 			ti,num-rings = <286>;
-			ti,sci-rm-range-gp-rings = <0x2>; /* GP ring range */
+			ti,sci-rm-range-gp-rings = <0x1>; /* GP ring range */
 			ti,dma-ring-reset-quirk;
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <195>;
@@ -154,11 +154,11 @@ mcu_udmap: dma-controller@285c0000 {
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
2.27.0

