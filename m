Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4D3C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 09:07:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4677320781
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 09:07:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XdScEtS9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbgHLJHW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 05:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727049AbgHLJHW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 05:07:22 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EAAEC061788
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 02:07:21 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id i10so1415353ljn.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 02:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t7cpfjcHtDHnwaPBBHF6z2YVNppEhyu7a7r8Eo2vTf8=;
        b=XdScEtS9GfoaxLnDQMiuBSmxXLy2IuRtYlnwb+sCkNgVqyATKyej4FweOmqFRX9UiZ
         tW3PZb8EVnA25e7lpon/YDc9+j8mn/iIYnnYzYnaMXU+rVebnu14Y7ngP0+Oo/yZRWdI
         oIzmimPplM4cKANibNhXGBZAcfxUD+x3lEc1/rlmspth1alhZgJN6Uv3E8fkVEPyXZAo
         VAHRsKovjPu7d+FCyxbwSvN0rMXdd5wx8IOrlCdKdZAvCoPLEM6+Q/ZD+3jQTlHMdh9m
         6rB8EQf8byp8cKfMVquuLO+aQ/4WGALOTIUJio3jh4E9Cr0BAqKrXBrhDB/NhnLAAV8a
         gwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t7cpfjcHtDHnwaPBBHF6z2YVNppEhyu7a7r8Eo2vTf8=;
        b=kvdkF+3bTwmj+nkJ/7mfZ3nDwip4E4nEppC3zTHaoaG8e1+W9jYHM6Bry1ZHLkWsx8
         d4Odb4dsUpWWS7YKZZxrWkXIhJEV9mfMANo/yZM/LCpwqmcJJ/3fS6ZenXl2Q99pGU/U
         DGL1rauBIQKwea4YoFNCpMiSZZmokg+qY0skxd3b0YJQvQaETG1jyrhMgV1NEJm1/RaH
         x7wAMtCdpPyKjOKHLH+pfPhp45LHiGqIU3YBcIHnF5ZW+m7cXBNb3dapiQFGCPG5ri6c
         4BLDh7IKyumPp0nIfsoMoY3BhgCsG9T+rghtCI6plmGz1Ieua+PhkCF+5AM/ZqkSB013
         JUZg==
X-Gm-Message-State: AOAM533cX+1FmUwFIeQEM17yGlRharkBTOGUfihjutnegJG1lmfsuACW
        zzBR0K3DB+KDpTW1yQeTGAstAw==
X-Google-Smtp-Source: ABdhPJxBEtVvf5OqH1WJEI9KjtZWUXh4iSaCHjlHFv1XwLfsmWZiGITNhV//KKl5W0tJd+rRXy2CsQ==
X-Received: by 2002:a05:651c:1293:: with SMTP id 19mr4639969ljc.427.1597223239940;
        Wed, 12 Aug 2020 02:07:19 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id s4sm305346lja.124.2020.08.12.02.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 02:07:19 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: leds: Add DT binding for Richtek RT8515
Date:   Wed, 12 Aug 2020 11:07:10 +0200
Message-Id: <20200812090711.2644688-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a YAML devicetree binding for the Richtek RT8515
dual channel flash/torch LED driver.

Cc: newbytee@protonmail.com
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/leds/richtek,rt8515.yaml         | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/richtek,rt8515.yaml

diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
new file mode 100644
index 000000000000..579ef8a2e40a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/richtek,rt8515.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RT8515 1.5A dual channel LED driver
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  The Richtek RT8515 is a dual channel (two mode) LED driver that
+  supports driving a white LED in flash or torch mode.
+
+properties:
+  compatible:
+    const: richtek,rt8515
+
+  enf-gpios:
+    maxItems: 1
+    description: A connection to the 'ENF' (enable flash) pin.
+
+  ent-gpios:
+    maxItems: 1
+    description: A connection to the 'ENT' (enable torch) pin.
+
+  led:
+    type: object
+    $ref: common.yaml#
+
+required:
+  - compatible
+  - ent-gpios
+  - enf-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    led-controller {
+        compatible = "richtek,rt8515";
+        enf-gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
+        ent-gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
+
+        led {
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            flash-max-timeout-us = <250000>;
+        };
+    };
-- 
2.26.2

