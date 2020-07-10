Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36D5C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 09:46:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA9AA20786
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 09:46:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="kfa1c32Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbgGJJq2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 05:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728043AbgGJJqY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 05:46:24 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDCBAC08C5DC
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 02:46:23 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id w2so2288341pgg.10
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 02:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3QX7mr2czZhjXYilcEPsm3JJuQZMY4I8zbNHVBoLG5o=;
        b=kfa1c32YEKjeTfDKHQAKtV8FgiuI1D8K0yOcy05VLxl5eFkOU4UF6V22Xj7GeoczAp
         ai941cnu1m42k3FmtXaAzEeP+jb4mRKbSKx+z4gSG+uULsOkZsWQ8VN+2RqHVZzr4KAC
         qGDjCEotAwW9ianPnMePwrDXejhy6qY39DuVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3QX7mr2czZhjXYilcEPsm3JJuQZMY4I8zbNHVBoLG5o=;
        b=RT7iSwzF/8kOPfZQaNvyMe2srLbmEpB34hflJp5MPLYZxalWNcZxXBJBdj8Su+gVq7
         PPGokftxtnwx3d53xlrgQ5HFRFEAlq2eo8Xu4IR/2w/goZKine7e/TMG0QhdxDj2lCgV
         V2NwWnvc5QKZG4qd7wvgJ7hyYnzksk1VvCIEzxpTNY6cp8vZWT9C7w1zA4kY0nGjay59
         0Mi0U5fkQRDs7qZX8ZoysVG4DnGy8CChvnVDeZsgnRkfw35LW6ab719Zqsxnrzv79wfV
         Z1IHF/UaBGnOenCcb9QSaLXtnoH7oB+H6xy7oqo7hvt7KvXO5r30FWcRF7eoSn78fQaz
         f+rg==
X-Gm-Message-State: AOAM532ebd5RCrkLGylCvSs6XKwmCniOVtI64xaxf6/nycS87giXCGUF
        NuG/6Sk3XCTRRtORRrlKudCt4w==
X-Google-Smtp-Source: ABdhPJyb2uDW5kLd5NsW4DYsjExTjrSLzOxm1x+MHO6glBvrk7cv7KZY20e8IH7bj3QhvrSDFrqw6A==
X-Received: by 2002:a63:bf04:: with SMTP id v4mr59776470pgf.212.1594374383340;
        Fri, 10 Jul 2020 02:46:23 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id z9sm5133213pgh.94.2020.07.10.02.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 02:46:22 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux@armlinux.org.uk, arnd@arndb.de,
        afaerber@suse.de, maz@kernel.org, w@1wt.eu,
        Daniel Palmer <daniel@0x0f.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 07/12] ARM: mstar: Add binding details for mstar,l3bridge
Date:   Fri, 10 Jul 2020 18:45:39 +0900
Message-Id: <20200710094544.430258-8-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710094544.430258-1-daniel@0x0f.com>
References: <20200710094544.430258-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds a YAML description of the l3bridge node needed by the
platform code for the MStar/SigmaStar Armv7 SoCs.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/misc/mstar,l3bridge.yaml         | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/mstar,l3bridge.yaml

diff --git a/Documentation/devicetree/bindings/misc/mstar,l3bridge.yaml b/Documentation/devicetree/bindings/misc/mstar,l3bridge.yaml
new file mode 100644
index 000000000000..cb7fd1cdfb1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/mstar,l3bridge.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 thingy.jp.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/misc/mstar,l3bridge.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MStar/SigmaStar Armv7 SoC l3bridge
+
+maintainers:
+  - Daniel Palmer <daniel@thingy.jp>
+
+description: |
+  MStar/SigmaStar's Armv7 SoCs have a pipeline in the interface
+  between the CPU and memory. This means that before DMA capable
+  devices are allowed to run the pipeline must be flushed to ensure
+  everything is in memory.
+
+  The l3bridge region contains registers that allow such a flush
+  to be triggered.
+
+  This node is used by the platform code to find where the registers
+  are and install a barrier that triggers the required pipeline flush.
+
+properties:
+  compatible:
+    items:
+      - const: mstar,l3bridge
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    l3bridge: l3bridge@1f204400 {
+        compatible = "mstar,l3bridge";
+        reg = <0x1f204400 0x200>;
+    };
-- 
2.27.0

