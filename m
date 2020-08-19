Return-Path: <SRS0=VXX5=B5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC82C433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 20:52:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8BD22245C
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 20:52:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LXqQ/fx4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgHSUwD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 16:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgHSUwC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Aug 2020 16:52:02 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F134C061757
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2020 13:52:01 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id j22so12800896lfm.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2020 13:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DrnAOfNeMY45Zc2VAynDzTk+Pika+bbdhzqu0uIz8TM=;
        b=LXqQ/fx4gASCmZtcHjHDguMZZ92GvjofBVvXPDlt6vO7HSmPDQfvI/a/1vyZzNRgCX
         jZ12bFn+2i3bNm8Vwhp2CRp3Kf4137UrglxaGOSBJrPBn4EoOKc5erpsRjErMoF/aOK0
         4mbTxt6DBylQ2k0lHNyEEDV/K9XjHFG7X27bDQoflaUbym7Zrb6zTkrPHbkyk+q/AWiw
         NpxZzk75/qrynlhb8vXjuStzilomVCS4k1FHz1/ImOxhlq2jY/vkv8eDYBpoIr3wXeKp
         BXY5Cd36msSs24beVkJdlDqGRkl+r2B5Tk2obFnE+Siy0Qmdz0M5aXogdXgPOhG3hOvX
         Pi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DrnAOfNeMY45Zc2VAynDzTk+Pika+bbdhzqu0uIz8TM=;
        b=oZw7zWt2jc5Jqd7UjVinYG2K6oBuyiFX5KVn1spdqY4J/y3K5UvxqahwZhrQdfF4mC
         3gGh2dstFIs2wBWYU0FgcxBIG4W2smPJTTBKPhw5tIkxxYaLK6mjXv4ek8s/tbDVuxSi
         pI2flDEIPZAKVM1kZAJ8whDMfjHyLvPBrF5RH3t1Z0FMbspri2UdbVmIFcWmVaB8a80h
         9Fom3R/iGGt7EeGUoBiVwga+s4p5kVPWOv3/IoBvrSbePuIlyXvFthpecnEJdG5hBC7B
         xdScyvwCgd39cWtSTJU1ryck0R3vxttjdTP/KZ5pL4yBS0LsCO7pJGdN/a5xyFefFset
         icTw==
X-Gm-Message-State: AOAM530FKqLQtPX0eHuUm8alK9m6LixCp/jrPnOkITmk5REHs7KBCO9h
        /CGyaDd0qVqbQhlxz75mw9ZIZ50wZIR3fw==
X-Google-Smtp-Source: ABdhPJyz+ohEqmEM1RkxQtUpRLw6wTd+k/jtb3NLYO4vG+UVH3YylURSMNIz97RIaO7LeQ91qbxsZw==
X-Received: by 2002:a19:3f57:: with SMTP id m84mr1052364lfa.128.1597870320184;
        Wed, 19 Aug 2020 13:52:00 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id u10sm8188lfo.39.2020.08.19.13.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 13:51:59 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 1/3 v3] dt-bindings: backlight: Add some common backlight properties
Date:   Wed, 19 Aug 2020 22:51:48 +0200
Message-Id: <20200819205150.164403-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Let's use a common.yaml include for the backlight like we do with
the LEDs. The LEDs are inherently incompatible so their bindings
cannot be reused for backlight.

Cc: devicetree@vger.kernel.org
Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Drop the | for the description
- Drop the "default-on" property, we're not using it.
- Drop the minimum 0 for unsigned u32:s
ChangeLog v1->v2:
- New patch as suggested by Sam.
---
 .../bindings/leds/backlight/common.yaml       | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/common.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/common.yaml b/Documentation/devicetree/bindings/leds/backlight/common.yaml
new file mode 100644
index 000000000000..4e7e95e331a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/common.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common backlight properties
+
+maintainers:
+  - Lee Jones <lee.jones@linaro.org>
+  - Daniel Thompson <daniel.thompson@linaro.org>
+  - Jingoo Han <jingoohan1@gmail.com>
+
+description:
+  Backlight devices provide backlight for different types of graphical
+  displays. They are typically but not necessarily implemented using a white
+  LED powered by a boost converter.
+
+properties:
+  default-brightness:
+    description:
+      The default brightness that should be applied to the LED by the operating
+      system on start-up. The brightness should not exceed the brightness the
+      LED can provide.
+    $ref: /schemas/types.yaml#definitions/uint32
+
+  max-brightness:
+    description:
+      Normally the maximum brightness is determined by the hardware and this
+      property is not required. This property is used to put a software limit
+      on the brightness apart from what the driver says, as it could happen
+      that a LED can be made so bright that it gets damaged or causes damage
+      due to restrictions in a specific system, such as mounting conditions.
+    $ref: /schemas/types.yaml#definitions/uint32
-- 
2.26.2

