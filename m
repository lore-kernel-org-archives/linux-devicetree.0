Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:58552 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755576Ab3GYObQ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 25 Jul 2013 10:31:16 -0400
From: Mark Brown <broonie@kernel.org>
Date: Thu, 25 Jul 2013 15:31:08 +0100
Message-Id: <1374762668-5037-1-git-send-email-broonie@kernel.org>
Subject: [PATCH] ASoC: wm8994: Add clock bindings to the device tree
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@linaro.org>
List-ID: <devicetree@vger.kernel.org>

From: Mark Brown <broonie@linaro.org>

Due to the variable availability of the clock API there is no code in the
driver to use these at present, for the time being the machine drivers
will need to handle requesting clocks.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 Documentation/devicetree/bindings/sound/wm8994.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/wm8994.txt b/Documentation/devicetree/bindings/sound/wm8994.txt
index f2f3e80..e045e90 100644
--- a/Documentation/devicetree/bindings/sound/wm8994.txt
+++ b/Documentation/devicetree/bindings/sound/wm8994.txt
@@ -32,6 +32,10 @@ Optional properties:
     The second cell is the flags, encoded as the trigger masks from
     Documentation/devicetree/bindings/interrupts.txt
 
+  - clocks : A list of up to two phandle and clock specifier pairs
+  - clock-names : A list of clock names sorted in the same order as clocks.
+                  Valid clock names are "MCLK1" and "MCLK2".
+
   - wlf,gpio-cfg : A list of GPIO configuration register values. If absent,
     no configuration of these registers is performed. If any value is
     over 0xffff then the register will be left as default. If present 11
-- 
1.8.3.2

