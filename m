Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77690C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 08:59:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5696720781
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 08:59:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="viBOK34v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgHLI7B (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 04:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbgHLI7B (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 04:59:01 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7AF9C06174A
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 01:59:00 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id t23so1384546ljc.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 01:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r3OkcCRL7MqoBL5xlT//nFVOTrvwkEqxrrABannpZUk=;
        b=viBOK34vTfDKsrR+xt3ygb+l9eq6m1AdCnrWwi6eVuJtpRgu3PZx2QLv2oh3vpDuLY
         m6o7ISyRqr3b8U/phrDB11xintLMnuYwkcfiV6HOoXxX+9AB+sRHgQiVL/GoLGVauGuV
         eMojLcq3AwEbmJVkEgM6WbgzVsJjpzocYSm1e6PlXWpTJgIY0+sTSPBgqDn5mv7nSa2t
         KOLQH71Zem5nq5UHvCrIWWoquss/cU3MovJHLwijnrW7Og38TSyjXgbKb1n1oyMxHcFN
         Y5Px1rfKFKFE5bXniCz5sn9ksCoPr01UwJfApeCFFqElUIJ3L83FLb3b4FAcOptSdu3d
         rPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r3OkcCRL7MqoBL5xlT//nFVOTrvwkEqxrrABannpZUk=;
        b=pq3KMFzvvl+9WYyUrrgF+tBHqWyiwQb15FRgaB5zQ+DP/uepl8hVUCY28Pwi/1b6SN
         wJiG2PDX0H6O2Z+eED7BuOeM5xfscfnfzPFd9J1kapqhIRfMs1kNyeYsxFeTabwblkE1
         UWlNDkbiF2ruuyzTqGYYuYBe3ThoZX565Sui4MzCgmlVASKu4wKnWVBmZAtsTb7xnU4G
         qfNMAsgmmCEROqpufePUPeWc/6x+bnQ2B0ZJr7Q6qxTmDDNnfCVoaNjDEy+7fXi4fCTK
         cyJsc8hM+aPFB0sJ+Z7eTBKzV3fIr74tyoOzXQ/8AyMKHcSKPkt2bLKoPTKctqAiFlYa
         kv+g==
X-Gm-Message-State: AOAM531m4fVfRv4ztBjPIpCaRfuz6uNmrnrN3bXud6PMvEFDvU/EaAx7
        X36zsXzBNjUoWqaef6BHvZucMA==
X-Google-Smtp-Source: ABdhPJylmCLkSU4B+1axzBLT+omZduMnxFTxK6z1UpJm5jeIGGXgoNolQRVC4TPIwNP1vM30nO0JRw==
X-Received: by 2002:a05:651c:2007:: with SMTP id s7mr4581626ljo.74.1597222739347;
        Wed, 12 Aug 2020 01:58:59 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id 132sm325676lfo.16.2020.08.12.01.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 01:58:58 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/3 v2] dt-bindings: backlight: Add Kinetic KTD253 bindings
Date:   Wed, 12 Aug 2020 10:58:49 +0200
Message-Id: <20200812085850.2643820-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812085850.2643820-1-linus.walleij@linaro.org>
References: <20200812085850.2643820-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds device tree bindings for the Kinetic KTD253
white LED backlight driver.

Cc: devicetree@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Create common.yaml for backlight as suggested by Sam and
  use that.
- Rename the GPIO line "enable-gpios"
---
 .../leds/backlight/kinetic,ktd253.yaml        | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
new file mode 100644
index 000000000000..e17f45a2a6bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktd253.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kinetic Technologies KTD253 one-wire backlight
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  The Kinetic Technologies KTD253 is a white LED backlight that is
+  controlled by a single GPIO line. If you just turn on the backlight
+  it goes to maximum backlight then you can set the level of backlight
+  using pulses on the enable wire. This is sometimes referred to as
+  "expresswire".
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: kinetic,ktd253
+
+  enable-gpios:
+    description: GPIO to use to enable/disable and dim the backlight.
+    maxItems: 1
+
+  default-on: true
+  default-brightness: true
+  max-brightness: true
+
+required:
+  - compatible
+  - enable-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    backlight {
+        compatible = "kinetic,ktd253";
+        enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+        default-on;
+        default-brightness = <160>;
+    };
-- 
2.26.2

