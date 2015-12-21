From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/3] USB: add generic onboard USB HUB driver
Date: Mon, 21 Dec 2015 16:33:25 +0800
Message-ID: <CAL411-qKE=12VZAN9=tUWPqkC5BfSgpQb9aNgCU6rmPLasXNHQ@mail.gmail.com>
References: <CAL411-rK6qfkbQsSjvXH5VPAQAm4tMyD6fVTEgFQrpLHNGMXeA@mail.gmail.com>
 <Pine.LNX.4.44L0.1512181030590.1682-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1512181030590.1682-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 18, 2015 at 11:38 PM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:
> On Fri, 18 Dec 2015, Peter Chen wrote:
>
>> On Fri, Dec 18, 2015 at 12:13 AM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:
>
>> > It's not clear (to me, anyway) how this is meant to work.  USB is a
>> > completely discoverable bus: There is no way to represent devices
>> > statically; they have to be discovered.  But a device can't be
>> > discovered unless it is functional, so if an onboard hub (or any other
>> > sort of USB device) requires power, clocks, or something similar in
>> > order to function, it won't be discovered.  There won't be any device
>> > structure to probe, and "forcing driver probe" won't accomplish
>> > anything.
>> >
>> > It seems to me that the only way something like this could be made to
>> > work is if the necessary actions are keyed off the host controller (and
>> > in particular, _not_ the hub driver), presumably at the time the
>> > controller is probed.
>>
>> The reason why I put the code at hub driver is the onboard USB device
>> may be at 2nd level hub, at hub driver, we can know all devices under
>> this level hub.
>
> Maybe.  I'm not convinced.  See below.
>
>> > With anything else, you run the risk that the
>> > necessary resources won't get enabled before they are needed.
>> >
>>
>> Sorry, I can't understand what you mean
>
> Suppose you have a platform driver to manage the device's resources,
> and the platform driver is in loadable module.  Suppose the device can
> be detected even before the resources have been initialized, but it
> can't work correctly.
>
> Then what happens when the platform driver's module doesn't get loaded
> until _after_ the device has been detected and after the device failed
> to initialize?
>
>

You are right, so the platform driver is not a good choice for doing
that.

>> +static int hub_of_children_register(struct usb_device *hdev)
>> +{
>> +     struct device *dev;
>> +
>> +     if (hdev->parent)
>> +             dev = &hdev->dev;
>> +     else
>> +             dev = bus_to_hcd(hdev->bus)->self.controller;
>> +
>> +     if (!dev->of_node)
>> +             return 0;
>
> Suppose hdev->parent is not NULL (hdev isn't the root hub -- maybe it's
> a 2nd-level hub).  Then how did hdev->dev->of_node get set?
>

Yes, the USB device doesn't know device node.

There are two problems which needs device tree to support, I have
below solutions for them, please help to see if it is reasonable.

1. The USB device can't work without external clock, power, reset operation.
At device tree, we have a node to describe external signals like clocks, gpios
for all onboard devices under this controller. And this node is as phandle for
host controller, see below:

--- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
@@ -108,6 +108,21 @@
                default-brightness-level = <7>;
                status = "okay";
        };
+
+       usbh1_pre_operation: usbh1_pre_operation {
+               clocks = <&clks IMX6QDL_CLK_1>,
+                        <&clks IMX6QDL_CLK_2>,
+                        <&clks IMX6QDL_CLK_3>,
+                        <&clks IMX6QDL_CLK_4>,
+                        <&clks IMX6QDL_CLK_5>,
+                        <&clks IMX6QDL_CLK_6>;
+               reset-gpios = <&gpio4 5 GPIO_ACTIVE_LOW>,
+                             <&gpio4 7 GPIO_ACTIVE_LOW>,
+                             <&gpio3 25 GPIO_ACTIVE_LOW>,
+                             <&gpio3 27 GPIO_ACTIVE_LOW>,
+                             <&gpio4 4 GPIO_ACTIVE_LOW>,
+                             <&gpio4 6 GPIO_ACTIVE_LOW>;
+       };
 };

 &clks {
@@ -590,6 +605,8 @@
 &usbh1 {
        vbus-supply = <&reg_usb_h1_vbus>;
        status = "okay";
+
+       devices-pre-operation = <&usbh1_pre_operation>
 };

At code, we add one API of_usb_pre_operation to get clocks and gpios through
host controller's device node, and this API is called at usb_add_hcd,
and opposite
operation is called at usb_remove_hcd.

This solution is almost the same with MMC power sequence solution.
(see drivers/mmc/core/pwrseq.c)

2. There are MFD USB devices, which includes several interfaces under
USB device,
like i2c, gpios, etc. Due to lack of device tree support, USB
class/device driver doesn't know
which kinds of interfaces are needed for this board.

This problem is hard to handle, I have a solution, but it can't cover
two same devices
under the same HUB ports. My solution is let USB know device node, the main idea
is similar with PCIi's (see drivers/of/of_pci.c, drivers/pci/of.c),
the most difficulty is
find correct node for USB device after bus enumeration. Once the
device is recognized,
the USB core will create a USB device for it, since we know its parent
device, and its parent
device  (eg, the host controller) has device node, and we can find all
children nodes under
this node, if the child's {vid, pid} is the same with {vid, pid} the
device descriptor we read, we
assign this node as usb device's node.

At USB class/device driver, we can get the properties/phandles under
this device node, and register
them.

At device tree, we need to describe the bus topology for this USB device.

-- 
BR,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
