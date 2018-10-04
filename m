From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v10 09/10] dt-binding: mtd: Document gpio-addr-flash
Date: Thu,  4 Oct 2018 16:29:41 +0200
Message-ID: <20181004142942.11887-1-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org, open list <linux-kernel@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add documentation for gpio-addr-flash. This binding allow creating
flash devices that are paged using GPIOs.

Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 Documentation/devicetree/bindings/mtd/mtd-physmap.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
index 232fa12e90ef..7df0dcaccb7d 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
@@ -29,6 +29,8 @@ file systems on embedded devices.
  - use-advanced-sector-protection: boolean to enable support for the
    advanced sector protection (Spansion: PPB - Persistent Protection
    Bits) locking.
+ - addr-gpios : (optional) List of GPIO descriptors that will be used to
+   address the MSBs address lines. The order goes from LSB to MSB.
 
 For JEDEC compatible devices, the following additional properties
 are defined:
-- 
2.19.0
