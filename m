Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C362CC43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 16:32:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 950602073D
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 16:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576081933;
	bh=X8bPj0TycJovcfs5WcvCdkqzw+mMSQeVYGNNyHBCS5c=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=pr2lLWzarJtzJr871f725dJWOmmvQ6I13Im02huUUAtkfkz3q/o305afhu4dP6gOS
	 g7wJpFhAtSzzu4vElykATEczpxje8mauJJmQcjoOelodFZUC0GW9+ZOxIg+JQemIKD
	 7eL3pkUjWmdJOofGDeWJFaZGvwbbLuT2MmqlUZ+8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729522AbfLKQcN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 11:32:13 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43581 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729267AbfLKQcM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 11:32:12 -0500
Received: by mail-oi1-f193.google.com with SMTP id x14so13763353oic.10;
        Wed, 11 Dec 2019 08:32:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XGNDrBcqUYBtKiIo+15fNrK7jgez1KzgJhEnUaSBLgQ=;
        b=YYwR0ZdUtd+duHGS4HpRki5v9+ZsutN7fn0YU/pJMlscNaYJ0NPGTSMJqT2u54huv5
         Ug2BXNr4JXsfSvVQZHTk3XSckeXDo1rmPugyR7SwgLpAzQ80tjvMxCq2v0W51l7lhhhG
         tC8LXIIm5WaeiP1vFZL4Ebm6++Rk2cByNw9CusKMOvhNFAdO/UvYviIgRQxswqPoKRl9
         Gt7Yz3vpu18Z54Or/slls7H4lwVrYHV299huAEcex09+r8oGgQZ1Ef+tIm3E7rw8Wix3
         PENE9iFPV1/wLnHOmgW8pmRLLNq+LKC38gpS0Zknl9KCG8YHI5s4FaVcaOsBGtdeigcV
         VDZA==
X-Gm-Message-State: APjAAAX/j5wygdaPns/9DYbqNCJjuZb1aaHmSI5FNvZb97l5TiuAkaGG
        XJz3pEjZMRT3XaXVsE++s7Q3DZQ=
X-Google-Smtp-Source: APXvYqzgROOzztOOeR9jvM10GQEB8EXSYcu/WPcKrTjVmKN/tY6KlFUjLvh+7QJaML9PdKKpYwBV4g==
X-Received: by 2002:a54:4485:: with SMTP id v5mr3288106oiv.144.1576081931501;
        Wed, 11 Dec 2019 08:32:11 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id f3sm1002180oto.57.2019.12.11.08.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 08:32:10 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH] dt-bindings: memory-controllers: tegra: Fix type references
Date:   Wed, 11 Dec 2019 10:32:10 -0600
Message-Id: <20191211163210.9778-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Json-schema requires a $ref to be under an 'allOf' if there are
additional constraints otherwise the additional constraints are
ignored. (Note that this behavior will be changed in draft8.)

Fixes: 641262f5e1ed ("dt-bindings: memory: Add binding for NVIDIA Tegra30 External Memory Controller")
Fixes: 785685b7a106 ("dt-bindings: memory: Add binding for NVIDIA Tegra30 Memory Controller")
Fixes: 8da65c377b21 ("dt-bindings: memory: tegra30: Convert to Tegra124 YAML")
Cc: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
I'll take this via the DT tree for rc2.

 .../bindings/memory-controllers/nvidia,tegra124-mc.yaml  | 3 ++-
 .../bindings/memory-controllers/nvidia,tegra30-emc.yaml  | 9 ++++++---
 .../bindings/memory-controllers/nvidia,tegra30-mc.yaml   | 3 ++-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
index 30d9fb193d7f..22a94b6fdbde 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
@@ -60,7 +60,8 @@ patternProperties:
             maximum: 1066000000
 
           nvidia,emem-configuration:
-            $ref: /schemas/types.yaml#/definitions/uint32-array
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32-array
             description: |
               Values to be written to the EMEM register block. See section
               "15.6.1 MC Registers" in the TRM.
diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
index 7fe0ca14e324..e4135bac6957 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
@@ -56,7 +56,8 @@ patternProperties:
             maximum: 900000000
 
           nvidia,emc-auto-cal-interval:
-            $ref: /schemas/types.yaml#/definitions/uint32
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32
             description:
               Pad calibration interval in microseconds.
             minimum: 0
@@ -78,7 +79,8 @@ patternProperties:
               Mode Register 0.
 
           nvidia,emc-zcal-cnt-long:
-            $ref: /schemas/types.yaml#/definitions/uint32
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32
             description:
               Number of EMC clocks to wait before issuing any commands after
               sending ZCAL_MRW_CMD.
@@ -96,7 +98,8 @@ patternProperties:
               FBIO "read" FIFO periodic resetting enabled.
 
           nvidia,emc-configuration:
-            $ref: /schemas/types.yaml#/definitions/uint32-array
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32-array
             description:
               EMC timing characterization data. These are the registers
               (see section "18.13.2 EMC Registers" in the TRM) whose values
diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
index 84fd57bcf0dc..4b9196c83291 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
@@ -77,7 +77,8 @@ patternProperties:
             maximum: 900000000
 
           nvidia,emem-configuration:
-            $ref: /schemas/types.yaml#/definitions/uint32-array
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32-array
             description: |
               Values to be written to the EMEM register block. See section
               "18.13.1 MC Registers" in the TRM.
-- 
2.20.1

