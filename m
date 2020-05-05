Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D724AC47254
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 10:09:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B56FC2083B
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 10:09:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="nKkDNLC1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DjLTN0hk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgEEKJm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 06:09:42 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:37101 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728238AbgEEKJl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 06:09:41 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id ABE76580267;
        Tue,  5 May 2020 06:09:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 05 May 2020 06:09:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=6SinJITdD/n69
        eIlJpnmxjWDDOpwI1CwjSpv52GcRJQ=; b=nKkDNLC1rFeu+nvfy/6sJ7jrxmlpS
        DVL+sLHcc1ADdZH18bZ0cGt4fOU+iJgiIJYNE0CF+Na64LI5sYVngrumyTGji8Fv
        KEXyD7Ghoqq0MJ5T6R9lGRvYx1dP1pFkjy9g0hMsKV7HRxIEQWqmUECHvgYREgAF
        g0IG8FYDTjMT9hxcHBSNGfrdEUUrmlYlShDnffjdayqSl2xu/tF9u/n1/qCOl34W
        taMGUKXi9QnLqNUhw/uvYf2TIciXj1s6qEyXc73uWNCcsHC20spQeCfaQZk18RZ6
        Us5JC/xLnXP9TrPDB6eGEOb4i3mTdeEIRWuCPL1lFFQcxmIq9Ufq3x0Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=6SinJITdD/n69eIlJpnmxjWDDOpwI1CwjSpv52GcRJQ=; b=DjLTN0hk
        c+eUUPuvYz2DxiMNSGg+Zm+vmq8EkkFqSbLFCkNXQdtnK2ly4W2Agcmg2Qlyv/2W
        p+s7tkwIvLv9AwSlnxaDGe4CbtCiyidmZDWFLP4myce2D0k4Opmbsm96jVAPAUQq
        ne5YdfdD2qKJtANytRyFf+1g+XsIsUBhZSBkFOtpzbybWTq/CyfhZOtVmAW3QXsF
        tnfTFwW89EofkpsSf6OJTPLnhUcQJ8ifoEIptrD+wINFEnSXTYWNJhrwTGvMyM1J
        wUq0MH4Mg4oLN2dtTCpB3FT/gzxUxaThqA6lUyrZrLenfyswgyTvEUQav+u8zS0u
        8iCg50FMVVRyWg==
X-ME-Sender: <xms:ZDuxXvlU1GcBjiFYtpGZYXZDSbHgCkqAVfAblNoGMWJlQGybwsNN9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeeigddvgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
    ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
    himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdevgfff
    gfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpeguvg
    hvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrh
    hnohdrthgvtghh
X-ME-Proxy: <xmx:ZDuxXhXPsAbE3vh1gyeWDyGBVobC7-BTZLNonK8riiEJjNRmuc8URQ>
    <xmx:ZDuxXr-OJ8UtCTf1VcnmjL0pXP0um1ZrU7dzofDAoa4dhNpmpRcK8Q>
    <xmx:ZDuxXuKcrPvn-Lms0kRaY5Yl8aXldSYTAphHgACA6JlgazyPlekDSA>
    <xmx:ZDuxXqJR5mNMSLO3O3mYPdE0gHbUiLgpryTajbBg36KkvUVvnAz6MQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4BC703065FD6;
        Tue,  5 May 2020 06:09:40 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/5] dt-bindings: iommu: Add Allwinner H6 IOMMU bindings
Date:   Tue,  5 May 2020 12:09:30 +0200
Message-Id: <e955f0d83976dc15e4b4ec903119ee8c1ed510e1.1588673353.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.70f96f9afd2e04161ebece593ae6cd7e17eca41b.1588673353.git-series.maxime@cerno.tech>
References: <cover.70f96f9afd2e04161ebece593ae6cd7e17eca41b.1588673353.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Allwinner H6 has introduced an IOMMU. Let's add a device tree binding
for it.

Reviewed-by: Rob Herring <robh@kernel.org>
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
