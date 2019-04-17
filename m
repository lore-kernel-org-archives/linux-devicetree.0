From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH] of_net: Fix residues after of_get_nvmem_mac_address removal
Date: Wed, 17 Apr 2019 22:09:12 +0200
Message-ID: <1555531752-22813-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

I've discovered following discrepancy in the bindings/net/ethernet.txt
documentation, where it states following:

 - nvmem-cells: phandle, reference to an nvmem node for the MAC address;
 - nvmem-cell-names: string, should be "mac-address" if nvmem is to be..

which is actually misleading and confusing. There are only two ethernet
drivers in the tree, cadence/macb and davinci which supports this
properties.

This nvmem-cell* properties were introduced in commit 9217e566bdee
("of_net: Implement of_get_nvmem_mac_address helper"), but
commit afa64a72b862 ("of: net: kill of_get_nvmem_mac_address()")
forget to properly clean up this parts.

So this patch fixes the documentation by moving the nvmem-cell*
properties at the appropriate places.  While at it, I've removed unused
include as well.

Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Fixes: afa64a72b862 ("of: net: kill of_get_nvmem_mac_address()")
Signed-off-by: Petr Štetiar <ynezz@true.cz>
---
 Documentation/devicetree/bindings/net/davinci_emac.txt | 2 ++
 Documentation/devicetree/bindings/net/ethernet.txt     | 2 --
 Documentation/devicetree/bindings/net/macb.txt         | 4 ++++
 drivers/of/of_net.c                                    | 1 -
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/davinci_emac.txt b/Documentation/devicetree/bindings/net/davinci_emac.txt
index 24c5cda..ca83dcc 100644
--- a/Documentation/devicetree/bindings/net/davinci_emac.txt
+++ b/Documentation/devicetree/bindings/net/davinci_emac.txt
@@ -20,6 +20,8 @@ Required properties:
 Optional properties:
 - phy-handle: See ethernet.txt file in the same directory.
               If absent, davinci_emac driver defaults to 100/FULL.
+- nvmem-cells: phandle, reference to an nvmem node for the MAC address
+- nvmem-cell-names: string, should be "mac-address" if nvmem is to be used
 - ti,davinci-rmii-en: 1 byte, 1 means use RMII
 - ti,davinci-no-bd-ram: boolean, does EMAC have BD RAM?
 
diff --git a/Documentation/devicetree/bindings/net/ethernet.txt b/Documentation/devicetree/bindings/net/ethernet.txt
index cfc376b..2974e63 100644
--- a/Documentation/devicetree/bindings/net/ethernet.txt
+++ b/Documentation/devicetree/bindings/net/ethernet.txt
@@ -10,8 +10,6 @@ Documentation/devicetree/bindings/phy/phy-bindings.txt.
   the boot program; should be used in cases where the MAC address assigned to
   the device by the boot program is different from the "local-mac-address"
   property;
-- nvmem-cells: phandle, reference to an nvmem node for the MAC address;
-- nvmem-cell-names: string, should be "mac-address" if nvmem is to be used;
 - max-speed: number, specifies maximum speed in Mbit/s supported by the device;
 - max-frame-size: number, maximum transfer unit (IEEE defined MTU), rather than
   the maximum frame size (there's contradiction in the Devicetree
diff --git a/Documentation/devicetree/bindings/net/macb.txt b/Documentation/devicetree/bindings/net/macb.txt
index 174f292..8b80515 100644
--- a/Documentation/devicetree/bindings/net/macb.txt
+++ b/Documentation/devicetree/bindings/net/macb.txt
@@ -26,6 +26,10 @@ Required properties:
 	Optional elements: 'tsu_clk'
 - clocks: Phandles to input clocks.
 
+Optional properties:
+- nvmem-cells: phandle, reference to an nvmem node for the MAC address
+- nvmem-cell-names: string, should be "mac-address" if nvmem is to be used
+
 Optional properties for PHY child node:
 - reset-gpios : Should specify the gpio for phy reset
 - magic-packet : If present, indicates that the hardware supports waking
diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
index 810ab0f..d820f3e 100644
--- a/drivers/of/of_net.c
+++ b/drivers/of/of_net.c
@@ -7,7 +7,6 @@
  */
 #include <linux/etherdevice.h>
 #include <linux/kernel.h>
-#include <linux/nvmem-consumer.h>
 #include <linux/of_net.h>
 #include <linux/phy.h>
 #include <linux/export.h>
-- 
1.9.1
