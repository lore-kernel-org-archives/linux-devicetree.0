Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67B7C3B196
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 11:10:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D96724649
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 11:10:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbgBNLKn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 06:10:43 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:54328 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729089AbgBNLKm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 06:10:42 -0500
Received: from [5.158.153.55] (helo=adam.guests.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
        (Exim 4.80)
        (envelope-from <bage@linutronix.de>)
        id 1j2Yro-00043V-Lg; Fri, 14 Feb 2020 12:10:40 +0100
From:   bage@linutronix.de
To:     devicetree@vger.kernel.org
Cc:     Bastian Germann <bage@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Benedikt Spranger <b.spranger@linutronix.de>
Subject: [PATCH v2 1/3] dt-bindings: Add vendor prefix for Linutronix
Date:   Fri, 14 Feb 2020 12:10:01 +0100
Message-Id: <20200214111003.11115-2-bage@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214111003.11115-1-bage@linutronix.de>
References: <20200206113328.7296-1-bage@linutronix.de>
 <20200214111003.11115-1-bage@linutronix.de>
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

Add a vendor prefix for Linutronix GmbH.
Website: https://linutronix.de/

Co-developed-by: Benedikt Spranger <b.spranger@linutronix.de>
Signed-off-by: Benedikt Spranger <b.spranger@linutronix.de>
Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9e67944bec9c..8d4462f85a00 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -545,6 +545,8 @@ patternProperties:
     description: LinkSprite Technologies, Inc.
   "^linksys,.*":
     description: Belkin International, Inc. (Linksys)
+  "^linutronix,.*":
+    description: Linutronix GmbH
   "^linux,.*":
     description: Linux-specific binding
   "^linx,.*":
-- 
2.20.1

