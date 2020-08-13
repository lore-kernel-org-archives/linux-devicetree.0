Return-Path: <SRS0=2LfR=BX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9AAC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 01:29:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4540E2177B
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 01:29:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nl/nkQNk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgHMB3h (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 21:29:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57532 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgHMB3h (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 21:29:37 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90384B8F;
        Thu, 13 Aug 2020 03:29:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597282172;
        bh=woAdLeaWut9Feii2mcbA91smYDm6yZyJzi1SuLCiPMU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nl/nkQNkaUc3KpkMnAlsZvEhnpb5dZV4Qt65VSqq4zIFSmw6sk70NhCqsZVnTfVbd
         WPl+HjPcCR2xvDoAn49X0mE31aFx0AI+QtlQE6kZjzFYkGzLhe/Gs0tSvVYdOA0t5W
         2wG3ZKVhxFkF4SE+B4K+P45EjAWTLzl4+XxOLNRs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH 2/8] dt-bindings: display: mxsfb: Add and fix compatible strings
Date:   Thu, 13 Aug 2020 04:29:04 +0300
Message-Id: <20200813012910.13576-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Additional compatible strings have been added in DT source for the
i.MX6SL, i.MX6SLL, i.MX6UL and i.MX7D without updating the bindings.
Most of the upstream DT sources use the fsl,imx28-lcdif compatible
string, which mostly predates the realization that the LCDIF in the
i.MX6 and newer SoCs have extra features compared to the i.MX28.

Update the bindings to add the missing compatible strings, with the
correct fallback values. This fails to validate some of the upstream DT
sources. Instead of adding the incorrect compatible fallback to the
binding, the sources should be updated separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/display/mxsfb.yaml     | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/mxsfb.yaml
index 202381ec5bb7..ec6533b1d4a3 100644
--- a/Documentation/devicetree/bindings/display/mxsfb.yaml
+++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
@@ -15,11 +15,19 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - fsl,imx23-lcdif
-      - fsl,imx28-lcdif
-      - fsl,imx6sx-lcdif
-      - fsl,imx8mq-lcdif
+    oneOf:
+      - enum:
+          - fsl,imx23-lcdif
+          - fsl,imx28-lcdif
+          - fsl,imx6sx-lcdif
+      - items:
+        - enum:
+          - fsl,imx6sl-lcdif
+          - fsl,imx6sll-lcdif
+          - fsl,imx6ul-lcdif
+          - fsl,imx7d-lcdif
+          - fsl,imx8mq-lcdif
+        - const: fsl,imx6sx-lcdif
 
   reg:
     maxItems: 1
-- 
Regards,

Laurent Pinchart

