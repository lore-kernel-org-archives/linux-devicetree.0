From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH] USB: EHCI: Don't use NO_IRQ in xilinx ehci driver
Date: Thu, 12 Jan 2012 10:56:00 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1201121055370.1384-100000@iolanthe.rowland.org>
References: <1326356777-24135-1-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1326356777-24135-1-git-send-email-monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 12 Jan 2012, Michal Simek wrote:

> Drivers shouldn't use NO_IRQ. This driver is used
> by Microblaze and PPC. PPC defines NO_IRQ as 0
> and Microblaze has removed it.
> 
> Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
> CC: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
> CC: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
> CC: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> CC: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> ---
>  drivers/usb/host/ehci-xilinx-of.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-xilinx-of.c b/drivers/usb/host/ehci-xilinx-of.c
> index 32793ce..9c2cc46 100644
> --- a/drivers/usb/host/ehci-xilinx-of.c
> +++ b/drivers/usb/host/ehci-xilinx-of.c
> @@ -183,7 +183,7 @@ static int __devinit ehci_hcd_xilinx_of_probe(struct platform_device *op)
>  	}
>  
>  	irq = irq_of_parse_and_map(dn, 0);
> -	if (irq == NO_IRQ) {
> +	if (!irq) {
>  		printk(KERN_ERR "%s: irq_of_parse_and_map failed\n", __FILE__);
>  		rv = -EBUSY;
>  		goto err_irq;

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
