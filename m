Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25FECA9EA9
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 18:25:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B23E521835
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 18:25:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kimc05Do"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502865AbfJRSZA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 14:25:00 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34430 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502836AbfJRSZA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 14:25:00 -0400
Received: by mail-lj1-f195.google.com with SMTP id j19so7181801lja.1
        for <devicetree@vger.kernel.org>; Fri, 18 Oct 2019 11:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YYQD8ZjjV8FYWgYSkKKTS/qtO4T+D7cqMY9D6mPQHr8=;
        b=kimc05Do/CaE/fiIUHNko2Lc742S8/237oDRPUfI3GEx6oAx9L9lJDf1iB9ZVBvgqr
         QHI9LXd7JPvAcIL8zQeohj8pqSIe4nKSyTNiX153O98ykn+pcc0mC6UD7j89U/P6K654
         wXdH5XPyh2zGfOJ3JCCvTD4hpxDtVNzNYM4mpoG7KN810cJKVnXxZud/XLtcFFIeY0wW
         /iVfomwNt/Sd+lhGoDLSXOItmjkDyAIakZzaekbf2DwspANM3ihx4jgKH8wazzadgrPt
         PClTRmbx3FQyecschVXDPaHtu5piX9TuDiRTHMHviHbZNAsG9BB+i38YhGgM58jkjt8k
         rLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YYQD8ZjjV8FYWgYSkKKTS/qtO4T+D7cqMY9D6mPQHr8=;
        b=C0rMbZn/2KMmAZ5SFplKT9F/9shiUbrMx/7cfamLDt7PvTRA45rXIBd3hL4PmTYI3/
         jzRfTlZW7o5D4/DybYUzOa+6AlczpIngSDV6pSZMZh+zmwHfMdkzu5q/ORUUsugcNYDI
         hEjnjVzo7a4jIwOiA3Q3fK33y9Q81T57s2FLEROrwfRm8E4aVNmDXagsrx1DmgHhIdgm
         3RhPLauQzNKBB/vS4TjVAoWt/e4JzreohWEOoxM0vDV1y3OgfIHRLizkl1jkAm/IhgDQ
         r20PiMtyb5BZmk2JOtU+UPk5z9Cm0uIKUAO3uf/QrWFYNs5eQBZoz9sEACesr0pbFCS0
         tVGw==
X-Gm-Message-State: APjAAAXUHuKZZTgibKoMFxzugcD4gQkUzpgA/VnUseralKTJ1DTSZb3t
        6pXpf05PHKsV2B0TLe3atlzDhg==
X-Google-Smtp-Source: APXvYqxtc8ZUeBcK8hiA5gxckfrSmYQjAwIJX8pQ/ZT8e1aLDLHCnL2gVSUTTfHtu03NaTJV1SDldQ==
X-Received: by 2002:a2e:29dd:: with SMTP id p90mr7174062ljp.26.1571423098036;
        Fri, 18 Oct 2019 11:24:58 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id g26sm3020617lje.80.2019.10.18.11.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 11:24:56 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/3 v3] drm/panel: Add DT bindings for Sony ACX424AKP
Date:   Fri, 18 Oct 2019 20:24:45 +0200
Message-Id: <20191018182446.26131-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018182446.26131-1-linus.walleij@linaro.org>
References: <20191018182446.26131-1-linus.walleij@linaro.org>
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
index 000000000000..c01eea17b08f
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
+  - $ref: panel-dsi-common.yaml#
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
+        panel {
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

