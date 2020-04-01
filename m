Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF33DC2D0F3
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 14:15:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B42A920705
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 14:15:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20150623.gappssmtp.com header.i=@nigauri-org.20150623.gappssmtp.com header.b="H+s+nfy/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733001AbgDAOPM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Apr 2020 10:15:12 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33265 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732854AbgDAOPK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Apr 2020 10:15:10 -0400
Received: by mail-pl1-f195.google.com with SMTP id ay1so42230plb.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2020 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LEOmiIfnZf4UuskndEqwJK0t3v/ejJbeSlL/pR1DNyY=;
        b=H+s+nfy/mK20JNRHDfxWOWd+Eu1wky61/AsKXrnLiemzPhc0oG6THAVOQLhUN4ezbU
         nLEkYb1P6HSIMGxNNd8MvbzSKzDUqxlYLqbyoV6XGa+QcAdrl/DXnGVMdq7q947FyYju
         o6rdjgCKc7fpUgxjE7KHoGgd1tZOZcQuIA7k22VU0kDUPBs4IIpg+BCy9qW/uiN9fUSa
         54oEd2DXtNwycXx4WJouzTnOWNnvm1dry7hX8MsulEJU9xGBxDN4D1muHElbWFsme9KR
         XlVYMCrHajBoqBUDV4egDmJnWUZ3/p8j9W4JV1xK8bdnzNYzN9VdFbBfAeWsVt5wv5Lq
         QQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LEOmiIfnZf4UuskndEqwJK0t3v/ejJbeSlL/pR1DNyY=;
        b=oIWdMQbAhI/TpQIuPiHu//4MxSCMkldLDIS2wxJzY9oLI5qkwFc4G0GraY6vDsHboJ
         t/5rRsco83LB48XTvfoDMMGBPIaAWBTI7F2/+fbXbNfcanHUpiDpKd9SM6Clmdz6iUMa
         Zs6N16ipMqZOm8NWLK6MtYCyg5oHc/9dS9twyRwtmZsCyRsg/jgjjgIQh+D7iy+7H1aX
         3YLL2uvaE6xlVErJzwM/L28IFdefRNrsvbNdMEAduaFu8x4uAZAKWVhS5vOCTB5hQYI3
         Mk4yeIqguFRjLSkuu9cszB0BBdkwzzKoMTwxFfwX0q5i030wUlPxGvwnm+lBroE2RJuE
         Ie4g==
X-Gm-Message-State: AGi0PuaplvSJ392hlVO7P/SLsNFhcG9psfp3erUmwEeTHRh3Gqa2iELg
        cwtapT0lEe9ozsfvDhN3qt+l5x6a2w==
X-Google-Smtp-Source: APiQypLNOzalB+9BmXgPPToTEm9YjtpcDjXL+lQ7eO0oK9Emyww38AV+GlPIy2FJZ++aU4Ft04axJA==
X-Received: by 2002:a17:90b:1888:: with SMTP id mn8mr5243859pjb.115.1585750509254;
        Wed, 01 Apr 2020 07:15:09 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:bf52:1f8e:88d2:6ec])
        by smtp.gmail.com with ESMTPSA id r59sm1805406pjb.45.2020.04.01.07.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 07:15:08 -0700 (PDT)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     devicetree@vger.kernel.org
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] dt-bindings: timer: cadence_ttc: Migrate timer-cadence-ttc documentation to YAML
Date:   Wed,  1 Apr 2020 23:14:49 +0900
Message-Id: <20200401141449.66905-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The document was migrated to YAML format and renamed cdns,ttc.yaml.
And updated the example to the latest format.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 .../bindings/timer/cadence,ttc-timer.txt      | 21 --------
 .../devicetree/bindings/timer/cdns,ttc.yaml   | 48 +++++++++++++++++++
 2 files changed, 48 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/cdns,ttc.yaml

diff --git a/Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt b/Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt
deleted file mode 100644
index eeee6cd51e5ce..0000000000000
--- a/Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Cadence TTC - Triple Timer Counter
-
-Required properties:
-- compatible : Should be "cdns,ttc".
-- reg : Specifies base physical address and size of the registers.
-- interrupts : A list of 3 interrupts; one per timer channel.
-- clocks: phandle to the source clock
-
-Optional properties:
-- timer-width: Bit width of the timer, necessary if not 16.
-
-Example:
-
-ttc0: ttc0@f8001000 {
-	interrupt-parent = <&intc>;
-	interrupts = < 0 10 4 0 11 4 0 12 4 >;
-	compatible = "cdns,ttc";
-	reg = <0xF8001000 0x1000>;
-	clocks = <&cpu_clk 3>;
-	timer-width = <32>;
-};
diff --git a/Documentation/devicetree/bindings/timer/cdns,ttc.yaml b/Documentation/devicetree/bindings/timer/cdns,ttc.yaml
new file mode 100644
index 0000000000000..c532b60b9c631
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/cdns,ttc.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/cdns,ttc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence TTC - Triple Timer Counter
+
+maintainers:
+  - Michal Simek <michal.simek@xilinx.com>
+
+properties:
+  compatible:
+    const: cdns,ttc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 3
+    maxItems: 3
+    description: |
+      A list of 3 interrupts; one per timer channel.
+
+  clocks:
+    maxItems: 1
+
+  timer-width:
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    description: |
+      Bit width of the timer, necessary if not 16.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    ttc0: ttc0@f8001000 {
+        interrupt-parent = <&intc>;
+        interrupts = <0 10 4>, <0 11 4>, <0 12 4>;
+        compatible = "cdns,ttc";
+        reg = <0xF8001000 0x1000>;
+        clocks = <&cpu_clk 3>;
+        timer-width = <32>;
+    };
-- 
2.26.0

