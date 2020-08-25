Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82979C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:22:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66BBC2075F
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:22:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JSKVPPf5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgHYRWA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 13:22:00 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50676 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgHYRV7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 13:21:59 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07PHLuqe113662;
        Tue, 25 Aug 2020 12:21:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598376116;
        bh=5OaiYw+pS5rZMV16/EXNWa0mvYTbGYKEYu4I4eGyvE0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=JSKVPPf5azpBb83fj6x1Yk/1piqVN3dMXfKx5mhu6bRW+DDTFScqyBg9iqyebp2p+
         +2iEr5oYZlcLAWBHrAGgZzJZVmjY+slfK+p2svvjR5smsU0DUaKqijPkkaRq7VMapK
         kiJcB4U9XSGqg5Y9b7tK0UZD62BUklaSN557eEH0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07PHLuxQ103002
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Aug 2020 12:21:56 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 12:21:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 12:21:56 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PHLtRt074723;
        Tue, 25 Aug 2020 12:21:55 -0500
Received: from localhost ([10.250.70.134])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 07PHLtaX098582;
        Tue, 25 Aug 2020 12:21:55 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 3/8] arm64: dts: ti: k3-j721e-som-p0: Add mailboxes to C66x DSPs
Date:   Tue, 25 Aug 2020 12:21:40 -0500
Message-ID: <20200825172145.13186-4-s-anna@ti.com>
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

Add the required 'mboxes' property to both the C66x DSP processors for the
TI J721E common processor board. The mailboxes and some shared memory are
required for running the Remote Processor Messaging (RPMsg) stack between
the host processor and each of the DSPs. The nodes are therefore added
in the common k3-j721e-som-p0.dtsi file so that all of these can be
co-located.

The chosen sub-mailboxes match the values used in the current firmware
images. This can be changed, if needed, as per the system integration
needs after making appropriate changes on the firmware side as well.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2:
 - Moved the additions from board dts file to k3-j721e-som-p0.dtsi
 - Revised patch title and description
v1: https://patchwork.kernel.org/patch/11725343/

 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
index 44a7e03b60d8..20defa0530e5 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
@@ -165,3 +165,11 @@ &mailbox0_cluster10 {
 &mailbox0_cluster11 {
 	status = "disabled";
 };
+
+&c66_0 {
+	mboxes = <&mailbox0_cluster3 &mbox_c66_0>;
+};
+
+&c66_1 {
+	mboxes = <&mailbox0_cluster3 &mbox_c66_1>;
+};
-- 
2.28.0

