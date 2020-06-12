Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CD0C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E80772081A
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahOoNCKD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgFLOTX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgFLOTX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:23 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF2DC03E96F;
        Fri, 12 Jun 2020 07:19:21 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l10so9901575wrr.10;
        Fri, 12 Jun 2020 07:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U3kp5xE4YdFU+s+XKW2LORF30/iip2juB3/xvnjGa6I=;
        b=ahOoNCKD2XMcCVtKrfzOLjeKKZSvPYXI+EqWOQ4nt+pkohAuc8IMjIkbGUCfoKGCgc
         Urlr9ws4g6LgyaMkyvbJwJCmVSS9Yx4Fk0LINJQqgdcvQE8k1//2TV1CeevkTnU/0+eE
         pvg9PCeLlOSBfMqozzeDnDKZ3YxUQgbFJ4IIlJoQ2ffLaJXIFCuhkNP0HvljlvB2NZfv
         h0aPjayGQeryJ0t5BGwbtV7I8Wrq751jnX7QNa5gIGhNVgP7IRWSGNIHxWv/mcS6QGfb
         WUGy+Yakay+Qd2HfoekoqOdQNuOF4kbseAIUYhwl66xeAvw3Lvuvbv450QV2bqOEI0b/
         /BzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U3kp5xE4YdFU+s+XKW2LORF30/iip2juB3/xvnjGa6I=;
        b=VHc2t8awN0K/QFu9JlK8e0rEArlHEylGe4XmzHGAaDIkwQA0xwNLy00/tzrjSWyglF
         V1Vh2BPivTtF0vdXn6MKbAqu62Ezfe7rUL/xhWTAjx9flC1vetqCkAnurEmfaOGLzYPH
         CCbtizg9qWiPESiPNsNvb4lT69BoCMw9/WT3MGufxJ4PrgAVsQeQGrlJDcYfMyZPwPpF
         oprRSXp+2oSCDB5guyIPjkqYStitlAOwSE4i+um7xQYNdR87QC0XlDeKXmDGEsM3uXyL
         jfpKJUZ7ggOG9bZf3iS2oOilqjr8rZj/fyDNmUSrkcqPvWLPZtxZdNexsE6Z9b5/f4ej
         pR/w==
X-Gm-Message-State: AOAM530Pnrb98dZfYtv3FUIgRrW8PaW/OyEL0Ur0RKvy1ace/5VSLfG8
        tOI5NYxOwhIr067ZeeV63A7R+Eoq
X-Google-Smtp-Source: ABdhPJx6TxEQdX+8oeI/j/Yovc7urBYH+GfvWnaDE9UiBMK22ixKet48GNxqemWqoM+QmFjFLHM9Xg==
X-Received: by 2002:adf:db09:: with SMTP id s9mr14925575wri.256.1591971560512;
        Fri, 12 Jun 2020 07:19:20 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y37sm11206355wrd.55.2020.06.12.07.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:19 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 06/38] dt-bindings: display: tegra: Document display-hub
Date:   Fri, 12 Jun 2020 16:18:31 +0200
Message-Id: <20200612141903.2391044-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200612141903.2391044-1-thierry.reding@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra186 and later have an additional component in the display pipeline
called the display hub. Document the bindings which were missing.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../display/tegra/nvidia,tegra20-host1x.txt   | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 47319214b5f6..2cf3cc4893da 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -297,6 +297,56 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - vic
 
+- display-hub: display controller hub
+  Required properties:
+  - compatible: "nvidia,tegra<chip>-display"
+  - reg: Physical base address and length of the controller's registers.
+  - interrupts: The interrupt outputs from the controller.
+  - clocks: Must contain an entry for each entry in clock-names.
+    See ../clocks/clock-bindings.txt for details.
+  - clock-names: Must include the following entries:
+    - disp
+    - dsc
+    - hub
+  - resets: Must contain an entry for each entry in reset-names.
+    See ../reset/reset.txt for details.
+  - reset-names: Must include the following entries:
+    - misc
+    - wgrp0
+    - wgrp1
+    - wgrp2
+    - wgrp3
+    - wgrp4
+    - wgrp5
+  - power-domains: A list of phandle and specifiers identifying the power
+    domains that the display hub is part of.
+  - ranges: Range of registers used for the display controllers.
+
+  Each subnode of the display hub represents one of the display controllers
+  available:
+
+  - display: display controller
+    - compatible: "nvidia,tegra<chip>-dc"
+    - reg: Physical base address and length of the controller's registers.
+    - interrupts: The interrupt outputs from the controller.
+    - clocks: Must contain an entry for each entry in clock-names.
+      See ../clocks/clock-bindings.txt for details.
+    - clock-names: Must include the following entries:
+      - dc
+    - resets: Must contain an entry for each entry in reset-names.
+      See ../reset/reset.txt for details.
+    - reset-names: Must include the following entries:
+      - dc
+    - power-domains: A list of phandle and specifiers that identify the power
+      domains that this display controller is part of.
+    - iommus: A phandle and specifier identifying the SMMU master interface of
+      this display controller.
+    - nvidia,outputs: A list of phandles of outputs that this display
+      controller can drive.
+    - nvidia,head: The number of the display controller head. This is used to
+      setup the various types of output to receive video data from the given
+      head.
+
 Example:
 
 / {
-- 
2.24.1

