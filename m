From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: [PATCH 3.12 099/133] i2c: mv64xxx: Document the newly introduced Armada XP A0 compatible
Date: Tue,  4 Feb 2014 13:08:20 -0800
Message-ID: <20140204210739.834494126@linuxfoundation.org>
References: <20140204210737.008598235@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140204210737.008598235-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

3.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

commit f8b94beb7e6a374cb0de531b72377c49857b35ca upstream.

The first variants of Armada XP SoCs (A0 stepping) have issues related
to the i2c controller which prevent to use the offload mechanism and
lead to a kernel hang during boot.

The commit introduces a new the compatible string
marvell,mv78230-a0-i2c for the i2c controller.

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Fixes: 930ab3d403ae (i2c: mv64xxx: Add I2C Transaction Generator support)
Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Signed-off-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>

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


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
