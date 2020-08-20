Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E44EC433E3
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 01:03:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E281F207DA
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 01:03:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GGDXnS0C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgHTBDq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 21:03:46 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55234 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgHTBDn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Aug 2020 21:03:43 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07K13e4U102217;
        Wed, 19 Aug 2020 20:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597885420;
        bh=THQfeBxY92kDWYrbowz3/IUcWuwMJ+A9ORUD/A2BHQE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GGDXnS0CPPfGyb6faqq12zT9p8U+OKnhUnE/2LNaU1jS88ndCAFXpo1A/apx5zN7a
         st0BUero+SRPRU6/6qffikKEhWEmdiP443NWdPQ0BbUE3kgO+9LX2Dz+Nbqh2rkole
         yA6sKUC8FrG1jIrfTxyZfVDx22t8BSw+X0vj/vFQ=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07K13eV5097690
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 19 Aug 2020 20:03:40 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 19
 Aug 2020 20:03:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 19 Aug 2020 20:03:40 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07K13eec075359;
        Wed, 19 Aug 2020 20:03:40 -0500
Received: from localhost ([10.250.32.29])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 07K13dtq022547;
        Wed, 19 Aug 2020 20:03:40 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 5/7] arm64: dts: ti: k3-j721e-common-proc-board: Add mailboxes to C71x DSP
Date:   Wed, 19 Aug 2020 20:03:29 -0500
Message-ID: <20200820010331.2911-6-s-anna@ti.com>
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

Add the required 'mboxes' property to the C71x DSP processor on the TI
J721E common processor board. The mailboxes and some shared memory are
required for running the Remote Processor Messaging (RPMsg) stack between
the host processor and each of the R5Fs. The chosen sub-mailboxes match
the values used in the current firmware images. This can be changed,
if needed, as per the system integration needs after making appropriate
changes on the firmware side as well.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index ff541dc09eca..acdae1f260a2 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -387,6 +387,10 @@ &c66_1 {
 	mboxes = <&mailbox0_cluster3 &mbox_c66_1>;
 };
 
+&c71_0 {
+	mboxes = <&mailbox0_cluster4 &mbox_c71_0>;
+};
+
 &main_sdhci0 {
 	/* eMMC */
 	non-removable;
-- 
2.28.0

