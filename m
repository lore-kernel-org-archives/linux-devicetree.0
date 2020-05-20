Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE60C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 08:49:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C3B7207D3
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 08:49:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y0susyFh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgETItJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 04:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbgETItJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 04:49:09 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25FB5C061A0F
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 01:49:09 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id s69so919865pjb.4
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 01:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d5AjCUOK5C/NKP2sQDKv/MsqrelpSGqalm8Xcnpaauo=;
        b=Y0susyFhHLNV45TA02G25odGkgkumbqIHVgPdZmyF+Fq28Dn1hMdsxfmb0sHNhrGmv
         oKFtW8iQc4rgkDx79cWtiqcmuplZTOnUqQxGYpieqO2hD5993B2EfpUpU9rWn7iIpIpK
         ERcv64HkzMPwt/k2zs2UICW4AH3nTk+NwFu8Llw3orhzKT6zyEA/lLqT9EHToxTtvskB
         uEV5aM5uEYw6IA9qu81bHddQlmyersnzarXyDMEuB4ykzm36INc6FmXf6wW6IJ6+OqYJ
         MoVPxOvUaWMRHnUDpMiePkHnPi9UVG1Op9FlrBxyB00MzJUk9LoUj9jqd59fEn9u8iJY
         NZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d5AjCUOK5C/NKP2sQDKv/MsqrelpSGqalm8Xcnpaauo=;
        b=MGP3d3jkuKlIJOxMj+o+hdcXcsM96OsIN2qOZ21vqquDCfjoE3BNGoIvo0K92RjVVz
         bgITBNsZuSBNkoZOrng/nHxG3t10O0Z1kptSHe29q6PndDj7D/t4DZRDizx11qLQ730r
         LFL/ja5hZL7oj/Y+GyiH+GoQdNPKI0VX2hPf5AZOZiH37n4dqSnV9qJOLIYjCql6d3ve
         w3ARpX60CH85WoqNvzYkLWmsLRoZpbgK0sg9Sj5LRxNJdILNDy+QcN7M44MaANyA9LHe
         yk+kKI2ohmjLZbaOuFeDVaWnZYiqpoJhMNTJm+HrEvxMViKJtjGd0jQNYrH59XbvLK2z
         4Baw==
X-Gm-Message-State: AOAM531FCcNAf7wtNCRvLJqS2wdCMYcf2p2sGaMu6wm31TJJargKdw6W
        p/A58pRiOWWjCI7CzbBfye5O
X-Google-Smtp-Source: ABdhPJz9kKWzD15RzkikcFrtmaZx5Ic6Hx1VlxXZ0TjqgjTZrh3e8YR8vYENwHtmYB5CBh0GdvVVzQ==
X-Received: by 2002:a17:902:ea8a:: with SMTP id x10mr3573442plb.255.1589964548543;
        Wed, 20 May 2020 01:49:08 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:91e:dd0a:7c30:1f7e:ebdb:aa2a])
        by smtp.gmail.com with ESMTPSA id a5sm1629332pfk.210.2020.05.20.01.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 01:49:07 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     jassisinghbrar@gmail.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: mailbox: Add devicetree binding for Qcom IPCC
Date:   Wed, 20 May 2020 14:18:52 +0530
Message-Id: <20200520084854.19729-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.26.GIT
In-Reply-To: <20200520084854.19729-1-manivannan.sadhasivam@linaro.org>
References: <20200520084854.19729-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add devicetree YAML binding for Qualcomm Inter-Processor Communication
Controller (IPCC) block.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../bindings/mailbox/qcom-ipcc.yaml           | 80 +++++++++++++++++++
 include/dt-bindings/mailbox/qcom-ipcc.h       | 33 ++++++++
 2 files changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
 create mode 100644 include/dt-bindings/mailbox/qcom-ipcc.h

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
new file mode 100644
index 000000000000..4ac2123d9193
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/qcom-ipcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Inter-Processor Communication Controller
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  The Inter-Processor Communication Controller (IPCC) is a centralized hardware
+  to route interrupts across various subsystems. It involves a three-level
+  addressing scheme called protocol, client and signal. For example, consider an
+  entity on the Application Processor Subsystem (APSS) that wants to listen to
+  Modem's interrupts via Shared Memory Point to Point (SMP2P) interface. In such
+  a case, the client would be Modem (client-id is 2) and the signal would be
+  SMP2P (signal-id is 2). The SMP2P itself falls under the Multiprocessor (MPROC)
+  protocol (protocol-id is 0). Refer include/dt-bindings/mailbox/qcom-ipcc.h
+  for the list of such IDs.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - qcom,sm8250-ipcc
+      - const: qcom,ipcc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 3
+    description:
+      The first cell is the client-id, the second cell is the signal-id and the
+      third cell is the interrupt type.
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell is the client-id, and the second cell is the signal-id.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        #include <dt-bindings/mailbox/qcom-ipcc.h>
+
+        mailbox@408000 {
+                compatible = "qcom,sm8250-ipcc", "qcom,ipcc";
+                reg = <0x408000 0x1000>;
+                interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-controller;
+                #interrupt-cells = <3>;
+                #mbox-cells = <2>;
+        };
+
+        smp2p-modem {
+                compatible = "qcom,smp2p";
+                interrupts-extended = <&ipcc_mproc IPCC_CLIENT_MPSS
+                                IPCC_MPROC_SIGNAL_SMP2P IRQ_TYPE_EDGE_RISING>;
+                mboxes = <&ipcc_mproc IPCC_CLIENT_MPSS IPCC_MPROC_SIGNAL_SMP2P>;
+
+                /* Other SMP2P fields */
+        };
diff --git a/include/dt-bindings/mailbox/qcom-ipcc.h b/include/dt-bindings/mailbox/qcom-ipcc.h
new file mode 100644
index 000000000000..4c23eefed5f3
--- /dev/null
+++ b/include/dt-bindings/mailbox/qcom-ipcc.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_MAILBOX_IPCC_H
+#define __DT_BINDINGS_MAILBOX_IPCC_H
+
+/* Signal IDs for MPROC protocol */
+#define IPCC_MPROC_SIGNAL_GLINK_QMP	0
+#define IPCC_MPROC_SIGNAL_SMP2P		2
+#define IPCC_MPROC_SIGNAL_PING		3
+
+/* Client IDs */
+#define IPCC_CLIENT_AOP			0
+#define IPCC_CLIENT_TZ			1
+#define IPCC_CLIENT_MPSS		2
+#define IPCC_CLIENT_LPASS		3
+#define IPCC_CLIENT_SLPI		4
+#define IPCC_CLIENT_SDC			5
+#define IPCC_CLIENT_CDSP		6
+#define IPCC_CLIENT_NPU			7
+#define IPCC_CLIENT_APSS		8
+#define IPCC_CLIENT_GPU			9
+#define IPCC_CLIENT_CVP			10
+#define IPCC_CLIENT_CAM			11
+#define IPCC_CLIENT_VPU			12
+#define IPCC_CLIENT_PCIE0		13
+#define IPCC_CLIENT_PCIE1		14
+#define IPCC_CLIENT_PCIE2		15
+#define IPCC_CLIENT_SPSS		16
+
+#endif
-- 
2.26.GIT

