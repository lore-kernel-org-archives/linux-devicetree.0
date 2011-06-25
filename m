From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 1/4] dt: early platform devices support
Date: Fri, 24 Jun 2011 22:49:56 -0600
Message-ID: <BANLkTi=7cM2dXniHM4mnXs46KaTc05hh-Q@mail.gmail.com>
References: <1308924659-31894-1-git-send-email-marc.zyngier@arm.com>
	<1308924659-31894-2-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1308924659-31894-2-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Greg Kroah-Hartman <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

[cc'ing linux kernel since I discuss driver core issues]
[cc'ing greg and kay, 'cause I've included a patch I'd like you to
look at (see end of email)]

On Fri, Jun 24, 2011 at 8:10 AM, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:
> Add support for populating early platform devices from the device
> tree, by walking the tree and adding nodes whose 'compatible'
> property matches the 'class' string passed as a parameter.
>
> This allows devices to be probed long before the whole device
> infrastructure is available.
>
> Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> ---
> =A0drivers/of/platform.c =A0 =A0 =A0 | =A0 26 ++++++++++++++++++++++++++
> =A0include/linux/of_platform.h | =A0 =A01 +
> =A02 files changed, 27 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index e75af39..2a323ee 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -458,4 +458,30 @@ int of_platform_populate(struct device_node *root,
> =A0 =A0 =A0 =A0of_node_put(root);
> =A0 =A0 =A0 =A0return rc;
> =A0}
> +
> +/**
> + * of_early_platform_populate() - Populate early platform devices from DT
> + * @class: string to compare to the 'compatible' attributes
> + *
> + * This function walks the device tree and register devices whose
> + * 'compatible' property matches the 'class' parameter.
> + *
> + * Returns 0 on success, < 0 on failure.
> + */
> +int of_early_platform_populate(const char *class)
> +{
> + =A0 =A0 =A0 struct platform_device *pdev;
> + =A0 =A0 =A0 struct device_node *np =3D NULL;
> +
> + =A0 =A0 =A0 while ((np =3D of_find_compatible_node(np, NULL, class))) {

for_each_compatible_node()

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdev =3D of_device_alloc(np, NULL, NULL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!pdev)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_del(&pdev->dev.devres_head);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 memset(&pdev->dev.devres_head, 0, sizeof(pd=
ev->dev.devres_head));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 early_platform_add_devices(&pdev, 1);

I'm not sure this will work reliably.  The of_platform semantics are
still slightly different from 'regular' platform devices (which I do
intend to fix though), so it may cause problems with how the device
name gets assigned.  I'd need to dig into it though.

> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return 0;
> +}

Hmmm, I'd really rather not go down the path of having different
'classes' of devices that need to be registered at different times.
There just isn't a really good generic way to know which devices
should be the 'early' ones, it gets hairy with regard to making sure
devices don't get registered twice, and it doesn't actually solve the
problem that there is no way to handle dependencies between devices in
the Linux device model.

What I /want/ to do is allow drivers to defer initialization at .probe
time if some of the resources it needs aren't yet available.
Unfortunately, that doesn't work so well for interrupt controllers
since irq numbers are expected to be correctly populated in the
platform device resource table.  What complicates things further is
that most gpio controllers are doubling as irq controllers nowdays,
and those are typically modelled with platform devices themselves.

One possible approach is to manipulate the order that devices get
registered in by looking explicitly at each device's interrupt-parent
and *-gpio properties, and making sure that interrupt-controllers and
gpio-controllers get registered before any dependent modules, but that
could get complex in a hurry and it doesn't actually solve anything if
one of the irq controller drivers is loaded as a module.  To make it
work, of_platform_populate() would have to actually defer registration
dependent devices until after the irq controller is bound to a driver.
 Blech!  It would be doable by keeping a list of nodes that a device
is dependant on, and snooping bus registrations to look for drivers
bound to the devices referencing that node, but it would be ugly and
would just gloss over the lack of handling dependencies in the driver
core.  Right now we fudge it by messing about with initcall ordering
on the device drivers so that the device driver registration order
doesn't matter, but that doesn't solve the problem caused by drivers
loaded by modules.

More and more, I'm think the solution is to do dependency checking at
.probe time.  If some asynchronous resources (irqs, gpios, phys, etc)
aren't available yet, then it need to be possible to defer
initialization, either by not binding the driver and returning
something like -EAGAIN to say "try me again later", or by letting the
driver explicitly call a deferred init api that with a callback for
when the resources do become available.  I'm really not sure which is
best.  I worry that a deferred init api will end up being complex and
unwieldy, so I'm kind of leaning towards the -EAGAIN solution since it
doesn't require drivers to create a new initialization path.  It would
mean that the driver core would have to keep a list of devices that
had a driver return -EAGAIN, and arrange to reattempt binding at some
point in the future.  Probably after a 'significant' event, such as
another device getting bound to a driver.

...

I should probably actually propose some kind of solution rather than
babbling on about the problem.  I took some time tonight to hack
together what I think the solution should look like.  Take a look at
the following and let me know what you think.  Greg/Kay, I could
certainly use your feedback on this (apologies for any work wrapping,
I'm pasting this into gmail).

---

commit efc3b3168879d0bd9bf9fa3ebfbb1a348394c76f
Author: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Date:   Fri Jun 24 22:33:46 2011 -0600

    drivercore: Add driver probe deferral mechanism

    Allow drivers to report at probe time that they cannot get all the reso=
urces
    required by the device, and should be retried at a later time.

    This should completely solve the problem of getting devices
    initialized in the right order.  Right now this is mostly handled by
    mucking about with initcall ordering which is a complete hack, and
    doesn't even remotely handle the case where device drivers are in
    modules.  This approach completely sidesteps the issues by allowing
    driver registration to occur in any order, and any driver can request
    to be retried after a few more other drivers get probed.

    This patch is *completely untested* and probably utterly broken.
    There is absolutely no locking implemented, and there needs to be
    something around the accesses to the deferred_probe_list (most likely
    a spin lock that gets dropped before each call to bus_probe_device()).
    I'd like to get feedback on if this is the correct approach before I
    do the work of actually making it correct.  :-)

    Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

diff --git a/drivers/base/core.c b/drivers/base/core.c
index bc8729d..83aafff 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -588,6 +588,7 @@ void device_initialize(struct device *dev)
 {
 	dev->kobj.kset =3D devices_kset;
 	kobject_init(&dev->kobj, &device_ktype);
+	INIT_LIST_HEAD(&dev->deferred_probe);
 	INIT_LIST_HEAD(&dev->dma_pools);
 	mutex_init(&dev->mutex);
 	lockdep_set_novalidate_class(&dev->mutex);
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 6658da7..3694661 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -28,6 +28,18 @@
 #include "base.h"
 #include "power/power.h"

+/**
+ * deferred_probe_work_func() - Retry probing devices in the deferred list.
+ */
+static LIST_HEAD(deferred_probe_list);
+static void deferred_probe_work_func(struct work_struct *work)
+{
+	struct device *dev;
+	list_for_each_entry(dev, &deferred_probe_list, deferred_probe) {
+		bus_probe_device(dev);
+	}
+}
+static DECLARE_WORK(deferred_probe_work, deferred_probe_work_func);

 static void driver_bound(struct device *dev)
 {
@@ -41,6 +53,9 @@ static void driver_bound(struct device *dev)
 		 __func__, dev->driver->name);

 	klist_add_tail(&dev->p->knode_driver, &dev->driver->p->klist_devices);
+	if (!list_empty(&dev->deferred_probe))
+		list_del_init(&dev->deferred_probe);
+	schedule_work(&deferred_probe_work);

 	if (dev->bus)
 		blocking_notifier_call_chain(&dev->bus->p->bus_notifier,
@@ -142,7 +157,17 @@ probe_failed:
 	driver_sysfs_remove(dev);
 	dev->driver =3D NULL;

-	if (ret !=3D -ENODEV && ret !=3D -ENXIO) {
+	if (ret =3D=3D -EAGAIN) {
+		/*
+		 * Probe could not obtain all resources for device and requested
+		 * to be reprobed with the availble drivers at some future point
+		 * in time.  Log the deferral request and add the device to the
+		 * deferred probe list.
+		 */
+		dev_info(dev, "Driver %s requests probe deferral\n", drv->name);
+		if (list_empty(&dev->deferred_probe))
+			list_add(&dev->deferred_probe, &deferred_probe_list);
+	} else if (ret !=3D -ENODEV && ret !=3D -ENXIO) {
 		/* driver matched but the probe failed */
 		printk(KERN_WARNING
 		       "%s: probe of %s failed with error %d\n",
diff --git a/include/linux/device.h b/include/linux/device.h
index c66111a..50cc399 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -506,6 +506,10 @@ struct device_dma_parameters {
  * @mutex:	Mutex to synchronize calls to its driver.
  * @bus:	Type of bus device is on.
  * @driver:	Which driver has allocated this
+ * @deferred_probe: entry in deferred_probe_list which is used to retry the
+ * 		binding of drivers which were unable to get all the resources
+ * 		needed by the device; typically because it depends on another
+ * 		driver getting probed first.
  * @platform_data: Platform data specific to the device.
  * 		Example: For devices on custom boards, as typical of embedded
  * 		and SOC based hardware, Linux often uses platform_data to point
@@ -565,6 +569,7 @@ struct device {
 	struct bus_type	*bus;		/* type of bus device is on */
 	struct device_driver *driver;	/* which driver has allocated this
 					   device */
+	struct list_head	deferred_probe;
 	void		*platform_data;	/* Platform specific data, device
 					   core doesn't touch it */
 	struct dev_pm_info	power;
