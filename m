Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9B0C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 16:03:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79FB522B3F
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 16:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598285039;
	bh=Jfwa0GB0ZLb8gVwHhi0OjtkS/JePmX7U96zqz3dMCNQ=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=uNCDhCIt20lUdv5vqd8RYs4vtyFwfEbMXV1DCoJkl5VWz4TucS9TnGsNVNLLpUkW4
	 cF9nmL7cwtSqr2ol29oy8dRHCkyk3H9oxuXlxYfLWM8xef+OepYUA0+GDtks5N5tXE
	 41pyTQNc+yFreUSjM0D/XPfaGOrE5Uifur4U1CeM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727878AbgHXQD5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 12:03:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:45574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726839AbgHXQDG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 24 Aug 2020 12:03:06 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1E272078D;
        Mon, 24 Aug 2020 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598284985;
        bh=Jfwa0GB0ZLb8gVwHhi0OjtkS/JePmX7U96zqz3dMCNQ=;
        h=From:To:Cc:Subject:Date:From;
        b=OhTOn4a/3Z22BtiPvAgQujCHYAQCaXUgiUwSedfvwlHfy+ll+OpV61OJOfGZRJ64h
         5KgfMUuBCL7uonYq9jOsYo6IZRNC4bviKBdHSWEMnSSIsT7wG7XQddalpVd9H1SbiT
         EJzmMoscPPjeBCUsFI2tnKUvmVVD3k33+1HSRM34=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 1/4] dt-bindings: arm: fsl: Add binding for Variscite VAR-SOM-MX8MM module
Date:   Mon, 24 Aug 2020 18:02:44 +0200
Message-Id: <20200824160247.19032-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a binding for the Variscite VAR-SOM-MX8MM System on Module.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Based on top of:
https://lore.kernel.org/linux-arm-kernel/20200823172019.18606-1-krzk@kernel.org/

Changes since v1:
1. None
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b48dbf924cfe..39f3a3d5f524 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -346,6 +346,7 @@ properties:
           - enum:
               - beacon,imx8mm-beacon-kit  # i.MX8MM Beacon Development Kit
               - fsl,imx8mm-evk            # i.MX8MM EVK Board
+              - variscite,var-som-mx8mm   # i.MX8MM Variscite VAR-SOM-MX8MM module
           - const: fsl,imx8mm
 
       - description: i.MX8MN based Boards
-- 
2.17.1

