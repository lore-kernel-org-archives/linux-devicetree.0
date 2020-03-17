Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E49C5ACBF
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 13:11:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87CC420770
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 13:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584450682;
	bh=pe4+oVxzkBbUWOVCg2sqdaUiq9h3cFUY7h7UCxj0XZc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=H9Gp4izkV6J4kJZKMPw2o08VWWElFW4mrO2FOhBPE6m7FXaL3tUFD5qy+cgES2Gch
	 TbXcBUOE2j5PPVWfpRaqQmgjR8uK/fyipGilwCgEzbRAlYkiPDhawxbxQiO7q+mHTt
	 S011teZoGHdy4pk/nbPW+zt4oBFzNlwLRzvUpqgs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgCQNLU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 09:11:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:37800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726388AbgCQNK4 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 17 Mar 2020 09:10:56 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B55EC2076D;
        Tue, 17 Mar 2020 13:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584450655;
        bh=pe4+oVxzkBbUWOVCg2sqdaUiq9h3cFUY7h7UCxj0XZc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jN4g8WTPXYIHwVccXMavEsxS+P9PuBQwJ5iVchDS+FV9oq83AUIbvnlW9HXKI04kk
         BfqQ2isgEpFdCh4QOVF8TKkel7SA7H4C/vlQs1ABxvFISgmLiqKkhfxKq+93PUnsL5
         9q4NBOqvg7HmUTd0yMm50kZOfc1cLGm5m5LGqaao=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jEBzh-0006SA-ML; Tue, 17 Mar 2020 14:10:53 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 06/12] docs: dt: fix a broken reference to input.yaml
Date:   Tue, 17 Mar 2020 14:10:45 +0100
Message-Id: <5a10b58afa9ec03acaaddbd7668899da674dae15.1584450500.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1584450500.git.mchehab+huawei@kernel.org>
References: <cover.1584450500.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The old file was converted to yaml, but its reference was
still pointing to the old one.

Fixes: 7cef1079e3ad ("dt-bindings: input: Add common input binding in json-schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index 7f42cc37038e..623fedf12180 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -164,7 +164,7 @@ Required properties:
 - compatible: should be:
               "fsl,imx8qxp-sc-key"
               followed by "fsl,imx-sc-key";
-- linux,keycodes: See Documentation/devicetree/bindings/input/keys.txt
+- linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Thermal bindings based on SCU Message Protocol
 ------------------------------------------------------------
-- 
2.24.1

