From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] devicetree: Add vendor-prefix for Silead Inc.
Date: Tue, 13 Sep 2016 12:30:22 +0200
Message-ID: <20160913103022.30954-1-heiko@sntech.de>
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: robh+dt@kernel.org, dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Silead Inc.specializes in touchscreen technology and got recently
introduced in a binding for the gsl1680 i2c touchscreen.

Therefore add the needed vendor-prefix as well.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
I checked linux-next 20160913 and the devicetree list, but the vendor-
prefix was still missing there, so hopefully I'm not duplicating some
other patch.

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 47e3adf..90761df 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -238,6 +238,7 @@ sigma	Sigma Designs, Inc.
 sii	Seiko Instruments, Inc.
 sil	Silicon Image
 silabs	Silicon Laboratories
+silead	Silead Inc.
 silergy	Silergy Corp.
 siliconmitus	Silicon Mitus, Inc.
 simtek
-- 
2.9.3

