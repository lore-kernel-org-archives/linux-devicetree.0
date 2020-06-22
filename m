Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49727C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 12:41:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29C322071A
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 12:41:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R4lWAbAy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgFVMlc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 08:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728213AbgFVMla (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 08:41:30 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF3CC061796
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 05:41:28 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id m2so8562433pjv.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 05:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LrEMg7fVwuiooc5MLW1OYb4mtJllfG4D6r8RWT/b3sw=;
        b=R4lWAbAyHu9KxYc2D26QmPW0EzdSxRA14BMpucKfCZKXmWSS5xQPtp1KPUl/5gc1yM
         45xbjqEWZNUzicGnVd0h97NXUOHwfNtutRUkkFvyF42E2HdGKQI8vyhmq0jqolso5Ubt
         iJy6t2lCfL/MyS3nhniaBsv/+FzEQ6FMnZ8X4NskCUTjOE9HKuMS2BPzyPKIpmBuWCNc
         ThozBEdrLUBljKvhN6Y4wYTaj5oBIFz/6KAGf0p364/QbGZOaG3pnWP7yXbx9Q/a8brj
         f/Neu1dgNDj41iC93Sv6Arqx07vjhGAUslNeIH/y0ynZwv+wE07bJEGJIOIDI3IzNGTl
         qRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LrEMg7fVwuiooc5MLW1OYb4mtJllfG4D6r8RWT/b3sw=;
        b=JGMdomMFpKeBnycdel2L8WaIT4EMVSU2CFNDzDIPkQiilSNhK0e+4WeBDDDpDxGFD5
         JzxGbpk3judG+wT1/46BIR13QW2VR/VZv34wXtSoyW4rswO2gu6mk3AXAlL8i7ncgB0Y
         OecZedn+cKSXbTbIyUKnMhRrtOWMjHv7fPy/9R4PK1NtiUsm/txFETk+yB2eWxU+qbmq
         ZspweMAjmObHjYaRCk4qdK/Ma2X337hw8TcTYp0+T0N39b2uCg86cQgec9FheuIZAOl8
         Wi96StDqIiECUC7BYAMjAC/PVlbM+t8cUiM3WRgOk22iMS9pP1x5x4uZEUc98uyhCFuH
         uehQ==
X-Gm-Message-State: AOAM531WIVSwxQKGSJlLfrf8928Pgr8ORqoMIjbeS7fsQhMXXkZ9hd+J
        D3WgZGsLxoiPwJDZvP4zph1Hww==
X-Google-Smtp-Source: ABdhPJzn8RCLDFgMrFmjXQEX4QECyCA6DythMPfZnclKCrsKrurpMrPKXQFV/t/mBRGPLI4Vjzl9fQ==
X-Received: by 2002:a17:90a:5c82:: with SMTP id r2mr7768404pji.161.1592829688267;
        Mon, 22 Jun 2020 05:41:28 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id i62sm14590581pfg.90.2020.06.22.05.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 05:41:27 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v5 2/4] dt-bindings: regulator: Add labibb regulator
Date:   Mon, 22 Jun 2020 18:11:08 +0530
Message-Id: <20200622124110.20971-3-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622124110.20971-1-sumit.semwal@linaro.org>
References: <20200622124110.20971-1-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Nisha Kumari <nishakumari@codeaurora.org>

Adding the devicetree binding for labibb regulator.

Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
 [sumits: cleanup as per review comments and update to yaml]

---
v5: Addressed review comments - removed interrupt-names, changed to
     dual license, added unevaluatedProperties: false
v4: fixed dt_binding_check issues
v3: moved to yaml
v2: updated for better compatible string and names.
---
 .../regulator/qcom-labibb-regulator.yaml      | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
new file mode 100644
index 000000000000..085cbd1ad8d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/qcom-labibb-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm's LAB(LCD AMOLED Boost)/IBB(Inverting Buck Boost) Regulator
+
+maintainers:
+  - Sumit Semwal <sumit.semwal@linaro.org>
+
+description:
+  LAB can be used as a positive boost power supply and IBB can be used as a
+  negative boost power supply for display panels. Currently implemented for
+  pmi8998.
+
+properties:
+  compatible:
+    const: qcom,pmi8998-lab-ibb
+
+  lab:
+    type: object
+
+    properties:
+
+      interrupts:
+        maxItems: 1
+        description:
+          Short-circuit interrupt for lab.
+
+    required:
+    - interrupts
+
+  ibb:
+    type: object
+
+    properties:
+
+      interrupts:
+        maxItems: 1
+        description:
+          Short-circuit interrupt for lab.
+
+    required:
+    - interrupts
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    labibb {
+      compatible = "qcom,pmi8998-lab-ibb";
+
+      lab {
+        interrupts = <0x3 0x0 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "sc-err";
+      };
+
+      ibb {
+        interrupts = <0x3 0x2 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "sc-err";
+      };
+    };
+
+...
-- 
2.27.0

