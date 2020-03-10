Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A36C18E5C
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 15:20:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB36120873
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 15:20:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPJQI53C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727758AbgCJPUX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 11:20:23 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53572 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgCJPUX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 11:20:23 -0400
Received: by mail-wm1-f68.google.com with SMTP id 25so1848434wmk.3;
        Tue, 10 Mar 2020 08:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=19P5Q8UerRaXg+pM9/nCaLV3h2AyveSWuKf0Gpk16Qc=;
        b=hPJQI53CXKGUKQ6jU+3Yk4A2f/61DleVLJlpLu7gmcgNeuqRC+h9jHegtHtMiMoirs
         eSZTsuwwpk2gJWCUXK31t/AYyWoqN3/U0Afs5MVe8GdJTCmORo8fJu+CpULL9yJYF9/m
         yEj/S1/0ITfGWqQfBD0MfJdTEMqUxcYd61dUCepw/nmTYNBXU/uXX1c4viWMZ1//GJiP
         f0KFevmKVuxqvTLyn1R+0vRCH9SIDd1gF30LjW3itEhy6mtrRaNIZtzrmlTUk4WLw0W4
         XEgY78A/Hv/2fI6lQ8BN7GCAPgnMlloUlRqYu1ctshqIVcTtzrV6NhjhG60JB3KH1GF/
         +WLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=19P5Q8UerRaXg+pM9/nCaLV3h2AyveSWuKf0Gpk16Qc=;
        b=igqjkBQggQsofPvYJ2+H8ndLXKdhwzNM4OgyBMMoxpysQs4XnhWlTCK9QVZn3p+kVK
         HoApndFoj8VhQfC++M7MHK7U/eV9dxOp04rtPbB6QhRMO1PHzjrDMGjdZL727hsBYjLa
         e7hKYUinhNcMKIRj+PpNNsxsb+xHVwf9FErei2ntAU6CYmnElvp8i0GInAW/fzyAK/xS
         Jb5uWuBw+jNiK+uOLCCsqtQhE2YhHxtH3A+Z3W8BNHtQzdfI+WYHXaXobjy7K6zfX8KE
         tCOz9Ig+VCRmMnmJuVuyFZ03dtaNC6dFMCJt90RQ8lAIWBJvlt4c4TxV+GL7RNisLzoW
         6Odw==
X-Gm-Message-State: ANhLgQ38fasVIJpf+qFO++iPr4XksGY3wB+VUxkCUwTV+CeZnPjxkouy
        ZuI3C0X6blOQ5tbXrUdOuj1/m/By
X-Google-Smtp-Source: ADFU+vtIkqP9tnxLdbeEmLYZOzuONJ3rU8LjegCTivGOd0PUquObJXoCx5ureVJpw5rPnAo1hMaFzA==
X-Received: by 2002:a1c:6a0c:: with SMTP id f12mr2590876wmc.78.1583853619358;
        Tue, 10 Mar 2020 08:20:19 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id u17sm4230626wmj.47.2020.03.10.08.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 08:20:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 4/8] dt-bindings: memory: tegra: Add external memory controller binding for Tegra210
Date:   Tue, 10 Mar 2020 16:19:59 +0100
Message-Id: <20200310152003.2945170-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310152003.2945170-1-thierry.reding@gmail.com>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Joseph Lo <josephl@nvidia.com>

Add the binding document for the external memory controller (EMC) which
communicates with external LPDDR4 devices. It includes the bindings of
the EMC node and a sub-node of EMC table which under the reserved memory
node. The EMC table contains the data of the rates that EMC supported.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v5:
- convert to dt-schema

 .../nvidia,tegra210-emc.yaml                  | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
new file mode 100644
index 000000000000..caf21c08f9cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra210 SoC External Memory Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  The EMC interfaces with the off-chip SDRAM to service the request stream
+  sent from the memory controller.
+
+properties:
+  compatible:
+    const: nvidia,tegra210-emc
+
+  reg:
+    maxItems: 3
+
+  clocks:
+    items:
+      - description: external memory clock
+
+  clock-names:
+    items:
+      - const: emc
+
+  interrupts:
+    items:
+      - description: EMC general interrupt
+
+  memory-region:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to a reserved memory region describing the table of EMC
+      frequencies trained by the firmware
+
+  nvidia,memory-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle of the memory controller node
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - nvidia,memory-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        emc_table: emc-table@83400000 {
+            compatible = "nvidia,tegra210-emc-table";
+            reg = <0x0 0x83400000 0x0 0x10000>;
+            status = "okay";
+        };
+    };
+
+    external-memory-controller@7001b000 {
+        compatible = "nvidia,tegra210-emc";
+        reg = <0x0 0x7001b000 0x0 0x1000>,
+              <0x0 0x7001e000 0x0 0x1000>,
+              <0x0 0x7001f000 0x0 0x1000>;
+        clocks = <&tegra_car TEGRA210_CLK_EMC>;
+        clock-names = "emc";
+        interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+        memory-region = <&emc_table>;
+        nvidia,memory-controller = <&mc>;
+    };
-- 
2.24.1

