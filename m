From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 5/5] usb: add pxa1928 ehci support
Date: Thu, 14 May 2015 10:24:38 +0200
Message-ID: <1431591878.2650.26.camel@x220>
References: <1431557340-5421-1-git-send-email-robh@kernel.org>
	 <1431557340-5421-6-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431557340-5421-6-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2015-05-13 at 17:49 -0500, Rob Herring wrote:
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig

> +config USB_EHCI_MV_OF
> +	bool "EHCI OF support for Marvell PXA/MMP USB controller"
> +	depends on (ARCH_PXA || ARCH_MMP)
> +	select USB_EHCI_ROOT_HUB_TT
> +	---help---
> +	  Enables support for Marvell (including PXA and MMP series) on-chip
> +	  USB SPH and OTG controller. SPH is a single port host, and it can
> +	  only be EHCI host. OTG is controller that can switch to host mode.
> +	  Note that this driver will not work on Marvell's other EHCI
> +	  controller used by the EBU-type SoCs including Orion, Kirkwood,
> +	  Dova, Armada 370 and Armada XP. See "Support for Marvell EBU
> +	  on-chip EHCI USB controller" for those.

> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile

> +obj-$(CONFIG_USB_EHCI_MV_OF)	+= ehci-mv-of.o

USB_EHCI_MV_OF is a bool symbol so ehci-mv-of.o will never be part of a
module, correct?

> --- /dev/null
> +++ b/drivers/usb/host/ehci-mv-of.c

> +MODULE_DEVICE_TABLE(of, mv_ehci_dt_match);

> +module_init(ehci_mv_init);
> +
> +static void __exit ehci_mv_cleanup(void)
> +{
> +	platform_driver_unregister(&ehci_mv_driver);
> +}
> +module_exit(ehci_mv_cleanup);
> +
> +MODULE_AUTHOR("Rob Herring <robh@kernel.org>");
> +MODULE_LICENSE("GPL v2");

The code contains a few module-specific constructs. (These will be
preprocessed away, replaced with a built-in equivalent, etc.) Was it
your intention to make USB_EHCI_MV_OF tristate?


Paul  Bolle
