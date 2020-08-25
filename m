Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D1BC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:22:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88A0F20706
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:22:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="w+Eyduju"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgHYRWB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 13:22:01 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42818 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHYRWA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 13:22:00 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07PHLvJr018072;
        Tue, 25 Aug 2020 12:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598376117;
        bh=mJj3AaAvho5XB6p/+WkoqC8cKpgemXyFul/fTt/vUeY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=w+EydujuNpDmEveOSi9NHJasmMeTMIRJGRXyT+h3s0fSbhnw3QOccX7iGyUThp9Wc
         34/dBySWfkZTuMrFA2aWd6wFRvFXPxzdvj5iRtDs0srELWpIgoT4lewAvnyMjvqEGV
         EzA2ak5b8wdXIN5WvZmTmB6HMoOv9xfTIjhZV4n4=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07PHLvgQ083342
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Aug 2020 12:21:57 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 12:21:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 12:21:56 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PHLuFM095768;
        Tue, 25 Aug 2020 12:21:56 -0500
Received: from localhost ([10.250.70.134])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 07PHLuRk098598;
        Tue, 25 Aug 2020 12:21:56 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 4/8] arm64: dts: ti: k3-j721e-som-p0: Add DDR carveout memory nodes for C66 DSPs
Date:   Tue, 25 Aug 2020 12:21:41 -0500
Message-ID: <20200825172145.13186-5-s-anna@ti.com>
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

Two carveout reserved memory nodes each have been added for each of the
C66x DSP remote processor devices present within the MAIN voltage domain
for the TI J721E EVM boards. These nodes are assigned to the respective
rproc device nodes as well. The first region will be used as the DMA pool
for the rproc devices, and the second region will furnish the static
carveout regions for the firmware memory.

The minimum granularity on the Cache settings on C66x DSP cores is 16 MB,
so the DMA memory regions are chosen such that they are in separate 16 MB
regions for each DSP, while reserving a total of 16 MB for each DSP and
not changing the overall DSP remoteproc carveouts.

The current carveout addresses and sizes are defined statically for each
device. The C66x DSP processors do not have an MMU, and as such require the
exact memory used by the firmwares to be set-aside. The firmware images
do not require any RSC_CARVEOUT entries in their resource tables to
allocate the memory for firmware memory segments.

The reserved memory nodes can be disabled later on if there is no use-case
defined to use the corresponding remote processor.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: Rebased version, memory-region property added to existing nodes
v1: https://patchwork.kernel.org/patch/11725339/

 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi | 28 +++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
index 20defa0530e5..eeffaf9bf471 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
@@ -25,6 +25,30 @@ secure_ddr: optee@9e800000 {
 			alignment = <0x1000>;
 			no-map;
 		};
+
+		c66_1_dma_memory_region: c66-dma-memory@a6000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa6000000 0x00 0x100000>;
+			no-map;
+		};
+
+		c66_0_memory_region: c66-memory@a6100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa6100000 0x00 0xf00000>;
+			no-map;
+		};
+
+		c66_0_dma_memory_region: c66-dma-memory@a7000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa7000000 0x00 0x100000>;
+			no-map;
+		};
+
+		c66_1_memory_region: c66-memory@a7100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa7100000 0x00 0xf00000>;
+			no-map;
+		};
 	};
 };
 
@@ -168,8 +192,12 @@ &mailbox0_cluster11 {
 
 &c66_0 {
 	mboxes = <&mailbox0_cluster3 &mbox_c66_0>;
+	memory-region = <&c66_0_dma_memory_region>,
+			<&c66_0_memory_region>;
 };
 
 &c66_1 {
 	mboxes = <&mailbox0_cluster3 &mbox_c66_1>;
+	memory-region = <&c66_1_dma_memory_region>,
+			<&c66_1_memory_region>;
 };
-- 
2.28.0

