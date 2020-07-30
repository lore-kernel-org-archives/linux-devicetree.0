Return-Path: <SRS0=Tykm=BJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E467C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 13:02:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A17521D95
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 13:02:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="DzRfY/Pl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbgG3NCg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jul 2020 09:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbgG3NCf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Jul 2020 09:02:35 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210D4C061794
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 06:02:35 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id b9so14045810plx.6
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 06:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CQXDaPRMT2Knve/W75mxDsq7AYy8/2i6BlEqeNHe2LA=;
        b=DzRfY/PlB7jme2woTtQhljw2ldEn1o/2IjXE5fMPsbTKe7eIqBcP+rsvpAa6K4VxBq
         r56S3C7ATRX4fbhGk4K/fQbHxnI0+hgie25kv8UUvoHn5vKlnZ7+WTsfaet6GKZKtaND
         px2tQDZnBza8iHqPatpOyKFRK78pKCil2r4/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CQXDaPRMT2Knve/W75mxDsq7AYy8/2i6BlEqeNHe2LA=;
        b=uP62kmSUplSZ0DTp3mMmCTgY2NJTgBC7ZEc6vZqsznEuMokl8gHrqNRwXWD5S/X6Nd
         tmaCRro1L0ZQrlAW2YTB4LsUOrS2AnBurZLxJsCmLbqAOvrV68DDQGSYYEdZuCPlb2lW
         x3ogDeWdhMCp4iaYnq1fnaAi1qbR1g/eCDdvBE5Gk8Rc5/gjFVusX/NcOWgv1fQSialO
         zWBVu7tqvkXH4LCuiIxE4aU5xqIdfjlPVsVHMmIyBzMkavrXs4hCuHnnjmBnRpicrfxn
         nNxCcu/j686W+YiAdvOXFC2BojJ2cEIRQOXKehuFctceAakRTtiSNfIQWnvl+f8U+Hmp
         q8xA==
X-Gm-Message-State: AOAM5329W6HfuxvbufenhcwPG4kjxSOwVqBZnZP5/p/wgnQhedbOmyTS
        JKLo7Jil7WH6wASRgDGVxdY1wg==
X-Google-Smtp-Source: ABdhPJyIpTrjirSM42AIRDjJTRvxM3JjBUd4U2OivfIkORi7zAWcv+nifY2e81XEdhi+AaHs+hjAgg==
X-Received: by 2002:a17:902:9042:: with SMTP id w2mr33492092plz.9.1596114154322;
        Thu, 30 Jul 2020 06:02:34 -0700 (PDT)
Received: from shiro.work (p532183-ipngn200506sizuokaden.shizuoka.ocn.ne.jp. [153.199.2.183])
        by smtp.googlemail.com with ESMTPSA id b13sm6758704pgd.36.2020.07.30.06.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 06:02:33 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To:     soc@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux@armlinux.org.uk, w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH 1/3] dt: bindings: interrupt-controller: Add binding description for msc313-intc
Date:   Thu, 30 Jul 2020 22:00:42 +0900
Message-Id: <20200730130044.2037509-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730130044.2037509-1-daniel@0x0f.com>
References: <20200730130044.2037509-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds a YAML description of the binding for the msc313-intc.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Tested-by: Willy Tarreau <w@1wt.eu>
---
 .../mstar,msc313-intc.yaml                    | 79 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mstar,msc313-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mstar,msc313-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/mstar,msc313-intc.yaml
new file mode 100644
index 000000000000..e87c72d452c3
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
+      - minimum: 0
+        maximum: 255
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
index 9b35edac7ef7..cf64b4b90222 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2140,6 +2140,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://linux-chenxing.org/
 F:	Documentation/devicetree/bindings/arm/mstar/*
+F:	Documentation/devicetree/bindings/interrupt-controller/mstar,msc313-intc.yaml
 F:	arch/arm/boot/dts/infinity*.dtsi
 F:	arch/arm/boot/dts/mercury*.dtsi
 F:	arch/arm/boot/dts/mstar-v7.dtsi
-- 
2.27.0

