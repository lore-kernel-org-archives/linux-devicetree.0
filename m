Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE740C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 21:11:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8B5B2067D
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 21:11:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nTHmIAKg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgGWVLn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 17:11:43 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59590 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgGWVLm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jul 2020 17:11:42 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06NLBfTx098002;
        Thu, 23 Jul 2020 16:11:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595538701;
        bh=/O41v73HtXFfIGvXSuOEKaB9+UYd2bCj6LNeroq+r78=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=nTHmIAKgAbTpz80PfUHYwsq3eYNXjiKSMB/0G2pd1aLHGVBG9bi+oJE4MLvmN2NLO
         AM7lbvJU/usYrcFiapd8rTv/ITIqxeZ/DYbYpBwz6u3amnulCGXEHY+bjboshLnanP
         n2P0p1YHzhQ6FbvszH0ILOm6gCBDX4cNWv+xjL+8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06NLBfhF106360;
        Thu, 23 Jul 2020 16:11:41 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 23
 Jul 2020 16:11:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 23 Jul 2020 16:11:40 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06NLBens004498;
        Thu, 23 Jul 2020 16:11:40 -0500
Received: from localhost ([10.250.34.248])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 06NLBeX8048246;
        Thu, 23 Jul 2020 16:11:40 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-j721e: Fix interconnect node names
Date:   Thu, 23 Jul 2020 16:11:37 -0500
Message-ID: <20200723211137.26641-3-s-anna@ti.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200723211137.26641-1-s-anna@ti.com>
References: <20200723211137.26641-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The various CBASS interconnect nodes on K3 J721E SoCs are defined
using the node name "interconnect". This is not a valid node name
as per the dt-schema. Fix these node names to use the standard name
used for SoC interconnects, "bus".

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e.dtsi b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
index 2f9a56d9b114..3565885142e7 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
@@ -120,7 +120,7 @@ pmu: pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	cbass_main: interconnect@100000 {
+	cbass_main: bus@100000 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -155,7 +155,7 @@ cbass_main: interconnect@100000 {
 			 <0x05 0x00000000 0x05 0x00000000 0x01 0x00000000>,
 			 <0x07 0x00000000 0x07 0x00000000 0x01 0x00000000>;
 
-		cbass_mcu_wakeup: interconnect@28380000 {
+		cbass_mcu_wakeup: bus@28380000 {
 			compatible = "simple-bus";
 			#address-cells = <2>;
 			#size-cells = <2>;
-- 
2.26.0

