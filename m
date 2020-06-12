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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E898C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6044620792
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkPFqeFe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgFLOUG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgFLOUF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:20:05 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A46DC03E96F;
        Fri, 12 Jun 2020 07:20:03 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x14so9928305wrp.2;
        Fri, 12 Jun 2020 07:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L9wKymHH/v6YunAl/pZm4DJsFjD8Guav1ycXTwqFKww=;
        b=TkPFqeFeTNBX4FL6lF+0WNeivTs95u98HXlMm28gfH2A14M3Ui2XfCNT+0hfXBjHUS
         ZdjAVcW5k4yIHyCJHgS7sStoGYDwUymRxfGfiawDBVUPsN8+z2VrXcHKlsiIIAJFCdib
         cYLaEM61bAebhAmHEiE+8oAyJNoy779tDwRlibbgrxc7fpTjGsTVmb1ygx187TB8JIEN
         2jUcgIFrEYeN9LgnFRgnh2JlBfpUwxLjlkygiKcMQm3PDFqT34OhP90oyFneGQz2kltK
         J6yWh+5DwsUpLu9PTVfdZH3QgNGXg8nPFBL1eZ6lsr4LWS2GksI+UvxOFeg15IpdNFoJ
         DRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L9wKymHH/v6YunAl/pZm4DJsFjD8Guav1ycXTwqFKww=;
        b=M/Zw/Re2jhZUh85iMMtGXQVp9uh4QGbebFwJ/OlbpbKYQwOC64R2GalBnyz12B2JZ7
         Mc67TVmqpVurV2PVkBS5ZPG3ZS51NjVK8F8CkNoEHZrrVELzub+lc5ApINUZptFUoZ12
         6XZrBevDWUFlaex6LPHy4p2MH7R4/9dv8ESXb1nM01PXLKFxr7vIa3gis3NUku2SlQrw
         dN2SVhGPvmDD3GVb59hDT3LwYggzSH1qBLhLYOgspZHMy3aRDPLrFSbx1jAUdYuZ1FM3
         yT8EWz5F6e3N/OLf7bISkhKoDpU1JAoye4Qnr1ZeaPIHJ/r1FRCPA+ndHapKF0DkokrI
         l0ig==
X-Gm-Message-State: AOAM5312jcYSWSRjTyxLFJXfCknhQeuJjc+EklreMWUjPkUsC+rMgNIX
        FT5XV2CRMlcQUYYYwp9IwaEFk+rT
X-Google-Smtp-Source: ABdhPJwKTfF3GUNIK9fxg74v9KFJrC+0O/dzuNxZKykbD/JFgX81pXE+2umGmmaSCfKe/z7OaY18yA==
X-Received: by 2002:a5d:558a:: with SMTP id i10mr16184313wrv.207.1591971602082;
        Fri, 12 Jun 2020 07:20:02 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l17sm8441535wmi.3.2020.06.12.07.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:20:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 26/38] dt-bindings: pci: iommu: Convert to json-schema
Date:   Fri, 12 Jun 2020 16:18:51 +0200
Message-Id: <20200612141903.2391044-27-thierry.reding@gmail.com>
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

Convert the PCI IOMMU device tree bindings from free-form text format to
json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/pci/pci-iommu.txt     | 171 ------------------
 .../devicetree/bindings/pci/pci-iommu.yaml    | 168 +++++++++++++++++
 2 files changed, 168 insertions(+), 171 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pci/pci-iommu.txt
 create mode 100644 Documentation/devicetree/bindings/pci/pci-iommu.yaml

diff --git a/Documentation/devicetree/bindings/pci/pci-iommu.txt b/Documentation/devicetree/bindings/pci/pci-iommu.txt
deleted file mode 100644
index 0def586fdcdf..000000000000
--- a/Documentation/devicetree/bindings/pci/pci-iommu.txt
+++ /dev/null
@@ -1,171 +0,0 @@
-This document describes the generic device tree binding for describing the
-relationship between PCI(e) devices and IOMMU(s).
-
-Each PCI(e) device under a root complex is uniquely identified by its Requester
-ID (AKA RID). A Requester ID is a triplet of a Bus number, Device number, and
-Function number.
-
-For the purpose of this document, when treated as a numeric value, a RID is
-formatted such that:
-
-* Bits [15:8] are the Bus number.
-* Bits [7:3] are the Device number.
-* Bits [2:0] are the Function number.
-* Any other bits required for padding must be zero.
-
-IOMMUs may distinguish PCI devices through sideband data derived from the
-Requester ID. While a given PCI device can only master through one IOMMU, a
-root complex may split masters across a set of IOMMUs (e.g. with one IOMMU per
-bus).
-
-The generic 'iommus' property is insufficient to describe this relationship,
-and a mechanism is required to map from a PCI device to its IOMMU and sideband
-data.
-
-For generic IOMMU bindings, see
-Documentation/devicetree/bindings/iommu/iommu.txt.
-
-
-PCI root complex
-================
-
-Optional properties
--------------------
-
-- iommu-map: Maps a Requester ID to an IOMMU and associated IOMMU specifier
-  data.
-
-  The property is an arbitrary number of tuples of
-  (rid-base,iommu,iommu-base,length).
-
-  Any RID r in the interval [rid-base, rid-base + length) is associated with
-  the listed IOMMU, with the IOMMU specifier (r - rid-base + iommu-base).
-
-- iommu-map-mask: A mask to be applied to each Requester ID prior to being
-  mapped to an IOMMU specifier per the iommu-map property.
-
-
-Example (1)
-===========
-
-/ {
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	iommu: iommu@a {
-		reg = <0xa 0x1>;
-		compatible = "vendor,some-iommu";
-		#iommu-cells = <1>;
-	};
-
-	pci: pci@f {
-		reg = <0xf 0x1>;
-		compatible = "vendor,pcie-root-complex";
-		device_type = "pci";
-
-		/*
-		 * The sideband data provided to the IOMMU is the RID,
-		 * identity-mapped.
-		 */
-		iommu-map = <0x0 &iommu 0x0 0x10000>;
-	};
-};
-
-
-Example (2)
-===========
-
-/ {
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	iommu: iommu@a {
-		reg = <0xa 0x1>;
-		compatible = "vendor,some-iommu";
-		#iommu-cells = <1>;
-	};
-
-	pci: pci@f {
-		reg = <0xf 0x1>;
-		compatible = "vendor,pcie-root-complex";
-		device_type = "pci";
-
-		/*
-		 * The sideband data provided to the IOMMU is the RID with the
-		 * function bits masked out.
-		 */
-		iommu-map = <0x0 &iommu 0x0 0x10000>;
-		iommu-map-mask = <0xfff8>;
-	};
-};
-
-
-Example (3)
-===========
-
-/ {
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	iommu: iommu@a {
-		reg = <0xa 0x1>;
-		compatible = "vendor,some-iommu";
-		#iommu-cells = <1>;
-	};
-
-	pci: pci@f {
-		reg = <0xf 0x1>;
-		compatible = "vendor,pcie-root-complex";
-		device_type = "pci";
-
-		/*
-		 * The sideband data provided to the IOMMU is the RID,
-		 * but the high bits of the bus number are flipped.
-		 */
-		iommu-map = <0x0000 &iommu 0x8000 0x8000>,
-			    <0x8000 &iommu 0x0000 0x8000>;
-	};
-};
-
-
-Example (4)
-===========
-
-/ {
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	iommu_a: iommu@a {
-		reg = <0xa 0x1>;
-		compatible = "vendor,some-iommu";
-		#iommu-cells = <1>;
-	};
-
-	iommu_b: iommu@b {
-		reg = <0xb 0x1>;
-		compatible = "vendor,some-iommu";
-		#iommu-cells = <1>;
-	};
-
-	iommu_c: iommu@c {
-		reg = <0xc 0x1>;
-		compatible = "vendor,some-iommu";
-		#iommu-cells = <1>;
-	};
-
-	pci: pci@f {
-		reg = <0xf 0x1>;
-		compatible = "vendor,pcie-root-complex";
-		device_type = "pci";
-
-		/*
-		 * Devices with bus number 0-127 are mastered via IOMMU
-		 * a, with sideband data being RID[14:0].
-		 * Devices with bus number 128-255 are mastered via
-		 * IOMMU b, with sideband data being RID[14:0].
-		 * No devices master via IOMMU c.
-		 */
-		iommu-map = <0x0000 &iommu_a 0x0000 0x8000>,
-			    <0x8000 &iommu_b 0x0000 0x8000>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/pci/pci-iommu.yaml b/Documentation/devicetree/bindings/pci/pci-iommu.yaml
new file mode 100644
index 000000000000..8aaa8e657559
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/pci-iommu.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/pci-iommu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PCI IOMMU bindings
+
+maintainers:
+  - Rob Herring <robh+dt@kernel.org>
+
+description: |
+  This document describes the generic device tree binding for describing the
+  relationship between PCI(e) devices and IOMMU(s).
+
+  Each PCI(e) device under a root complex is uniquely identified by its
+  Requester ID (AKA RID). A Requester ID is a triplet of a Bus number, Device
+  number, and Function number.
+
+  For the purpose of this document, when treated as a numeric value, a RID is
+  formatted such that:
+
+    * Bits [15:8] are the Bus number.
+    * Bits [7:3] are the Device number.
+    * Bits [2:0] are the Function number.
+    * Any other bits required for padding must be zero.
+
+  IOMMUs may distinguish PCI devices through sideband data derived from the
+  Requester ID. While a given PCI device can only master through one IOMMU, a
+  root complex may split masters across a set of IOMMUs (e.g. with one IOMMU
+  per bus).
+
+  The generic 'iommus' property is insufficient to describe this relationship,
+  and a mechanism is required to map from a PCI device to its IOMMU and
+  sideband data.
+
+  For generic IOMMU bindings, see
+  Documentation/devicetree/bindings/iommu/iommu.txt.
+
+properties:
+  iommu-map:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description: |
+      Maps a Requester ID to an IOMMU and associated IOMMU specifier data.
+
+      The property is an arbitrary number of tuples of (rid-base, iommu,
+      iommu-base, length).
+
+      Any RID r in the interval [rid-base, rid-base + length) is associated
+      with the listed IOMMU, with the IOMMU specifier (r - rid-base +
+      iommu-base).
+
+  iommu-map-mask:
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    description:
+      A mask to be applied to each Requester ID prior to being mapped to an
+      IOMMU specifier per the iommu-map property.
+
+examples:
+  - |
+    iommu0: iommu@a {
+        reg = <0xa 0x1>;
+        compatible = "vendor,some-iommu";
+        #iommu-cells = <1>;
+    };
+
+    pci@f {
+        reg = <0xf 0x1>;
+        compatible = "vendor,pcie-root-complex";
+        device_type = "pci";
+
+        #address-cells = <3>;
+        #size-cells = <2>;
+        ranges = <0x02000000 0 0x00000000 0x00000000 0 0x00000000>;
+
+        /*
+         * The sideband data provided to the IOMMU is the RID,
+         * identity-mapped.
+         */
+        iommu-map = <0x0 &iommu0 0x0 0x10000>;
+    };
+
+  - |
+    iommu1: iommu@a {
+        reg = <0xa 0x1>;
+        compatible = "vendor,some-iommu";
+        #iommu-cells = <1>;
+    };
+
+    pci@f {
+        reg = <0xf 0x1>;
+        compatible = "vendor,pcie-root-complex";
+        device_type = "pci";
+
+        #address-cells = <3>;
+        #size-cells = <2>;
+        ranges = <0x02000000 0 0x00000000 0x00000000 0 0x00000000>;
+
+        /*
+         * The sideband data provided to the IOMMU is the RID with the
+         * function bits masked out.
+         */
+        iommu-map = <0x0 &iommu 0x0 0x10000>;
+        iommu-map-mask = <0xfff8>;
+    };
+
+  - |
+    iommu2: iommu@a {
+        reg = <0xa 0x1>;
+        compatible = "vendor,some-iommu";
+        #iommu-cells = <1>;
+    };
+
+    pci@f {
+        reg = <0xf 0x1>;
+        compatible = "vendor,pcie-root-complex";
+        device_type = "pci";
+
+        #address-cells = <3>;
+        #size-cells = <2>;
+        ranges = <0x02000000 0 0x00000000 0x00000000 0 0x00000000>;
+
+        /*
+         * The sideband data provided to the IOMMU is the RID,
+         * but the high bits of the bus number are flipped.
+         */
+        iommu-map = <0x0000 &iommu2 0x8000 0x8000>,
+                    <0x8000 &iommu2 0x0000 0x8000>;
+    };
+
+  - |
+    iommu_a: iommu@a {
+        reg = <0xa 0x1>;
+        compatible = "vendor,some-iommu";
+        #iommu-cells = <1>;
+    };
+
+    iommu_b: iommu@b {
+        reg = <0xb 0x1>;
+        compatible = "vendor,some-iommu";
+        #iommu-cells = <1>;
+    };
+
+    iommu_c: iommu@c {
+        reg = <0xc 0x1>;
+        compatible = "vendor,some-iommu";
+        #iommu-cells = <1>;
+    };
+
+    pci@f {
+        reg = <0xf 0x1>;
+        compatible = "vendor,pcie-root-complex";
+        device_type = "pci";
+
+        #address-cells = <3>;
+        #size-cells = <2>;
+        ranges = <0x02000000 0 0x00000000 0x00000000 0 0x00000000>;
+
+        /*
+         * Devices with bus number 0-127 are mastered via IOMMU
+         * a, with sideband data being RID[14:0].
+         * Devices with bus number 128-255 are mastered via
+         * IOMMU b, with sideband data being RID[14:0].
+         * No devices master via IOMMU c.
+         */
+        iommu-map = <0x0000 &iommu_a 0x0000 0x8000>,
+                    <0x8000 &iommu_b 0x0000 0x8000>;
+    };
-- 
2.24.1

