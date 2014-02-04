From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3.13 110/140] i2c: mv64xxx: Document the newly introduced Armada XP A0 compatible
Date: Tue,  4 Feb 2014 13:11:37 -0800
Message-ID: <20140204211040.116852581@linuxfoundation.org>
References: <20140204211036.967663852@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140204211036.967663852@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

3.13-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Gregory CLEMENT <gregory.clement@free-electrons.com>

commit f8b94beb7e6a374cb0de531b72377c49857b35ca upstream.

The first variants of Armada XP SoCs (A0 stepping) have issues related
to the i2c controller which prevent to use the offload mechanism and
lead to a kernel hang during boot.

The commit introduces a new the compatible string
marvell,mv78230-a0-i2c for the i2c controller.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
cc: devicetree@vger.kernel.org
Fixes: 930ab3d403ae (i2c: mv64xxx: Add I2C Transaction Generator support)
Signed-off-by: Jason Cooper <jason@lakedaemon.net>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 Documentation/devicetree/bindings/i2c/i2c-mv64xxx.txt |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--- a/Documentation/devicetree/bindings/i2c/i2c-mv64xxx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mv64xxx.txt
@@ -5,7 +5,11 @@ Required properties :
 
  - reg             : Offset and length of the register set for the device
  - compatible      : Should be "marvell,mv64xxx-i2c" or "allwinner,sun4i-i2c"
-                     or "marvell,mv78230-i2c"
+                     or "marvell,mv78230-i2c" or "marvell,mv78230-a0-i2c"
+                     Note: Only use "marvell,mv78230-a0-i2c" for a very rare,
+                     initial version of the SoC which had broken offload
+                     support.  Linux auto-detects this and sets it
+                     appropriately.
  - interrupts      : The interrupt number
 
 Optional properties :
