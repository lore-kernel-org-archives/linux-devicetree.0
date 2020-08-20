Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB92C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 01:03:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 416A9207FB
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 01:03:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="X9VPJoI8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgHTBDm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 21:03:42 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38738 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgHTBDl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Aug 2020 21:03:41 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07K13bXQ125136;
        Wed, 19 Aug 2020 20:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597885417;
        bh=HvcrdTewTyLrfnvj3w3sPW4V02Y3+YOtzRBAp/3q3dU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=X9VPJoI8POPKJ2V5CNy6TEFSywGuN9597n0MJgM6oPol3kG7M/resz+O18/bnNvRG
         ROI0d1a0BgMjFjz83lwquLBsAnqkXj2PbV3YP7O4H+KuwKVE59B1bZN3bPkPTfsI/r
         C0UioV1MQ1c/WFBNnEj2DqHeSsAfl+uF8ZWPQrOI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07K13bKq115722
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 19 Aug 2020 20:03:37 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 19
 Aug 2020 20:03:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 19 Aug 2020 20:03:37 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07K13beB075329;
        Wed, 19 Aug 2020 20:03:37 -0500
Received: from localhost ([10.250.32.29])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 07K13au7022528;
        Wed, 19 Aug 2020 20:03:37 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/7] arm64: dts: ti: k3-j721e-main: Add C66x DSP nodes
Date:   Wed, 19 Aug 2020 20:03:25 -0500
Message-ID: <20200820010331.2911-2-s-anna@ti.com>
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

