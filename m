Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29624C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:22:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05C942076C
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:22:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Z+eSuKqG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgHYRWI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 13:22:08 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34742 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgHYRWE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 13:22:04 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07PHM0KN106195;
        Tue, 25 Aug 2020 12:22:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598376120;
        bh=8BlAbogxUh4L5xld/guoACIkEBpgim3x52fTL7GwpSw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Z+eSuKqGcwnBVJPWy+Nf3VBbpGil+BrLeAIAnW+93vtdR1xEoQ2WHNSMbk39Bgc00
         YcBYjz4XqV+y0hIoP7McvK+ny8OrHcQBDJ7QQbzpoK28rM3SXKibsoILRZyN51mF+k
         P3nS2xEnDNL1KfVyRFS3a8F4uXVt8t6Lq3Lqd9ys=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07PHM0OR083400
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Aug 2020 12:22:00 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 12:22:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 12:22:00 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PHM06R074787;
        Tue, 25 Aug 2020 12:22:00 -0500
Received: from localhost ([10.250.70.134])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 07PHM0lp098619;
        Tue, 25 Aug 2020 12:22:00 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 8/8] arm64: dts: ti: k3-j721e-som-p0: Reserve memory for IPC between RTOS cores
Date:   Tue, 25 Aug 2020 12:21:45 -0500
Message-ID: <20200825172145.13186-9-s-anna@ti.com>
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

Add a reserved memory node to reserve a portion of the DDR memory to be
used for performing inter-processor communication between all the remote
processors running RTOS on the TI J721E EVM boards. 28 MB of memory is
reserved for this purpose, and this accounts for all the vrings and vring
buffers between all the possible pairs of remote processors.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: No changes
v1: https://patchwork.kernel.org/patch/11725341/

 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
index 0e28be492ac2..d69d90c8b5e3 100644
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

