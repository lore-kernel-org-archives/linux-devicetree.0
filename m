Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4988C433E4
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 01:03:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74001207FB
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 01:03:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kdz17yaM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgHTBDp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 21:03:45 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45442 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbgHTBDm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Aug 2020 21:03:42 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07K13cEC053563;
        Wed, 19 Aug 2020 20:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597885418;
        bh=WOzi/0IGVTVWFmjd5KggPQLL88A+j8XkzXr6Lfyzh2U=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=kdz17yaMsIkEaL9NzGWXZzJDP9acgD7HoA7GHLB56Th60TstrBsvHsFJOXyVfsNdg
         baWgYnEkI3DQOXh2vZLsfJVj7DqUI+eZPmT7D0PcIFqq6m8Qna7Pzp72Qjv9pC1YZu
         Xss1zpKPmz81ECoaGsaP/IVFsT+qWFmvNAMW+9IQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07K13cER097661
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 19 Aug 2020 20:03:38 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 19
 Aug 2020 20:03:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 19 Aug 2020 20:03:37 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07K13bhm011203;
        Wed, 19 Aug 2020 20:03:37 -0500
Received: from localhost ([10.250.32.29])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 07K13b3e022533;
        Wed, 19 Aug 2020 20:03:37 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/7] arm64: dts: ti: k3-j721e-common-proc-board: Add mailboxes to C66x DSPs
Date:   Wed, 19 Aug 2020 20:03:26 -0500
Message-ID: <20200820010331.2911-3-s-anna@ti.com>
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

Add the required 'mboxes' property to both the C66x DSP processors on the
TI J721E common processor board. The mailboxes and some shared memory
are required for running the Remote Processor Messaging (RPMsg) stack
between the host processor and each of the R5Fs. The chosen sub-mailboxes
match the values used in the current firmware images. This can be changed,
if needed, as per the system integration needs after making appropriate
changes on the firmware side as well.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index e8fc01d97ada..ff541dc09eca 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -379,6 +379,14 @@ &mailbox0_cluster11 {
 	status = "disabled";
 };
 
+&c66_0 {
+	mboxes = <&mailbox0_cluster3 &mbox_c66_0>;
+};
+
+&c66_1 {
+	mboxes = <&mailbox0_cluster3 &mbox_c66_1>;
+};
+
 &main_sdhci0 {
 	/* eMMC */
 	non-removable;
-- 
2.28.0

