From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] PCI: generic: Refactor code to enable reuse by other
 drivers.
Date: Tue, 22 Dec 2015 10:07:33 +0000
Message-ID: <20151222100732.GD32623@arm.com>
References: <1450749222-15966-1-git-send-email-ddaney.cavm@gmail.com>
 <1450749222-15966-2-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450749222-15966-2-git-send-email-ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 21, 2015 at 05:53:41PM -0800, David Daney wrote:
> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> 
> No change in functionality.
> 
> Move structure definitions into a separate header file.  Split probe
> function in to two parts:
> 
>    - a small driver specific probe function (gen_pci_probe)
> 
>    - a common probe that can be used by other drivers
>      (gen_pci_common_probe)
> 
> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/pci/host/pci-host-generic.c | 53 ++++++++++++-----------------------
>  drivers/pci/host/pci-host-generic.h | 56 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 74 insertions(+), 35 deletions(-)
>  create mode 100644 drivers/pci/host/pci-host-generic.h
> 
> diff --git a/drivers/pci/host/pci-host-generic.c b/drivers/pci/host/pci-host-generic.c
> index 5434c90..e83cec7 100644
> --- a/drivers/pci/host/pci-host-generic.c
> +++ b/drivers/pci/host/pci-host-generic.c
> @@ -25,33 +25,7 @@
>  #include <linux/of_pci.h>
>  #include <linux/platform_device.h>
>  
> -struct gen_pci_cfg_bus_ops {
> -	u32 bus_shift;
> -	struct pci_ops ops;
> -};
> -
> -struct gen_pci_cfg_windows {
> -	struct resource				res;
> -	struct resource				*bus_range;
> -	void __iomem				**win;
> -
> -	struct gen_pci_cfg_bus_ops		*ops;
> -};
> -
> -/*
> - * ARM pcibios functions expect the ARM struct pci_sys_data as the PCI
> - * sysdata.  Add pci_sys_data as the first element in struct gen_pci so
> - * that when we use a gen_pci pointer as sysdata, it is also a pointer to
> - * a struct pci_sys_data.
> - */
> -struct gen_pci {
> -#ifdef CONFIG_ARM
> -	struct pci_sys_data			sys;
> -#endif
> -	struct pci_host_bridge			host;
> -	struct gen_pci_cfg_windows		cfg;
> -	struct list_head			resources;
> -};
> +#include "pci-host-generic.h"
>  
>  static void __iomem *gen_pci_map_cfg_bus_cam(struct pci_bus *bus,
>  					     unsigned int devfn,
> @@ -208,19 +182,15 @@ static int gen_pci_parse_map_cfg_windows(struct gen_pci *pci)
>  	return 0;
>  }
>  
> -static int gen_pci_probe(struct platform_device *pdev)
> +int gen_pci_common_probe(struct platform_device *pdev,
> +			 struct gen_pci *pci)

Whilst I'm fine with this patch, I don't know how Bjorn will feel about
exposing this function outside of the generic host driver. We could avoid
it by turning things upside-down and having the generic driver probe
the other drivers by matching a compatible string with a probe function
pointer, but I'd be interested to see what others think.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
