From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH V2] usb: xhci: add support for performing fake doorbell
Date: Mon, 17 Oct 2016 23:10:27 +0200
Message-ID: <d41d60cc-9710-deb8-f4a5-784894b8e3d5@hauke-m.de>
References: <20161001215817.25384-1-zajec5@gmail.com>
 <20161017203036.23399-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161017203036.23399-1-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Florian Fainelli <florian@openwrt.org>
List-Id: devicetree@vger.kernel.org

On 10/17/2016 10:30 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Broadcom's Northstar XHCI controllers seem to need a special start
> procedure to work correctly. There isn't any official documentation of
> this, the problem is that controller doesn't detect any connected
> devices with default setup. Moreover connecting USB device to controller
> that doesn't run properly can cause SoC's watchdog issues.
> 
> A workaround that was successfully tested on multiple devices is to
> perform a fake doorbell. This patch adds code for doing this and enables
> it on BCM4708 family.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Enable quirk for brcm,bcm4708 machines instead of adding separated binding
>     for it. Thanks Rob for your comment on this.
> ---
>  drivers/usb/host/xhci-plat.c |  6 +++++
>  drivers/usb/host/xhci.c      | 63 +++++++++++++++++++++++++++++++++++++++++---
>  drivers/usb/host/xhci.h      |  1 +
>  3 files changed, 67 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index ed56bf9..b01a3be 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -56,12 +56,18 @@ static int xhci_priv_init_quirk(struct usb_hcd *hcd)
>  
>  static void xhci_plat_quirks(struct device *dev, struct xhci_hcd *xhci)
>  {
> +	struct platform_device	*pdev = to_platform_device(dev);
> +	struct device_node	*node = pdev->dev.of_node;
> +
>  	/*
>  	 * As of now platform drivers don't provide MSI support so we ensure
>  	 * here that the generic code does not try to make a pci_dev from our
>  	 * dev struct in order to setup MSI
>  	 */
>  	xhci->quirks |= XHCI_PLAT;
> +
> +	if (node && of_machine_is_compatible("brcm,bcm4708"))
> +		xhci->quirks |= XHCI_FAKE_DOORBELL;

Are you sure only the bcm4708 and similar SoCs are affected? Having here
a list with 3 or more checks would looks strange. I prefer your first patch.

@Florian do you know if other Broadcom SoC are affected by this problem
or are only Northstar SoCs affected?

Hauke
