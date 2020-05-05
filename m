Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB5EC47254
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 14:03:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 283E52078D
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 14:03:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="exa1u54L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729322AbgEEODJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 10:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729321AbgEEODJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 10:03:09 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5A6C061A41
        for <devicetree@vger.kernel.org>; Tue,  5 May 2020 07:03:08 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id x4so2444845wmj.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2020 07:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1RBYv7clwofuc4RomuNetMbXz5K8VN7BlCrpLgWGuKQ=;
        b=exa1u54LNh7NcTBkr9fjj1LtLgzCEkb41a3/XAcPpRhDL8uYlIw1yKBcaC3npPnAq+
         iNlvvzM/LMlufPMoM4dQZJ662snagyOfwpwmeJEqzq61YYz64HYeJRj+t1eanmoFGCCm
         ddLdtP3LKdxRSHIxe+vrvt/nhHYJVAn1o3UPfgDEWejxezv/4+QjsbqAvxgBe7whd+5j
         77G9QNzigkGdn3zaHrl1amKuP74s0sgTujd8o+/gAP4984gyy9fEV9GjDIQFQWbcI7X3
         11cm8fOu0E7dE+1WWNOwcnos+18bfhkHGHvtTqVQaqq7TSYiyOSef5MYIBHFOkOkZSnf
         cUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1RBYv7clwofuc4RomuNetMbXz5K8VN7BlCrpLgWGuKQ=;
        b=qA2eUs6+mP89Un6RwdebWkp8TIVBkXC3y8bRWaFtGhfNnn16rPqLSIAg4TWJG1mOmp
         0lbEyB2AOUiRdphEd193fYVpb8yv7hvTthiLYIm+APhp2VBC5DfF9uBYnGXZ1LboKZCd
         edEx7HLcPWW4T92yiif1wSFiuev2b6Pt/DiAhKITOE4BBoiFvoXuCAfIA2IzV1nS/8Li
         aHUBQGxEiNJCg/gb9oxdgJLoEdZe0bhlP7CK4Bi9K2Xko71jsUXMV3fadNtlGDp/pq2A
         oeFK/o6gc6qto/U0EvM+pvkrJWPHvT8LJbFFxvKg14I/9jTxDfEx73Mcz8RSeNn4Q+zq
         kZag==
X-Gm-Message-State: AGi0PuYLyaIaKD+J54fiuvofeAn9G+JyJ2PVvQQVUpVh1pMX2WHFPdLW
        SZWXKzztm8kZambQNrjontcjBQ==
X-Google-Smtp-Source: APiQypKyODJ/h2tkRj/3s4Rn7dN4YkXrc4seYlCWxagOZmnAKutgDsCqy57VDKSasTPAC6+hVxwWqw==
X-Received: by 2002:a1c:9c0a:: with SMTP id f10mr3688664wme.139.1588687386996;
        Tue, 05 May 2020 07:03:06 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id c190sm4075755wme.4.2020.05.05.07.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 07:03:06 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Felix Fietkau <nbd@openwrt.org>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Fabien Parent <fparent@baylibre.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 02/11] dt-bindings: new: add yaml bindings for MediaTek Ethernet MAC
Date:   Tue,  5 May 2020 16:02:22 +0200
Message-Id: <20200505140231.16600-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200505140231.16600-1-brgl@bgdev.pl>
References: <20200505140231.16600-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds yaml DT bindings for the MediaTek Ethernet MAC present on the
mt8* family of SoCs.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../bindings/net/mediatek,eth-mac.yaml        | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml

diff --git a/Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml b/Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml
new file mode 100644
index 000000000000..7682fe9d8109
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/mediatek,eth-mac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Ethernet MAC Controller
+
+maintainers:
+  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
+
+description:
+  This Ethernet MAC is used on the MT8* family of SoCs from MediaTek.
+  It's compliant with 802.3 standards and supports half- and full-duplex
+  modes with flow-control as well as CRC offloading and VLAN tags.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8516-eth
+      - mediatek,mt8518-eth
+      - mediatek,mt8175-eth
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    additionalItems: false
+    items:
+      - const: core
+      - const: reg
+      - const: trans
+
+  mediatek,pericfg:
+    $ref: /schemas/types.yaml#definitions/phandle
+    description:
+      Phandle to the device containing the PERICFG register range.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - mediatek,pericfg
+  - phy-handle
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8516-clk.h>
+
+    ethernet: ethernet@11180000 {
+        compatible = "mediatek,mt8516-eth";
+        reg = <0 0x11180000 0 0x1000>;
+        mediatek,pericfg = <&pericfg>;
+        interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&topckgen CLK_TOP_RG_ETH>,
+                 <&topckgen CLK_TOP_66M_ETH>,
+                 <&topckgen CLK_TOP_133M_ETH>;
+        clock-names = "core", "reg", "trans";
+        phy-handle = <&eth_phy>;
+        phy-mode = "rmii";
+
+        mdio {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eth_phy: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
-- 
2.25.0

