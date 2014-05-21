From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC/PATCH] of: platform: Remove unique device name enforcement
Date: Wed, 21 May 2014 16:43:53 +0900
Message-ID: <20140521074353.C8B79C4198A@trevor.secretlab.ca>
References: <1400432516-6802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
	<CAL_JsqJKDFJDsGbhB-=W=ujgoRpnJGcJ9a74uhHjj4KFvRK=gg@mail.gmail.com>
	<20140520065014.493C3C412E3@trevor.secretlab.ca>
	<CAL_JsqJHhJ1ba5tOGnsNNp1DhPwnJWh8F9f2xL8b3FYj=kC1hA@mail.gmail.com>
	<20140521005357.4CAE4C418EF@trevor.secretlab.ca>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140521005357.4CAE4C418EF-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Guido =?iso-8859-1?q?Mart=EDnez?= <guido-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 21 May 2014 09:53:57 +0900, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Tue, 20 May 2014 13:30:02 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Tue, May 20, 2014 at 1:50 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > > On Sun, 18 May 2014 18:11:07 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > >> On Sun, May 18, 2014 at 12:01 PM, Ezequiel Garcia
> > >> <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
> > >> > When creating a device object for a devicetree node, the device name
> > >> > is created by using the node name and the 'reg' property, to make a name
> > >> > such as "a000.foo_device".
> > >> >
> > >> > For certain devices without an associated address, and hence no 'reg' property,
> > >> > the current code attempts to make a unique name, by using a global integer.
> > >> > Names look like "foo_device.1", "bar_device.2", and so on.
> > >> > Examples of such devices are: gpio-keys', backlights and rotary-encoders.
> > >> >
> > >> > The system cannot know such devices name before hand, given they are determined
> > >> > by the kernel probe order and by the nodes present in the devicetree. This can
> > >> > be problematic, on systems that are tied to the device's name, e.g. when
> > >> > catching hotplug events.
> > >
> > > The device's uevent file in sysfs contains both the ->name and
> > > ->full_name values for a node. Does that help you?
> > >
> > > The big problem is not the structure under /sys/devices, but rather the
> > > symlinks to devices that appear under /sys/bus/*/devices. If two leaf
> > > nodes have the same name, then they will conflict when they get added to
> > > a bus_type's array of devices.
> > >
> > > Another way to handle it is to only add the suffix when a conflict
> > > actually occurs. That requires checking first whether or not a name will
> > > conflict and ammending it only when that happens. I don't know if that
> > > can be done nicely. I'll take a look.
> > 
> > That was my idea as well and to move to a local number so you have
> > something like deviceA, deviceA.1, deviceB, deviceB.1 (maybe the
> > number is always appended). Perhaps a random number instead so no one
> > expects the names to be an ABI. ;)
> 
> Another idea: how about fix the name to alwasy be the final component of
> the path name, followed by phandle. Anything that doesn't have a phandle
> can be assigned one at boot. That would guarantee uniqueness without the
> cost of trying to find duplicates.
> 
> for example:
> 	uart@10043000:0012

Yet another approach. How about this patch? If the unit address cannot
be translated, then append the translated name of the parent.

Before:
# ls -l /sys/bus/platform/devices/
10002000.i2c -> ../../../devices/platform/10002000.i2c
10003000.intc -> ../../../devices/platform/amba.0/10003000.intc
10008000.lcd -> ../../../devices/platform/10008000.lcd
10010000.net -> ../../../devices/platform/10010000.net
10140000.intc -> ../../../devices/platform/amba.0/10140000.intc
34000000.flash -> ../../../devices/platform/34000000.flash
alarmtimer -> ../../../devices/platform/alarmtimer
amba.0 -> ../../../devices/platform/amba.0
fpga.1 -> ../../../devices/platform/amba.0/fpga.1
testcase-device1.2 -> ../../../devices/platform/testcase-device1.2
testcase-device2.3 -> ../../../devices/platform/testcase-device2.3

After:
# ls -l /sys/bus/platform/devices/
10002000.i2c -> ../../../devices/platform/10002000.i2c
10003000.intc -> ../../../devices/platform/amba/10003000.intc
10008000.lcd -> ../../../devices/platform/10008000.lcd
10010000.net -> ../../../devices/platform/10010000.net
10140000.intc -> ../../../devices/platform/amba/10140000.intc
34000000.flash -> ../../../devices/platform/34000000.flash
alarmtimer -> ../../../devices/platform/alarmtimer
amba -> ../../../devices/platform/amba
amba:fpga -> ../../../devices/platform/amba/amba:fpga
fffff000.testcase-data:testcase-device1 -> ../../../devices/platform/fffff000.testcase-data:testcase-device1
fffff000.testcase-data:testcase-device2 -> ../../../devices/platform/fffff000.testcase-data:testcase-device2

commit 177e5ff131639c8568248e5b9b2380066ce305d6
Author: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date:   Wed May 21 15:40:31 2014 +0900

    of: Ensure unique names without sacrificing determinism
    
    The way the driver core is implemented, every device using the same bus
    type is required to have a unique name because a symlink to each device
    is created in the appropriate /sys/bus/*/devices directory, and two
    identical names causes a collision.
    
    The current code handles the requirement by using an globally
    incremented counter that is appended to the device name. It works, but
    it means any change to device registration will change the assigned
    numbers. Instead, if we build up the name by using information from the
    parent nodes, then it can be guaranteed to be unique without adding a
    random number to the end of it.
    
    Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 9c121819e813..e74fccbeb177 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -74,12 +74,9 @@ EXPORT_SYMBOL(of_find_device_by_node);
  */
 void of_device_make_bus_id(struct device *dev)
 {
-	static atomic_t bus_no_reg_magic;
 	struct device_node *node = dev->of_node;
 	const __be32 *reg;
 	u64 addr;
-	const __be32 *addrp;
-	int magic;
 
 #ifdef CONFIG_PPC_DCR
 	/*
@@ -101,33 +98,26 @@ void of_device_make_bus_id(struct device *dev)
 	}
 #endif /* CONFIG_PPC_DCR */
 
-	/*
-	 * For MMIO, get the physical address
-	 */
-	reg = of_get_property(node, "reg", NULL);
-	if (reg) {
-		if (of_can_translate_address(node)) {
+	/* Construct the name, using parent nodes if necessary to ensure uniqueness */
+	while (node->parent) {
+		/*
+		 * If the address can be translated, then that is as much
+		 * uniqueness as we need. Make it the first component and return
+		 */
+		reg = of_get_property(node, "reg", NULL);
+		if (reg && of_can_translate_address(node)) {
 			addr = of_translate_address(node, reg);
-		} else {
-			addrp = of_get_address(node, 0, NULL, NULL);
-			if (addrp)
-				addr = of_read_number(addrp, 1);
-			else
-				addr = OF_BAD_ADDR;
-		}
-		if (addr != OF_BAD_ADDR) {
-			dev_set_name(dev, "%llx.%s",
-				     (unsigned long long)addr, node->name);
+			dev_set_name(dev, dev_name(dev) ? "%llx.%s:%s" : "%llx.%s",
+				     (unsigned long long)addr, node->name,
+				     dev_name(dev));
 			return;
 		}
-	}
 
-	/*
-	 * No BusID, use the node name and add a globally incremented
-	 * counter (and pray...)
-	 */
-	magic = atomic_add_return(1, &bus_no_reg_magic);
-	dev_set_name(dev, "%s.%d", node->name, magic - 1);
+		/* format arguments only used if dev_name() resolves to NULL */
+		dev_set_name(dev, dev_name(dev) ? "%s:%s" : "%s",
+			     strrchr(node->full_name, '/') + 1, dev_name(dev));
+		node = node->parent;
+	}
 }
 
 /**

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
