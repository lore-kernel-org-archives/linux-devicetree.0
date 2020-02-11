Return-Path: <SRS0=x5QR=37=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98928C352A3
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 12:26:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6BB50208C3
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 12:26:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728757AbgBKM0d (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Feb 2020 07:26:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:50184 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728560AbgBKM0c (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 11 Feb 2020 07:26:32 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C1CB6B0B7;
        Tue, 11 Feb 2020 12:26:31 +0000 (UTC)
From:   Nikolay Borisov <nborisov@suse.com>
To:     mripard@kernel.org, bjorn.andersson@linaro.org
Cc:     devicetree@vger.kernel.org, wens@csie.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v2 3/3] dt-bindings: hwlock: Document A64 hwspinlock bindings
Date:   Tue, 11 Feb 2020 14:26:24 +0200
Message-Id: <20200211122624.16484-4-nborisov@suse.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211122624.16484-1-nborisov@suse.com>
References: <20200211122624.16484-1-nborisov@suse.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add binding for the hwspinlock found on Allwinner A64 SoC.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 .../allwinner,sun50i-a64-hwspinlock.yaml      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/allwinner,sun50i-a64-hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/allwinner,sun50i-a64-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/allwinner,sun50i-a64-hwspinlock.yaml
new file mode 100644
index 000000000000..46bfff2541d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/allwinner,sun50i-a64-hwspinlock.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/allwinner,sun50i-a64-hwspinlock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A64 SoC Hardware Spinlock bindings
+
+maintainers:
+  - Nikolay Borisov <nborisov@suse.com>
+
+properties:
+  "#hwlock-cells":
+    const: 1
+
+  compatible:
+    const: allwinner,sun50i-a64-hwspinlock
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#hwlock-cells"
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    hwspinlock@1c18000 {
+        compatible = "allwinner,sun50i-a64-hwspinlock";
+        #hwlock-cells = <1>;
+        reg = <0x01c18000 0x1000>;
+        clocks = <&ccu CLK_BUS_SPINLOCK>;
+        resets = <&ccu RST_BUS_SPINLOCK>;
+    };
+
+...
-- 
2.17.1

