Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B09C3F68F
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 13:40:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8457A2464D
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 13:40:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729563AbfLENka (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 08:40:30 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:52668 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729423AbfLENka (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Dec 2019 08:40:30 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id aDgS2100T5USYZQ01DgSya; Thu, 05 Dec 2019 14:40:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrMo-00028O-Du; Thu, 05 Dec 2019 14:40:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrMo-0001dd-C3; Thu, 05 Dec 2019 14:40:26 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: i2c: sh_mobile: Document r8a77961 support
Date:   Thu,  5 Dec 2019 14:40:25 +0100
Message-Id: <20191205134025.6256-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Document support for the IIC controller in the Renesas R-Car M3-W+
(R8A77961) SoC.

No driver update is needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/i2c/renesas,iic.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,iic.txt b/Documentation/devicetree/bindings/i2c/renesas,iic.txt
index 64d11ffb07c47621..ffe085c9947e6703 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,iic.txt
+++ b/Documentation/devicetree/bindings/i2c/renesas,iic.txt
@@ -17,6 +17,7 @@ Required properties:
 			- "renesas,iic-r8a7794" (R-Car E2)
 			- "renesas,iic-r8a7795" (R-Car H3)
 			- "renesas,iic-r8a7796" (R-Car M3-W)
+			- "renesas,iic-r8a77961" (R-Car M3-W+)
 			- "renesas,iic-r8a77965" (R-Car M3-N)
 			- "renesas,iic-r8a77990" (R-Car E3)
 			- "renesas,iic-sh73a0" (SH-Mobile AG5)
-- 
2.17.1

