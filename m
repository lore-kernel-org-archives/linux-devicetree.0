Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0626CC33CA1
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 15:50:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF28121744
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 15:50:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ISEN+lju"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbgAFPuV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 10:50:21 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33080 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgAFPuU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 10:50:20 -0500
Received: by mail-lj1-f194.google.com with SMTP id y6so43370818lji.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 07:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bwAT2XWcUWTIAz8ovsKA2zMF8ldaoI73jdUGsE0/j7I=;
        b=ISEN+ljul5zbwEs37aMK7qGdMjDfHDaHyakglYuS0czKpb1pi83R/4dNAChWgp1ZTQ
         HI+gOII1eVo35iHxXLz225Fs/5L8sTyuLI0fZLTShiuqdrTeFRWZqjUM0naIrt4Gq+kY
         LGOJLUQggMt65g7RLc7WYEzhHDTi0dr/6YEE9AUh9II69aISX160tReVOIdlFinkUhE2
         oAJSEm1VBuu4jMYw944VHkKcUGT8WzuyYVFBYeLk6Q6PCcUebld+t1fDDbcemMM2cPTH
         cHS8TbjY1CGf9Cih9GwVr7A+wlNGRnshwBR2PApsu/X2kUcXu4Ux9qnZcBEenCOFx7lQ
         5rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bwAT2XWcUWTIAz8ovsKA2zMF8ldaoI73jdUGsE0/j7I=;
        b=pOg66CjfXMPosrNthYVclZMuIc/pYd6GzM1SdgRRGsiRCxCkKruaSTZbtCgB2vi0qK
         zOCn3GjB7HhH3GK3dKwSp38CxM484C2JnbmLjqXe6DXdvDB1xO0O0508LCol87ZMRAjO
         aFdSFqVAu5fAnHqyqtreR4jCl42c1IUeofMSKeDgZQ+SD0y5Wb2/FTLnJ0kWhOvOSeQE
         oqMg7oYLDYOkn8+kzUXdgzOVj51aQlmw+TgGTAnSnWust4FZpJgd9CZKDCPhA09YEt3U
         tEp+ZnPDLa3O0+RXAiOVWYi+sg31/ILdUifIkdrtmtwCP/3F9tSlKiYdukgzhB32i0qn
         Oe5w==
X-Gm-Message-State: APjAAAV/eQFGFQkUKh/2ArR5pcoyycNn7Tg7gw7BWOmC0rPVGOf2UHr+
        fc56K9xAW2trAqxmFI2qXv8YdQ==
X-Google-Smtp-Source: APXvYqyfN/Txlv5OTSZXcQJltcuohomKJz0luNwo/dCj7iu5oNleIUxXbdzW6ldd4Sou6eeBxAQORg==
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr57815026ljg.166.1578325817404;
        Mon, 06 Jan 2020 07:50:17 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id x84sm29388259lfa.97.2020.01.06.07.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 07:50:16 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 07/12] dt-bindings: media: venus: Convert msm8996 to DT schema
Date:   Mon,  6 Jan 2020 17:49:24 +0200
Message-Id: <20200106154929.4331-8-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Convert qcom,msm8996-venus Venus binding to DT schema.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../bindings/media/qcom,msm8996-venus.yaml    | 153 ++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
new file mode 100644
index 000000000000..3d42fa83d31b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#"
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
+    const: qcom,msm8996-venus
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
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: mbus
+
+  iommus:
+    maxItems: 20
+
+  memory-region:
+    maxItems: 1
+
+  video-decoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-decoder
+
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        items:
+          - const: core
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
+  video-encoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-encoder
+
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        items:
+          - const: core
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
+  - video-decoder
+  - video-encoder
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
+
+        video-codec@c00000 {
+                compatible = "qcom,msm8996-venus";
+                reg = <0x00c00000 0xff000>;
+                interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+                clocks = <&mmcc VIDEO_CORE_CLK>,
+                         <&mmcc VIDEO_AHB_CLK>,
+                         <&mmcc VIDEO_AXI_CLK>,
+                         <&mmcc VIDEO_MAXI_CLK>;
+                clock-names = "core", "iface", "bus", "mbus";
+                power-domains = <&mmcc VENUS_GDSC>;
+                iommus = <&iommu 0>;
+                memory-region = <&venus_mem>;
+
+                video-decoder {
+                        compatible = "venus-decoder";
+                        clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
+                        clock-names = "core";
+                        power-domains = <&mmcc VENUS_CORE0_GDSC>;
+                };
+
+                video-encoder {
+                        compatible = "venus-encoder";
+                        clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
+                        clock-names = "core";
+                        power-domains = <&mmcc VENUS_CORE1_GDSC>;
+                };
+        };
-- 
2.17.1

