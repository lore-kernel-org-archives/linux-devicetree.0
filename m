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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85D4C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 21:11:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5DF3207C4
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 21:11:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FY4+mBxh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgGWVLn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 17:11:43 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55374 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbgGWVLn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jul 2020 17:11:43 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06NLBeO0098109;
        Thu, 23 Jul 2020 16:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595538700;
        bh=AvA/3flL1lvhfpZIkpDl4/E87runPBSR4YhkzjSR0z8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=FY4+mBxh0+FmVzBE2iVFqx8TJ2SNq1oOS+htztX1WAZ6In1luSWSoO2/SgVIq3PGF
         iUU6rChnX9x6cexHMshRevxJQl3jAMQEIr1gK/58V4ZEdvsnMq2O74nynXU3kBPKPT
         9zL9XeK7XoILmDPd3qIn7AeyBRS6SZyNCq3bHfeI=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06NLBeOX067252
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 23 Jul 2020 16:11:40 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 23
 Jul 2020 16:11:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 23 Jul 2020 16:11:40 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06NLBetB014209;
        Thu, 23 Jul 2020 16:11:40 -0500
Received: from localhost ([10.250.34.248])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 06NLBe97048243;
        Thu, 23 Jul 2020 16:11:40 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am65: Fix interconnect node names
Date:   Thu, 23 Jul 2020 16:11:36 -0500
Message-ID: <20200723211137.26641-2-s-anna@ti.com>
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

The various CBASS interconnect nodes on K3 AM65x SoCs are defined
using the node name "interconnect". This is not a valid node name
as per the dt-schema. Fix these node names to use the standard name
used for SoC interconnects, "bus".

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am65.dtsi b/arch/arm64/boot/dts/ti/k3-am65.dtsi
index 5be75e430965..94ab5bd744cf 100644
--- a/arch/arm64/boot/dts/ti/k3-am65.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65.dtsi
@@ -61,7 +61,7 @@ pmu: pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	cbass_main: interconnect@100000 {
+	cbass_main: bus@100000 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -88,7 +88,7 @@ cbass_main: interconnect@100000 {
 			 <0x05 0x00000000 0x05 0x00000000 0x01 0x0000000>,
 			 <0x07 0x00000000 0x07 0x00000000 0x01 0x0000000>;
 
-		cbass_mcu: interconnect@28380000 {
+		cbass_mcu: bus@28380000 {
 			compatible = "simple-bus";
 			#address-cells = <2>;
 			#size-cells = <2>;
@@ -106,7 +106,7 @@ cbass_mcu: interconnect@28380000 {
 				 <0x05 0x00000000 0x05 0x00000000 0x01 0x0000000>, /* FSS OSPI0 data region 3*/
 				 <0x07 0x00000000 0x07 0x00000000 0x01 0x0000000>; /* FSS OSPI1 data region 3*/
 
-			cbass_wakeup: interconnect@42040000 {
+			cbass_wakeup: bus@42040000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
 				#size-cells = <1>;
-- 
2.26.0

