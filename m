From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: [RFC/PATCH] of: platform: Remove unique device name enforcement
Date: Sun, 18 May 2014 14:01:56 -0300
Message-ID: <1400432516-6802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When creating a device object for a devicetree node, the device name
is created by using the node name and the 'reg' property, to make a name
such as "a000.foo_device".

For certain devices without an associated address, and hence no 'reg' property,
the current code attempts to make a unique name, by using a global integer.
Names look like "foo_device.1", "bar_device.2", and so on.
Examples of such devices are: gpio-keys', backlights and rotary-encoders.

The system cannot know such devices name before hand, given they are determined
by the kernel probe order and by the nodes present in the devicetree. This can
be problematic, on systems that are tied to the device's name, e.g. when
catching hotplug events.

In order to fix the name, this commit removes the global integer uniqueness
enforcement and instead uses the node name for the device name. The rationale
behind such change, is that there's no way two nodes with the same node name
are associated to two different devices, by the nature of the devicetree.
In other words, it's impossible to produce a name collision for these kind
of devices.

Signed-off-by: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
---
Hello Grant, Rob:

I'm pretty sure there's a good reason for the existence of the atomic magic
integer, so this is not a *real* patch, but rather a bold attempt at asking you
some explanations for this.

Under what circumstances does the magic integer avoids a name collision?
Will this propposal introduce a regression?

 drivers/of/platform.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 60292e1..0f091a3 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -65,20 +65,17 @@ EXPORT_SYMBOL(of_find_device_by_node);
  */
 
 /**
- * of_device_make_bus_id - Use the device node data to assign a unique name
+ * of_device_make_bus_id - Use the device node data to assign name
  * @dev: pointer to device structure that is linked to a device tree node
  *
  * This routine will first try using either the dcr-reg or the reg property
- * value to derive a unique name.  As a last resort it will use the node
- * name followed by a unique number.
+ * value to derive the device name.
  */
 void of_device_make_bus_id(struct device *dev)
 {
-	static atomic_t bus_no_reg_magic;
 	struct device_node *node = dev->of_node;
 	const __be32 *reg;
 	u64 addr;
-	int magic;
 
 #ifdef CONFIG_PPC_DCR
 	/*
@@ -113,12 +110,7 @@ void of_device_make_bus_id(struct device *dev)
 		}
 	}
 
-	/*
-	 * No BusID, use the node name and add a globally incremented
-	 * counter (and pray...)
-	 */
-	magic = atomic_add_return(1, &bus_no_reg_magic);
-	dev_set_name(dev, "%s.%d", node->name, magic - 1);
+	dev_set_name(dev, "%s", node->name);
 }
 
 /**
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
