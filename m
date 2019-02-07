From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 2/2] drivers: xhci: Add quirk to reset xHCI port PHY
Date: Thu, 7 Feb 2019 17:06:53 +0200
Message-ID: <6392f206-9db2-5506-9e5d-cdf2b784d32e@linux.intel.com>
References: <1549347534-11320-1-git-send-email-srinath.mannam@broadcom.com>
 <1549347534-11320-3-git-send-email-srinath.mannam@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549347534-11320-3-git-send-email-srinath.mannam@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Srinath Mannam <srinath.mannam@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05.02.2019 08:18, Srinath Mannam wrote:
> Add a quirk to reset xHCI port PHY on port disconnect event.
> Stingray USB HS PHY has an issue, that USB High Speed device detected
> at Full Speed after the same port has connected to Full speed device.
> This problem can be resolved with that port PHY reset on disconnect.
> 
> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
> ---
>   drivers/usb/core/hcd.c       |  6 ++++++
>   drivers/usb/core/phy.c       | 21 +++++++++++++++++++++
>   drivers/usb/core/phy.h       |  1 +
>   drivers/usb/host/xhci-plat.c |  3 +++
>   drivers/usb/host/xhci-ring.c |  9 ++++++---
>   drivers/usb/host/xhci.h      |  1 +
>   include/linux/usb/hcd.h      |  1 +
>   7 files changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 015b126..e2b87a6 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2663,6 +2663,12 @@ int usb_hcd_find_raw_port_number(struct usb_hcd *hcd, int port1)
>   	return hcd->driver->find_raw_port_number(hcd, port1);
>   }
>   
> +int usb_hcd_phy_port_reset(struct usb_hcd *hcd, int port)
> +{
> +	return usb_phy_roothub_port_reset(hcd->phy_roothub, port);
> +}
> +EXPORT_SYMBOL_GPL(usb_hcd_phy_port_reset);
> +
>   static int usb_hcd_request_irqs(struct usb_hcd *hcd,
>   		unsigned int irqnum, unsigned long irqflags)
>   {
> diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
> index 38b2c77..c64767d 100644
> --- a/drivers/usb/core/phy.c
> +++ b/drivers/usb/core/phy.c
> @@ -162,6 +162,27 @@ void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub)
>   }
>   EXPORT_SYMBOL_GPL(usb_phy_roothub_power_off);
>   
> +int usb_phy_roothub_port_reset(struct usb_phy_roothub *phy_roothub, int port)
> +{
> +	struct usb_phy_roothub *roothub_entry;
> +	struct list_head *head;
> +	int i = 0;
> +
> +	if (!phy_roothub)
> +		return -EINVAL;
> +
> +	head = &phy_roothub->list;
> +
> +	list_for_each_entry(roothub_entry, head, list) {
> +		if (i == port)
> +			return phy_reset(roothub_entry->phy);
> +		i++;
> +	}

I'm not that familiar with SoC's that have several PHYs per controller,
but this looks odd.

For the above code to work wouldn't it require that each port has their own PHY,
and the PHYs are added to the list of usb_phy_roothub is in the same order as usb ports?

Or is there something I don't understand here?

-Mathias
