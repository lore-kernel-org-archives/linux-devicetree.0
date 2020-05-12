Return-Path: <SRS0=NYOC=62=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A30C54E8B
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 13:14:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFBA8206DD
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 13:14:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HhvGzsjg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729568AbgELNOd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 May 2020 09:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729524AbgELNOd (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 May 2020 09:14:33 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE05AC061A0C
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 06:14:32 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f134so9527594wmf.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 06:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ucIamOxWoiikiTT7OyOk1rVSeBavTDD4mVIWBfGQ0Tg=;
        b=HhvGzsjgUcWS4ZqZpMHWKZ6oPMKgpOt/PCYx6PHdLARn1pl00Negjb8wMAe4LiENqa
         cvvCgPgIgXvxRAOJUDj7etyWlGa4OaRWWDV3azcbY99r6J2ubJUpENBOJpwniqb2C8wv
         0T6b/pFIazBufnzGCG7SFiHa4hg9iyktA2jRg/eSZ6txf1VRN9UDdShnlx9ifd7nqnYc
         ymhZ7gkbtUU4kI8m2cZ0ZfpW7dwvxgFxrXVHMd5aUz2s/IVMQAJpMtz3YeYYGrY3sCFh
         nAhUHWwBFUJaNOLcLRK1kHGfPj8bp2NROzB3CUiGno1WahODSUDWnWKNz2QwOKGnLnaF
         I1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ucIamOxWoiikiTT7OyOk1rVSeBavTDD4mVIWBfGQ0Tg=;
        b=nPI1VnCFN+ekyUcY4LQKgXqKgEGPI/0hj52FvF5emFes3x8rWx6BD9UlTK2u/3wen9
         v1q6OX3nSPVhA5wHsRpx5EWTTiC2jJSn/rrsiRsNYGRIU+xNiRCsRRkk+LylS270V1D3
         W7q8dAPWfbi/7nAHVX4qF6i/GFOBVKyUn3PMPOsh3UctcOpJaunN2JvEr44CY7S8Sm3b
         yIera7K0oz22u67eUniOVUOOOXHMYpB7WfCFWQ0LuJbTVb1S+wsnX/Dvwm8FMpe/KYA/
         s1q7BwsbQUNVRYhtvgfGOvI9fNvKMrqyETnWYEpUVzmCdb3n3naX3MB+2gIIFqLuIMeK
         fSzQ==
X-Gm-Message-State: AGi0PuaCETGzrz4IBtXs/dxSUt4Ovg7hAW1NpjlENm/5IlvudQ0m0kQO
        C4S7gRh67hXZryr+OiGIsA1UBQ==
X-Google-Smtp-Source: APiQypJLgHGkWpi4Lcz/tiolMUMUWnpODhX3I8i/kPzrgclwoULRyPhWPJAIGGotuugAy+3zWXhlQQ==
X-Received: by 2002:a1c:9e51:: with SMTP id h78mr39840046wme.177.1589289271434;
        Tue, 12 May 2020 06:14:31 -0700 (PDT)
Received: from lmecxl0524.home (2a01cb058702ff00bc4b798f4f30d41e.ipv6.abo.wanadoo.fr. [2a01:cb05:8702:ff00:bc4b:798f:4f30:d41e])
        by smtp.gmail.com with ESMTPSA id p9sm16480524wrj.29.2020.05.12.06.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 06:14:30 -0700 (PDT)
From:   Etienne Carriere <etienne.carriere@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        fabrice.gasnier@st.com, alexandre.torgue@st.com,
        mcoquelin.stm32@gmail.com, robh+dt@kernel.org,
        srinivas.kandagatla@linaro.org,
        Etienne Carriere <etienne.carriere@st.com>
Subject: [PATCH v2] dt-bindings: nvmem: stm32: new property for data access
Date:   Tue, 12 May 2020 15:13:34 +0200
Message-Id: <20200512131334.1750-1-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Etienne Carriere <etienne.carriere@st.com>

Introduce boolean property st,non-secure-otp for OTP data located
in a factory programmed area that only secure firmware can access
by default and that shall be reachable from the non-secure world.

This change also allows additional properties for NVMEM nodes that
were forbidden prior this change.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
---
Changes since v1:
  Change nvmem.yaml to allow additional properties in NVMEM nodes.

Link to v1:
  https://lore.kernel.org/patchwork/patch/1239028/

 .../devicetree/bindings/nvmem/nvmem.yaml        |  2 --
 .../bindings/nvmem/st,stm32-romem.yaml          | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.yaml b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
index 65980224d550..b459f9dba6c9 100644
--- a/Documentation/devicetree/bindings/nvmem/nvmem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
@@ -67,8 +67,6 @@ patternProperties:
     required:
       - reg
 
-    additionalProperties: false
-
 examples:
   - |
       #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
index d84deb4774a4..c11c99f085d7 100644
--- a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
@@ -24,6 +24,18 @@ properties:
       - st,stm32f4-otp
       - st,stm32mp15-bsec
 
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    type: object
+
+    properties:
+      st,non-secure-otp:
+        description: |
+          This property explicits a factory programmed area that both secure
+          and non-secure worlds can access. It is needed when, by default, the
+          related area can only be reached by the secure world.
+        type: boolean
+
 required:
   - "#address-cells"
   - "#size-cells"
@@ -41,6 +53,11 @@ examples:
       calib@22c {
         reg = <0x22c 0x2>;
       };
+
+      mac_addr@e4 {
+        reg = <0xe4 0x8>;
+        st,non-secure-otp;
+      };
     };
 
 ...
-- 
2.17.1

