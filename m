Return-Path: <SRS0=ljBG=GL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:41637 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753356AbeCUT25 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 21 Mar 2018 15:28:57 -0400
Received: by mail-qk0-f194.google.com with SMTP id s78so6689530qkl.8
        for <devicetree@vger.kernel.org>; Wed, 21 Mar 2018 12:28:56 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 07/14] mmc: dt-bindings: add MMC support to JZ4740 SoC
Date: Wed, 21 Mar 2018 16:27:34 -0300
Message-Id: <20180321192741.25872-8-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <20180321192741.25872-1-ezequiel@vanguardiasur.com.ar>
References: <20180321192741.25872-1-ezequiel@vanguardiasur.com.ar>
Sender: devicetree-owner@vger.kernel.org
To: Mathieu Malaterre <malat@debian.org>, Ulf Hansson <ulf.hansson@linaro.org>, Paul Cercueil <paul@crapouillou.net>
Cc: linux-mmc@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <jhogan@kernel.org>, kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.co.uk>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Ezequiel Garcia <ezequiel@collabora.co.uk>

Add the devicetree binding for JZ4740/JZ4780 SoC MMC/SD controller.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.co.uk>
---
 Documentation/devicetree/bindings/mmc/jz4740.txt | 38 ++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/jz4740.txt

diff --git a/Documentation/devicetree/bindings/mmc/jz4740.txt b/Documentation/devicetree/bindings/mmc/jz4740.txt
new file mode 100644
index 000000000000..7cd8c432d7c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/jz4740.txt
@@ -0,0 +1,38 @@
+* Ingenic JZ47xx MMC controllers
+
+This file documents the device tree properties used for the MMC controller in
+Ingenic JZ4740/JZ4780 SoCs. These are in addition to the core MMC properties
+described in mmc.txt.
+
+Required properties:
+- compatible: Should be one of the following:
+  - "ingenic,jz4740-mmc" for the JZ4740
+  - "ingenic,jz4780-mmc" for the JZ4780
+- reg: Should contain the MMC controller registers location and length.
+- interrupts: Should contain the interrupt specifier of the MMC controller.
+- clocks: Clock for the MMC controller.
+
+Optional properties:
+- dmas: List of DMA specifiers with the controller specific format
+        as described in the generic DMA client binding. A tx and rx
+        specifier is required.
+- dma-names: RX and TX  DMA request names.
+        Should be "rx" and "tx", in that order.
+
+For additional details on DMA client bindings see ../dma/dma.txt.
+
+Example:
+
+mmc0: mmc@13450000 {
+	compatible = "ingenic,jz4780-mmc";
+	reg = <0x13450000 0x1000>;
+
+	interrupt-parent = <&intc>;
+	interrupts = <37>;
+
+	clocks = <&cgu JZ4780_CLK_MSC0>;
+	clock-names = "mmc";
+
+	dmas = <&dma JZ4780_DMA_MSC0_RX 0xffffffff>, <&dma JZ4780_DMA_MSC0_TX 0xffffffff>;
+	dma-names = "rx", "tx";
+};
-- 
2.16.2

