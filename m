Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26960C3B186
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 12:07:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E772C2082F
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 12:07:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VdCgYUjQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbgBJMHZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 07:07:25 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55820 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbgBJMHZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 07:07:25 -0500
Received: by mail-wm1-f65.google.com with SMTP id q9so9609529wmj.5
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 04:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x0ouoTkt3Ut5OXKfPgK1h53EOxbNSeKO18hqFnETzgE=;
        b=VdCgYUjQtOvHs10av2SRGg41TliOoFZSiT0HYGbU4ZMxYl5gneInWejN1cCOn3Z41X
         UjJkAqECV+l1GTn9/L08WCdbqROXon1JE6tGtIAmCARGG+aaiatcrf1MABgH88Lm9wTi
         oTmTZgjWum2BUEnp5Xeb2XGdcbF+UqI5XNYd3WDUqLiM0C7CtE6uOwuODiM2scdx6mZm
         GFUsQeR0pRIbOlr305HYSBLBvfikaCYGf8Fkui+aAxNlPEGn3cgB+fIPyGkDiHVzsvNm
         undIYueSWCX+GCE7Sa5lKccwAnQp2ilPXCd2u1RQ6SXqbUtzG/gnk6spBjyTElJw5cmh
         KT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x0ouoTkt3Ut5OXKfPgK1h53EOxbNSeKO18hqFnETzgE=;
        b=Ro7iN+S3j9zYmblkJL5j/LGlUcu/dDiUCTTSEPPncVg1qVmMfaiOrBzExTyOPNdGxY
         6KTG+aQspyC/1CyMHpqavKXeiGXHvdvWC9J7FeGlsH4Fb3sQlQ5r8XdojDmUQTfKHsx1
         ydy6t7yJs6wR6RdmyGyTolGFH0Aq767hkr2b5MMe1G4lSn+HSikpjkq/g0iIEsgpWFCs
         Q6mUS8Tw6UER6wRm89H6LrgQHY2SjAsUGV+PsSxPb1AnokyAbDye2TZ/GxUWnhLR6gUM
         nGo+5RD5HYJK11b4aXRIgx/r/lmEamLDL6sEdiM/tGk8MxQtvsoFsTgIPloFbpZPluGk
         xYUw==
X-Gm-Message-State: APjAAAW4awSKdUZkZVrOJCVX7AB3DDd03/RTqdM7H4uKlh/vcak2tgUz
        0pdfckibIjh3xc1asb37qB2BOw==
X-Google-Smtp-Source: APXvYqwcSVpYsFOBYoVofOHclUzN5NIEP4opVx8xD1ELu0zcVr9kZjaqIql+5yY/caF3pHRnLmId5Q==
X-Received: by 2002:a1c:3d46:: with SMTP id k67mr15728835wma.171.1581336441867;
        Mon, 10 Feb 2020 04:07:21 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id i204sm293124wma.44.2020.02.10.04.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 04:07:21 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Sriharsha Allenki <sallenki@codeaurora.org>,
        Anu Ramanathan <anur@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v6 02/18] dt-bindings: phy: Add Qualcomm Synopsys Hi-Speed USB PHY binding
Date:   Mon, 10 Feb 2020 12:07:07 +0000
Message-Id: <20200210120723.91794-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Sriharsha Allenki <sallenki@codeaurora.org>

Adds bindings for Qualcomm's 28 nm USB PHY supporting Low-Speed, Full-Speed
and Hi-Speed USB connectivity on Qualcomm chipsets.

[bod: Converted to YAML. Changed name dropping snps, 28nm components]

Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom,usb-hs-28nm.yaml        | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml
new file mode 100644
index 000000000000..ca6a0836b53c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/qcom,usb-hs-28nm.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Synopsys DesignWare Core 28nm High-Speed PHY
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Qualcomm Low-Speed, Full-Speed, Hi-Speed 28nm USB PHY
+
+properties:
+  compatible:
+    enum:
+      - qcom,usb-hs-28nm-femtophy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: rpmcc ref clock
+      - description: PHY AHB clock
+      - description: Rentention clock
+
+  clock-names:
+    items:
+      - const: ref
+      - const: ahb
+      - const: sleep
+
+  resets:
+    items:
+      - description: PHY core reset
+      - description: POR reset
+
+  reset-names:
+    items:
+      - const: phy
+      - const: por
+
+  vdd-supply:
+    description: phandle to the regulator VDD supply node.
+
+  vdda1p8-supply:
+    description: phandle to the regulator 1.8V supply node.
+
+  vdda3p3-supply:
+    description: phandle to the regulator 3.3V supply node.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - vdd-supply
+  - vdda1p8-supply
+  - vdda3p3-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcs404.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    usb2_phy_prim: phy@7a000 {
+        compatible = "qcom,usb-hs-28nm-femtophy";
+        reg = <0x0007a000 0x200>;
+        #phy-cells = <0>;
+        clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
+                 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
+                 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
+        clock-names = "ref", "ahb", "sleep";
+        resets = <&gcc GCC_USB_HS_PHY_CFG_AHB_BCR>,
+                 <&gcc GCC_USB2A_PHY_BCR>;
+        reset-names = "phy", "por";
+        vdd-supply = <&vreg_l4_1p2>;
+        vdda1p8-supply = <&vreg_l5_1p8>;
+        vdda3p3-supply = <&vreg_l12_3p3>;
+    };
+...
-- 
2.25.0

