Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E10C33CB2
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 18:15:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 871BA24679
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 18:15:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fF7zoJ7j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgANSPb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 13:15:31 -0500
Received: from mail-wm1-f50.google.com ([209.85.128.50]:51687 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728057AbgANSPb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jan 2020 13:15:31 -0500
Received: by mail-wm1-f50.google.com with SMTP id d73so14950853wmd.1;
        Tue, 14 Jan 2020 10:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W98ArnC1pumbkemZi5CT4h5r3WVttDYJlBmsQmIg0jQ=;
        b=fF7zoJ7j84HEur4t7vRP9pCOgqJjTAb/waoTBzB6upPg9OCfMW1o8tRwWRD44Zlzvi
         BD196qmmaHG6J7HTFyH65ejY8dxJ1FoDGFZFVONsppNApMeJS3mZz1uc72HzL7/0OQRg
         XhZhmTGhSqnsycsg/OkvufN/xiXB/zvOO/cMVJ8R4AVLLNApTUzk5zrEVaUBEbxiCBVg
         vLA4koAzrpmL5+iJ05VC3pNOKWaPH/qa08NW5p+cwsvBo+VsD1IuOSB5Ej3EtrD7yrQj
         UO5/qr0FND18rZkOwahQ3LoqxT3kLIx9Ay6Fxn958eWoTi4yKCnWWA2dAjfjm1hAEgH6
         z5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W98ArnC1pumbkemZi5CT4h5r3WVttDYJlBmsQmIg0jQ=;
        b=n99pne/1Ke88aPER1Y7uZfjkbJxFywJGJ+7xr/bSStaF9bVpDLEbVpK8Ez6r2D6PPO
         LbVpP0dftBX0LhDQKlchOZC3r5krNBFy5RGO+A8+jHFK6b8IkzmbK5tBeCYeAD6Sk6aq
         SqWzhA9jOTblQy7fync03MYA8/se0ZcagwyLLJTmIde+0RgL9mWAyY2mGtiViwr2tLML
         RfTNpaUqQmeUNVW6fo72AYdom0OfBW1UxGuKRf9K+Welpkhmt2246zc7NzhchWUiKdeQ
         lWPD6PagIf8SMiTHdPrt//4QWf3yoLkMUL20Rlf1NSDezVpCLiKIoUVAwoOhaaIbHfhH
         IgIg==
X-Gm-Message-State: APjAAAXG8P1gNoD1fM3qJo7tIGb1MqqEpNr1QytLYs0ozSrtZZzUmfK7
        gzEDnT9imhZkvevUUbceYCM=
X-Google-Smtp-Source: APXvYqyBzCnuumI4Fh0LYRvwsVkumU0eVccJWmdeyhY0NNwAMNcFiksNL4cpvcirakHVrE5qBG0dyQ==
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr28099001wmi.37.1579025728196;
        Tue, 14 Jan 2020 10:15:28 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id z187sm20427839wme.16.2020.01.14.10.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 10:15:27 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document interconnects property
Date:   Tue, 14 Jan 2020 19:15:19 +0100
Message-Id: <20200114181519.3402385-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114181519.3402385-1-thierry.reding@gmail.com>
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Document the interconnects property that is used to describe the paths
from and to system memory from and to the BPMP.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Rob, Georgi,

after the initial RFC that I did for adding interconnect properties on
Tegra, I realized that the description wasn't complete. This is an
attempt at a more accurate description, but unfortunately I'm not sure
if it's even correct in terms of the interconnect bindings.

The problem here is that on Tegra, each device has multiple paths to
system memory, and I have no good idea on what to pick as the default.
They are all basically the same path, but each provides extra controls
to configure the "interconnect".

Any ideas on how to resolve this? Let me know if the DT bindings and
example don't make things clear enough.

Thierry

 .../firmware/nvidia,tegra186-bpmp.yaml        | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
index dabf1c1aec2f..d40fcd836e90 100644
--- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
@@ -43,6 +43,24 @@ properties:
       - enum:
           - nvidia,tegra186-bpmp
 
+  interconnects:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: A list of phandle and specifier pairs that describe the
+      interconnect paths to and from the BPMP.
+
+  interconnect-names:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: One string for each pair of phandle and specifier in the
+      "interconnects" property.
+    # XXX We need at least one of these to be named dma-mem so that the core
+    # will set the DMA mask based on the DMA parent, but all of these go to
+    # system memory eventually.
+    items:
+      - const: dma-mem
+      - const: dma-mem
+      - const: dma-mem
+      - const: dma-mem
+
   iommus:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: |
@@ -152,8 +170,43 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/tegra186-clock.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/mailbox/tegra186-hsp.h>
+    #include <dt-bindings/memory/tegra186-mc.h>
+
+    mc: memory-controller@2c00000 {
+        compatible = "nvidia,tegra186-mc";
+        reg = <0x02c00000 0xb0000>;
+        interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+        status = "disabled";
+
+        #interconnect-cells = <1>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ranges = <0x02c00000 0x0 0x02c00000 0x0 0xb0000>;
+
+        /*
+         * Memory clients have access to all 40 bits that the memory
+         * controller can address.
+         */
+        dma-ranges = <0x0 0x0 0x0 0x100 0x0>;
+
+        #memory-controller-cells = <0>;
+
+        emc: external-memory-controller@2c60000 {
+            compatible = "nvidia,tegra186-emc";
+            reg = <0x0 0x02c60000 0x0 0x50000>;
+            interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&bpmp TEGRA186_CLK_EMC>;
+            clock-names = "emc";
+
+            #interconnect-cells = <0>;
+
+            nvidia,bpmp = <&bpmp>;
+        };
+    };
 
     hsp_top0: hsp@3c00000 {
         compatible = "nvidia,tegra186-hsp";
@@ -187,6 +240,12 @@ examples:
 
     bpmp {
         compatible = "nvidia,tegra186-bpmp";
+        interconnects = <&emc &mc TEGRA186_MEMORY_CLIENT_BPMPR>,
+                        <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc>,
+                        <&emc &mc TEGRA186_MEMORY_CLIENT_BPMPDMAR>,
+                        <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc>;
+        interconnect-names = "dma-mem", "dma-mem", "dma-mem", "dma-mem";
+
         iommus = <&smmu TEGRA186_SID_BPMP>;
         mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_BPMP>;
         shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
-- 
2.24.1

