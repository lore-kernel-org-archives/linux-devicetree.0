Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7E1C33C9A
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 13:15:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5765F2071F
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 13:15:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="md/291Ch"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfKNNPd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 08:15:33 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45381 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726949AbfKNNPc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 Nov 2019 08:15:32 -0500
Received: by mail-lf1-f68.google.com with SMTP id v8so4984829lfa.12
        for <devicetree@vger.kernel.org>; Thu, 14 Nov 2019 05:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9z7rkpJrlLoeMh05t6y+nlPabQrExaTPME734tIxvFk=;
        b=md/291ChpFviyMAUZIlcGt3q0RQpQVAPh1nV50LkwPIHao9OcbRJZ6W/TvXCoWfYA5
         2njAgUZZlrUYnZW9brNA+ODs3TAytW5uIjZA7/NZtLWdvgiFccEoyfXr2/Ntlo8D+WoR
         KzSlKVtwPNxYWB5fdxwpLRy3VdnnIfPExb/FqEXK8JcqonZJjq+eqM1Rie+dPqPuOzTz
         1gboA7mZlGXDBzGSoSYIdgg5oZzxEQQf4WXLSFJbSf6k5eHlvKVnMHtP73KIYWdSu6DC
         /kUJssZ2/Dp9tv6BpEQhJgWvYA2Own2Q+gBp7IIxJbqlsXQO4sKidSulAHOce0ZwykGP
         OSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9z7rkpJrlLoeMh05t6y+nlPabQrExaTPME734tIxvFk=;
        b=cokvXqYuoTcfqR+Brz8DPjBFX0jbnC0mIdCMU1q8kQIG9T9hplWAmhyZIDF52c4W30
         ouFmlNrM7CPI7PdVYvj52irUzOnMu5ltk+13DSw57PP2cZ8BngsklnuVK04unAVJHQIb
         PLS50sdnS216/D/OT9ukPD62zu4aPAabIqRTF7c36lDg/5Uk6z2HxAZROvOhmAgaR/Nl
         UgWufZof31k/o69W9/4iyWPzxqwgoVJKAee/7th/Fu9uVL9jO2DpgEbxN2g5IpJ/JbWw
         mzqpmVQjGwr94ZAEgOUsOIbb8SK0idHOwJKNpsLOofGCjiYPm+nm2sKsw8Q5lhBQh/v8
         3ePQ==
X-Gm-Message-State: APjAAAW0NMId3zPW+4jWn6I6Twkvwtdldm0Oz89cOPLt28C5SUJh8t/T
        KqO/HsrBMYPJQLLYPXJno6facw==
X-Google-Smtp-Source: APXvYqyLvQwj/9KZhmJKicBOORuxSGsmg5QitV8pjk7lCdvZe6Eq79RBq4cmVB6dAzMCrExjfmFEYA==
X-Received: by 2002:ac2:498a:: with SMTP id f10mr6832516lfl.170.1573737330426;
        Thu, 14 Nov 2019 05:15:30 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id r7sm2283515ljc.74.2019.11.14.05.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 05:15:28 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2 v6] drm/panel: Add DT bindings for Sony ACX424AKP
Date:   Thu, 14 Nov 2019 14:15:24 +0100
Message-Id: <20191114131525.3988-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
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
ChangeLog v5->v6:
- Fix the binding by simply not referencing the display controller
  bindings from a panel binding.
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
 .../display/panel/sony,acx424akp.yaml         | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml b/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
new file mode 100644
index 000000000000..185dcc8fd1f9
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

