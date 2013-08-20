Return-Path: <devicetree-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:57209 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751534Ab3HTQlD (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 20 Aug 2013 12:41:03 -0400
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 2/2] dt: dbx5x0: remove mentor,musb binding
Date: Tue, 20 Aug 2013 18:40:27 +0200
Message-Id: <1377016827-26827-2-git-send-email-bigeasy@linutronix.de>
In-Reply-To: <1377016827-26827-1-git-send-email-bigeasy@linutronix.de>
References: <1377016827-26827-1-git-send-email-bigeasy@linutronix.de>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Lee Jones <lee.jones@linaro.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-ID: <devicetree@vger.kernel.org>

The "mentor,musb" binding isn't documented so I was about to document
it.
The node is missing a few properties for configuration like
"multipoint", "dyn_fifo", "num_eps" or "ram_bits". However I am not sure
"missing" is the right word here because some of those informations
might be obtained from the chip itself but it is not done (yet).
Further the ePARP 2.3.1 says the matching goes from left to right taking
the fist match. Right now there is jus a driver for
"stericsson,db8500-musb" and none for "mentor,musb". I'm not 100% that
it is simply possible to have a generic since even for DMA we have
ifdefs in the driver between "generic mentor dma" and "ux500 dma" and I
mean within musb and not the dma code.

For that reason (that I am not sure a generic musb binding is possible and
how its binding / required properties will look like) and the reason that
we have here a minor binding without a driver to look at I suggest to
remove that binding.
If the majority of people prefer to keep this binding I'm curious how
the documentation of the binding should look like.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 Documentation/devicetree/bindings/usb/ux500-usb.txt | 2 +-
 arch/arm/boot/dts/dbx5x0.dtsi                       | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ux500-usb.txt b/Documentation/devicetree/bindings/usb/ux500-usb.txt
index 330d6ec..439a41c 100644
--- a/Documentation/devicetree/bindings/usb/ux500-usb.txt
+++ b/Documentation/devicetree/bindings/usb/ux500-usb.txt
@@ -15,7 +15,7 @@ Ux500 MUSB
 Example:
 
 usb_per5@a03e0000 {
-	compatible = "stericsson,db8500-musb", "mentor,musb";
+	compatible = "stericsson,db8500-musb";
 	reg = <0xa03e0000 0x10000>;
 	interrupts = <0 23 0x4>;
 	interrupt-names = "mc";
diff --git a/arch/arm/boot/dts/dbx5x0.dtsi b/arch/arm/boot/dts/dbx5x0.dtsi
index a152945..4522aff8 100644
--- a/arch/arm/boot/dts/dbx5x0.dtsi
+++ b/arch/arm/boot/dts/dbx5x0.dtsi
@@ -177,8 +177,7 @@
 		};
 
 		usb_per5@a03e0000 {
-			compatible = "stericsson,db8500-musb",
-				"mentor,musb";
+			compatible = "stericsson,db8500-musb";
 			reg = <0xa03e0000 0x10000>;
 			interrupts = <0 23 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "mc";
-- 
1.8.4.rc2

