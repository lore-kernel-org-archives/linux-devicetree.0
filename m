Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547DDC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 08:58:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FCBC2076B
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 08:58:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mKuImcfj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgHLI66 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 04:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbgHLI66 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 04:58:58 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6C7C06174A
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 01:58:57 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id d2so763917lfj.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 01:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XR829pUP5cLChd4zqV/cH8aq566vZipy/8mJiU3FYTY=;
        b=mKuImcfjEOJa5U6e8r4Oy2S/3g8vafL/gjV+IfgGp/8JPqvEEUDaOZ0SiUip81VNwg
         +3xBN84L9ziqvJPujY2o5pBMUYAEcTCuMLYgaxjkulnLjtLX2BvvirHb4yTsjwIX1VsO
         dRLr1Agaoxh93uPOXsl0oKVMAAVDjBwW9RoQwC/A6XKWCI1ZWSgoRqheqTxfN14x7/co
         n92xE3RLiemHvtTUq42uOXq9rhFY4iBPuTowinKxanXqn5eKtRSQltgnAIv0QdYcxx1J
         ojeY9NWozkeN0R5Mm+jhlJbEJrJndAvuhBYiXuLvme0yndR0bd6qHOFIh9k8LM6cj8wU
         2L7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XR829pUP5cLChd4zqV/cH8aq566vZipy/8mJiU3FYTY=;
        b=KGk8uabBB1GH7bQlvR5Bi00lSgmcEd33FqClgkK6gRVqrxOX/qzubPg2GourL/Wwi3
         5M431klTGFwZFSZnEvsUciaJwH5A4CXjH+m6cjKEyn3Rp4EUQYCiYjQXjDTCtS3HrIJz
         DzZXV+a5vh1QXZ2ecbrKaGmdh3I4khyAFPo0MxYJKKcq3F5rrTF9kJW4hicr0i1lbP+P
         KuSk0MAwpxoFvnqISIiXIqvw2dLeGPsVJEihqIZOcAtxyCNHPRFZERNaHQo6weyxMiQP
         SciXMuurKuDewOZcFcZzztmYxIN/c7oXTub0V7xILZrJx3snQe1Wc3+dPAg+xpvsaE8O
         wjmA==
X-Gm-Message-State: AOAM531/emutjcYbduHoPHdsttigOz+Rvq1lPo5qfGTHxH43k3S4Fd7y
        qMGQ1AAtso73DMSGPxmOau3e4w==
X-Google-Smtp-Source: ABdhPJzF4FhFZlghHCbK3ZU7Y+VshjC75Tt5gKCXubxLdvdRGZB+h+0y1ygWCnWkw1vUXqnqbKAl5g==
X-Received: by 2002:a19:814c:: with SMTP id c73mr5043801lfd.16.1597222736269;
        Wed, 12 Aug 2020 01:58:56 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id 132sm325676lfo.16.2020.08.12.01.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 01:58:55 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 1/3 v2] dt-bindings: backlight: Add some common backlight properties
Date:   Wed, 12 Aug 2020 10:58:48 +0200
Message-Id: <20200812085850.2643820-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- New patch as suggested by Sam.
---
 .../bindings/leds/backlight/common.yaml       | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/common.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/common.yaml b/Documentation/devicetree/bindings/leds/backlight/common.yaml
new file mode 100644
index 000000000000..8ae7e3818b0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/common.yaml
@@ -0,0 +1,42 @@
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
+description: |
+  Backlight devices provide backlight for different types of graphical
+  displays. They are typically but not necessarilt implemented using a white
+  LED powered by a boost converter.
+
+properties:
+  default-on:
+    description:
+      The initial state of the backlight can be set to be on with this
+      property. This is a state applied by the operating system so that the
+      backlight is always turned on at boot.
+
+  default-brightness:
+    description:
+      The default brightness that should be applied to the LED by the operating
+      system on start-up. The brightness should not exceed the brightness the
+      LED can provide.
+    $ref: /schemas/types.yaml#definitions/uint32
+    minimum: 0
+
+  max-brightness:
+    description:
+      Normally the maximum brightness is determined by the hardware and this
+      property is not required. This property is used to put a software limit
+      on the brightness apart from what the driver says, as it could happen
+      that a LED can be made so bright that it gets damaged or causes damage
+      due to restrictions in a specific system, such as mounting conditions.
+    $ref: /schemas/types.yaml#definitions/uint32
+    minimum: 0
-- 
2.26.2

