Return-Path: <SRS0=mz9M=BP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B567C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Aug 2020 19:54:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18EC822B42
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Aug 2020 19:54:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="EQulCbJg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729589AbgHETyy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 5 Aug 2020 15:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728027AbgHEQsJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 5 Aug 2020 12:48:09 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32003C0617B1
        for <devicetree@vger.kernel.org>; Wed,  5 Aug 2020 04:01:26 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id u10so15552354plr.7
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2020 04:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bEXE45LcqvqPQXnOIHLz5P7xwCTBDkRs/TdXM1m+mFI=;
        b=EQulCbJgChPEOrrWhj0Yj6pCh0S3mTWPli5hIxKes2rVZ/rB3VbS0zWELm0qovgRox
         3RNcvKc/Ka4EV3Yu+AQsAw0wmqdiDoxPx8/cNg5caL+P1l0ZU1xGoZxU+SflhuXk8+sb
         7TBVPNm86jPhCITaDJk8n2ts8Dzg5iWCDocwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bEXE45LcqvqPQXnOIHLz5P7xwCTBDkRs/TdXM1m+mFI=;
        b=NFX0aoi1kMW/YLpO5l9+pUHvlWcgZIRUhdh5ispLHXrnSPpn25/fo/8S7tBihswj9/
         nmkStQW9EdTuqm8Mbcsou5f74cbZf5e1oUu5CZtqEbk81gVG3beT3LKCqBGazcuZ6ZUy
         gkA2zT8Bt8h5r0MCRDGHyLcIk30xv16w6ZNeeZDS/pLrw2ddFQMwKJBJ2SalFyCeyIeJ
         RsPll83oM9PPiY2xurv0UDsSrkFiR7aqPA/Gw3mEdaHb6o8aBaCSP7gwrytRyWYIB/Bj
         ewAt8zT/aqiJkSJB3LCLe+TBD1ApeNBhszpZQ7t15IIJZjWXZqhiN3NR/dQxU4bID/h4
         ERzQ==
X-Gm-Message-State: AOAM5308SefdMXckFeUZEcxR/gGSo8xTj2FP7gJ4ZV78xCWzyoIwG8Xe
        9nHcgWp18yh2vWX0gvtCE2sf3g==
X-Google-Smtp-Source: ABdhPJyvJqUXzc7a83FfWTPCOuRjbh298XT8zPB8FEb7iiv/46NZBBTcpzUImBIfusw1aOQW/aMxLw==
X-Received: by 2002:a17:902:ed13:: with SMTP id b19mr2520446pld.24.1596625284813;
        Wed, 05 Aug 2020 04:01:24 -0700 (PDT)
Received: from shiro.work (p532183-ipngn200506sizuokaden.shizuoka.ocn.ne.jp. [153.199.2.183])
        by smtp.googlemail.com with ESMTPSA id fv21sm2583142pjb.16.2020.08.05.04.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 04:01:24 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        robh+dt@kernel.org, arnd@arndb.de, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/3] dt: bindings: interrupt-controller: Add binding description for msc313-intc
Date:   Wed,  5 Aug 2020 20:00:50 +0900
Message-Id: <20200805110052.2655487-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805110052.2655487-1-daniel@0x0f.com>
References: <20200805110052.2655487-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds a YAML description of the binding for the msc313-intc.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../mstar,msc313-intc.yaml                    | 79 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mstar,msc313-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mstar,msc313-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/mstar,msc313-intc.yaml
new file mode 100644
index 000000000000..e256887aa847
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mstar,msc313-intc.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 thingy.jp.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/interrupt-controller/mstar,msc313-intc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MStar/SigmaStar ARMv7 SoC Interrupt Controller Device Tree Bindings
+
+maintainers:
+  - Daniel Palmer <daniel@thingy.jp>
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  "#interrupt-cells":
+    const: 2
+
+  compatible:
+    enum:
+      - mstar,msc313-intc-irq
+      - mstar,msc313-intc-fiq
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  mstar,gic-offset:
+    description:
+      Offset added to the intc irq number to get the parent GIC irq.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 255
+
+  mstar,nr-interrupts:
+    description:
+      Number of interrupt lines this intc has.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 1
+        maximum: 64
+
+required:
+  - "#interrupt-cells"
+  - compatible
+  - reg
+  - interrupt-controller
+  - mstar,gic-offset
+  - mstar,nr-interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    intc_fiq: intc@201310 {
+        compatible = "mstar,msc313-intc-fiq";
+        interrupt-controller;
+        reg = <0x201310 0x40>;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&gic>;
+        mstar,gic-offset = <96>;
+        mstar,nr-interrupts = <32>;
+    };
+
+  - |
+    intc_irq: intc@201350 {
+        compatible = "mstar,msc313-intc-irq";
+        interrupt-controller;
+        reg = <0x201350 0x40>;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&gic>;
+        mstar,gic-offset = <32>;
+        mstar,nr-interrupts = <64>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c8e8232c65da..6e64d17aad7b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2152,6 +2152,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://linux-chenxing.org/
 F:	Documentation/devicetree/bindings/arm/mstar/*
+F:	Documentation/devicetree/bindings/interrupt-controller/mstar,msc313-intc.yaml
 F:	arch/arm/boot/dts/infinity*.dtsi
 F:	arch/arm/boot/dts/mercury*.dtsi
 F:	arch/arm/boot/dts/mstar-v7.dtsi
-- 
2.27.0

