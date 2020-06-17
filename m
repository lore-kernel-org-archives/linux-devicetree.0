Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A826C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 14:51:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA2F2207DD
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 14:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y9OrDC9h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgFQOv5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 10:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgFQOvz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 10:51:55 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1FA5C0613EE
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 07:51:53 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id a127so1232289pfa.12
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 07:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3UqoEHyclqWTZ6o9P2bVTaRwTAG/SUOq+WEpN17DlXI=;
        b=Y9OrDC9hmnaZiWZ03awQhEvSEjE+uRuTYpf6VJ3V4kdyWqzAzoewW0MqirwTRACtwb
         Z8ydiqwUnj99tTs5JBdt4fcU5vXzr54yADGIOv/3pWK9zGlWl54589kDU9/bwNgm0JZw
         ofNSDYACtqdkjl5eimB61JEWjAyg0eYOOH0jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3UqoEHyclqWTZ6o9P2bVTaRwTAG/SUOq+WEpN17DlXI=;
        b=Xu+1j7t2OP+u5cOm0ZVZNnFN7xuyR92QaWRRv7PITIMc9B9GDVajsAs+Xu2d2RqjaY
         kvXYX74Eu+hhiD7f0enzvp1pcdqtxHXx0QwL4dCHBFpl5gBbagJE0oIjXd8c//vN90fh
         f/M3E00jxqeBPHVMnAdrydnT9WW1Sm8oFS7HxR2JvSttKMAVnc+DU67DaXGaKjogMP1y
         rADD9oH6ysb8k3kSl28Vvj6+yxE4Pig4GdkDf7DfOG0hU6+duvCgVtsN3n7fvBZQqDtN
         L3BMVvq+PZIbKvZUFdxGwD/wu0gx9fImvmKGy37Z+Yw4V9N+RBoZ4jIxXT69ogm/cwKN
         Iq4A==
X-Gm-Message-State: AOAM530d2+yJslkNEkYjP7ukCC+YYzV5fq1WLWronPOkGSAQAz6U5tNi
        ytZDI5sjF8J+xkuUEz39jS41YQ==
X-Google-Smtp-Source: ABdhPJwZuUJa5t0PDpcdBoO4yQcCP6aoTAXHLpNeKnYlVkvVd6NZvxEFFbYGHs9XYEoQBDCvij/dug==
X-Received: by 2002:a63:1b20:: with SMTP id b32mr6694782pgb.39.1592405513440;
        Wed, 17 Jun 2020 07:51:53 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id k18sm147040pfp.208.2020.06.17.07.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 07:51:52 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     dhavalp@codeaurora.org, mturney@codeaurora.org,
        rnayak@codeaurora.org, Ravi Kumar Bokka <rbokka@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: nvmem: Add properties needed for blowing fuses
Date:   Wed, 17 Jun 2020 07:51:14 -0700
Message-Id: <20200617074930.v3.2.I3b5c3bfaf5fb2d28d63f1b5ee92980900e3f8251@changeid>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
In-Reply-To: <20200617145116.247432-1-dianders@chromium.org>
References: <20200617145116.247432-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Ravi Kumar Bokka <rbokka@codeaurora.org>

On some systems it's possible to actually blow the fuses in the qfprom
from the kernel.  Add properties to support that.

NOTE: Whether this is possible depends on the BIOS settings and
whether the kernel has permissions here, so not all boards will be
able to blow fuses in the kernel.

Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Add an extra reg range (at 0x6000 offset for SoCs checked)
- Define two options for reg: 1 item or 4 items.
- No reg-names.
- Add "clocks" and "clock-names" to list of properties.
- Clock is now "sec", not "secclk".
- Add "vcc-supply" to list of properties.
- Fixed up example.

 .../bindings/nvmem/qcom,qfprom.yaml           | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 5efa5e7c4d81..b195212c6193 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -17,8 +17,27 @@ properties:
     const: qcom,qfprom
 
   reg:
-    items:
-      - description: The corrected region.
+    # If the QFPROM is read-only OS image then only the corrected region
+    # needs to be provided.  If the QFPROM is writable then all 4 regions
+    # must be provided.
+    oneOf:
+      - items:
+          - description: The corrected region.
+      - items:
+          - description: The corrected region.
+          - description: The raw region.
+          - description: The config region.
+          - description: The security control region.
+
+  # Clock must be provided if QFPROM is writable from the OS image.
+  clocks:
+    maxItems: 1
+  clock-names:
+    const: sec
+
+  # Supply reference must be provided if QFPROM is writable from the OS image.
+  vcc-supply:
+    description: Our power supply.
 
   # Needed if any child nodes are present.
   "#address-cells":
@@ -31,6 +50,28 @@ required:
    - reg
 
 examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+
+    efuse@784000 {
+      compatible = "qcom,qfprom";
+      reg = <0 0x00784000 0 0x8ff>,
+            <0 0x00780000 0 0x7a0>,
+            <0 0x00782000 0 0x100>,
+            <0 0x00786000 0 0x1fff>;
+      clocks = <&gcc GCC_SEC_CTRL_CLK_SRC>;
+      clock-names = "sec";
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      vcc-supply = <&vreg_l11a_1p8>;
+
+      hstx-trim-primary@25b {
+        reg = <0x25b 0x1>;
+        bits = <1 3>;
+      };
+    };
+
   - |
     efuse@784000 {
       compatible = "qcom,qfprom";
-- 
2.27.0.290.gba653c62da-goog

