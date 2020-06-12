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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E47BC433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8FB120835
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dM1ztAHY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgFLOTu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgFLOTu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:50 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3EE7C03E96F;
        Fri, 12 Jun 2020 07:19:49 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id l17so8338656wmj.0;
        Fri, 12 Jun 2020 07:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VhywprnvhfnyYrER7ciOmga+mZ+nG/On6LreVjgKuhc=;
        b=dM1ztAHYoQ00ug48aKc+T2TSkJRhizhYjCxt2a9ONCZ+0/+kUI8CJkA1lmY/4ySwHK
         yGypifzfH6NWoadIDBhPvxU8oE0Gw1/DWGwD49ZnqjskU1M1v+nnajE7MSYCukaacwxf
         27r1N/iO/ItqxRAkMzJuAZanbgeqsydI/uxOoaCkl32s38y6Xrl9wOXPQSxwmFBg8jdS
         MzE3Tg0/+Ca+FNoNILr62S8kKWWRwAFKeRFEpyMj6MUVvnNxQrziSFLXafLr68gRTAhn
         cP6TS0UpCjkwGXOgUlxeXENegJtxumMAyXA+Ku2TSHyEc+eWMftJ5QB2+/jEOumbP4Id
         +/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VhywprnvhfnyYrER7ciOmga+mZ+nG/On6LreVjgKuhc=;
        b=Lu5s9Lhb+/D83dLtUxIdrpvY7TUWIfPy3hLhBS2x7A1YLmTZwXo3HAXCvJhJA0jFWr
         qIkLGnzp1xNepfDjGDSrjP0Ke97QV34ZJnxXv8JiSl80P7IE1mSMb4LZJ5UWGU4zpU6+
         XUrXraKXgbN5Tz6MpGiQYtePgEqeMg0kenfwPQEebn2XUfU9xsj61PZacENRm7ukmBcA
         HogAR/Oy5TC+S7SSYYWn27QnUOrnXyEhVIJme8iMZbqurLrrXlIB6jEq7EdPos+tqQ/G
         LyfxoN8VIElb7eerr0Ao0TYKEjU+f2QJioZNFx/MCXksBOyU2Yn1O6jPolHUp5O/AipX
         UNlA==
X-Gm-Message-State: AOAM533uUKnb+/O10sLCVhIgZlI8AGctZRTKFK2dzW0TNagaN9jPzSjH
        C1GyKHzh0iA7FvadANiHgXMz2hCm
X-Google-Smtp-Source: ABdhPJxxKofbQFnVlvbsimDpLtOaUCkxRjyTvugnL4+cNE8M3fWotyQlifixROW6zCPwQ0qkVlAfBQ==
X-Received: by 2002:a05:600c:1403:: with SMTP id g3mr13016771wmi.136.1591971587532;
        Fri, 12 Jun 2020 07:19:47 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id w1sm9038838wmi.13.2020.06.12.07.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:46 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 19/38] dt-bindings: net: dwc-qos-ethernet: Convert to json-schema
Date:   Fri, 12 Jun 2020 16:18:44 +0200
Message-Id: <20200612141903.2391044-20-thierry.reding@gmail.com>
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

Convert the Synopsis/DesignWare Ethernet QOS device tree bindings from
free-form text format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/net/snps,dwc-qos-ethernet.txt    | 168 ----------
 .../bindings/net/snps,dwc-qos-ethernet.yaml   | 308 ++++++++++++++++++
 2 files changed, 308 insertions(+), 168 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.txt
 create mode 100644 Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.txt b/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.txt
deleted file mode 100644
index ad3c6e109ce1..000000000000
--- a/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.txt
+++ /dev/null
@@ -1,168 +0,0 @@
-* Synopsys DWC Ethernet QoS IP version 4.10 driver (GMAC)
-
-This binding is deprecated, but it continues to be supported, but new
-features should be preferably added to the stmmac binding document.
-
-This binding supports the Synopsys Designware Ethernet QoS (Quality Of Service)
-IP block. The IP supports multiple options for bus type, clocking and reset
-structure, and feature list. Consequently, a number of properties and list
-entries in properties are marked as optional, or only required in specific HW
-configurations.
-
-Required properties:
-- compatible: One of:
-  - "axis,artpec6-eqos", "snps,dwc-qos-ethernet-4.10"
-    Represents the IP core when integrated into the Axis ARTPEC-6 SoC.
-  - "nvidia,tegra186-eqos", "snps,dwc-qos-ethernet-4.10"
-    Represents the IP core when integrated into the NVIDIA Tegra186 SoC.
-  - "snps,dwc-qos-ethernet-4.10"
-    This combination is deprecated. It should be treated as equivalent to
-    "axis,artpec6-eqos", "snps,dwc-qos-ethernet-4.10". It is supported to be
-    compatible with earlier revisions of this binding.
-- reg: Address and length of the register set for the device
-- clocks: Phandle and clock specifiers for each entry in clock-names, in the
-  same order. See ../clock/clock-bindings.txt.
-- clock-names: May contain any/all of the following depending on the IP
-  configuration, in any order:
-  - "tx"
-    The EQOS transmit path clock. The HW signal name is clk_tx_i.
-    In some configurations (e.g. GMII/RGMII), this clock also drives the PHY TX
-    path. In other configurations, other clocks (such as tx_125, rmii) may
-    drive the PHY TX path.
-  - "rx"
-    The EQOS receive path clock. The HW signal name is clk_rx_i.
-    In some configurations (e.g. GMII/RGMII), this clock is derived from the
-    PHY's RX clock output. In other configurations, other clocks (such as
-    rx_125, rmii) may drive the EQOS RX path.
-    In cases where the PHY clock is directly fed into the EQOS receive path
-    without intervening logic, the DT need not represent this clock, since it
-    is assumed to be fully under the control of the PHY device/driver. In
-    cases where SoC integration adds additional logic to this path, such as a
-    SW-controlled clock gate, this clock should be represented in DT.
-  - "slave_bus"
-    The CPU/slave-bus (CSR) interface clock. This applies to any bus type;
-    APB, AHB, AXI, etc. The HW signal name is hclk_i (AHB) or clk_csr_i (other
-    buses).
-  - "master_bus"
-    The master bus interface clock. Only required in configurations that use a
-    separate clock for the master and slave bus interfaces. The HW signal name
-    is hclk_i (AHB) or aclk_i (AXI).
-  - "ptp_ref"
-    The PTP reference clock. The HW signal name is clk_ptp_ref_i.
-  - "phy_ref_clk"
-    This clock is deprecated and should not be used by new compatible values.
-    It is equivalent to "tx".
-  - "apb_pclk"
-    This clock is deprecated and should not be used by new compatible values.
-    It is equivalent to "slave_bus".
-
-  Note: Support for additional IP configurations may require adding the
-  following clocks to this list in the future: clk_rx_125_i, clk_tx_125_i,
-  clk_pmarx_0_i, clk_pmarx1_i, clk_rmii_i, clk_revmii_rx_i, clk_revmii_tx_i.
-  Configurations exist where multiple similar clocks are used at once, e.g. all
-  of clk_rx_125_i, clk_pmarx_0_i, clk_pmarx1_i. For this reason it is best to
-  extend the binding with a separate clock-names entry for each of those RX
-  clocks, rather than repurposing the existing "rx" clock-names entry as a
-  generic/logical clock in a similar fashion to "master_bus" and "slave_bus".
-  This will allow easy support for configurations that support multiple PHY
-  interfaces using a mux, and hence need to have explicit control over
-  specific RX clocks.
-
-  The following compatible values require the following set of clocks:
-  - "nvidia,tegra186-eqos", "snps,dwc-qos-ethernet-4.10":
-    - "slave_bus"
-    - "master_bus"
-    - "rx"
-    - "tx"
-    - "ptp_ref"
-  - "axis,artpec6-eqos", "snps,dwc-qos-ethernet-4.10":
-    - "slave_bus"
-    - "master_bus"
-    - "tx"
-    - "ptp_ref"
-  - "snps,dwc-qos-ethernet-4.10" (deprecated):
-    - "phy_ref_clk"
-    - "apb_clk"
-- interrupts: Should contain the core's combined interrupt signal
-- phy-mode: See ethernet.txt file in the same directory
-- resets: Phandle and reset specifiers for each entry in reset-names, in the
-  same order. See ../reset/reset.txt.
-- reset-names: May contain any/all of the following depending on the IP
-  configuration, in any order:
-  - "eqos". The reset to the entire module. The HW signal name is hreset_n
-    (AHB) or aresetn_i (AXI).
-
-  The following compatible values require the following set of resets:
-  (the reset properties may be omitted if empty)
-  - "nvidia,tegra186-eqos", "snps,dwc-qos-ethernet-4.10":
-    - "eqos".
-  - "axis,artpec6-eqos", "snps,dwc-qos-ethernet-4.10":
-    - None.
-  - "snps,dwc-qos-ethernet-4.10" (deprecated):
-    - None.
-
-Optional properties:
-- dma-coherent: Present if dma operations are coherent
-- phy-reset-gpios: Phandle and specifier for any GPIO used to reset the PHY.
-  See ../gpio/gpio.txt.
-- snps,en-lpi: If present it enables use of the AXI low-power interface
-- snps,write-requests: Number of write requests that the AXI port can issue.
-  It depends on the SoC configuration.
-- snps,read-requests: Number of read requests that the AXI port can issue.
-  It depends on the SoC configuration.
-- snps,burst-map: Bitmap of allowed AXI burst lengts, with the LSB
-  representing 4, then 8 etc.
-- snps,txpbl: DMA Programmable burst length for the TX DMA
-- snps,rxpbl: DMA Programmable burst length for the RX DMA
-- snps,en-tx-lpi-clockgating: Enable gating of the MAC TX clock during
-  TX low-power mode.
-- phy-handle: See ethernet.txt file in the same directory
-- mdio device tree subnode: When the GMAC has a phy connected to its local
-    mdio, there must be device tree subnode with the following
-    required properties:
-    - compatible: Must be "snps,dwc-qos-ethernet-mdio".
-    - #address-cells: Must be <1>.
-    - #size-cells: Must be <0>.
-
-    For each phy on the mdio bus, there must be a node with the following
-    fields:
-
-    - reg: phy id used to communicate to phy.
-    - device_type: Must be "ethernet-phy".
-    - fixed-mode device tree subnode: see fixed-link.txt in the same directory
-
-The MAC address will be determined using the optional properties
-defined in ethernet.txt.
-
-Examples:
-ethernet2@40010000 {
-	clock-names = "phy_ref_clk", "apb_pclk";
-	clocks = <&clkc 17>, <&clkc 15>;
-	compatible = "snps,dwc-qos-ethernet-4.10";
-	interrupt-parent = <&intc>;
-	interrupts = <0x0 0x1e 0x4>;
-	reg = <0x40010000 0x4000>;
-	phy-handle = <&phy2>;
-	phy-mode = "gmii";
-	phy-reset-gpios = <&gpioctlr 43 GPIO_ACTIVE_LOW>;
-
-	snps,en-tx-lpi-clockgating;
-	snps,en-lpi;
-	snps,write-requests = <2>;
-	snps,read-requests = <16>;
-	snps,burst-map = <0x7>;
-	snps,txpbl = <8>;
-	snps,rxpbl = <2>;
-
-	dma-coherent;
-
-	mdio {
-		#address-cells = <0x1>;
-		#size-cells = <0x0>;
-		phy2: phy@1 {
-			compatible = "ethernet-phy-ieee802.3-c22";
-			device_type = "ethernet-phy";
-			reg = <0x1>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.yaml b/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.yaml
new file mode 100644
index 000000000000..252f11affd6b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.yaml
@@ -0,0 +1,308 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/snps,dwc-qos-ethernet.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DWC Ethernet QoS IP version 4.10 driver (GMAC)
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Alexandre Torgue <alexandre.torgue@st.com>
+  - Giuseppe Cavallaro <peppe.cavallaro@st.com>
+  - Jose Abreu <joabreu@synopsys.com>
+
+description: |
+  This binding is deprecated, but it continues to be supported, but new
+  features should be preferably added to the stmmac binding document.
+
+  This binding supports the Synopsys Designware Ethernet QoS (Quality Of
+  Service) IP block. The IP supports multiple options for bus type, clocking
+  and reset structure, and feature list. Consequently, a number of properties
+  and list entries in properties are marked as optional, or only required in
+  specific HW configurations.
+
+properties:
+  compatible:
+    oneOf:
+      - description: Represents the IP core when integrated into the Axis
+          ARTPEC-6 SoC.
+        items:
+          - const: axis,artpec6-eqos
+          - const: snps,dwc-qos-ethernet-4.10
+
+      - description: Represents the IP core when integrated into the NVIDIA
+          Tegra186 SoC.
+        items:
+          - const: nvidia,tegra186-eqos
+          - const: snps,dwc-qos-ethernet-4.10
+
+      - description: Represents the IP core when integrated into the NVIDIA
+          Tegra194 SoC.
+        items:
+          - const: nvidia,tegra194-eqos
+          - const: nvidia,tegra186-eqos
+          - const: snps,dwc-qos-ethernet-4.10
+
+      - description: This combination is deprecated. It should be treated as
+          equivalent to "axis,artpec6-eqos", "snps,dwc-qos-ethernet-4.10". It
+          is supported to be compatible with earlier revisions of this binding.
+        items:
+          - const: snps,dwc-qos-ethernet-4.10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: |
+      A phandle and specifier pair for each entry in the clock-names property.
+
+      Note: Support for additional IP configurations may require adding the
+      following clocks to this list in the future: clk_rx_125_i, clk_tx_125_i,
+      clk_pmarx_0_i, clk_pmarx1_i, clk_rmii_i, clk_revmii_rx_i,
+      clk_revmii_tx_i. Configurations exist where multiple similar clocks are
+      used at once, e.g. all of clk_rx_125_i, clk_pmarx_0_i, clk_pmarx1_i. For
+      this reason it is best to extend the binding with a separate clock-names
+      entry for each of those RX clocks, rather than repurposing the existing
+      "rx" clock-names entry as a generic/logical clock in a similar fashion
+      to "master_bus" and "slave_bus". This will allow easy support for
+      configurations that support multiple PHY interfaces using a mux, and
+      hence need to have explicit control over specific RX clocks.
+
+  interrupts:
+    description: Should contain the core's combined interrupt signal.
+
+  resets:
+    description: A phandle and reset specifier for each entry in reset-names,
+      in the same order.
+
+  reset-names:
+    description: A list of names corresponding to each entry in the resets
+      property.
+
+  dma-coherent:
+    description: Present if DMA operations are coherent.
+    $ref: "/schemas/types.yaml#/definitions/flag"
+
+  iommus:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  phy-reset-gpios:
+    description: A list of phandle and specifier for any GPIO used to reset
+      the PHY. See ../gpio/gpio.txt.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  snps,en-lpi:
+    description: If present it enables use of the AXI low-power interface.
+    $ref: "/schemas/types.yaml#/definitions/flag"
+
+  snps,write-requests:
+    description: Number of write requests that the AXI port can issue. It
+      depends on the SoC configuration.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  snps,read-requests:
+    description: Number of read requests that the AXI port can issue. It
+      depends on the SoC configuration.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  snps,burst-map:
+    description: Bitmap of allowed AXI burst lengts, with the LSB representing
+      4, then 8 etc.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  snps,txpbl:
+    description: DMA Programmable burst length for the TX DMA.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  snps,rxpbl:
+    description: DMA Programmable burst length for the RX DMA.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  snps,en-tx-lpi-clockgating:
+    description: Enable gating of the MAC TX clock during TX low-power mode.
+    $ref: "/schemas/types.yaml#/definitions/flag"
+
+  mdio:
+    description: A subnode representing the GMAC's MDIO bus.
+    type: object
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^phy@[0-9a-f]+$":
+        $ref: "ethernet-phy.yaml"
+        description: Each PHY on the MDIO bus is represented by one of these
+          nodes.
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phy-mode
+
+allOf:
+  - $ref: "ethernet-controller.yaml"
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra186-eqos
+    then:
+      properties:
+        reset-names:
+          items:
+            - description: The reset to the entire module. The HW signal name
+                is hreset_n (AHB) or aresetn_i (AXI).
+              const: eqos
+
+        clocks:
+          items:
+            - description: The master bus interface clock. Only required in
+                configurations that use a separate clock for the master and
+                slave bus interfaces. The HW signal name is hclk_i (AHB) or
+                aclk_i (AXI).
+
+            - description: The CPU/slave-bus (CSR) interface clock. This
+                applies to any bus type; APB, AHB, AXI, etc. The HW signal
+                name is hclk_i (AHB) or clk_csr_i (other buses).
+
+            - description: The EQOS receive path clock. The HW signal name is
+                clk_rx_i. In some configurations (e.g. GMII/RGMII), this clock
+                is derived from the PHY's RX clock output. In other
+                configurations, other clocks (such as rx_125, rmii) may drive
+                the EQOS RX path. In cases where the PHY clock is directly fed
+                into the EQOS receive path without intervening logic, the DT
+                need not represent this clock, since it is assumed to be fully
+                under the control of the PHY device or driver. In cases where
+                SoC integration adds additional logic to this path, such as a
+                SW-controlled clock gate, this clock should be represented in
+                DT.
+
+            - description: The EQOS transmit path clock. The HW signal name is
+                clk_tx_i. In some configurations (e.g. GMII/RGMII), this clock
+                also drives the PHY TX path. In other configurations, other
+                clocks (such as tx_125, rmii) may drive the PHY TX path.
+
+            - description: The PTP reference clock. The HW signal name is
+                clk_ptp_ref_i.
+
+        clock-names:
+          items:
+            - const: master_bus
+            - const: slave_bus
+            - const: rx
+            - const: tx
+            - const: ptp_ref
+
+      required:
+        - resets
+        - reset-names
+
+  - if:
+      properties:
+        compatible:
+          allOf:
+            - const: axis,artpec6-eqos
+            - const: snps,dwc-qos-ethernet-4.10
+    then:
+      properties:
+        clocks:
+          items:
+            - description: The CPU/slave-bus (CSR) interface clock. This
+                applies to any bus type; APB, AHB, AXI, etc. The HW signal
+                name is hclk_i (AHB) or clk_csr_i (other buses).
+
+            - description: The master bus interface clock. Only required in
+                configurations that use a separate clock for the master and
+                slave bus interfaces. The HW signal name is hclk_i (AHB) or
+                aclk_i (AXI).
+
+            - description: The EQOS transmit path clock. The HW signal name is
+                clk_tx_i. In some configurations (e.g. GMII/RGMII), this clock
+                also drives the PHY TX path. In other configurations, other
+                clocks (such as tx_125, rmii) may drive the PHY TX path.
+
+            - description: The PTP reference clock. The HW signal name is
+                clk_ptp_ref_i.
+
+        clock-names:
+          items:
+            - const: slave_bus
+            - const: master_bus
+            - const: tx
+            - const: ptp_ref
+
+  - if:
+      properties:
+        compatible:
+          const: snps,dwc-qos-ethernet-4.10
+    then:
+      properties:
+        clocks:
+          items:
+            - description: The EQOS transmit path clock. The HW signal name is
+                clk_tx_i. In some configurations (e.g. GMII/RGMII), this clock
+                also drives the PHY TX path. In other configurations, other
+                clocks (such as tx_125, rmii) may drive the PHY TX path.
+
+            - description: The CPU/slave-bus (CSR) interface clock. This
+                applies to any bus type; APB, AHB, AXI, etc. The HW signal
+                name is hclk_i (AHB) or clk_csr_i (other buses).
+
+        clock-names:
+          items:
+            - const: phy_ref_clk
+            - const: apb_pclk
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    ethernet@40010000 {
+        clock-names = "phy_ref_clk", "apb_pclk";
+        clocks = <&clkc 17>, <&clkc 15>;
+        compatible = "snps,dwc-qos-ethernet-4.10";
+        interrupt-parent = <&intc>;
+        interrupts = <0x0 0x1e 0x4>;
+        reg = <0x40010000 0x4000>;
+        phy-handle = <&phy2>;
+        phy-mode = "gmii";
+        phy-reset-gpios = <&gpioctlr 43 GPIO_ACTIVE_LOW>;
+
+        snps,en-tx-lpi-clockgating;
+        snps,en-lpi;
+        snps,write-requests = <2>;
+        snps,read-requests = <16>;
+        snps,burst-map = <0x7>;
+        snps,txpbl = <8>;
+        snps,rxpbl = <2>;
+
+        dma-coherent;
+
+        mdio {
+            #address-cells = <0x1>;
+            #size-cells = <0x0>;
+            phy2: phy@1 {
+                compatible = "ethernet-phy-ieee802.3-c22";
+                device_type = "ethernet-phy";
+                #phy-cells = <0>;
+                reg = <0x1>;
+            };
+        };
+    };
-- 
2.24.1

