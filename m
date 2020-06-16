Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE0DC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 12:17:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C0D720DD4
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 12:17:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="pRHoQGOi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728771AbgFPMRc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 08:17:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728750AbgFPMR1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 16 Jun 2020 08:17:27 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35BDAC08C5C8
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2020 05:17:26 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x22so9425464pfn.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2020 05:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WPc9wn7ciRL1/w7YcmkKxstKF3mhNYu9SS7UDFpaIkA=;
        b=pRHoQGOibAbZ1yZhGC1VjydH6LsawBp9BOxAXHkYUj73VL61nHAE9LWaxMS5BnRLQD
         U09DfnmpkPud8r6/qyDr6JHMNsS4fUKvpjRC9Ju7IeBMQu9uoxQdwH92a7pKmcZ8PSzP
         EGhL6bYdu+H641fbEeINue5LO6RHJYIz8c0IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WPc9wn7ciRL1/w7YcmkKxstKF3mhNYu9SS7UDFpaIkA=;
        b=kmj/AQQFXn95E+fzJNWyO73Muu5nMz5qTgoLI+ZTvqlLQbd3hOIQ7v0DWwhL3f7lA6
         7ellC3vyTLRAjMby64+t0AtqDQr6M1kKXgt1+ipzs7K6zXpQhuSHvbRxXLjjHmpmu15C
         +QytiXlmJ6zKa4qx+NRYS+2/fVTzqwOaFNGZzWRykLbaSfdER6S9p+KRUMlvRVQbmZoy
         xZ3MDIddkJn17lslIYQ+k1rX9whLvyHQXpqwDi+MPm4H7IUoK7Ald6k1180hspNe7T6N
         2Ywg25VWEYcLao1tRxExajKPGFYLXGqYf0OdfnzUebx12K/kY/Qw9gPJLklpiJeKodq0
         6Tbw==
X-Gm-Message-State: AOAM530jtZoTqtgs34epvwUALqsQZXK0UMb4CDpBvnVWV9dI+RsLHvhC
        tedRmBAwtpvVRARjTiVRJyXtTw==
X-Google-Smtp-Source: ABdhPJwFji2rq0/TQPbi6zc2IyYD8PpzBsMwAjXHb3n4En8XrRpu37zMMSxM+h6TlaeDuyV620XM9A==
X-Received: by 2002:a63:3e8d:: with SMTP id l135mr1833340pga.230.1592309845671;
        Tue, 16 Jun 2020 05:17:25 -0700 (PDT)
Received: from shiro.work (p1285116-ipngn200805sizuokaden.shizuoka.ocn.ne.jp. [114.171.61.116])
        by smtp.googlemail.com with ESMTPSA id f23sm2360703pja.8.2020.06.16.05.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 05:17:25 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v4 07/12] ARM: mstar: Add binding details for mstar,l3bridge
Date:   Tue, 16 Jun 2020 21:15:20 +0900
Message-Id: <20200616121525.1409790-8-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200616121525.1409790-1-daniel@0x0f.com>
References: <20200612130032.3905240-2-daniel@0x0f.com>
 <20200616121525.1409790-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds a YAML description of the l3bridge node needed by the
platform code for the MStar/SigmaStar Armv7 SoCs.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
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
2.27.0.rc0

