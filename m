Return-Path: <SRS0=YFsx=BV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A04C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Aug 2020 15:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6550C20782
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Aug 2020 15:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597160369;
	bh=VmvdbQ9cWYVA92XC3xkcdIMhDtn34LN8RdKKa0ECRfw=;
	h=From:To:Subject:Date:List-ID:From;
	b=q3hBcNgprE7CbOjffjldR77kzajQQwizFvdL6J6hJZNj1bMUxVHKugRN1HR59lp3S
	 qnwPc0V/gFgYKEzczxExkFnuermje0fhkhcMdgCrZ6gMIuJiPwcOVj+a/0C/T2ITbs
	 ZYF0xOmb1dDIyAj1+ozhVjkfPigi9LAD02xnhaY8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728859AbgHKPj2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Aug 2020 11:39:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:45592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728833AbgHKPj2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 11 Aug 2020 11:39:28 -0400
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E91AD2076C;
        Tue, 11 Aug 2020 15:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597160368;
        bh=VmvdbQ9cWYVA92XC3xkcdIMhDtn34LN8RdKKa0ECRfw=;
        h=From:To:Subject:Date:From;
        b=oGDCJrYn2pVSlNbaLzWIuKZihkTq342auOlw8Yu7M41JBXNQ1yS+XIJuCjjdgZviI
         vJc7+Tv4gz5SGsyuH+XoNXnOsf9fkUsX5p3gG3pUQ+XQinEx7HHD5OgMnANEv4GUw7
         olCwecgbMyOCv+MbPtcQRJPr07wx/mcpeW9+cGdo=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Li Yang <leoyang.li@nxp.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: arm: fsl: Add binding for Variscite VAR-SOM-MX8MM module
Date:   Tue, 11 Aug 2020 17:39:13 +0200
Message-Id: <20200811153916.5455-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a binding for the Variscite VAR-SOM-MX8MM System on Module.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index f63895c8ce2d..d8208aa56a3d 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -342,6 +342,7 @@ properties:
         items:
           - enum:
               - fsl,imx8mm-evk            # i.MX8MM EVK Board
+              - variscite,var-som-mx8mm   # i.MX8MM Variscite VAR-SOM-MX8MM module
           - const: fsl,imx8mm
 
       - description: i.MX8MN based Boards
-- 
2.17.1

