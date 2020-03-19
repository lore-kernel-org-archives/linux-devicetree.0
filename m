Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B31C4332B
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 07:51:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A421420722
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 07:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbgCSHvC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 03:51:02 -0400
Received: from mx.socionext.com ([202.248.49.38]:23096 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726892AbgCSHvB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Mar 2020 03:51:01 -0400
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 19 Mar 2020 16:51:00 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by kinkan-ex.css.socionext.com (Postfix) with ESMTP id C1BD218005C;
        Thu, 19 Mar 2020 16:51:00 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Thu, 19 Mar 2020 16:51:00 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
        by kinkan.css.socionext.com (Postfix) with ESMTP id 4CE621A0E67;
        Thu, 19 Mar 2020 16:51:00 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v2 3/6] arm64: dts: uniphier: Add XDMAC node
Date:   Thu, 19 Mar 2020 16:50:49 +0900
Message-Id: <1584604252-13172-4-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584604252-13172-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1584604252-13172-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add external DMA controller support implemented in UniPhier SoCs.
This supports for LD11, LD20 and PXs3.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 8 ++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 8 ++++++++
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index 56f382f..c001f6c 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -566,6 +566,14 @@
 			};
 		};
 
+		xdmac: dma-controller@5fc10000 {
+			compatible = "socionext,uniphier-xdmac";
+			reg = <0x5fc10000 0x1000>;
+			interrupts = <0 188 4>;
+			dma-channels = <16>;
+			#dma-cells = <2>;
+		};
+
 		aidet: aidet@5fc20000 {
 			compatible = "socionext,uniphier-ld11-aidet";
 			reg = <0x5fc20000 0x200>;
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index bd4f8db..ebd0d98 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -664,6 +664,14 @@
 			};
 		};
 
+		xdmac: dma-controller@5fc10000 {
+			compatible = "socionext,uniphier-xdmac";
+			reg = <0x5fc10000 0x1000>;
+			interrupts = <0 188 4>;
+			dma-channels = <16>;
+			#dma-cells = <2>;
+		};
+
 		aidet: aidet@5fc20000 {
 			compatible = "socionext,uniphier-ld20-aidet";
 			reg = <0x5fc20000 0x200>;
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index cf4f762..d69c57b 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -498,6 +498,14 @@
 			};
 		};
 
+		xdmac: dma-controller@5fc10000 {
+			compatible = "socionext,uniphier-xdmac";
+			reg = <0x5fc10000 0x1000>;
+			interrupts = <0 188 4>;
+			dma-channels = <16>;
+			#dma-cells = <2>;
+		};
+
 		aidet: aidet@5fc20000 {
 			compatible = "socionext,uniphier-pxs3-aidet";
 			reg = <0x5fc20000 0x200>;
-- 
2.7.4

