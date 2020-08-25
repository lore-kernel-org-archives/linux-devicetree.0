Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04117C433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:22:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD4CC20706
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:22:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Hc38eVhJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbgHYRWH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 13:22:07 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48982 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgHYRWE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 13:22:04 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07PHLxwh076703;
        Tue, 25 Aug 2020 12:21:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598376119;
        bh=GaENPEf7820KhBwhXKq0TWishE5d8TM83FEgSVYRXfA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Hc38eVhJ1iQ5f73VKROlxyPA6E+JjlKk14unhanyE6mD8ledrTC+rooP/KPEtGwIK
         W7ZFw8e47bNPf3IP+dEqR5TWVCUMDiWBkqqCN0x17iyfJOaeOl4J13mgwuw3T+3aC3
         S/tfEhut1ivpSYyLWdGjtZiGAcmEWDfEjXM6FMMY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07PHLxoM083380
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Aug 2020 12:21:59 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 12:21:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 12:21:59 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PHLxs4074769;
        Tue, 25 Aug 2020 12:21:59 -0500
Received: from localhost ([10.250.70.134])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 07PHLxeb098614;
        Tue, 25 Aug 2020 12:21:59 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 7/8] arm64: dts: ti: k3-j721e-som-p0: Add DDR carveout memory nodes for C71x DSP
Date:   Tue, 25 Aug 2020 12:21:44 -0500
Message-ID: <20200825172145.13186-8-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825172145.13186-1-s-anna@ti.com>
References: <20200825172145.13186-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Two carveout reserved memory nodes have been added for the lone C71x DSP
remote processor device present within the MAIN voltage domain for the TI
J721E EVM boards. These nodes are assigned to the respective rproc device
node as well. The first region will be used as the DMA pool for the rproc
device, and the second region will furnish the static carveout regions for
the firmware memory.

The current carveout addresses and sizes are defined statically for each
device. The C71x DSP processor does support a MMU called CMMU, but is not
currently supported and as such requires the exact memory used by the
firmware to be set-aside. The firmware images currently do not need any
RSC_CARVEOUT entries either in their resource tables to allocate the
memory for firmware memory segments.

The reserved memory nodes can be disabled later on if there is no use-case
defined to use the C71x DSP remoteproc processor.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: Rebased version, memory-region property added to existing nodes
v1: https://patchwork.kernel.org/patch/11725337/

 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
index bb37651a0014..0e28be492ac2 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
@@ -49,6 +49,18 @@ c66_1_memory_region: c66-memory@a7100000 {
 			reg = <0x00 0xa7100000 0x00 0xf00000>;
 			no-map;
 		};
+
+		c71_0_dma_memory_region: c71-dma-memory@a8000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa8000000 0x00 0x100000>;
+			no-map;
+		};
+
+		c71_0_memory_region: c71-memory@a8100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa8100000 0x00 0xf00000>;
+			no-map;
+		};
 	};
 };
 
@@ -204,4 +216,6 @@ &c66_1 {
 
 &c71_0 {
 	mboxes = <&mailbox0_cluster4 &mbox_c71_0>;
+	memory-region = <&c71_0_dma_memory_region>,
+			<&c71_0_memory_region>;
 };
-- 
2.28.0

