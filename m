Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A86ACA9EAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 11:43:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F3EF2166E
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 11:43:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dN9+UiU2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbfJXLnO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 07:43:14 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45912 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbfJXLnO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 24 Oct 2019 07:43:14 -0400
Received: by mail-lf1-f67.google.com with SMTP id v8so18288573lfa.12
        for <devicetree@vger.kernel.org>; Thu, 24 Oct 2019 04:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y6qwseFf3sOEzysjfxOCeatUxazVlV6E5726z4gpfTk=;
        b=dN9+UiU2TiIaFv1ECG8dz2AKCpyynB8QkW7md/WXneHG+ISMq7AOoyaWnBLRx6PmAY
         wXWWnF3wjJYAdwfg3HzJfX9UwYP9NvatBJyQpbjP/e+Tuc7RJbuqP9ArqxbPjtwGNikj
         tFn26MVd/P/b7ieBc3YSzBJV8fdanYQ2Zv4qzqR8TctDjFINFboEs6WGkCJa4sS2H0Hq
         02QOjA6Xds3Gcpjct994FJ8a2Nhqp8byEzloxr+5qdwusSGfrh3Daj52ZfgFAx9cUUBf
         AXtxTJn2f6upA6wyfmm32/YAowtwNgXf2IJgpqk4DysQdfOWhpHtPts87nW8wC3Rj1+W
         sMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y6qwseFf3sOEzysjfxOCeatUxazVlV6E5726z4gpfTk=;
        b=pgZNpnYDfftCQpqI+T/MqBt/b0E8cogBm29CBk2mQKhm0kbK5QG29qD7QB3p56d1Tl
         46lxnzQptemS8T5Hsmp9DDyLEnNYLbaxuVFgludqd7KHVhlQRAJSLsAHhZxsdfNpJAx2
         GcZzkipSnDguqRujA5mufQnuxyRWLSy6hJCer/I1o6PpKPBVTh17/R9uWqvTb6Qx+TN5
         RiaoNsxdrIYKl/PCzvjHUt6V6X3ont2Mc9/P/VRhFU+nR4qpEdk/nF69EwTFe3Py0ZC0
         pivlRGNHbI0/mrmNR7EfN94WeqSMMAF0YB7Lho2P5QUvL3/Cm9yc/fhKwnN1w6HI8iiT
         rYrQ==
X-Gm-Message-State: APjAAAUDaxZSRVPT8PhmQGq00VJ0FPNwUU00W/+FhEbOZQqY1zNnbC4c
        SoCL7G4uHa3i1qSbsqkbt2qXmg==
X-Google-Smtp-Source: APXvYqwApy6iTTlUo7LyKjHSge1hqKfP9JTwipM9xBhCzAcimzQLZisjM3ga4wJey8II3bDv8+mD1A==
X-Received: by 2002:a19:651b:: with SMTP id z27mr24607041lfb.117.1571917392144;
        Thu, 24 Oct 2019 04:43:12 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id e14sm4001846ljb.75.2019.10.24.04.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 04:43:11 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/3 v4] drm/panel: Add DT bindings for Sony ACX424AKP
Date:   Thu, 24 Oct 2019 13:43:04 +0200
Message-Id: <20191024114305.15581-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191024114305.15581-1-linus.walleij@linaro.org>
References: <20191024114305.15581-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds device tree bindings for the Sony ACX424AKP panel.
Let's use YAML.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Adjust to adjusted DSI bindings.
ChangeLog v2->v3:
- Put the example inside a dsi-controller so we have a complete
  example that verifies to the DSI panel generic binding.
ChangeLog v1->v2:
- Suggest a stand-alone YAML bindings file for DSI panels in
  a separate patch, and use that to reference the
  boolean "enforce-video-mode" attribute for DSI panels
---
 .../display/panel/sony,acx424akp.yaml         | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml b/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
new file mode 100644
index 000000000000..a2f49b9a5958
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sony,acx424akp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony ACX424AKP 4" 480x864 AMOLED panel
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: ../dsi-controller.yaml#
+
+properties:
+  compatible:
+    const: sony,acx424akp
+  reg: true
+  port: true
+  reset-gpios: true
+  vddi-supply:
+     description: regulator that supplies the vddi voltage
+  enforce-video-mode: true
+
+required:
+  - compatible
+  - reg
+  - port
+  - reset-gpios
+  - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi-controller@0 {
+        compatible = "foo";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "sony,acx424akp";
+            reg = <0>;
+            vddi-supply = <&foo>;
+            reset-gpios = <&foo_gpio 0 GPIO_ACTIVE_LOW>;
+        };
+    };
+
+...
\ No newline at end of file
-- 
2.21.0

