Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6614C433E8
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 01:03:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9705D207DA
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 01:03:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UdPnw24s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgHTBDs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 21:03:48 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38750 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbgHTBDp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Aug 2020 21:03:45 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07K13gMs125158;
        Wed, 19 Aug 2020 20:03:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597885422;
        bh=fuqtcibFyfAnfIPJv9eRt9tO38sIyYu+EZMympBdU8I=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=UdPnw24s/7CfVlNOOPLX0WqQM2WRRlj8KyuF/mTTdAqqqyzLD7oKBsp3yTfuVW0Qv
         EEsSkSJ2JjlnDl6O3wSNfcGxEyf13mRVIjqBWWrxN3hlmK31EZqCw9E+60AZZEf+fP
         dAnLpazun1rWhNRu/EFVsA86de+9vG9u0dRRKZ5s=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07K13gfQ064989;
        Wed, 19 Aug 2020 20:03:42 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 19
 Aug 2020 20:03:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 19 Aug 2020 20:03:41 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07K13fQk121623;
        Wed, 19 Aug 2020 20:03:41 -0500
Received: from localhost ([10.250.32.29])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 07K13fiF022556;
        Wed, 19 Aug 2020 20:03:41 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 7/7] arm64: dts: ti: k3-j721e-som-p0: Reserve memory for IPC between RTOS cores
Date:   Wed, 19 Aug 2020 20:03:31 -0500
Message-ID: <20200820010331.2911-8-s-anna@ti.com>
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

Add a reserved memory node to reserve a portion of the DDR memory to be
used for performing inter-processor communication between all the remote
processors running RTOS on the TI J721E EVM boards. 28 MB of memory is
reserved for this purpose, and this accounts for all the vrings and vring
buffers between all the possible pairs of remote processors.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
index 600586cc22e5..d30a06248027 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
@@ -61,6 +61,12 @@ c71_0_memory_region: c71-memory@a8100000 {
 			reg = <0x00 0xa8100000 0x00 0xf00000>;
 			no-map;
 		};
+
+		rtos_ipc_memory_region: ipc-memories@aa000000 {
+			reg = <0x00 0xaa000000 0x00 0x01c00000>;
+			alignment = <0x1000>;
+			no-map;
+		};
 	};
 };
 
-- 
2.28.0

