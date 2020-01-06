Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BD4C33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 15:50:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC38D207FD
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 15:50:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SwWyXdzI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbgAFPuZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 10:50:25 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46065 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbgAFPuW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 10:50:22 -0500
Received: by mail-lj1-f193.google.com with SMTP id j26so51359016ljc.12
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 07:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qJRQqbxtU+g5xK/We/q06cYHmzIn2tLzDjx3jt0m0lc=;
        b=SwWyXdzIVboa4oz5pq9asgnlJ43rSiu4CmuNG3Is4ywORbuYnnJUUf44y61F2UDWnk
         xUAM0OeK/tKHrbU2fkeOnDswGXrTEDy7ZL/3TSEMJQimaoqnyvhA3vJTkOYj1ujYHpvH
         xYKYbcv1aV8HYg+fWSDftud6DTbJ3EjUpwL3o+1lWjV2N2Ol8BZuuPrEKdWV3xXQ3SV+
         wEyvj3Rex5g5x1LdTM0IGbC0FDIAAkuL9wu8UTPON/5MfbIzIB7naGcFMRuBo+IAGpdr
         ID54WhnWm/TFOWcY/iBbmACR+dHFhrAKsjXzmasTVv6E0VYXOPO9Bi/wK0KO1Sp04Hd1
         zgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qJRQqbxtU+g5xK/We/q06cYHmzIn2tLzDjx3jt0m0lc=;
        b=iUSwGn+u7sABn+s6iQbRHMyhEt0/B0cwLMZKtr0I0stqh5X6Mn0qC51AzcsQfSfaf/
         D1TAknJQcdV4PeL+PH+66j4pKQ8WB25QG8sABeFBXH1h9PcK67vDrjhQ4nUJB+51mmo8
         4eFi+ZYqFFErvkp5zKOV9QFyeSIXoEJmg0DTiy1GIPeadjVqi5eNYXanHF5nuj7QxoCq
         Erbvf+m8j+7HU4aoksBR0ljrafAYsbTnDnV58Kb2rpsq5Wikvn7MaMsOMeGB1VrGgXER
         Ltunn4rOEid5iLD9KfJtEmM1dUgmKLp5YgqlqXCoTecCky7+Ap+NwyYMEsefKYrChkfF
         YuAA==
X-Gm-Message-State: APjAAAUHtZJIiBcxyqewpxY7F8nMUPGw0TPQbOr0CWYPr35Z3/u5RiTs
        v6Ugx8R8m0sFVKy+HGwdq9zxSg==
X-Google-Smtp-Source: APXvYqwEqBo6XhdAmAqIVvPlC+H4ae4xFNAxoOJCGDw1SOvr1ow15WmxvJqY+UtNkfDmEg1mVV1sAw==
X-Received: by 2002:a2e:870b:: with SMTP id m11mr59228435lji.93.1578325819348;
        Mon, 06 Jan 2020 07:50:19 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id x84sm29388259lfa.97.2020.01.06.07.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 07:50:18 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 08/12] dt-bindings: media: venus: Convert sdm845 to DT schema
Date:   Mon,  6 Jan 2020 17:49:25 +0200
Message-Id: <20200106154929.4331-9-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Convert qcom,sdm845-venus Venus binding to DT schema.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../bindings/media/qcom,sdm845-venus.yaml     | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
new file mode 100644
index 000000000000..05cabe4e893a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
@@ -0,0 +1,156 @@
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
+    const: qcom,sdm845-venus
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
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
+    maxItems: 2
+
+  memory-region:
+    maxItems: 1
+
+  video-core0:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-decoder
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
+        const: venus-encoder
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
+        maxItems: 1
+
+    required:
+      - iommus
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

