From: Nishanth Menon <nm@ti.com>
Subject: [PATCH] Documentation: dt: keystone: Fix up missing quotes
Date: Wed, 7 Oct 2015 12:04:16 -0500
Message-ID: <1444237456-28020-1-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Nishanth Menon <nm@ti.com>
List-Id: devicetree@vger.kernel.org

Add missing commits for the suggest compatible flags in dt binding.

Fixes: 8841cbf666d6 ("Documentation: dt: keystone: provide SoC specific compatible flags")
Reported-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---

This could be squashed since the original patch was not merged yet..
Apologies on the miss. (based on next-20151006)

 Documentation/devicetree/bindings/arm/keystone/keystone.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/keystone/keystone.txt b/Documentation/devicetree/bindings/arm/keystone/keystone.txt
index 800d2d02e27b..3090a8a008c0 100644
--- a/Documentation/devicetree/bindings/arm/keystone/keystone.txt
+++ b/Documentation/devicetree/bindings/arm/keystone/keystone.txt
@@ -17,11 +17,11 @@ SoC families:
 SoCs:
 
 - Keystone 2 Hawking/Kepler
-   compatible = ti,k2hk", "ti,keystone"
+   compatible = "ti,k2hk", "ti,keystone"
 - Keystone 2 Lamarr
-   compatible = ti,k2l", "ti,keystone"
+   compatible = "ti,k2l", "ti,keystone"
 - Keystone 2 Edison
-   compatible = ti,k2e", "ti,keystone"
+   compatible = "ti,k2e", "ti,keystone"
 
 Boards:
 -  Keystone 2 Hawking/Kepler EVM
-- 
2.1.4
