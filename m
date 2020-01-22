Return-Path: <SRS0=6ipe=3L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C141C33CAF
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 12:44:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 32E8024684
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 12:44:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="Q84S4QWX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZYIWuF2q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbgAVMoU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jan 2020 07:44:20 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:34163 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728731AbgAVMoU (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 22 Jan 2020 07:44:20 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 514B121AD2;
        Wed, 22 Jan 2020 07:44:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 22 Jan 2020 07:44:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=PpkqFMc9bHGZU
        C2M9j/B71daXgXhgIIRGqNjkpJlLo8=; b=Q84S4QWXlfd0S2itTk7DJjpOsSUTa
        5T0QZuOnUHTcvN4KghuuZTujOQ15P3DprTUxApc3Bqdp11d4OUd/2hZk9CHGpUN0
        +pquAjq0sxs6Mdbhj+x/Amir3WJBDEOyG8d2+2XPhFrr+T9LOCT/VoBJUXzpa/fJ
        g+69Fcspafab8hhRM05ypXbKHRty9YLAIJ96JJ/31l6yz/ek76+bd9yUwqGkyIys
        wQ/kxvxaD5UI+4rD00QHigW3VuEIRI1ZrvyRZHpetDYLbf5UOm6GPo/J9YqB9wI7
        Whn3fJKDUFqGyBqpwN2EC4iUrq9UaRlhtSdo5sY9KXaVYuIFXlPjHc77Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=PpkqFMc9bHGZUC2M9j/B71daXgXhgIIRGqNjkpJlLo8=; b=ZYIWuF2q
        mD/c4OJ140VhJhhskbcdaHH3GyKzc6a1CSAyLhjCGAMy+bufabFv+LGCuG4+Ks/d
        IM39mqNkucl6j91cDFSdDbSEOHm+0NC/Ln/x16gKsF3obBgTodym3E05yQ4Vu626
        J/v8Z2Of/3MdWOUJyr349CXQcREzuXsdM0wl3oixUUFTCv56lyg8i4ywUFyw9TOV
        3IfFuuefINxqzRTTO8bwfuh/2XC2tj1b1rSsuMlaa73eY8eYz2YBUX7567VO1jGM
        9lSLkYjzu7AR5izDQwEf4Nugrl5NQVZmq+99nQveuGXRGh6k1JRi4FGDj2NC4+Td
        kq40u8SW5bCTOA==
X-ME-Sender: <xms:o0MoXmEwsdasyonWjv_ljWt-QC24y0RsIrx3QXMmXsF5gDd235JHNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvddtgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
    ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
    himhgvsegtvghrnhhordhtvggthheqnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdr
    ohhrghenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:o0MoXhXdPcfuDQJ0KaBZbhcmHqmBhMG4YyShRrnsec43WHDrItbSFA>
    <xmx:o0MoXmyOkpcsY50btgYI5vmm7xv51WHldExsCUnc2Dzt3wJk1Lu_Yw>
    <xmx:o0MoXuSpowk1Om7XnT1ll9d_UeRsC4PolUuY8pGqWLX6UuAuzPRalw>
    <xmx:o0MoXnUFDhrQ6unMBrM9oiH-7BII6EcQi-bP-GDfe3EHSJQWj3-jVg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id DC1EA3060C16;
        Wed, 22 Jan 2020 07:44:18 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/3] dt-bindings: iommu: Add Allwinner H6 IOMMU bindings
Date:   Wed, 22 Jan 2020 13:44:07 +0100
Message-Id: <3022a8d9d60f35db072b39313ec46708a567a9c5.1579696927.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.b2a9e1507135d81e726fcbb65137665a7f0ab74f.1579696927.git-series.maxime@cerno.tech>
References: <cover.b2a9e1507135d81e726fcbb65137665a7f0ab74f.1579696927.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Allwinner H6 has introduced an IOMMU. Let's add a device tree binding
for it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml

diff --git a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
new file mode 100644
index 000000000000..5e125cf2a88b
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H6 IOMMU Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  "#iommu-cells":
+    const: 1
+    description:
+      The content of the cell is the master ID.
+
+  compatible:
+    const: allwinner,sun50i-h6-iommu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#iommu-cells"
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/interrupt-controller/arm-gic.h>
+      #include <dt-bindings/interrupt-controller/irq.h>
+
+      #include <dt-bindings/clock/sun50i-h6-ccu.h>
+      #include <dt-bindings/reset/sun50i-h6-ccu.h>
+
+      iommu: iommu@30f0000 {
+          compatible = "allwinner,sun50i-h6-iommu";
+          reg = <0x030f0000 0x10000>;
+          interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+          clocks = <&ccu CLK_BUS_IOMMU>;
+          resets = <&ccu RST_BUS_IOMMU>;
+          #iommu-cells = <1>;
+      };
+
+...
-- 
git-series 0.9.1
