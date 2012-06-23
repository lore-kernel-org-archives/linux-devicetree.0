From: Marek Vasut <marex@denx.de>
Subject: [PATCH] LED: Fix missing semicolon in OF documentation
Date: Sat, 23 Jun 2012 20:41:17 +0200
Message-ID: <1340476877-2704-1-git-send-email-marex@denx.de>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: linux-doc@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Trivial fix

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: Rob Landley <rob@landley.net>
Cc: devicetree-discuss@lists.ozlabs.org
Cc: linux-doc@vger.kernel.org
---
 Documentation/devicetree/bindings/gpio/led.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/led.txt b/Documentation/devicetree/bindings/gpio/led.txt
index fd2bd56..9bb308a 100644
--- a/Documentation/devicetree/bindings/gpio/led.txt
+++ b/Documentation/devicetree/bindings/gpio/led.txt
@@ -55,4 +55,4 @@ run-control {
 		gpios = <&mpc8572 7 0>;
 		default-state = "on";
 	};
-}
+};
-- 
1.7.10

