Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338BAC3B185
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 09:27:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05AB521739
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 09:27:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/RqvAgW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgBJJ1h (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 04:27:37 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46217 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbgBJJ1h (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 04:27:37 -0500
Received: by mail-lf1-f66.google.com with SMTP id z26so3622271lfg.13
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 01:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jAkaYaS1dWjwotJL6Ekax5c9MO/wRSZYk2j1/gM/YaQ=;
        b=e/RqvAgWE9raJPkliN8umOw06eNe7EOMSAJLg1J0mGXZ4TRpDe/nyACa4AwrABj4sG
         hHBgUdaRp0G9LUnjcXJdO5KF/30+uphZZYi5L7W6jKksZCZiwNECA+l7uXIQA0BXQb5L
         MQCI9/xxvZqyaRHrtVHkopKDhkLtkzMypKcyMSnm/RBZMqmb17wwprWoB+rVRnuhhPcZ
         H8LUxbauOEEFKK5Q7ROkXYOdIVwl7p39mkMGd5hykTXpo4kfMxZR0Yck72/9ZaG2F8vc
         xdCV+bBkE049TmXTFfelvyf55hGlbD1lUYQ2Em1xmYNmmarOGxav6xA4TlqhCQ4ebJ6W
         rQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jAkaYaS1dWjwotJL6Ekax5c9MO/wRSZYk2j1/gM/YaQ=;
        b=T31U+e6SzjnatYcpivKIbGFanAf8q1l9Tf5xJjJ53qiU3Z8ym4tylQwbktON7yZ1CP
         6bqQfZfIyBgoBMH8WsgCvqTpEioa02cnzogQr32XTI+ILgfFO0ycGA9ezG6QVihr6VG2
         1Ehv/mKh79J8glKM44sLa6l9ahTJqdEybFhPG4ERtaC1YPJjKoPIl1xcwTDHErHyqw4f
         NvRGgLBwSlepKrdZrwzElBvQTqRJOITZ2wTxQLzOaavnGV1+GPzUFsnxdUUGWiJlAxOz
         DfTginf+dW42aODSVapWJ6c2SXwvjX0BcEs65kDr5hCYbBu2uRY3bEkJJfMrfQLLcZIq
         EROQ==
X-Gm-Message-State: APjAAAU+/SV+zj8DFdG1ElqKSb+lUtv+1nCbiSNkoP3hWY1TN47E51Qt
        LjGbnqjQy1T9khdu61uXhlZJ7wVKR8c=
X-Google-Smtp-Source: APXvYqzoiljqCocVevGzEspn0FFdQcd+EWibgTR+iXw11ag1cVDxjNin8zY+APNspo2m/9p35xPkCg==
X-Received: by 2002:a05:6512:3ac:: with SMTP id v12mr260046lfp.205.1581326855205;
        Mon, 10 Feb 2020 01:27:35 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id d9sm5989882lja.73.2020.02.10.01.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 01:27:34 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 6/7] dt-bindings: arm: Add Versatile Express and Juno YAML schema
Date:   Mon, 10 Feb 2020 10:27:12 +0100
Message-Id: <20200210092713.279105-7-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200210092713.279105-1-linus.walleij@linaro.org>
References: <20200210092713.279105-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This implements the top-level schema for the ARM Versatile
Express and Juno platforms.

Cc: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/arm/arm,vexpress-juno.yaml       | 118 ++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml

diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
new file mode 100644
index 000000000000..f22edf66b622
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Versatile Express and Juno Boards Device Tree Bindings
+
+maintainers:
+  - Sudeep Holla <sudeep.holla@arm.com>
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |+
+  ARM's Versatile Express platform were built as reference designs for exploring
+  multicore Cortex-A class systems. The Versatile Express family contains both
+  32 bit (Aarch32) and 64 bit (Aarch64) systems.
+
+  The board consist of a motherboard and one or more daughterboards (tiles). The
+  motherboard provides a set of peripherals. Processor and RAM "live" on the
+  tiles.
+
+  The motherboard and each core tile should be described by a separate Device
+  Tree source file, with the tile's description including the motherboard file
+  using an include directive. As the motherboard can be initialized in one of
+  two different configurations ("memory maps"), care must be taken to include
+  the correct one.
+
+  When a new generation of boards were introduced under the name "Juno", these
+  shared to many common characteristics with the Versatile Express that the
+  "arm,vexpress" compatible was retained in the root node, and these are
+  included in this binding schema as well.
+
+  The root node indicates the CPU SoC on the core tile, and this
+  is a daughterboard to the main motherboard. The name used in the compatible
+  string shall match the name given in the core tile's technical reference
+  manual, followed by "arm,vexpress" as an additional compatible value. If
+  further subvariants are released of the core tile, even more fine-granular
+  compatible strings with up to three compatible strings are used.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: CoreTile Express A9x4 (V2P-CA9) has 4 Cortex A9 CPU cores
+          in MPCore configuration in a test chip on the core tile. See ARM
+          DUI 0448I. This was the first Versatile Express platform.
+        items:
+          - const: arm,vexpress,v2p-ca9
+          - const: arm,vexpress
+      - description: CoreTile Express A5x2 (V2P-CA5s) has 2 Cortex A5 CPU cores
+          in a test chip on the core tile. It is intended to evaluate NEON, FPU
+          and Jazelle support in the Cortex A5 family. See ARM DUI 0541C.
+        items:
+          - const: arm,vexpress,v2p-ca5s
+          - const: arm,vexpress
+      - description: Coretile Express A15x2 (V2P-CA15) has 2 Cortex A15 CPU
+          cores in a MPCore configuration in a test chip on the core tile. See
+          ARM DUI 0604F.
+        items:
+          - const: arm,vexpress,v2p-ca15
+          - const: arm,vexpress
+      - description: CoreTile Express A15x4 (V2P-CA15, HBI-0237A) has 4 Cortex
+          A15 CPU cores in a test chip on the core tile. This is the first test
+          chip called "TC1".
+        items:
+          - const: arm,vexpress,v2p-ca15,tc1
+          - const: arm,vexpress,v2p-ca15
+          - const: arm,vexpress
+      - description: Coretile Express A15x2 A7x3 (V2P-CA15_A7) has 2 Cortex A15
+          CPU cores and 3 Cortex A7 cores in a big.LITTLE MPCore configuration
+          in a test chip on the core tile. See ARM DDI 0503I.
+        items:
+          - const: arm,vexpress,v2p-ca15_a7
+          - const: arm,vexpress
+      - description: LogicTile Express 20MG (V2F-1XV7) has 2 Cortex A53 CPU
+          cores in a test chip on the core tile. See ARM DDI 0498D.
+        items:
+          - const: arm,vexpress,v2f-1xv7,ca53x2
+          - const: arm,vexpress,v2f-1xv7
+          - const: arm,vexpress
+      - description: Arm Versatile Express Juno "r0" (the first Juno board,
+          V2M-Juno) was introduced as a vehicle for evaluating big.LITTLE on
+          AArch64 CPU cores. It has 2 Cortex A57 CPU cores and 4 Cortex A53
+          cores in a big.LITTLE configuration. It also features the MALI T624
+          GPU. See ARM document 100113_0000_07_en.
+        items:
+          - const: arm,juno
+          - const: arm,vexpress
+      - description: Arm Versatile Express Juno r1 Development Platform
+          (V2M-Juno r1) was introduced mainly aimed at development of PCIe
+          based systems. Juno r1 also has support for AXI masters placed on
+          the TLX connectors to join the coherency domain. Otherwise it is the
+          same configuration as Juno r0. See ARM document 100122_0100_06_en.
+        items:
+          - const: arm,juno-r1
+          - const: arm,vexpress
+      - description: Arm Versatile Express Juno r2 Development Platform
+          (V2M-Juno r2). It has the same feature set as Juno r0 and r1. See
+          ARM document 100114_0200_04_en.
+        items:
+          - const: arm,juno-r2
+          - const: arm,vexpress
+
+  arm,hbi:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: This indicates the ARM HBI (Hardware Board ID), this is
+      ARM's unique board model ID, visible on the PCB's silkscreen.
+
+  arm,vexpress-site:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: Site
+
+required:
+  - compatible
+  - arm,hbi
+
+...
-- 
2.23.0

