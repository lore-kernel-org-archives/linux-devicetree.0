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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C8FC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F11420838
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1j1f35a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgFLOTy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgFLOTx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:53 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE83BC03E96F;
        Fri, 12 Jun 2020 07:19:52 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j10so9919859wrw.8;
        Fri, 12 Jun 2020 07:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5DU+mTFc8FCBMOx2TCs92eA+mmZPO6K1jVR+xUTvb6A=;
        b=Q1j1f35aLnD0wuX10TYeZBaAztQVRXP115pxMrg6h9cxS/cv6aJ6nXuYgv/lSVfD1p
         WZPGK9wPT8UsCSiyhjjpuesZMY1776ykL5SBPS9qc+J+0ZR5MuWZN9zR37Oxf2tCkb3w
         ojcvFksCmEMaY5m5pkqO2KMGQzpe7zJJTXmPBYzegx6fBGe/cTV+tOJ6/HdLOktVTI2x
         NUrs1m0mOa1oX6PF7lYK4RXMh6lv0JoBCEGSMyXJ8PeSMGYTbYVnV3js2QePn3zsYDB1
         WAgGpn7RC5H59rtve/DkP2FDPtm+llloltUcQOyKKUJXmtjtazbCkSCcnUdSsGGHSCj5
         gYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5DU+mTFc8FCBMOx2TCs92eA+mmZPO6K1jVR+xUTvb6A=;
        b=um5TYFDbfxBUahP3jMTHTayMnz9Jh93uOcmfHk0jsdugw38C1adj07eQx9Za+ONBoc
         whpOyBR9cNEpZsFsuE8WeocECNDmeHUxTnJLvt2km2MYWNTmLiVFaYNSHxpLlPDdUUV5
         9bHZMXlIKaEcAmuFeSrEEbsUz0JdoLCj62gxDfL4k78M6jPkWlTuEfCtyaR+h8UfrbPA
         TGHeJ1JbnoNNuEXvAyslYNL1rkTTRWqCdZOdzFhWlKNEJgS88ksGg+wRvUlOVb0wrCU4
         unJTJFbP6YENWXOQry4elJUoXqs1mq68ouyfSdn5FLU6IUDWsOaxLvhFKhu3dOHWzr1X
         qbOQ==
X-Gm-Message-State: AOAM533rfYcZlS/nBullWAKAvoe/uawoMdvOHQ+Ei5eoLPxa2hb6X3nC
        dzINoe4y9ewIXgfAXUe/SF0=
X-Google-Smtp-Source: ABdhPJyj/W1L4wo8XmlLKguN9kPOXzNjSooiTCPWbgu4zG6RqWjE5rpr5IPb/iEZiXwap60sxpAaqg==
X-Received: by 2002:adf:f74e:: with SMTP id z14mr15768656wrp.338.1591971591580;
        Fri, 12 Jun 2020 07:19:51 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p1sm9982897wrx.44.2020.06.12.07.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:50 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 21/38] dt-bindings: sound: sgtl5000: Convert to json-schema
Date:   Fri, 12 Jun 2020 16:18:46 +0200
Message-Id: <20200612141903.2391044-22-thierry.reding@gmail.com>
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

Convert the Freescale SGTL5000 device tree bindings from free-form text
format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/sound/sgtl5000.txt    |  60 ----------
 .../devicetree/bindings/sound/sgtl5000.yaml   | 103 ++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |   2 -
 3 files changed, 103 insertions(+), 62 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/sgtl5000.txt
 create mode 100644 Documentation/devicetree/bindings/sound/sgtl5000.yaml

diff --git a/Documentation/devicetree/bindings/sound/sgtl5000.txt b/Documentation/devicetree/bindings/sound/sgtl5000.txt
deleted file mode 100644
index 9d9ff5184939..000000000000
--- a/Documentation/devicetree/bindings/sound/sgtl5000.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-* Freescale SGTL5000 Stereo Codec
-
-Required properties:
-- compatible : "fsl,sgtl5000".
-
-- reg : the I2C address of the device
-
-- #sound-dai-cells: must be equal to 0
-
-- clocks : the clock provider of SYS_MCLK
-
-- VDDA-supply : the regulator provider of VDDA
-
-- VDDIO-supply: the regulator provider of VDDIO
-
-Optional properties:
-
-- VDDD-supply : the regulator provider of VDDD
-
-- micbias-resistor-k-ohms : the bias resistor to be used in kOhms
-	The resistor can take values of 2k, 4k or 8k.
-	If set to 0 it will be off.
-	If this node is not mentioned or if the value is unknown, then
-	micbias	resistor is set to 4K.
-
-- micbias-voltage-m-volts : the bias voltage to be used in mVolts
-	The voltage can take values from 1.25V to 3V by 250mV steps
-	If this node is not mentioned or the value is unknown, then
-	the value is set to 1.25V.
-
-- lrclk-strength: the LRCLK pad strength. Possible values are:
-0, 1, 2 and 3 as per the table below:
-
-VDDIO		1.8V		2.5V		3.3V
-0 = 		Disable
-1 =		1.66 mA		2.87 mA		4.02  mA
-2 =		3.33 mA		5.74 mA		8.03  mA
-3 =		4.99 mA		8.61 mA		12.05 mA
-
-- sclk-strength: the SCLK pad strength. Possible values are:
-0, 1, 2 and 3 as per the table below:
-
-VDDIO		1.8V		2.5V		3.3V
-0 = 		Disable
-1 =		1.66 mA		2.87 mA		4.02  mA
-2 =		3.33 mA		5.74 mA		8.03  mA
-3 =		4.99 mA		8.61 mA		12.05 mA
-
-Example:
-
-sgtl5000: codec@a {
-	compatible = "fsl,sgtl5000";
-	reg = <0x0a>;
-	#sound-dai-cells = <0>;
-	clocks = <&clks 150>;
-	micbias-resistor-k-ohms = <2>;
-	micbias-voltage-m-volts = <2250>;
-	VDDA-supply = <&reg_3p3v>;
-	VDDIO-supply = <&reg_3p3v>;
-};
diff --git a/Documentation/devicetree/bindings/sound/sgtl5000.yaml b/Documentation/devicetree/bindings/sound/sgtl5000.yaml
new file mode 100644
index 000000000000..4f29b63c54d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sgtl5000.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sgtl5000.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale SGTL5000 Stereo Codec
+
+maintainers:
+  - Fabio Estevam <festevam@gmail.com>
+
+properties:
+  compatible:
+    const: fsl,sgtl5000
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: the clock provider of SYS_MCLK
+
+  VDDA-supply:
+    description: the regulator provider of VDDA
+
+  VDDIO-supply:
+    description: the regulator provider of VDDIO
+
+  VDDD-supply:
+    description: the regulator provider of VDDD
+
+  micbias-resistor-k-ohms:
+    description: The bias resistor to be used in kOhms. The resistor can take
+      values of 2k, 4k or 8k. If set to 0 it will be off. If this node is not
+      mentioned or if the value is unknown, then micbias resistor is set to
+      4k.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    enum: [ 0, 2, 4, 8 ]
+
+  micbias-voltage-m-volts:
+    description: The bias voltage to be used in mVolts. The voltage can take
+      values from 1.25V to 3V by 250mV steps. If this node is not mentioned
+      or the value is unknown, then the value is set to 1.25V.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    enum: [ 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000 ]
+
+  lrclk-strength:
+    description: |
+      The LRCLK pad strength. Possible values are: 0, 1, 2 and 3 as per the
+      table below:
+
+        VDDIO		1.8V		2.5V		3.3V
+        0 =		Disable
+        1 =		1.66 mA		2.87 mA		4.02  mA
+        2 =		3.33 mA		5.74 mA		8.03  mA
+        3 =		4.99 mA		8.61 mA		12.05 mA
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    enum: [ 0, 1, 2, 3 ]
+
+  sclk-strength:
+    description: |
+      The SCLK pad strength. Possible values are: 0, 1, 2 and 3 as per the
+      table below:
+
+        VDDIO		1.8V		2.5V		3.3V
+        0 =		Disable
+        1 =		1.66 mA		2.87 mA		4.02  mA
+        2 =		3.33 mA		5.74 mA		8.03  mA
+        3 =		4.99 mA		8.61 mA		12.05 mA
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    enum: [ 0, 1, 2, 3 ]
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+  - clocks
+  - VDDA-supply
+  - VDDIO-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec@a {
+            compatible = "fsl,sgtl5000";
+            reg = <0x0a>;
+            #sound-dai-cells = <0>;
+            clocks = <&clks 150>;
+            micbias-resistor-k-ohms = <2>;
+            micbias-voltage-m-volts = <2250>;
+            VDDA-supply = <&reg_3p3v>;
+            VDDIO-supply = <&reg_3p3v>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 4165352a590a..b7e94fe8643f 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -80,8 +80,6 @@ properties:
           - fsl,mpl3115
             # MPR121: Proximity Capacitive Touch Sensor Controller
           - fsl,mpr121
-            # SGTL5000: Ultra Low-Power Audio Codec
-          - fsl,sgtl5000
             # G751: Digital Temperature Sensor and Thermal Watchdog with Two-Wire Interface
           - gmt,g751
             # Infineon IR38064 Voltage Regulator
-- 
2.24.1

