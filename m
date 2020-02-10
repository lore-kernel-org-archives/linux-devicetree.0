Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630BBC3B184
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 09:27:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39ACA214DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 09:27:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x0f3kBJf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbgBJJ1e (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 04:27:34 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37124 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgBJJ1e (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 04:27:34 -0500
Received: by mail-lf1-f68.google.com with SMTP id b15so3667768lfc.4
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 01:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ypf2PVbAsW0uSJC/xuhYlQ/Mtj2shleLiZbK07EUwj0=;
        b=x0f3kBJfs1TQT26gIKmjgGSOqimBHYznHSoW11k0cYIjSbxkGJgkfStOtuYUhXTg/M
         Vz6iUQqe1sAUqwVk7R56B7wtEzBVNkrSJEPOWolB9SM3Lq57DGNbSXTLCVbPIbzrqoj9
         X1sVx7xCn7pKir1HJ9QZkjt6KaZpdiqOMDESW8l5L72W+iE1xot/1uigxxWqI3fjETfz
         Tk/7Qpw27/LMc/AwCAShiDCQW92vfPnAcKhGYEnTJc0EItMdBjO2OEGYr/CKcHOWul4G
         5R0p00zxAmWrl7iXvx2bUqqPnadg5Wt6uDiyh7/QF3LtqHXkaAKAyHfgHxNDQNc1kecG
         nKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ypf2PVbAsW0uSJC/xuhYlQ/Mtj2shleLiZbK07EUwj0=;
        b=GeT70MQtzce2XkyFO6Sr8V0qe3aBrQgpfoph7Ih069Wb2ZgQv3FjkqX3nj7Jr33veB
         avvPAjSBuASGsTRrqAdSi5II/PykSn/qzX0C3DbaNLe2EfhaS8aIDwMyeda9jwnffi+9
         2tfxjrMMIG54ivy10itrmVin0Vc1Eh+crfSOcfqZtNhG+ipahwk7GFqQZFwN1/EXTAX7
         AdNVeME76Wn4cD369yJP5jhoEqB6FcAxudp16O8AhNAYKqM6VRHCi9qZEmwyWsibXiOa
         o8R1XoPiTNH8TNVbXKmic+S6PlJBv9hbwC5SCCcKndzRKjROgjmLD1wMXtjH5QACz23D
         oYMQ==
X-Gm-Message-State: APjAAAXqEWL24uBd9nycgoJ59HgtK/sScEbCom8rOq4C0s7AXxNQHzHD
        M3U1jj6K1VFDnOraLYWyEdigjzb3KcM=
X-Google-Smtp-Source: APXvYqwQHaVhyh725IyFzPTM076vs4JVrzJ8l8B9fKRDiQUGK9CnZtXYrLQX4bxiC1FhaO5rQ2++UA==
X-Received: by 2002:a19:7015:: with SMTP id h21mr297087lfc.68.1581326851914;
        Mon, 10 Feb 2020 01:27:31 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id d9sm5989882lja.73.2020.02.10.01.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 01:27:31 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/7] dt-bindings: arm: Add Versatile YAML schema
Date:   Mon, 10 Feb 2020 10:27:10 +0100
Message-Id: <20200210092713.279105-5-linus.walleij@linaro.org>
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
platforms.

Cc: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/arm/arm,versatile.yaml           | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,versatile.yaml

diff --git a/Documentation/devicetree/bindings/arm/arm,versatile.yaml b/Documentation/devicetree/bindings/arm/arm,versatile.yaml
new file mode 100644
index 000000000000..81fd010643f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,versatile.yaml
@@ -0,0 +1,69 @@
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
+patternProperties:
+  "^core-module@[0-9a-f]+$":
+    type: object
+    description: the root node in the Versatile platforms must contain
+      a core module child node. They are always at physical address
+      0x10000000 in all the Versatile variants.
+    properties:
+      compatible:
+        contains:
+          const: arm,core-module-versatile
+        description: this node is the core module node, it can be compatible
+          with syscon and simple-bus as well
+
+    required:
+      - compatible
+      - reg
+
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
2.23.0

