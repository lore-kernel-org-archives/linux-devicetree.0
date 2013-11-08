From: Sebastian Reichel <sre@debian.org>
Subject: [PATCH] Documentation: dt: matrix-keymap: Add linux,keypad-no-autorepeat
Date: Fri,  8 Nov 2013 23:54:10 +0100
Message-ID: <1383951250-2050-1-git-send-email-sre@debian.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@ring0.de>, Kumar Gala <galak@codeaurora.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@secretlab.ca>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sre@debian.org>
List-Id: devicetree@vger.kernel.org

Add documentation for linux,keypad-no-autorepeat, which
is supported by most matrix-keymap implementations.

Signed-off-by: Sebastian Reichel <sre@debian.org>
---
 Documentation/devicetree/bindings/input/matrix-keymap.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/matrix-keymap.txt b/Documentation/devicetree/bindings/input/matrix-keymap.txt
index c54919f..e87de50 100644
--- a/Documentation/devicetree/bindings/input/matrix-keymap.txt
+++ b/Documentation/devicetree/bindings/input/matrix-keymap.txt
@@ -14,6 +14,7 @@ drivers will use fixed values for these.
 - keypad,num-rows: Number of row lines connected to the keypad controller.
 - keypad,num-columns: Number of column lines connected to the keypad
   controller.
+- linux,keypad-no-autorepeat: Do not enable autorepeat feature.
 
 Some users of this binding might choose to specify secondary keymaps for
 cases where there is a modifier key such as a Fn key. Proposed names
-- 
1.8.4.rc3
