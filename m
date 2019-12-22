Return-Path: <SRS0=TQXC=2M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C644C3F68F
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE20E2084D
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVClek6m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbfLVOKp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 09:10:45 -0500
Received: from mail-wr1-f53.google.com ([209.85.221.53]:32780 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfLVOKp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 09:10:45 -0500
Received: by mail-wr1-f53.google.com with SMTP id b6so13983577wrq.0;
        Sun, 22 Dec 2019 06:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8j9eOWE07q09JFeaj2clIPgNgVmP6iqPKn1MuSSo7Oc=;
        b=FVClek6mKaJOjogEQLFMQAkMI/BdjhvFdPu+anfn54WLHMlADjW0cR/H0YPZczqs7n
         rC344yXpt8uBNgeAG1cSvhWn8IAYvqtUwGQVl5y1YMfFG4TI0RRBj+9wmakWMoBVzQdM
         57qumlvrliy/fxkSSDUZmKAbV6//QUmYTkWb3ZYSVj1B8Ey+yx7rO99HCb+LCZxNC3eF
         PK1L4I6IJSVB5Z8iQYusGvY80EK3vj7i60yJ8095KgI8b+RSLdzIqEx9jxKQkz1/khW6
         Pn043pgRI39oelRIStes3s/0YLavBij2Njm/IKfS8qP0HwrWbsBzf8R1v4tRsLtb4RMJ
         fLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8j9eOWE07q09JFeaj2clIPgNgVmP6iqPKn1MuSSo7Oc=;
        b=avdquuZwNE0hMOBnXwmhKMmdtOAfYNegIqglfJq0ZlyF77RCrhQQLFd3DfmNBwvGq/
         f7+FBV15kg47Mkl656eYxAVXaNpatMw3OvDgyMBYEl+YiUtYMMlzrQwTqfQ1T3KbxSBv
         qGtTkaVbGgBjAHKdX9pCrO2SpEmUIO2rrw23gSoe1/p2WrnzNEcZMQS46sKtaJPG6NFQ
         RohYslVSYpIJKVqblB2WZ/O8BR0qFEUXilwQfcovv/X8F5vb9jMXTk0dk2qFM1tPEBU1
         eeTTwvXmWxzjBBAMKsJrxp9yLgBlDGeryAYbWb9kH690vqb0vXyHdnjBKabwhLAQDNpb
         0giQ==
X-Gm-Message-State: APjAAAWIQG7Jv2ZIHbkel0tstWJrerfFC8o7h5wPkwpa++Q5oDIrdgxD
        XBi2nvOrbolKDKt1+c+zYjY=
X-Google-Smtp-Source: APXvYqwSAMiWX4D5ZDFDftFWr1MP4Lsx68aGKsyiaWVVVuw3+AJXMCYq9rsZp5L5tgh0Vbs6O7Y39w==
X-Received: by 2002:a05:6000:f:: with SMTP id h15mr24397770wrx.90.1577023842589;
        Sun, 22 Dec 2019 06:10:42 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id c4sm16570068wml.7.2019.12.22.06.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 06:10:41 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 03/13] dt-bindings: memory: Add Tegra186 memory subsystem
Date:   Sun, 22 Dec 2019 15:10:25 +0100
Message-Id: <20191222141035.1649937-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222141035.1649937-1-thierry.reding@gmail.com>
References: <20191222141035.1649937-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The NVIDIA Tegra186 SoC contains a memory subsystem composed of the
memory controller and the external memory controller. The memory
controller provides interfaces for the memory clients to access the
memory. Accesses can be either bounced through the SMMU for IOVA
translation or directly to the EMC.

The bulk of the programming of the external memory controller happens
through interfaces exposed by the BPMP. Describe this relationship by
adding a phandle reference to the BPMP to the EMC node.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../nvidia,tegra186-mc.yaml                   | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
new file mode 100644
index 000000000000..b98a1d03410b
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra186-mc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra186 (and later) SoC Memory Controller
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description: |
+  The NVIDIA Tegra186 SoC features a 128 bit memory controller that is split
+  into four 32 bit channels to support LPDDR4 with x16 subpartitions. The MC
+  handles memory requests for 40-bit virtual addresses from internal clients
+  and arbitrates among them to allocate memory bandwidth.
+
+  Up to 15 GiB of physical memory can be supported. Security features such as
+  encryption of traffic to and from DRAM via general security apertures are
+  available for video and other secure applications, as well as DRAM ECC for
+  automotive safety applications (single bit error correction and double bit
+  error detection).
+
+properties:
+  $nodename:
+    pattern: "^memory-controller@[0-9a-f]+$"
+
+  compatible:
+    items:
+      - enum:
+          - nvidia,tegra186-mc
+          - nvidia,tegra194-mc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+  dma-ranges: true
+
+patternProperties:
+  "^external-memory-controller@[0-9a-f]+$":
+    description:
+      The bulk of the work involved in controlling the external memory
+      controller on NVIDIA Tegra186 and later is performed on the BPMP. This
+      coprocessor exposes the EMC clock that is used to set the frequency at
+      which the external memory is clocked and a remote procedure call that
+      can be used to obtain the set of available frequencies.
+    type: object
+    properties:
+      compatible:
+        items:
+          - enum:
+              - nvidia,tegra186-emc
+              - nvidia,tegra194-emc
+
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      clocks:
+        items:
+          - description: external memory clock
+
+      clock-names:
+        items:
+          - const: emc
+
+      nvidia,bpmp:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          phandle of the node representing the BPMP
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra186-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    memory-controller@2c00000 {
+        compatible = "nvidia,tegra186-mc";
+        reg = <0x0 0x02c00000 0x0 0xb0000>;
+        interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ranges = <0x0 0x02c00000 0x02c00000 0x0 0xb0000>;
+
+        /*
+         * Memory clients have access to all 40 bits that the memory
+         * controller can address.
+         */
+        dma-ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
+
+        external-memory-controller@2c60000 {
+            compatible = "nvidia,tegra186-emc";
+            reg = <0x0 0x02c60000 0x0 0x50000>;
+            interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&bpmp TEGRA186_CLK_EMC>;
+            clock-names = "emc";
+
+            nvidia,bpmp = <&bpmp>;
+        };
+    };
+
+    bpmp: bpmp {
+        compatible = "nvidia,tegra186-bpmp";
+        #clock-cells = <1>;
+    };
-- 
2.24.1

