Return-Path: <SRS0=gpjL=32=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB8CC33CAC
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 11:33:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5010421927
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 11:33:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgBFLdm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Feb 2020 06:33:42 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:37589 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbgBFLdl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Feb 2020 06:33:41 -0500
Received: from [5.158.153.53] (helo=adam.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
        (Exim 4.80)
        (envelope-from <bage@linutronix.de>)
        id 1izfPf-0001yw-KZ; Thu, 06 Feb 2020 12:33:39 +0100
From:   bage@linutronix.de
To:     devicetree@vger.kernel.org
Cc:     Bastian Germann <bage@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 2/5] dt-bindings: arm: sunxi: Add Linutronix Testbox
Date:   Thu,  6 Feb 2020 12:33:24 +0100
Message-Id: <20200206113328.7296-3-bage@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200206113328.7296-1-bage@linutronix.de>
References: <20200206113328.7296-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bastian Germann <bage@linutronix.de>

Add device tree bindings for the newly added Linutronix Testbox board.

Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index cffe8bb0bad1..5ee10e3f84c8 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -384,6 +384,12 @@ properties:
           - const: linksprite,pcduino3-nano
           - const: allwinner,sun7i-a20
 
+      - description: Linutronix Testbox v2
+        items:
+          - const: lx,testbox-v2
+          - const: lamobo,lamobo-r1
+          - const: allwinner,sun7i-a20
+
       - description: HAOYU Electronics Marsboard A10
         items:
           - const: haoyu,a10-marsboard
-- 
2.20.1

