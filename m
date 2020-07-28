Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DC0C433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 10:03:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AF00207E8
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 10:03:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="aZjlb1Tl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbgG1KDf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 06:03:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728413AbgG1KDe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 06:03:34 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC76DC0619D2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 03:03:34 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id p1so9626484pls.4
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 03:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UGsiii/VuwmqPfClt9nZik7lgTCfAI/hYH2Kw3sm0tw=;
        b=aZjlb1TlqNvnHjgbpdqBb3Zqpxfsv5kqxXU5K0hc7pxtuRjGdbxT99bec2EbRjReh0
         Lcr0m7kvXywHYDcrxwdqcmRpq06W1qwMj5Ie3iZyNh7vNUwGiVS0iam9CK5iXvt++CU+
         McY66LsbpIcc74LqmkM6683uVifmqZWHfif+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UGsiii/VuwmqPfClt9nZik7lgTCfAI/hYH2Kw3sm0tw=;
        b=DX7JhVNjdeby+O/br38HGDB41xtow3N90gCtuTd11Rjr9cfWt7J1bveCdBDatCe0pS
         14U+oYDqILQC16IX2k75hNWvjsjfJdb2YFVe5YnH7X/rvXokz/PX6RaicSFB73HlOG5g
         /C7BY9iyukIv3mfPg+Jx128bNjTkL3F+K3KZnUC8Uj6FaU/5Zq+LwZdda07W2zldcfkP
         l/eifjp2PcrtgPtHl0Phc8DPihZCmspFRreE++Sq81nBgfV1KA0H4h8eQwVBLFYwn9WB
         YTn5EW/xWe4gWS8iwSmzgoYiw4CSA9IMgRGMprzRNojZuJnIfDPL4zKOCPDHmUGK7FI2
         Qr0g==
X-Gm-Message-State: AOAM532uQk+FdvMYPOp6RXcXyEe6lfpKsyzlRK7SQsqYpdeCld+ouIdc
        xansUWzhYF2TCt923wo8eDPqQQS2w4A=
X-Google-Smtp-Source: ABdhPJw6UyQBkFA772dimnjAycW9U2WNs/tw98zNz7om7aaCJC9iZPBD3XhE6+p0Oh65J2mhjvouBA==
X-Received: by 2002:a17:902:b693:: with SMTP id c19mr22444382pls.102.1595930614254;
        Tue, 28 Jul 2020 03:03:34 -0700 (PDT)
Received: from shiro.work (p532183-ipngn200506sizuokaden.shizuoka.ocn.ne.jp. [153.199.2.183])
        by smtp.googlemail.com with ESMTPSA id u66sm17779018pfb.191.2020.07.28.03.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 03:03:33 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To:     soc@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, arnd@arndb.de, robh@kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 1/9] dt-bindings: arm: mstar: Add binding details for mstar,pmsleep
Date:   Tue, 28 Jul 2020 19:03:13 +0900
Message-Id: <20200728100321.1691745-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728100321.1691745-1-daniel@0x0f.com>
References: <20200728100321.1691745-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds a YAML description of the pmsleep node used by
MStar/SigmaStar Armv7 SoCs.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../bindings/arm/mstar/mstar,pmsleep.yaml     | 43 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mstar/mstar,pmsleep.yaml

diff --git a/Documentation/devicetree/bindings/arm/mstar/mstar,pmsleep.yaml b/Documentation/devicetree/bindings/arm/mstar/mstar,pmsleep.yaml
new file mode 100644
index 000000000000..ef78097a7087
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mstar/mstar,pmsleep.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 thingy.jp.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mstar/mstar,pmsleep.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MStar/SigmaStar Armv7 SoC pmsleep register region
+
+maintainers:
+  - Daniel Palmer <daniel@thingy.jp>
+
+description: |
+  MStar/Sigmastar's Armv7 SoCs contain a region of registers that are
+  in the always on domain that the vendor code calls the "pmsleep" area.
+
+  This area contains registers and bits for a broad range of functionality
+  ranging from registers that control going into deep sleep to bits that
+  turn things like the internal temperature sensor on and off.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+         - enum:
+             - mstar,pmsleep
+         - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmsleep: pmsleep@1c00 {
+        compatible = "mstar,pmsleep", "syscon";
+        reg = <0x0x1c00 0x100>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 991814ea6f76..432fcc867ed6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2140,6 +2140,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://linux-chenxing.org/
 F:	Documentation/devicetree/bindings/arm/mstar.yaml
+F:	Documentation/devicetree/bindings/arm/mstar/*
 F:	arch/arm/boot/dts/infinity*.dtsi
 F:	arch/arm/boot/dts/mercury*.dtsi
 F:	arch/arm/boot/dts/mstar-v7.dtsi
-- 
2.27.0

