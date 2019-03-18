From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: l2x0: add L210 write allocate override flag
Date: Mon, 18 Mar 2019 09:30:53 +0100
Message-ID: <20190318083053.24197-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

This adds support for setting the flag bit "write allocate
override" to the L210 variant.

The "write allocate override" bit is used on the Nomadik STn8815
and is necessary to properly make use of the L210 cache on that
machine without sporadic crashes.

After this the platform can boot and run without any out-of-tree
patches.

Cc: devicetree@vger.kernel.org
Cc: Russell King <linux@arm.linux.org.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/arm/l2c2x0.yaml | 5 +++++
 arch/arm/mm/cache-l2x0.c                          | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/l2c2x0.yaml b/Documentation/devicetree/bindings/arm/l2c2x0.yaml
index bfc5c185561c..4cffcda3e2b7 100644
--- a/Documentation/devicetree/bindings/arm/l2c2x0.yaml
+++ b/Documentation/devicetree/bindings/arm/l2c2x0.yaml
@@ -168,6 +168,11 @@ properties:
       be specified to indicate that such transforms are precluded.
     type: boolean
 
+  arm,write-allocate-override:
+    description: On L210 only, normally the L210 will use HPROT attributes,
+    setting this bit overrides that behaviour and cause the cache to make all
+    write-through and write-back accesses into read-write-allocate accesses.
+
   arm,parity-enable:
     description: enable parity checking on the L2 cache (L220 or PL310).
     type: boolean
diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 808efbb89b88..5cbdb9c18884 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1078,6 +1078,14 @@ static void __init l2x0_of_parse(const struct device_node *np,
 		val |= L2C_AUX_CTRL_SHARED_OVERRIDE;
 	}
 
+	/* L210-specific aux control flag */
+	if (of_device_is_compatible(np, "arm,l210-cache")) {
+		if (of_property_read_bool(np, "arm,write-allocate-override")) {
+			mask &= ~L210_AUX_CTRL_WA_OVERRIDE;
+			val |= L210_AUX_CTRL_WA_OVERRIDE;
+		}
+	}
+
 	ret = l2x0_cache_size_of_parse(np, aux_val, aux_mask, &assoc, SZ_256K);
 	if (ret)
 		return;
-- 
2.20.1
