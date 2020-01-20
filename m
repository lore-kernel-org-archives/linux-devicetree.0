Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20806C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 16:30:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EBE2022464
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 16:30:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nE0CkDt5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729211AbgATQay (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 11:30:54 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37566 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729325AbgATQax (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 11:30:53 -0500
Received: by mail-wr1-f65.google.com with SMTP id w15so108829wru.4
        for <devicetree@vger.kernel.org>; Mon, 20 Jan 2020 08:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b8/dS5tP31Iur5npp0surpmGJGT8VB8RlaqrYOLfhfM=;
        b=nE0CkDt5zupX8KbivDDY1kkbB3MrKNPCU8eYnB5s/nDahiRRMpnwjZGew0JxqmX5e/
         9MD9mjPIHBqCJNFnCg5/psqyFL+FtFwZeU/+jhc/UmVLys+AHtr6k5YH0IzANW0l3gQY
         GmeqXK5AxAJcFpHjXmqX2E8Vzv3MF6Ntp17EwklI6tT82b+uL3WXT5Vyz8rrHUWtiYvn
         BNHBlRDh0XGiOXfrLE4cz5pODQQbdE0lFbVRYVbGl+m0FmxMforO7ISEdQ8/zRoI/oZE
         bKBYGlFGZZuNxevgPr7ePwYvjXWgoqWen4JJwybCrnhti1j74MItL36tBiSzG7VSSYbQ
         XX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b8/dS5tP31Iur5npp0surpmGJGT8VB8RlaqrYOLfhfM=;
        b=h44LqAQfsO5fF2xzRtK8A6jgFfelWb6eDMdSQEcVzD/hpBYh/BRndyXZhFKm2hzkuu
         I2afOl02Ubon9DqCQde9JG5x/5JqRa1QN5q6OrtolGeqC2HAC/996s6+U294ckaLE7rh
         laVTF1Hz2AADKeGNexPjAE5Lea1kxjhe1FA2jJPFj/iZvHHD1hocn+nqiN6+tXcZzeOM
         neMJYqZ7MXpz9DI5Vc+yfr5tOlWgpbidOp+x4udpNmltUugqZkcFmSByE9ZZVttCvhrg
         TLnyrGKeM0uyCWqwgu15058OoQLRtez1S9zLcZlcPbSKDte8Re9P9tuWvWqbRfcRL5eq
         nxEA==
X-Gm-Message-State: APjAAAXHNJ0H3vz9pnJOeg9tDA6DoQIxFobL+G4s2vqQ0quFV84b0bz3
        zT9QdMHIdn+TL5TCOndw3LI37g==
X-Google-Smtp-Source: APXvYqxttFdHokVsGizWadBv+/FjKvEaHQWtjXAIUVLiqaOv4alQBqNckpCOVavSsJDlvwhfHfVWJA==
X-Received: by 2002:a5d:6346:: with SMTP id b6mr331109wrw.354.1579537852256;
        Mon, 20 Jan 2020 08:30:52 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p26sm22631756wmc.24.2020.01.20.08.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 08:30:51 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 04/19] dt-bindings: Add Qualcomm USB SuperSpeed PHY bindings
Date:   Mon, 20 Jan 2020 16:31:01 +0000
Message-Id: <20200120163116.1197682-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
References: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Binding description for Qualcomm's Synopsys 1.0.0 SuperSpeed phy
controller embedded in QCS404.

Based on Sriharsha Allenki's <sallenki@codeaurora.org> original
definitions.

[bod: converted to yaml format]

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/phy/qcom,usb-ss.yaml  | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
new file mode 100644
index 000000000000..4206b8f36bdd
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/qcom,usb-ss.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Synopsys 1.0.0 SuperSpeed USB PHY
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Qualcomm Synopsys 1.0.0 SuperSpeed USB PHY
+
+properties:
+  compatible:
+    enum:
+      - qcom,usb-ssphy
+
+  reg:
+    maxItems: 1
+    description: USB PHY base address and length of the register map.
+
+  "#phy-cells":
+    const: 0
+    description: Should be 0. See phy/phy-bindings.txt for details.
+
+  clocks:
+    maxItems: 3
+    minItems: 3
+    description: phandles for rpmcc clock, PHY AHB clock, SuperSpeed pipe clock.
+
+  clock-names:
+    items:
+      - const: ref
+      - const: phy
+      - const: sleep
+
+  vdd-supply:
+    maxItems: 1
+    description: phandle to the regulator VDD supply node.
+
+  vdda1p8-supply:
+    maxItems: 1
+    description: phandle to the regulator 1.8V supply node.
+
+  resets:
+    items:
+      - description: COM reset
+      - description: PHY reset line
+
+  reset-names:
+    items:
+      - const: com
+      - const: phy
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcs404.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    usb3_phy: usb3-phy@78000 {
+        compatible = "qcom,usb-ssphy";
+        reg = <0x78000 0x400>;
+        #phy-cells = <0>;
+        clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
+                 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
+                 <&gcc GCC_USB3_PHY_PIPE_CLK>;
+        clock-names = "ref", "phy", "pipe";
+        resets = <&gcc GCC_USB3_PHY_BCR>,
+                 <&gcc GCC_USB3PHY_PHY_BCR>;
+        reset-names = "com", "phy";
+        vdd-supply = <&vreg_l3_1p05>;
+        vdda1p8-supply = <&vreg_l5_1p8>;
+    };
+...
-- 
2.25.0

