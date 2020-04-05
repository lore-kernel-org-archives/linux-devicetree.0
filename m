Return-Path: <SRS0=YuQm=5V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F6FC2BA15
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Apr 2020 17:10:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7458720659
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Apr 2020 17:10:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgDERK5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 5 Apr 2020 13:10:57 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:30015 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgDERK5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 5 Apr 2020 13:10:57 -0400
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB526NfqU="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id u043b8w35HAoxim
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 5 Apr 2020 19:10:50 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/2] dt-bindings: mms114: document melfas,mms345l binding
Date:   Sun,  5 Apr 2020 19:09:04 +0200
Message-Id: <20200405170904.61512-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200405170904.61512-1-stephan@gerhold.net>
References: <20200405170904.61512-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The mms114 driver now supports MMS345L; document the
melfas,mms345l binding that is used for it.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Andi Shyti <andi@etezian.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2:
  - Pick up review tags

v1: https://patchwork.kernel.org/patch/11178503/
---
 Documentation/devicetree/bindings/input/touchscreen/mms114.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/mms114.txt b/Documentation/devicetree/bindings/input/touchscreen/mms114.txt
index 2cd954051d29..707234cfd7e6 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/mms114.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/mms114.txt
@@ -1,9 +1,10 @@
-* MELFAS MMS114/MMS152 touchscreen controller
+* MELFAS MMS114/MMS152/MMS345L touchscreen controller
 
 Required properties:
 - compatible: should be one of:
 	- "melfas,mms114"
 	- "melfas,mms152"
+	- "melfas,mms345l"
 - reg: I2C address of the chip
 - interrupts: interrupt to which the chip is connected
 - touchscreen-size-x: See [1]
-- 
2.26.0

