Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6695FC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 16:12:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 348542065D
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 16:12:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Itw4gj29"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgENQMD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 12:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgENQMD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 May 2020 12:12:03 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C015C061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 09:12:03 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id fu13so12637920pjb.5
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ES8afuL7PSuY7X1eTte9GLtkb9S07PMJ4/U2q/1l3LQ=;
        b=Itw4gj29hGMizedRPJwNNjoNbwd9nz3Tfc+zIJDtulSOotvysbj+DkrpCoW9KbzC+P
         rHjF3TgJP6owOXEDDCwJ6OZoacQsRZt3Khtj6mIDI0KpViSoPydhUk7d4UhOif/4EGMo
         9MyX9bG5AuZfnXjBH4sp0DUQuYBjLTLVSiLZLrfgmGAz0qGLiBD7vF7/Hl28TILx42CZ
         cHI0XF0iRG8NcTzddzXLOFfaTpJkdBeFyuJqyUUk0LhjXrrUc1fD0t6k0RWfzIFB2OnX
         dAp9SN+Fg2ByOcdTrwrhFmtz/3OMqzFfIeNsaYuJ4kZTzgcytBA6H2jBdpWBVkkJ1Z30
         Z1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ES8afuL7PSuY7X1eTte9GLtkb9S07PMJ4/U2q/1l3LQ=;
        b=b3AL9/Vp/2oQxsm+jJObqpPuSxSYUqnI1dOIgPxJvu9BOjcIyhcO/0K7KiIZdU24Qt
         imMZDVnSTMYIoI/9urP1EPNyctuOStsIMNrmP2DtacTFF/TErqDipop5/HSoEJrU0sfu
         ZQILWnV6+k6edgaOi93qEIuBNP6UFXSEXRzjEDr85QzxZyy68nK4QojcL5yHyaysLe5Q
         IQ4/zIPwp6wHjdCNF3tfH66k2eE+e05ofG3dsOwmeASvc1DTDFDSszZe6WLLrLRcizzD
         9bB2vC7P6uJkIrUu0Bn3OMvINg6VE2l3D0oVEks7EjcQSxTe13qsRJxM09RRfMa6sduL
         v8RA==
X-Gm-Message-State: AOAM533jQIbK/MB4xoQ+2486t4F9WPU41kMO+kGiKmUirVJ6O5T09p0G
        c7ISnSgKXaiFiqfNQdEpcHQA5UsX8NE65w==
X-Google-Smtp-Source: ABdhPJyObmtYnStJLaJtJzAGemjZQ1QgrOmeN7N6Q26fz2KGs69RXBqWup98xXOKuxVxlEJx/NGYrQ==
X-Received: by 2002:a17:902:b114:: with SMTP id q20mr4363148plr.120.1589472722763;
        Thu, 14 May 2020 09:12:02 -0700 (PDT)
Received: from localhost.localdomain ([106.215.24.137])
        by smtp.gmail.com with ESMTPSA id t5sm2331755pgp.80.2020.05.14.09.11.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 May 2020 09:12:02 -0700 (PDT)
From:   Amit Singh Tomar <amittomer25@gmail.com>
To:     andre.przywara@arm.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, robh+dt@kernel.org
Cc:     cristian.ciocaltea@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v1 5/9] dt-bindings: dmaengine: convert Actions Semi Owl SoCs bindings to yaml
Date:   Thu, 14 May 2020 21:40:53 +0530
Message-Id: <1589472657-3930-6-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589472657-3930-1-git-send-email-amittomer25@gmail.com>
References: <1589472657-3930-1-git-send-email-amittomer25@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Converts the device tree bindings for the Actions Semi Owl SoCs DMA
Controller over to YAML schemas.

It also adds new compatible string "actions,s700-dma" to match
the driver.

Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
---
New patch, was not there in RFC.
---
 Documentation/devicetree/bindings/dma/owl-dma.txt  | 47 ------------
 Documentation/devicetree/bindings/dma/owl-dma.yaml | 84 ++++++++++++++++++++++
 2 files changed, 84 insertions(+), 47 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/dma/owl-dma.txt
 create mode 100644 Documentation/devicetree/bindings/dma/owl-dma.yaml

diff --git a/Documentation/devicetree/bindings/dma/owl-dma.txt b/Documentation/devicetree/bindings/dma/owl-dma.txt
deleted file mode 100644
index 03e9bb12b75f..000000000000
--- a/Documentation/devicetree/bindings/dma/owl-dma.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-* Actions Semi Owl SoCs DMA controller
-
-This binding follows the generic DMA bindings defined in dma.txt.
-
-Required properties:
-- compatible: Should be "actions,s900-dma".
-- reg: Should contain DMA registers location and length.
-- interrupts: Should contain 4 interrupts shared by all channel.
-- #dma-cells: Must be <1>. Used to represent the number of integer
-              cells in the dmas property of client device.
-- dma-channels: Physical channels supported.
-- dma-requests: Number of DMA request signals supported by the controller.
-                Refer to Documentation/devicetree/bindings/dma/dma.txt
-- clocks: Phandle and Specifier of the clock feeding the DMA controller.
-
-Example:
-
-Controller:
-                dma: dma-controller@e0260000 {
-                        compatible = "actions,s900-dma";
-                        reg = <0x0 0xe0260000 0x0 0x1000>;
-                        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
-                                     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
-                                     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
-                                     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
-                        #dma-cells = <1>;
-                        dma-channels = <12>;
-                        dma-requests = <46>;
-                        clocks = <&clock CLK_DMAC>;
-                };
-
-Client:
-
-DMA clients connected to the Actions Semi Owl SoCs DMA controller must
-use the format described in the dma.txt file, using a two-cell specifier
-for each channel.
-
-The two cells in order are:
-1. A phandle pointing to the DMA controller.
-2. The channel id.
-
-uart5: serial@e012a000 {
-        ...
-        dma-names = "tx", "rx";
-        dmas = <&dma 26>, <&dma 27>;
-        ...
-};
diff --git a/Documentation/devicetree/bindings/dma/owl-dma.yaml b/Documentation/devicetree/bindings/dma/owl-dma.yaml
new file mode 100644
index 000000000000..12e68c0ece67
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/owl-dma.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/owl-dma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Actions Semi Owl SoCs DMA controller
+
+description: |
+  The OWL DMA is a general-purpose direct memory access controller capable of
+  supporting 10 and 12 independent DMA channels for S700 and S900 SoCs
+  respectively.
+  DMA clients connected to the Actions Semi Owl SoCs DMA controller must
+  use the format described in the owl-dma.yaml file, using a two-cell specifier
+  for each channel.
+
+  The two cells in order are:
+  1. A phandle pointing to the DMA controller.
+  2. The channel id.
+
+  uart5: serial@e012a000 {
+    ...
+    dma-names = "tx", "rx";
+    dmas = <&dma 26>, <&dma 27>;
+    ...
+  };
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+allOf:
+  - $ref: "dma-controller.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - actions,s900-dma
+      - actions,s700-dma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 4
+
+  "#dma-cells":
+    const: 1
+
+  dma-channels:
+    maxItems: 1
+
+  dma-requests:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#dma-cells"
+  - dma-channels
+  - dma-requests
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/actions,s700-cmu.h>
+    dma: dma-controller@e0260000 {
+        compatible = "actions,s900-dma";
+        reg = <0x0 0xe0260000 0x0 0x1000>;
+        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+        #dma-cells = <1>;
+        dma-channels = <12>;
+        dma-requests = <46>;
+        clocks = <&clock CLK_DMAC>;
+    };
+
+...
-- 
2.7.4

