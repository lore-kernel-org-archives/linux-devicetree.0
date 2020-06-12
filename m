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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33395C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0968E20835
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rhs2BXjR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgFLOTq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgFLOTp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:45 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615FCC03E96F;
        Fri, 12 Jun 2020 07:19:45 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id h5so9940209wrc.7;
        Fri, 12 Jun 2020 07:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r4cJneLq/+2iU5VzPceMzaFHSS96kSqWm93JwCsnyqE=;
        b=Rhs2BXjROiYzZOr4ghai68RUYC3tZXr4dDwKUSHVR6Ni7gcxRvIJ1815LGo3BCtj4C
         uJ0R7TDuKaVPNIuS5UFWaZx0gEcxDfQpIgFPbm0ppbqnholuzD2wUnZL0LTQc30dwegM
         aGUYfgLw4wngRBfRgaA4cTObtNmaATQ81G2JG4UjcXlvWGvihHfrJEopi09S3gDik6iu
         PR2aR2hdonwBDrljXS0d+Ubs/c7tjsaRn2qw8RPmSAziABtNaxgB5ITrxofeMutt/wQ1
         HPkCVhzOEiK3HLVNgCVobMr4hJr9S84Kr4N/jMafv7Wjtwet/Nuaz8YwUF6ylEV6eEtn
         YHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r4cJneLq/+2iU5VzPceMzaFHSS96kSqWm93JwCsnyqE=;
        b=QXPNm7kOZZhtWCOJeV1GxiQpsyxgtVGBHD1MOxvW2+t8wF+sWDyI3BVuFLFe4rO6ZR
         pLUwaAiYUz9HlE/ihdE8cD4k/re5IoMXNHJYwSM5llVqV7K0hdizp5zF2kucGrTk8st6
         JzCA7lvRNutq7bcN2N6NuIKYUZpemnGETLBzR31COTcFP0g74caSanM876crXCgRmY1e
         DCWczM9CTGyJkAdQ/0ffSdOcBatxmQyUtDr+rdpRtCYYXOajZcYyi73C3Y2lDL2o8BgJ
         /RrlCqJEVvXw6ERDPjSXfUMROgnIvw4CXjy1LrxiSA+/YywEwNVFskoxvVkmIHQOpP55
         kgrw==
X-Gm-Message-State: AOAM531kOkMdc5T5fGrvX1V5cpqxou/SENdljY5PCyh0OUNiBcRAjKoU
        xhNuCHvy7ZMV9HDKTzbYBZT5oZzH
X-Google-Smtp-Source: ABdhPJxnVvlDV7IIZa9Frj2bGTYhIHLH4wWblgtRJkPFP7wVqp2TzB8O3crC0lcq0/ooWFS8+eiaaw==
X-Received: by 2002:adf:9507:: with SMTP id 7mr15163387wrs.63.1591971583569;
        Fri, 12 Jun 2020 07:19:43 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c206sm10207902wmf.36.2020.06.12.07.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:42 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 17/38] dt-bindings: usb: tegra-xusb: Convert to json-schema
Date:   Fri, 12 Jun 2020 16:18:42 +0200
Message-Id: <20200612141903.2391044-18-thierry.reding@gmail.com>
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

Convert the Tegra XUSB controller bindings from the free-form text
format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/usb/nvidia,tegra124-xusb.txt     | 132 -------
 .../bindings/usb/nvidia,tegra124-xusb.yaml    | 360 ++++++++++++++++++
 2 files changed, 360 insertions(+), 132 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
deleted file mode 100644
index 5bfcc0b4d6b9..000000000000
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
+++ /dev/null
@@ -1,132 +0,0 @@
-NVIDIA Tegra xHCI controller
-============================
-
-The Tegra xHCI controller supports both USB2 and USB3 interfaces exposed by
-the Tegra XUSB pad controller.
-
-Required properties:
---------------------
-- compatible: Must be:
-  - Tegra124: "nvidia,tegra124-xusb"
-  - Tegra132: "nvidia,tegra132-xusb", "nvidia,tegra124-xusb"
-  - Tegra210: "nvidia,tegra210-xusb"
-  - Tegra186: "nvidia,tegra186-xusb"
-- reg: Must contain the base and length of the xHCI host registers, XUSB FPCI
-  registers and XUSB IPFS registers.
-- reg-names: Must contain the following entries:
-  - "hcd"
-  - "fpci"
-  - "ipfs"
-- interrupts: Must contain the xHCI host interrupt and the mailbox interrupt.
-- clocks: Must contain an entry for each entry in clock-names.
-  See ../clock/clock-bindings.txt for details.
-- clock-names: Must include the following entries:
-   - xusb_host
-   - xusb_host_src
-   - xusb_falcon_src
-   - xusb_ss
-   - xusb_ss_src
-   - xusb_ss_div2
-   - xusb_hs_src
-   - xusb_fs_src
-   - pll_u_480m
-   - clk_m
-   - pll_e
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: Must include the following entries:
-  - xusb_host
-  - xusb_ss
-  - xusb_src
-  Note that xusb_src is the shared reset for xusb_{ss,hs,fs,falcon,host}_src.
-- nvidia,xusb-padctl: phandle to the XUSB pad controller that is used to
-  configure the USB pads used by the XHCI controller
-
-For Tegra124 and Tegra132:
-- avddio-pex-supply: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
-- dvddio-pex-supply: PCIe/USB3 digital logic power supply. Must supply 1.05 V.
-- avdd-usb-supply: USB controller power supply. Must supply 3.3 V.
-- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
-- avdd-pll-erefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
-- avdd-usb-ss-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
-- hvdd-usb-ss-supply: High-voltage PCIe/USB3 power supply. Must supply 3.3 V.
-- hvdd-usb-ss-pll-e-supply: High-voltage PLLE power supply. Must supply 3.3 V.
-
-For Tegra210:
-- dvddio-pex-supply: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
-- hvddio-pex-supply: High-voltage PCIe/USB3 power supply. Must supply 1.8 V.
-- avdd-usb-supply: USB controller power supply. Must supply 3.3 V.
-- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
-- avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
-- dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
-- hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8 V.
-
-For Tegra210 and Tegra186:
-- power-domains: A list of PM domain specifiers that reference each power-domain
-  used by the xHCI controller. This list must comprise of a specifier for the
-  XUSBA and XUSBC power-domains. See ../power/power_domain.txt and
-  ../arm/tegra/nvidia,tegra20-pmc.txt for details.
-- power-domain-names: A list of names that represent each of the specifiers in
-  the 'power-domains' property. Must include 'xusb_ss' and 'xusb_host' which
-  represent the power-domains XUSBA and XUSBC, respectively. See
-  ../power/power_domain.txt for details.
-
-Optional properties:
---------------------
-- phys: Must contain an entry for each entry in phy-names.
-  See ../phy/phy-bindings.txt for details.
-- phy-names: Should include an entry for each PHY used by the controller. The
-  following PHYs are available:
-  - Tegra124: usb2-0, usb2-1, usb2-2, hsic-0, hsic-1, usb3-0, usb3-1
-  - Tegra132: usb2-0, usb2-1, usb2-2, hsic-0, hsic-1, usb3-0, usb3-1
-  - Tegra210: usb2-0, usb2-1, usb2-2, usb2-3, hsic-0, usb3-0, usb3-1, usb3-2,
-              usb3-3
-  - Tegra186: usb2-0, usb2-1, usb2-2, hsic-0, usb3-0, usb3-1, usb3-2
-
-Example:
---------
-
-	usb@0,70090000 {
-		compatible = "nvidia,tegra124-xusb";
-		reg = <0x0 0x70090000 0x0 0x8000>,
-		      <0x0 0x70098000 0x0 0x1000>,
-		      <0x0 0x70099000 0x0 0x1000>;
-		reg-names = "hcd", "fpci", "ipfs";
-
-		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
-
-		clocks = <&tegra_car TEGRA124_CLK_XUSB_HOST>,
-			 <&tegra_car TEGRA124_CLK_XUSB_HOST_SRC>,
-			 <&tegra_car TEGRA124_CLK_XUSB_FALCON_SRC>,
-			 <&tegra_car TEGRA124_CLK_XUSB_SS>,
-			 <&tegra_car TEGRA124_CLK_XUSB_SS_DIV2>,
-			 <&tegra_car TEGRA124_CLK_XUSB_SS_SRC>,
-			 <&tegra_car TEGRA124_CLK_XUSB_HS_SRC>,
-			 <&tegra_car TEGRA124_CLK_XUSB_FS_SRC>,
-			 <&tegra_car TEGRA124_CLK_PLL_U_480M>,
-			 <&tegra_car TEGRA124_CLK_CLK_M>,
-			 <&tegra_car TEGRA124_CLK_PLL_E>;
-		clock-names = "xusb_host", "xusb_host_src", "xusb_falcon_src",
-			      "xusb_ss", "xusb_ss_div2", "xusb_ss_src",
-			      "xusb_hs_src", "xusb_fs_src", "pll_u_480m",
-			      "clk_m", "pll_e";
-		resets = <&tegra_car 89>, <&tegra_car 156>, <&tegra_car 143>;
-		reset-names = "xusb_host", "xusb_ss", "xusb_src";
-
-		nvidia,xusb-padctl = <&padctl>;
-
-		phys = <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}>, /* mini-PCIe USB */
-		       <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-2}>, /* USB A */
-		       <&{/padctl@0,7009f000/pads/pcie/lanes/pcie-0}>; /* USB A */
-		phy-names = "usb2-1", "usb2-2", "usb3-0";
-
-		avddio-pex-supply = <&vdd_1v05_run>;
-		dvddio-pex-supply = <&vdd_1v05_run>;
-		avdd-usb-supply = <&vdd_3v3_lp0>;
-		avdd-pll-utmip-supply = <&vddio_1v8>;
-		avdd-pll-erefe-supply = <&avdd_1v05_run>;
-		avdd-usb-ss-pll-supply = <&vdd_1v05_run>;
-		hvdd-usb-ss-supply = <&vdd_3v3_lp0>;
-		hvdd-usb-ss-pll-e-supply = <&vdd_3v3_lp0>;
-	};
diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
new file mode 100644
index 000000000000..4d9e4cfc459a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
@@ -0,0 +1,360 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/nvidia,tegra124-xusb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra xHCI controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  The Tegra xHCI controller supports both USB2 and USB3 interfaces exposed by
+  the Tegra XUSB pad controller.
+
+properties:
+  compatible:
+    oneOf:
+      - description: NVIDIA Tegra124
+        const: nvidia,tegra124-xusb
+
+      - description: NVIDIA Tegra132
+        items:
+          - const: nvidia,tegra132-xusb
+          - const: nvidia,tegra124-xusb
+
+      - description: NVIDIA Tegra210
+        const: nvidia,tegra210-xusb
+
+      - description: NVIDIA Tegra186
+        const: nvidia,tegra186-xusb
+
+      - description: NVIDIA Tegra194
+        const: nvidia,tegra194-xusb
+
+  reg:
+    minItems: 1
+    maxItems: 3
+
+  reg-names:
+    minItems: 1
+    maxItems: 3
+
+  interrupts:
+    items:
+      - description: xHCI host interrupt
+      - description: mailbox interrupt
+
+  clocks:
+    minItems: 9
+    maxItems: 11
+
+  clock-names:
+    minItems: 9
+    maxItems: 11
+
+  nvidia,xusb-padctl:
+    description: phandle to the XUSB pad controller that is used to configure
+      the USB pads used by the XHCI controller
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  # optional
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  resets:
+    items:
+      - description: reset for the XUSB host controller
+      - description: reset for the SuperSpeed logic
+      - description: shared reset for xusb_{ss,hs,fs,falcon,host}_src.
+
+  reset-names:
+    items:
+      - const: xusb_host
+      - const: xusb_ss
+      - const: xusb_src
+
+  iommus:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  phys:
+    description: Must contain an entry for each entry in phy-names. See
+      ../phy/phy-bindings.txt for details.
+
+  phy-names:
+    description: Should include an entry for each PHY used by the controller.
+
+  power-domains:
+    description: A list of PM domain specifiers that reference each
+      power-domain used by the xHCI controller. This list must comprise
+      of a specifier for the XUSBA and XUSBC power-domains. See
+      ../power/power_domain.txt and ../arm/tegra/nvidia,tegra20-pmc.txt
+      for details.
+
+  power-domain-names:
+    description: A list of names that represent each of the specifiers
+      in the 'power-domains' property. See ../power/power_domain.txt for
+      details.
+
+patternProperties:
+  # USB device nodes can have arbitrary names, but always need a unit-address
+  "^.*@[0-9]+$":
+    type: object
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - nvidia,xusb-padctl
+
+unevaluatedProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra124-xusb
+    then:
+      properties:
+        reg:
+          items:
+            - description: base and length of the xHCI host registers
+            - description: base and length of the XUSB FPCI registers
+            - description: base and length of the XUSB IPFS registers
+
+        reg-names:
+          items:
+            - const: hcd
+            - const: fpci
+            - const: ipfs
+
+        clocks:
+          minItems: 11
+
+        clock-names:
+          items:
+            - const: xusb_host
+            - const: xusb_host_src
+            - const: xusb_falcon_src
+            - const: xusb_ss
+            - const: xusb_ss_src
+            - const: xusb_ss_div2
+            - const: xusb_hs_src
+            - const: xusb_fs_src
+            - const: pll_u_480m
+            - const: clk_m
+            - const: pll_e
+
+        phy-names:
+          contains:
+            anyOf:
+              - const: usb2-0
+              - const: usb2-1
+              - const: usb2-2
+              - const: hsic-0
+              - const: hsic-1
+              - const: usb3-0
+              - const: usb3-1
+
+        avddio-pex-supply:
+          description: PCIe/USB3 analog logic power supply. Must supply
+            1.05 V.
+
+        dvddio-pex-supply:
+          description: PCIe/USB3 digital logic power supply. Must supply
+            1.05 V.
+
+        avdd-usb-supply:
+          description: USB controller power supply. Must supply 3.3 V.
+
+        hvdd-usb-ss-supply:
+          description: High-voltage PCIe/USB3 power supply. Must supply 3.3 V.
+
+      required:
+        - resets
+        - reset-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra210-xusb
+    then:
+      properties:
+        reg:
+          items:
+            - description: base and length of the xHCI host registers
+            - description: base and length of the XUSB FPCI registers
+            - description: base and length of the XUSB IPFS registers
+
+        reg-names:
+          items:
+            - const: hcd
+            - const: fpci
+            - const: ipfs
+
+        clocks:
+          minItems: 11
+
+        clock-names:
+          items:
+            - const: xusb_host
+            - const: xusb_host_src
+            - const: xusb_falcon_src
+            - const: xusb_ss
+            - const: xusb_ss_src
+            - const: xusb_ss_div2
+            - const: xusb_hs_src
+            - const: xusb_fs_src
+            - const: pll_u_480m
+            - const: clk_m
+            - const: pll_e
+
+        phy-names:
+          contains:
+            anyOf:
+              - const: usb2-0
+              - const: usb2-1
+              - const: usb2-2
+              - const: usb2-3
+              - const: hsic-0
+              - const: usb3-0
+              - const: usb3-1
+              - const: usb3-2
+              - const: usb3-3
+
+        dvddio-pex-supply:
+          description: PCIe/USB3 analog logic power supply. Must supply
+            1.05 V.
+
+        hvddio-pex-supply:
+          description: High-voltage PCIe/USB3 power supply. Must supply 1.8 V.
+
+        avdd-usb-supply:
+          description: USB controller power supply. Must supply 3.3 V.
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra210-xusb
+              - nvidia,tegra186-xusb
+              - nvidia,tegra194-xusb
+    then:
+      properties:
+        power-domain-names:
+          items:
+            - description: the XUSBC power domain
+              const: xusb_host
+            - description: the XUSBA power domain
+              const: xusb_ss
+
+      required:
+        - power-domains
+        - power-domain-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra186-xusb
+              - nvidia,tegra194-xusb
+    then:
+      properties:
+        # Tegra186 doesn't have the IPFS registers
+        reg:
+          items:
+            - description: base and length of the xHCI host registers
+            - description: base and length of the XUSB FPCI registers
+
+        reg-names:
+          items:
+            - const: hcd
+            - const: fpci
+
+        clocks:
+          maxItems: 9
+
+        clock-names:
+          items:
+            - const: xusb_host
+            - const: xusb_falcon_src
+            - const: xusb_ss
+            - const: xusb_ss_src
+            - const: xusb_hs_src
+            - const: xusb_fs_src
+            - const: pll_u_480m
+            - const: clk_m
+            - const: pll_e
+
+        phy-names:
+          contains:
+            anyOf:
+              - const: usb2-0
+              - const: usb2-1
+              - const: usb2-2
+              - const: hsic-0
+              - const: usb3-0
+              - const: usb3-1
+              - const: usb3-2
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/tegra124-car.h>
+
+    usb@0,70090000 {
+        compatible = "nvidia,tegra124-xusb";
+        reg = <0x0 0x70090000 0x0 0x8000>,
+              <0x0 0x70098000 0x0 0x1000>,
+              <0x0 0x70099000 0x0 0x1000>;
+        reg-names = "hcd", "fpci", "ipfs";
+
+        interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&tegra_car TEGRA124_CLK_XUSB_HOST>,
+                 <&tegra_car TEGRA124_CLK_XUSB_HOST_SRC>,
+                 <&tegra_car TEGRA124_CLK_XUSB_FALCON_SRC>,
+                 <&tegra_car TEGRA124_CLK_XUSB_SS>,
+                 <&tegra_car TEGRA124_CLK_XUSB_SS_DIV2>,
+                 <&tegra_car TEGRA124_CLK_XUSB_SS_SRC>,
+                 <&tegra_car TEGRA124_CLK_XUSB_HS_SRC>,
+                 <&tegra_car TEGRA124_CLK_XUSB_FS_SRC>,
+                 <&tegra_car TEGRA124_CLK_PLL_U_480M>,
+                 <&tegra_car TEGRA124_CLK_CLK_M>,
+                 <&tegra_car TEGRA124_CLK_PLL_E>;
+        clock-names = "xusb_host", "xusb_host_src", "xusb_falcon_src",
+                      "xusb_ss", "xusb_ss_div2", "xusb_ss_src",
+                      "xusb_hs_src", "xusb_fs_src", "pll_u_480m",
+                      "clk_m", "pll_e";
+        resets = <&tegra_car 89>, <&tegra_car 156>, <&tegra_car 143>;
+        reset-names = "xusb_host", "xusb_ss", "xusb_src";
+
+        nvidia,xusb-padctl = <&padctl>;
+
+        phys = <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}>, /* mini-PCIe USB */
+               <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-2}>, /* USB A */
+               <&{/padctl@0,7009f000/pads/pcie/lanes/pcie-0}>; /* USB A */
+        phy-names = "usb2-1", "usb2-2", "usb3-0";
+
+        avddio-pex-supply = <&vdd_1v05_run>;
+        dvddio-pex-supply = <&vdd_1v05_run>;
+        avdd-usb-supply = <&vdd_3v3_lp0>;
+        avdd-pll-utmip-supply = <&vddio_1v8>;
+        avdd-pll-erefe-supply = <&avdd_1v05_run>;
+        avdd-usb-ss-pll-supply = <&vdd_1v05_run>;
+        hvdd-usb-ss-supply = <&vdd_3v3_lp0>;
+        hvdd-usb-ss-pll-e-supply = <&vdd_3v3_lp0>;
+    };
-- 
2.24.1

