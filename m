Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE61EC433E4
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:22:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D07A420706
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:22:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="d4CUsOOn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgHYRWB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 13:22:01 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42812 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgHYRV7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 13:21:59 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07PHLtd4018062;
        Tue, 25 Aug 2020 12:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598376115;
        bh=34LfQFZeNzUori014wy/v8YDHQDiIMBJ0FHmgwYe0YE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=d4CUsOOnrs+/MJiyXEjxPV2sGJeHilZZirwvnscSWWyEtoPYT2WYNj0FDmlnrc945
         bPGwxr6kA8boprQh1Z4c8xw0rd3VbXvsEe3EiCtBuSzeYUNx9uVZ7tW0QpBHNFfv9M
         L74PFBJfIbbmZFvt9gXE/e8fQHSl1WA1ipggmdZo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07PHLt4v091494
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Aug 2020 12:21:55 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 12:21:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 12:21:54 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PHLsAS095745;
        Tue, 25 Aug 2020 12:21:54 -0500
Received: from localhost ([10.250.70.134])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 07PHLsUE098539;
        Tue, 25 Aug 2020 12:21:54 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 2/8] arm64: dts: ti: k3-j721e-main: Add C66x DSP nodes
Date:   Tue, 25 Aug 2020 12:21:39 -0500
Message-ID: <20200825172145.13186-3-s-anna@ti.com>
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

The J721E SoCs have two TMS320C66x DSP Core Subsystems (C66x CorePacs)
in the MAIN voltage domain, each with a C66x Fixed/Floating-Point DSP
Core, and 32 KB of L1P & L1D configurable SRAMs/Cache and an additional
288 KB of L2 configurable SRAM/Cache. These subsystems do not have
an MMU but contain a Region Address Translator (RAT) sub-module for
translating 32-bit processor addresses into larger bus addresses.
The inter-processor communication between the main A72 cores and
these processors is achieved through shared memory and Mailboxes.
Add the DT nodes for these DSP processor sub-systems in the common
k3-j721e-main.dtsi file.

The following firmware names are used by default for these cores, and
can be overridden in a board dts file if desired:
    C66x_0 DSP: j7-c66_0-fw
    C66x_1 DSP: j7-c66_1-fw

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: No changes
v1: https://patchwork.kernel.org/patch/11725349/

 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 12ceea9b3c9a..46cde2677e17 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -1326,4 +1326,30 @@ watchdog1: watchdog@2210000 {
 		assigned-clocks = <&k3_clks 253 1>;
 		assigned-clock-parents = <&k3_clks 253 5>;
 	};
+
+	c66_0: dsp@4d80800000 {
+		compatible = "ti,j721e-c66-dsp";
+		reg = <0x4d 0x80800000 0x00 0x00048000>,
+		      <0x4d 0x80e00000 0x00 0x00008000>,
+		      <0x4d 0x80f00000 0x00 0x00008000>;
+		reg-names = "l2sram", "l1pram", "l1dram";
+		ti,sci = <&dmsc>;
+		ti,sci-dev-id = <142>;
+		ti,sci-proc-ids = <0x03 0xff>;
+		resets = <&k3_reset 142 1>;
+		firmware-name = "j7-c66_0-fw";
+	};
+
+	c66_1: dsp@4d81800000 {
+		compatible = "ti,j721e-c66-dsp";
+		reg = <0x4d 0x81800000 0x00 0x00048000>,
+		      <0x4d 0x81e00000 0x00 0x00008000>,
+		      <0x4d 0x81f00000 0x00 0x00008000>;
+		reg-names = "l2sram", "l1pram", "l1dram";
+		ti,sci = <&dmsc>;
+		ti,sci-dev-id = <143>;
+		ti,sci-proc-ids = <0x04 0xff>;
+		resets = <&k3_reset 143 1>;
+		firmware-name = "j7-c66_1-fw";
+	};
 };
-- 
2.28.0

