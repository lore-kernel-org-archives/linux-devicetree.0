Return-Path: <grant.likely@secretlab.ca>
Return-Path: <grant.likely@secretlab.ca>
Sender: Grant Likely <glikely@secretlab.ca>
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 3/6] of: platform: Fix and export
 of_platform_device_destroy
In-Reply-To: 
 <1403430039-15085-4-git-send-email-pantelis.antoniou@konsulko.com>
References: 
	<1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1403430039-15085-4-git-send-email-pantelis.antoniou@konsulko.com>
Date: Tue, 24 Jun 2014 16:13:25 +0100
Message-Id: <20140624151325.97F01C40B84@trevor.secretlab.ca>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pawel Moll <pawel.moll@arm.com>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, 22 Jun 2014 12:40:36 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> of_platform_destroy did not work properly, since the tree
> population test was iterating on all devices having a parent
> a given platform device.
> 
> The check was intended to check whether any other *platform*
> devices were still populated, but instead checked for every
> kind of device. This is wrong, since platform devices typically
> create a subsystem regular device and set themselves as parents.
> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> ---
>  drivers/of/platform.c       | 11 ++++++++++-
>  include/linux/of_platform.h |  2 ++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 500436f..4f60060 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -506,10 +506,18 @@ int of_platform_populate(struct device_node *root,
>  }
>  EXPORT_SYMBOL_GPL(of_platform_populate);
>  
> -static int of_platform_device_destroy(struct device *dev, void *data)
> +int of_platform_device_destroy(struct device *dev, void *data)
>  {
>  	bool *children_left = data;
>  
> +	/* if the device is not a platform device, do nothing */
> +	if (dev->bus != &platform_bus_type
> +#ifdef CONFIG_ARM_AMBA
> +		&& dev->bus != &amba_bustype
> +#endif
> +	   )
> +		return 0;
> +

[Adding Pawel who introduced of_platform_device_destroy()]

Actually, it occurs to me that the *children_left test is completly
wrong and should just be removed outright. If there are devices left,
then it is a great big driver bug because the driver failed to clean up
after itself on remove. We can let the driver core complain loudly when
things go wrong. In fact, we must do that because the device unregister
functions don't provide any return code anyway.

Pawel, does the following patch look correct to you?

g.

---
of/platform: Fix of_platform_device_destroy iteration of devices

of_platform_destroy does not work properly, since the tree
population test was iterating on all devices having as its parent
the given platform device.

The check was intended to check whether any other platform or amba
devices created by of_platform_populate were still populated, but
instead checked for every kind of device. This is wrong, since platform
devices typically create a subsystem regular device and set themselves
as parents.

Instead, go ahead and call the unregister functions for any devices
created with of_platform_populate. The driver core will take care of
unbinding drivers, and drivers are responsible for getting rid of any
child devices that weren't created by of_platform_populate.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Signed-off-by: Grant Likely <grant.likely@linaro.org>
---
 drivers/of/platform.c       | 32 +++++++++-----------------------
 include/linux/of.h          |  1 +
 include/linux/of_platform.h |  7 ++-----
 3 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 6c48d73a7fd7..cb57e488779a 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -426,6 +426,7 @@ static int of_platform_bus_create(struct device_node *bus,
 			break;
 		}
 	}
+	of_node_set_flag(bus, OF_POPULATED_BUS);
 	return rc;
 }
 
@@ -512,19 +513,13 @@ EXPORT_SYMBOL_GPL(of_platform_populate);
 
 static int of_platform_device_destroy(struct device *dev, void *data)
 {
-	bool *children_left = data;
-
 	/* Do not touch devices not populated from the device tree */
-	if (!dev->of_node || !of_node_check_flag(dev->of_node, OF_POPULATED)) {
-		*children_left = true;
+	if (!dev->of_node || !of_node_check_flag(dev->of_node, OF_POPULATED))
 		return 0;
-	}
 
-	/* Recurse, but don't touch this device if it has any children left */
-	if (of_platform_depopulate(dev) != 0) {
-		*children_left = true;
-		return 0;
-	}
+	/* Recurse for any nodes that were treated as busses */
+	if (of_node_check_flag(dev->of_node, OF_POPULATED_BUS))
+		device_for_each_child(dev, NULL, of_platform_device_destroy);
 
 	if (dev->bus == &platform_bus_type)
 		platform_device_unregister(to_platform_device(dev));
@@ -532,19 +527,15 @@ static int of_platform_device_destroy(struct device *dev, void *data)
 	else if (dev->bus == &amba_bustype)
 		amba_device_unregister(to_amba_device(dev));
 #endif
-	else {
-		*children_left = true;
-		return 0;
-	}
 
 	of_node_clear_flag(dev->of_node, OF_POPULATED);
-
+	of_node_clear_flag(dev->of_node, OF_POPULATED_BUS);
 	return 0;
 }
 
 /**
  * of_platform_depopulate() - Remove devices populated from device tree
- * @parent: device which childred will be removed
+ * @parent: device which children will be removed
  *
  * Complementary to of_platform_populate(), this function removes children
  * of the given device (and, recurrently, their children) that have been
@@ -554,14 +545,9 @@ static int of_platform_device_destroy(struct device *dev, void *data)
  * Returns 0 when all children devices have been removed or
  * -EBUSY when some children remained.
  */
-int of_platform_depopulate(struct device *parent)
+void of_platform_depopulate(struct device *parent)
 {
-	bool children_left = false;
-
-	device_for_each_child(parent, &children_left,
-			      of_platform_device_destroy);
-
-	return children_left ? -EBUSY : 0;
+	device_for_each_child(parent, NULL, of_platform_device_destroy);
 }
 EXPORT_SYMBOL_GPL(of_platform_depopulate);
 
diff --git a/include/linux/of.h b/include/linux/of.h
index 196b34c1ef4e..abf829a1f150 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -204,6 +204,7 @@ static inline unsigned long of_read_ulong(const __be32 *cell, int size)
 #define OF_DYNAMIC	1 /* node and properties were allocated via kmalloc */
 #define OF_DETACHED	2 /* node has been detached from the device tree */
 #define OF_POPULATED	3 /* device already created for the node */
+#define OF_POPULATED_BUS	4 /* of_platform_populate recursed to children of this node */
 
 #define OF_IS_DYNAMIC(x) test_bit(OF_DYNAMIC, &x->_flags)
 #define OF_MARK_DYNAMIC(x) set_bit(OF_DYNAMIC, &x->_flags)
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index d96e1badbee0..c2b0627a2317 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -72,7 +72,7 @@ extern int of_platform_populate(struct device_node *root,
 				const struct of_device_id *matches,
 				const struct of_dev_auxdata *lookup,
 				struct device *parent);
-extern int of_platform_depopulate(struct device *parent);
+extern void of_platform_depopulate(struct device *parent);
 #else
 static inline int of_platform_populate(struct device_node *root,
 					const struct of_device_id *matches,
@@ -81,10 +81,7 @@ static inline int of_platform_populate(struct device_node *root,
 {
 	return -ENODEV;
 }
-static inline int of_platform_depopulate(struct device *parent)
-{
-	return -ENODEV;
-}
+static inline void of_platform_depopulate(struct device *parent) { }
 #endif
 
 #endif	/* _LINUX_OF_PLATFORM_H */
-- 
1.9.1
