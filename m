Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F08C35DF5
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 08:46:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1296B218AC
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 08:46:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SBiw6COn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729874AbgBYIqn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 03:46:43 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35310 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729833AbgBYIqn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 03:46:43 -0500
Received: by mail-lj1-f193.google.com with SMTP id q8so13082911ljb.2
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 00:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6uJF/Xnb7AfY84JDvLCWRFt/YHx1qx13mAubdwTWHRw=;
        b=SBiw6COnxwXNgyWaugF3f2cbrYrIgwge5Rv3v2WvaEM5P0/P8gCgXfkTLSl1Fps/xx
         f8vgHcWahlmLUHC7JgJT/nrEzDjJxXe579o+qqNlRdSiEcVHdDoLsZ3ibEg5cf+87/jK
         IMWy7pePQgJIX/NZny+0D/4Ad3+1LjFpefLFOH56n7iD2Zt9NznqvvrbcHrR3h11aaHp
         0o/o/mc26FU70KyLseJoLqSWzhppRaWx36zI5JBhLiWrwLlMeuGEoAFhr1rViBKtBqTX
         ujOa8YkR5pCyrzdvvmmyD7514NAfuCGAMYEVhEfGINX+7kYH5YU4XdiXxwaoeDVDpOsS
         P0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6uJF/Xnb7AfY84JDvLCWRFt/YHx1qx13mAubdwTWHRw=;
        b=Lz/xWhpGvTgJTb2jbWOGYdtd7js2RGUjPfIg3Y2k+l+xvFPBXfV+tmMCO3Fhx02A0W
         sGkntbfKTVT7OUjc8E++EVBxs4HPyVlk5hVVZjlS3kY6VdZZeznOnM6AkHnwn4jFEXpt
         L0o2Wtp14+K9viq4kC9budPktcO5CaUZkbw1RFB0KYymy3OzcuFWZdCZO5ep5O2/xxbt
         D4IOb4OxjI6cx/ro/YJDXnPzjvsJ6+afiIz4CPNC2+U8CbqkLYHM229K+ChKNMualBaB
         BIg3ODEcDBOHc9LgIIRlVMtj6VsQiWRNxzpHozK9UwUhf1yrT/P2zCqu8xcNAb1MLjkt
         X+OA==
X-Gm-Message-State: APjAAAXTtyCNJZu19mMOR7HoH4WdHKb1/Mv4D1YhCJRqRdXc+HgN9zfJ
        FWBiN3cMlpCu2DSmYM7kNFJ5aE7E5n8=
X-Google-Smtp-Source: APXvYqwPMNNy2RqNeP48/bLrf/l1Oskw5iJgKhu/zEizsVzFHfra226TsdRqOv9xcedm+Ev3bh4CcQ==
X-Received: by 2002:a2e:8745:: with SMTP id q5mr33184574ljj.208.1582620401758;
        Tue, 25 Feb 2020 00:46:41 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id e8sm8957251ljb.45.2020.02.25.00.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 00:46:40 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 2/5 v2] dt-bindings: arm: Add Versatile YAML schema
Date:   Tue, 25 Feb 2020 09:46:24 +0100
Message-Id: <20200225084627.24825-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200225084627.24825-1-linus.walleij@linaro.org>
References: <20200225084627.24825-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This implements the top-level schema for the ARM Versatile
platforms.

Cc: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Enforce core module to be @10000000
- Require all three compatibles on the core module
---
 .../bindings/arm/arm,versatile.yaml           | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,versatile.yaml

diff --git a/Documentation/devicetree/bindings/arm/arm,versatile.yaml b/Documentation/devicetree/bindings/arm/arm,versatile.yaml
new file mode 100644
index 000000000000..06efd2a075c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,versatile.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,versatile.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Versatile Boards Device Tree Bindings
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |+
+  The ARM Versatile boards are two variants of ARM926EJ-S evaluation boards
+  with various pluggable interface boards, in essence the Versatile PB version
+  is a superset of the Versatile AB version.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: The ARM Versatile Application Baseboard (HBI-0118) is an
+          evaluation board specifically for the ARM926EJ-S. It can be connected
+          to an IB1 interface board for a touchscreen-type use case or an IB2
+          for a candybar phone-type use case. See ARM DUI 0225D.
+        items:
+          - const: arm,versatile-ab
+      - description: The ARM Versatile Platform Baseboard (HBI-0117) is an
+          extension of the Versatile Application Baseboard that includes a
+          PCI host controller. Like the sibling board, it is done specifically
+          for ARM926EJ-S. See ARM DUI 0224B.
+        items:
+          - const: arm,versatile-pb
+
+  core-module@10000000:
+    type: object
+    description: the root node in the Versatile platforms must contain
+      a core module child node. They are always at physical address
+      0x10000000 in all the Versatile variants.
+    properties:
+      compatible:
+        items:
+          - const: arm,core-module-versatile
+          - const: syscon
+          - const: simple-mfd
+      reg:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+
+patternProperties:
+  "^syscon@[0-9a-f]+$":
+    type: object
+    description: When fitted with the IB2 Interface Board, the Versatile
+      AB will present an optional system controller node which controls the
+      extra peripherals on the interface board.
+    properties:
+      compatible:
+        contains:
+          const: arm,versatile-ib2-syscon
+    required:
+      - compatible
+      - reg
+
+required:
+  - compatible
+  - core-module@10000000
+
+...
-- 
2.24.1

