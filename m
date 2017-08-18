From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFCv3 usb-next 2/3] usb: host: add a generic platform USB
 roothub driver
Date: Fri, 18 Aug 2017 13:47:59 +0800
Message-ID: <1503035279.17567.5.camel@mhfsdcap03>
References: <20170814224542.18257-1-martin.blumenstingl@googlemail.com>
         <20170814224542.18257-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170814224542.18257-3-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2017-08-15 at 00:45 +0200, Martin Blumenstingl wrote:
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
> yet which were only introduced recently (documentation is available in
> devicetree/bindings/usb/usb-device.txt).
> With this new driver the usb2-phy and usb3-phy can be specified directly
> in the child-node of the corresponding port of the roothub via
> devicetree. This can be extended by not just parsing PHYs (some of the
> other drivers listed above are for example also parsing a list of clocks
> as well) when required.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  drivers/usb/host/Kconfig            |   3 +
>  drivers/usb/host/Makefile           |   2 +
>  drivers/usb/host/platform-roothub.c | 180 ++++++++++++++++++++++++++++++++++++
>  drivers/usb/host/platform-roothub.h |  12 +++
>  4 files changed, 197 insertions(+)
>  create mode 100644 drivers/usb/host/platform-roothub.c
>  create mode 100644 drivers/usb/host/platform-roothub.h
> 

Tested-by: Chunfeng Yun<chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>


> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index fa5692dec832..b8b05c786b2a 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -805,6 +805,9 @@ config USB_HCD_SSB
>  
>  	  If unsure, say N.
>  
> +config USB_PLATFORM_ROOTHUB
> +	bool
> +
>  config USB_HCD_TEST_MODE
>  	bool "HCD test mode support"
>  	---help---
> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> index cf2691fffcc0..dc817f82d632 100644
> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile
> @@ -29,6 +29,8 @@ obj-$(CONFIG_USB_WHCI_HCD)	+= whci/
>  
>  obj-$(CONFIG_USB_PCI)	+= pci-quirks.o
>  
> +obj-$(CONFIG_USB_PLATFORM_ROOTHUB)	+= platform-roothub.o
> +
>  obj-$(CONFIG_USB_EHCI_HCD)	+= ehci-hcd.o
>  obj-$(CONFIG_USB_EHCI_PCI)	+= ehci-pci.o
>  obj-$(CONFIG_USB_EHCI_HCD_PLATFORM)	+= ehci-platform.o
> diff --git a/drivers/usb/host/platform-roothub.c b/drivers/usb/host/platform-roothub.c
> new file mode 100644
> index 000000000000..70d2d97aa8b2
> --- /dev/null
> +++ b/drivers/usb/host/platform-roothub.c
> @@ -0,0 +1,180 @@
[...]


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
