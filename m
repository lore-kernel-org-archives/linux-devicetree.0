Return-Path: <SRS0=Kjxg=MX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40624 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbeJLDEJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Oct 2018 23:04:09 -0400
Received: by mail-lj1-f196.google.com with SMTP id r83-v6so9291966ljr.7
        for <devicetree@vger.kernel.org>; Thu, 11 Oct 2018 12:35:28 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] usb: host: add DT bindings for faraday fotg2
Date: Thu, 11 Oct 2018 21:35:20 +0200
Message-Id: <20181011193520.3844-1-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-ID: <devicetree@vger.kernel.org>

From: Hans Ulli Kroll <ulli.kroll@googlemail.com>

This adds device tree bindings for the Faraday FOTG2
dual-mode host controller.

Cc: devicetree@vger.kernel.org
Signed-off-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Changed "OTH" to "OTG"
- Collected Rob's ACK.
- I don't see any problem with these bindings, but IIRC Hans
  had some reservations for the OTG mode, maybe we can strip
  some properties like the mini-usb thing and use as a starter
  so we can add host mode at least?
---
 .../bindings/usb/faraday,fotg210.txt          | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/faraday,fotg210.txt

diff --git a/Documentation/devicetree/bindings/usb/faraday,fotg210.txt b/Documentation/devicetree/bindings/usb/faraday,fotg210.txt
new file mode 100644
index 000000000000..06a2286e2054
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/faraday,fotg210.txt
@@ -0,0 +1,35 @@
+Faraday FOTG Host controller
+
+This OTG-capable USB host controller is found in Cortina Systems
+Gemini and other SoC products.
+
+Required properties:
+- compatible: should be one of:
+  "faraday,fotg210"
+  "cortina,gemini-usb", "faraday,fotg210"
+- reg: should contain one register range i.e. start and length
+- interrupts: description of the interrupt line
+
+Optional properties:
+- clocks: should contain the IP block clock
+- clock-names: should be "PCLK" for the IP block clock
+
+Required properties for "cortina,gemini-usb" compatible:
+- syscon: a phandle to the system controller to access PHY registers
+
+Optional properties for "cortina,gemini-usb" compatible:
+- cortina,gemini-mini-b: boolean property that indicates that a Mini-B
+  OTG connector is in use
+- wakeup-source: see power/wakeup-source.txt
+
+Example for Gemini:
+
+usb@68000000 {
+	compatible = "cortina,gemini-usb", "faraday,fotg210";
+	reg = <0x68000000 0x1000>;
+	interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&cc 12>;
+	clock-names = "PCLK";
+	syscon = <&syscon>;
+	wakeup-source;
+};
-- 
2.17.1
