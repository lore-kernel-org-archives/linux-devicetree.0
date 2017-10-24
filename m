From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 usb-next 2/4] usb: core: add a wrapper for the USB
 PHYs on the root-hub
Date: Tue, 24 Oct 2017 08:06:54 +0800
Message-ID: <1508803614.17567.120.camel@mhfsdcap03>
References: <20171023215718.3446-1-martin.blumenstingl@googlemail.com>
         <20171023215718.3446-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171023215718.3446-3-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2017-10-23 at 23:57 +0200, Martin Blumenstingl wrote:
> Many SoC platforms have separate devices for the USB PHY which are
> registered through the generic PHY framework. These PHYs have to be
> enabled to make the USB controller actually work. They also have to be
> disabled again on shutdown/suspend.
> 
> Currently (at least) the following HCI platform drivers are using custom
> code to obtain all PHYs via devicetree for the roothub/controller and
> disable/enable them when required:
> - ehci-platform.c has ehci_platform_power_{on,off}
> - xhci-mtk.c has xhci_mtk_phy_{init,exit,power_on,power_off}
> - ohci-platform.c has ohci_platform_power_{on,off}
> 
> These drivers are not using the generic devicetree USB device bindings
> (for the root-hub) yet which were only introduced recently (documentation
> is available in devicetree/bindings/usb/usb-device.txt).
> 
> With this new wrapper the usb2-phy and usb3-phy can be specified directly
> in the child-node of the corresponding port of the roothub via
> devicetree.
> This allows SoCs like the Amlogic Meson GXL family to operate correctly
> because all USB PHYs are initialized (instead of the first USB PHY
> only).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> Tested-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/usb/core/Makefile |   2 +-
>  drivers/usb/core/phy.c    | 176 ++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/core/phy.h    |   7 ++
>  3 files changed, 184 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/usb/core/phy.c
>  create mode 100644 drivers/usb/core/phy.h
> 
> diff --git a/drivers/usb/core/Makefile b/drivers/usb/core/Makefile
> index 250ec1d662d9..b6e181d08bf6 100644
> --- a/drivers/usb/core/Makefile
> +++ b/drivers/usb/core/Makefile
> @@ -5,7 +5,7 @@
>  usbcore-y := usb.o hub.o hcd.o urb.o message.o driver.o
>  usbcore-y += config.o file.o buffer.o sysfs.o endpoint.o
>  usbcore-y += devio.o notify.o generic.o quirks.o devices.o
> -usbcore-y += port.o
> +usbcore-y += phy.o port.o
>  
>  usbcore-$(CONFIG_OF)		+= of.o
>  usbcore-$(CONFIG_USB_PCI)		+= hcd-pci.o
> diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
> new file mode 100644
> index 000000000000..31245b4abdbf
> --- /dev/null
> +++ b/drivers/usb/core/phy.c
...
> diff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h
> new file mode 100644
> index 000000000000..6fde59bfbff8
> --- /dev/null
> +++ b/drivers/usb/core/phy.h
> @@ -0,0 +1,7 @@
> +struct usb_phy_roothub;
> +
> +struct usb_phy_roothub *usb_phy_roothub_init(struct device *dev);
> +int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub);
> +
> +int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub);
> +void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub);

Tested-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Acked-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> 



--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
