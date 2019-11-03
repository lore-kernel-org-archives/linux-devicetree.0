Return-Path: <SRS0=PDL5=Y3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9323ACA9EB0
	for <linux-devicetree@archiver.kernel.org>; Sun,  3 Nov 2019 20:57:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6661621744
	for <linux-devicetree@archiver.kernel.org>; Sun,  3 Nov 2019 20:57:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B9CBujAL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727683AbfKCU5P (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 3 Nov 2019 15:57:15 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40796 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727501AbfKCU5P (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 3 Nov 2019 15:57:15 -0500
Received: by mail-lj1-f194.google.com with SMTP id q2so8846132ljg.7
        for <devicetree@vger.kernel.org>; Sun, 03 Nov 2019 12:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OWmTkgG+DdmOGUyUmLEDg8JGs6+s+lKtM+lwb24iwj8=;
        b=B9CBujALEz6KEgHeAHPXYL3qf3J11FjOtj04mnLd2rylkQI9Zw20l+n4oiBXrpsnK3
         efnwnAfTGd2amCVTf8pzC+0s653jji0LnItxsEwUW7IWVQ9PHQyfHG7Bt9+Cb4/HY1tn
         y4adR0kkCbSM85NcvToR98+ZoPJq9QdbJy6qVwkooqJCXafvRV2Wt8u/XJHSNAnnb06k
         8gxhYDK8stBqxaZ01Yk4u/a4F/6JnS0t2jiGMunAeQPauQ/0cwINeIvwEd+Pr1Cz+S8K
         BW2t78NlNqxBMiuartgpO7mPu9JEkrDueT8Jq7X9SNN51Rdh9y0r2MtN0E7X5ThO+q8v
         /KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OWmTkgG+DdmOGUyUmLEDg8JGs6+s+lKtM+lwb24iwj8=;
        b=JfESCHvG1KVd/Jnnl5jAmIv0UaU8KHSyNr/lViVN+ziYmewLAC1kmsDW1LqujsbCnV
         lvT+1yHxcCvQQLA56wR/VxMsMs1GEkTNOhK+C6Zk/d6j8TZkzkplsG2flVHGt/VzQTb4
         FyqfLVOT8Miqt3dJB/PVfQCZPgmeiuAcbz5SrFShHAsR4RdQHBbb2RmBzl82FKt5Q98+
         v0GIoM50Qu11iVtpUjvX8Pnd5WgOkwWzIv2xQi1iwoSlkJIbVP1bhQx1AODvk/cirH6k
         Is+oJi/FgRon6j10qs3w2dvTfZJN5nUHiLxWsbDwpIpTDluMUXYsaX1+QWNDj/RjXHKc
         w38Q==
X-Gm-Message-State: APjAAAV3WJw2PVTEhdpWQ5hcZxjT1xp7x3DpOgDAg/B+Y9QbMQHVK2LO
        96LF09jmpSQfAZOtzsdczLSq7g==
X-Google-Smtp-Source: APXvYqyl+jVTdA9oYmr5lDEn5dTrROBCisuGIRKXHjUxr/01TErtFXyfrYuZm5A7G816KZBN8pHP6Q==
X-Received: by 2002:a2e:9119:: with SMTP id m25mr11530357ljg.24.1572814633241;
        Sun, 03 Nov 2019 12:57:13 -0800 (PST)
Received: from localhost.localdomain (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id v203sm6936784lfa.25.2019.11.03.12.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 12:57:12 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2 v5] drm/panel: Add DT bindings for Sony ACX424AKP
Date:   Sun,  3 Nov 2019 21:54:59 +0100
Message-Id: <20191103205459.24965-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191103205459.24965-1-linus.walleij@linaro.org>
References: <20191103205459.24965-1-linus.walleij@linaro.org>
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
ChangeLog v4->v5:
- Fix up all warnings etc incurred from the now working schema check
  and DTS compilation.
- I still have a vert annoying error message in the Sony
  panel bindings that uses this schema:
  sony,acx424akp.example.dt.yaml: panel@0: $nodename:0: 'panel@0' does not match '^dsi-controller(@.*)?$'
  As this is modeled very closely to
  Documentation/devicetree/bindings/net/mdio.yaml
  and that one doesn't emit this type of warning for its ethernet-phy@0
  etc I am pretty much clueless and just can't see what the problem
  is.
- If I can't figure this out the only viable next step is to drop the
  ambition to create yaml bindings simply because I'm unable to do
  it, and go back to traditional text bindings :(
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
 .../display/panel/sony,acx424akp.yaml         | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml b/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
new file mode 100644
index 000000000000..1c123139b80a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
@@ -0,0 +1,50 @@
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
+  reset-gpios: true
+  vddi-supply:
+     description: regulator that supplies the vddi voltage
+  enforce-video-mode: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi-controller@a0351000 {
+        compatible = "ste,mcde-dsi";
+        reg = <0xa0351000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "sony,acx424akp";
+            reg = <0>;
+            vddi-supply = <&foo>;
+            reset-gpios = <&foo_gpio 0 GPIO_ACTIVE_LOW>;
+        };
+    };
+
+...
-- 
2.21.0

