Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0E9C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 01:03:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8219E207DA
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 01:03:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="R/yWMebw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgHTBDr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 21:03:47 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36460 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgHTBDo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Aug 2020 21:03:44 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07K13fVr119179;
        Wed, 19 Aug 2020 20:03:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597885421;
        bh=x0k8xeCLis1DyQpNBVsG18vcpLEXm4cK+kWAkYgyze4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=R/yWMebwTAGUKdeOWocphXI891aoU0g0W8rX5LrPJ+JWms1BTsrBAgWjcWQuEcRaV
         FHmGhucSXtCJd1u5CF7miEnrEgFJ3T9+d6qydo6ykSKaVsTp91OClnEau+QZTNO6ZP
         IYqxQPG73xsDVTupVfg5YvJmioebI3CzCrrfOCtc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07K13fej115766
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 19 Aug 2020 20:03:41 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 19
 Aug 2020 20:03:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 19 Aug 2020 20:03:40 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07K13eDJ009804;
        Wed, 19 Aug 2020 20:03:40 -0500
Received: from localhost ([10.250.32.29])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 07K13e84022551;
        Wed, 19 Aug 2020 20:03:40 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 6/7] arm64: dts: ti: k3-j721e-som-p0: Add DDR carveout memory nodes for C71x DSP
Date:   Wed, 19 Aug 2020 20:03:30 -0500
Message-ID: <20200820010331.2911-7-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820010331.2911-1-s-anna@ti.com>
References: <20200820010331.2911-1-s-anna@ti.com>
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
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
index f1a8190e3b5a..600586cc22e5 100644
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
 
@@ -106,3 +118,8 @@ &c66_1 {
 	memory-region = <&c66_1_dma_memory_region>,
 			<&c66_1_memory_region>;
 };
+
+&c71_0 {
+	memory-region = <&c71_0_dma_memory_region>,
+			<&c71_0_memory_region>;
+};
-- 
2.28.0

