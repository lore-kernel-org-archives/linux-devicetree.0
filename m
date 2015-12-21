From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v2 0/3] USB: add generic onboard USB HUB driver
Date: Mon, 21 Dec 2015 14:40:42 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1512211436030.1618-100000@netrider.rowland.org>
References: <CAL411-qKE=12VZAN9=tUWPqkC5BfSgpQb9aNgCU6rmPLasXNHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL411-qKE=12VZAN9=tUWPqkC5BfSgpQb9aNgCU6rmPLasXNHQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 21 Dec 2015, Peter Chen wrote:

> There are two problems which needs device tree to support, I have
> below solutions for them, please help to see if it is reasonable.
> 
> 1. The USB device can't work without external clock, power, reset operation.
> At device tree, we have a node to describe external signals like clocks, gpios
> for all onboard devices under this controller. And this node is as phandle for
> host controller, see below:
> 
> --- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
> @@ -108,6 +108,21 @@
>                 default-brightness-level = <7>;
>                 status = "okay";
>         };
> +
> +       usbh1_pre_operation: usbh1_pre_operation {
> +               clocks = <&clks IMX6QDL_CLK_1>,
> +                        <&clks IMX6QDL_CLK_2>,
> +                        <&clks IMX6QDL_CLK_3>,
> +                        <&clks IMX6QDL_CLK_4>,
> +                        <&clks IMX6QDL_CLK_5>,
> +                        <&clks IMX6QDL_CLK_6>;
> +               reset-gpios = <&gpio4 5 GPIO_ACTIVE_LOW>,
> +                             <&gpio4 7 GPIO_ACTIVE_LOW>,
> +                             <&gpio3 25 GPIO_ACTIVE_LOW>,
> +                             <&gpio3 27 GPIO_ACTIVE_LOW>,
> +                             <&gpio4 4 GPIO_ACTIVE_LOW>,
> +                             <&gpio4 6 GPIO_ACTIVE_LOW>;
> +       };
>  };
> 
>  &clks {
> @@ -590,6 +605,8 @@
>  &usbh1 {
>         vbus-supply = <&reg_usb_h1_vbus>;
>         status = "okay";
> +
> +       devices-pre-operation = <&usbh1_pre_operation>
>  };
> 
> At code, we add one API of_usb_pre_operation to get clocks and gpios through
> host controller's device node, and this API is called at usb_add_hcd,
> and opposite
> operation is called at usb_remove_hcd.
> 
> This solution is almost the same with MMC power sequence solution.
> (see drivers/mmc/core/pwrseq.c)

That seems reasonable to me.

> 2. There are MFD USB devices, which includes several interfaces under
> USB device,
> like i2c, gpios, etc. Due to lack of device tree support, USB
> class/device driver doesn't know
> which kinds of interfaces are needed for this board.
> 
> This problem is hard to handle, I have a solution, but it can't cover
> two same devices
> under the same HUB ports. My solution is let USB know device node, the main idea
> is similar with PCIi's (see drivers/of/of_pci.c, drivers/pci/of.c),
> the most difficulty is
> find correct node for USB device after bus enumeration. Once the
> device is recognized,
> the USB core will create a USB device for it, since we know its parent
> device, and its parent
> device  (eg, the host controller) has device node, and we can find all
> children nodes under
> this node, if the child's {vid, pid} is the same with {vid, pid} the
> device descriptor we read, we
> assign this node as usb device's node.

I don't really understand this.  However, you can always specify a USB 
device by giving its port number on the parent hub, and the hub's port 
number on _its_ parent hub, and so on back to the root hub and host 
controller.  That works even if you're not using DT or OF or ACPI.

Alan Stern

> At USB class/device driver, we can get the properties/phandles under
> this device node, and register
> them.
> 
> At device tree, we need to describe the bus topology for this USB device.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
