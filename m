Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247A1C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 09:46:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03900206F4
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 09:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="JEB7EdzF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgGJJqS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 05:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727978AbgGJJqR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 05:46:17 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7477CC08C5CE
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 02:46:17 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id f16so2385397pjt.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 02:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EBZgP3deAWnrA7Inan7wePEbZVmga6iYv9cUbrdNVdw=;
        b=JEB7EdzFCSOo6BA25tce1nPlUCeluAY6tixTAvRI5YJDgdsTzd0mDdTxv724aFu8xg
         hagRFVj8ByfObN7JedPVgZ4WExSxa3gIh4ic63Kts1R/tG/mr2XJQAqs1Eb5/is75C1v
         RCaBzY2GjnlSirUbubxnkqmcgRqvV+JgMqzmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EBZgP3deAWnrA7Inan7wePEbZVmga6iYv9cUbrdNVdw=;
        b=Xz10XErIrhNIyBTXFs9fGs1xh/lI3tATqoy1C69TTLyAehj3N15/tE4mo0Xk62Ezwq
         KKCJ5TgYURk4SF9UDCAIFwUkdttF5F1suHDAvDySkWF1zgndgXp1gaxmt2mj/ycbbDus
         9AlrE78akcr0mHuYwYF05bs5TvQkF1gOWMAhAq+WxEJFkmQKYBbhsrW857BiNW9Rtmu1
         Oa4lnbiNIpH+luNLT/lPYVWB51ATpz4AaaDGvV4vbzvo+2WmpRBEyVkIUXM8hpzhbqBC
         IiqDOQxNj8lsyOVm4uIA08MeeW/T+ZEFB+7WhtvotBStV0PqJeDfBQeV9DLmnKcXpjsY
         c4+Q==
X-Gm-Message-State: AOAM533M0lf3jc+4KOtSOll1pvXgZoiPqrqRd1kt44Y4hmF5jLcKfuR0
        BCgpDOJT6cYNFQFwnoGoOrIzRndfK2qeGg==
X-Google-Smtp-Source: ABdhPJyYGy1UmKpuvRtdfLkEXSNCfq+LAo6x8H0InK8DtBExthcHh7WS95SW0FjsFXZu1Yh1VFGXkA==
X-Received: by 2002:a17:902:c011:: with SMTP id v17mr22428432plx.15.1594374376918;
        Fri, 10 Jul 2020 02:46:16 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id z9sm5133213pgh.94.2020.07.10.02.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 02:46:16 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux@armlinux.org.uk, arnd@arndb.de,
        afaerber@suse.de, maz@kernel.org, w@1wt.eu,
        Daniel Palmer <daniel@0x0f.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 05/12] dt-bindings: arm: Add mstar YAML schema
Date:   Fri, 10 Jul 2020 18:45:37 +0900
Message-Id: <20200710094544.430258-6-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710094544.430258-1-daniel@0x0f.com>
References: <20200710094544.430258-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/mstar.yaml        | 33 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++++
 2 files changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mstar.yaml

diff --git a/Documentation/devicetree/bindings/arm/mstar.yaml b/Documentation/devicetree/bindings/arm/mstar.yaml
new file mode 100644
index 000000000000..bdce34b3336e
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mstar.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mstar.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MStar platforms device tree bindings
+
+maintainers:
+  - Daniel Palmer <daniel@thingy.jp>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: infinity boards
+        items:
+          - enum:
+              - thingyjp,breadbee-crust # thingy.jp BreadBee Crust
+          - const: mstar,infinity
+
+      - description: infinity3 boards
+        items:
+          - enum:
+              - thingyjp,breadbee # thingy.jp BreadBee
+          - const: mstar,infinity3
+
+      - description: mercury5 boards
+        items:
+          - enum:
+              - 70mai,midrived08 # 70mai midrive d08
+          - const: mstar,mercury5
diff --git a/MAINTAINERS b/MAINTAINERS
index 1d4aa7f942de..96110ee8a41c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2117,6 +2117,13 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm/mach-pxa/mioa701.c
 
+ARM/MStar/Sigmastar Armv7 SoC support
+M:	Daniel Palmer <daniel@thingy.jp>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+W:	http://linux-chenxing.org/
+F:	Documentation/devicetree/bindings/arm/mstar.yaml
+
 ARM/NEC MOBILEPRO 900/c MACHINE SUPPORT
 M:	Michael Petchkovsky <mkpetch@internode.on.net>
 S:	Maintained
-- 
2.27.0

