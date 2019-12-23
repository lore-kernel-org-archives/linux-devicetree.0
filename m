Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48442C2D0CF
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 11:34:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F7DC20882
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 11:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CJgFlssV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfLWLe0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 06:34:26 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43449 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbfLWLd6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Dec 2019 06:33:58 -0500
Received: by mail-lf1-f65.google.com with SMTP id 9so12364444lfq.10
        for <devicetree@vger.kernel.org>; Mon, 23 Dec 2019 03:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4Sx+Ffce1P6yPQB1Yvs6yRRad8RPj7QM5hUn0Iss1Ak=;
        b=CJgFlssV6Q26pqI4XnvLGZZpr3PUlJEKjXNorCXRAON27GCx7y19UES7qx9WSjemHL
         N8jjs+rNVRScoE6oX50pQb+VVM5+U6y4HDPUAdixaboQPBIY9cd4/ME5Leni5kSg4QZB
         hQhrHBrfjrsghxqbxsT5THsrwjYWLXDz2SNuCCpz9FAEcAs/lUf0Vo8R+zL72dMrLN8Q
         R/tBXhOtrjTbpou8BkOJQfnUbtk+eq+VNLwupF/9DtVrl25V+YEB1pOy4Gxpde3AbRA0
         s9i9IOocRabnu5Q8OYvCtK0XDDgI6MWWQV5ZGU3+qENrUctLjaQUn8rGPGj2pAmBWgMk
         GaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4Sx+Ffce1P6yPQB1Yvs6yRRad8RPj7QM5hUn0Iss1Ak=;
        b=WseLRil5DDUu7XkELgQ8EliegxC8T9r0nFRhk3NJFlDQKO/cjo1Ph57pQDyd5QimUI
         e01c4mmQ7/UFuulNPPhDs3HHnIZXkPg9rNaAWPp4rdwfNCs2wMy3WjI2FyJe/ihctwX6
         Fos4lF6asGWUdBRSJbP4+gm+7dHinWS2Tqufo6rrpjBanSfHazfYrbrAhJPumj4YHIlP
         l3tc8wvcVP/uyU+NNkrbx1avytjxHxcNcXL1cJf0m4c3Fm+xNwVDXDBIyU21+Fkumr0d
         ORu54Ril+V7bfN/lnzZW0VR5g+8LzZ/Q+ScBuqVB8N+S7NAFeJGdTk63SYfgIzC81FoM
         3tGA==
X-Gm-Message-State: APjAAAVR2io3F9ciZHdEHmTC1IFLxZkapypcK4geeFVcEaOxt3LFnfCh
        fldmgFAj9qo/3+1EsAfiK579SA==
X-Google-Smtp-Source: APXvYqzzNRlCX77afyK3/FXf98VOYFsHshktgmtcqghEPAJma5YIwTfOCA6GtEa6JqQOKVF0iRr9eg==
X-Received: by 2002:ac2:5635:: with SMTP id b21mr16568619lff.127.1577100836099;
        Mon, 23 Dec 2019 03:33:56 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id g15sm8381500ljk.8.2019.12.23.03.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2019 03:33:55 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 08/12] dt-bindings: media: venus: Convert sdm845 to DT schema
Date:   Mon, 23 Dec 2019 13:33:07 +0200
Message-Id: <20191223113311.20602-9-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
References: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Convert qcom,sdm845-venus Venus binding to DT schema.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../bindings/media/qcom,sdm845-venus.yaml     | 157 ++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
new file mode 100644
index 000000000000..ceae04be96dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
@@ -0,0 +1,157 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,sdm845-venus.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Venus video encode and decode accelerators
+
+maintainers:
+  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
+
+description: |
+  The Venus IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+properties:
+  compatible:
+    const: "qcom,sdm845-venus"
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    minItems: 1
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+
+  iommus:
+    minItems: 1
+    maxItems: 20
+
+  memory-region:
+    maxItems: 1
+
+  video-core0:
+    type: object
+
+    properties:
+      compatible:
+        const: "venus-decoder"
+
+      clocks:
+        maxItems: 2
+
+      clock-names:
+        items:
+          - const: core
+          - const: bus
+
+      power-domains:
+        minItems: 1
+        maxItems: 1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - power-domains
+
+    additionalProperties: false
+
+  video-core1:
+    type: object
+
+    properties:
+      compatible:
+        const: "venus-encoder"
+
+      clocks:
+        maxItems: 2
+
+      clock-names:
+        items:
+          - const: core
+          - const: bus
+
+      power-domains:
+        minItems: 1
+        maxItems: 1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - power-domains
+
+    additionalProperties: false
+
+  video-firmware:
+    type: object
+
+    description: |
+      Firmware subnode is needed when the platform does not
+      have TrustZone.
+
+    properties:
+      iommus:
+        minItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+  - clock-names
+  - iommus
+  - memory-region
+  - video-core0
+  - video-core1
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        #include <dt-bindings/clock/qcom,videocc-sdm845.h>
+
+        video-codec@aa00000 {
+                compatible = "qcom,sdm845-venus";
+                reg = <0 0x0aa00000 0 0xff000>;
+                interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+                clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
+                         <&videocc VIDEO_CC_VENUS_AHB_CLK>,
+                         <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>;
+                clock-names = "core", "iface", "bus";
+                power-domains = <&videocc VENUS_GDSC>;
+                iommus = <&apps_smmu 0x10a0 0x8>,
+                         <&apps_smmu 0x10b0 0x0>;
+                memory-region = <&venus_mem>;
+
+                video-core0 {
+                        compatible = "venus-decoder";
+                        clocks = <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+                                 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
+                        clock-names = "core", "bus";
+                        power-domains = <&videocc VCODEC0_GDSC>;
+                };
+
+                video-core1 {
+                        compatible = "venus-encoder";
+                        clocks = <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
+                                 <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
+                        clock-names = "core", "bus";
+                        power-domains = <&videocc VCODEC1_GDSC>;
+                };
+        };
-- 
2.17.1

