Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB51BC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:22:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABCF220706
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:22:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jH6gpVzg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbgHYRWD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 13:22:03 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34728 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgHYRWB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 13:22:01 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07PHLwpe106178;
        Tue, 25 Aug 2020 12:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598376118;
        bh=IzIG4vMp7vIYhRwizzvnQOn29NFC5YzGIFEqHqXnh44=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=jH6gpVzgjC5s5rvUcQ9qsMzGEvJ12VXuNYjBNMWLISin0g/HIwnPpqtxQJcaiFsTT
         SWRzLLbiMvfNKlbR6rhTpYPPUrEuEggqpHfOlEkCxdJ8ueOsOxcy+SNUWiUieeOKw6
         KcCHrAhsJZtjfR/wotjXFgQTy4zgZX61Ik+zFuKo=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07PHLwHs083352
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Aug 2020 12:21:58 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 12:21:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 12:21:57 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PHLvGm054258;
        Tue, 25 Aug 2020 12:21:57 -0500
Received: from localhost ([10.250.70.134])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 07PHLvKZ098602;
        Tue, 25 Aug 2020 12:21:57 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 5/8] arm64: dts: ti: k3-j721e-main: Add C71x DSP node
Date:   Tue, 25 Aug 2020 12:21:42 -0500
Message-ID: <20200825172145.13186-6-s-anna@ti.com>
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

The J721E SoCs have a single TMS320C71x DSP Subsystem in the MAIN
voltage domain containing the next-generation C711 CPU core. The
subsystem has 32 KB of L1D configurable SRAM/Cache and 512 KB of
L2 configurable SRAM/Cache. This subsystem has a CMMU but is not
used currently. The inter-processor communication between the main
A72 cores and the C711 processor is achieved through shared memory
and a Mailbox. Add the DT node for this DSP processor sub-system
in the common k3-j721e-main.dtsi file.

The following firmware name is used by default for the C71x core,
and can be overridden in a board dts file if desired:
    C71x_0 DSP: j7-c71_0-fw

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: No changes
v1: https://patchwork.kernel.org/patch/11725335/

 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 46cde2677e17..4ba5d356655a 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -1352,4 +1352,16 @@ c66_1: dsp@4d81800000 {
 		resets = <&k3_reset 143 1>;
 		firmware-name = "j7-c66_1-fw";
 	};
+
+	c71_0: dsp@64800000 {
+		compatible = "ti,j721e-c71-dsp";
+		reg = <0x00 0x64800000 0x00 0x00080000>,
+		      <0x00 0x64e00000 0x00 0x0000c000>;
+		reg-names = "l2sram", "l1dram";
+		ti,sci = <&dmsc>;
+		ti,sci-dev-id = <15>;
+		ti,sci-proc-ids = <0x30 0xff>;
+		resets = <&k3_reset 15 1>;
+		firmware-name = "j7-c71_0-fw";
+	};
 };
-- 
2.28.0

