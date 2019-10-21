Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7085CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 15:19:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D69020B7C
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 15:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571671140;
	bh=pZPt95h86j2DHhnebWftea1csHW0nl72tOQFiaF7e7s=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=h39T+sFlL6oVzUNRNXFi0VAY4d+fR1mGAFYmALZMyqjqfUEnHSmTCz9enstUQ0k5V
	 OGh2vygzP6p/q73fEsdGkE938h4xN50rd/bTr6aCGmRilYSbuZvMthUm/iZJMkWADh
	 bRgXbo9DXKH/vSPL680U4Q1MxIe6i1yyaaqyGlr8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfJUPTA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 11:19:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:32880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726289AbfJUPS7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 21 Oct 2019 11:18:59 -0400
Received: from localhost.localdomain (unknown [194.230.155.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 630512084B;
        Mon, 21 Oct 2019 15:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571671139;
        bh=pZPt95h86j2DHhnebWftea1csHW0nl72tOQFiaF7e7s=;
        h=From:To:Cc:Subject:Date:From;
        b=B+V5q5QOX1c1zdAcO+okPLxM00nUGbUp/oXP1f+mDySsn0k+0Oj7M+RxFdLWyYgpI
         l0d6LFMNu9gjvDJarn1j3+DhSHNH0rV6RQmhvYtfi/9UtpTeac83PnxpulmStAiFE6
         kUjEzAZSQjPsWvX23l+UNISYTzMdxvnP40evQXJM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] dt-bindings: display: st,stm32-dsi: Fix white spaces
Date:   Mon, 21 Oct 2019 17:18:47 +0200
Message-Id: <20191021151847.13891-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Remove unneeded indentation in blank line and space at end of line.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/display/st,stm32-dsi.yaml  | 2 +-
 Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
index de6c99198cbe..3be76d15bf6c 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
@@ -108,7 +108,7 @@ examples:
         resets = <&rcc DSI_R>;
         reset-names = "apb";
         phy-dsi-supply = <&reg18>;
-        
+
         #address-cells = <1>;
         #size-cells = <0>;
 
diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
index a40197ab281e..bf8ad916e9b0 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
@@ -37,7 +37,7 @@ properties:
   port:
     type: object
     description:
-      "Video port for DPI RGB output. 
+      "Video port for DPI RGB output.
       ltdc has one video port with up to 2 endpoints:
       - for external dpi rgb panel or bridge, using gpios.
       - for internal dpi input of the MIPI DSI host controller.
-- 
2.17.1

