From: Harry Wei <jiaweiwei.xiyou@gmail.com>
Subject: Re: Fwd: [PATCH] of: Add missing of_address.h to xilinx ehci driver
Date: Mon, 14 Feb 2011 23:56:27 +0800
Message-ID: <20110214155625.GA1951@gmail.com>
References: <1297680009-4054-1-git-send-email-monstr@monstr.eu>
 <AANLkTikwaUVs_a_eetGjCj=Tg9qSPKAgxKac11gHWqDe@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTikwaUVs_a_eetGjCj=Tg9qSPKAgxKac11gHWqDe@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, greg@kroah.com, john.williams@petalogix.com, monstr@monstr.eu, grant.likely@secretlab.ca
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 14, 2011 at 11:53:13PM +0800, harryxiyou wrote:
> ---------- Forwarded message ----------
> From: Michal Simek <monstr@monstr.eu>
> Date: 2011/2/14
> Subject: [PATCH] of: Add missing of_address.h to xilinx ehci driver
> To: glikely@secretlab.ca
> Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org,
> Michal Simek <monstr@monstr.eu>, John Williams <john.williams@petalogix.com>
> 
> 
> Build log:
> In file included from drivers/usb/host/ehci-hcd.c:1208:
> drivers/usb/host/ehci-xilinx-of.c: In function 'ehci_hcd_xilinx_of_probe':
> drivers/usb/host/ehci-xilinx-of.c:168: error: implicit declaration of
> function 'of_address_to_resource'
> 
> Signed-off-by: John Williams <john.williams@petalogix.com>
> Signed-off-by: Michal Simek <monstr@monstr.eu>
Acked-by: Harry Wei <harryxiyou@gmail.com> 
> ---
>  drivers/usb/host/ehci-xilinx-of.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-xilinx-of.c
> b/drivers/usb/host/ehci-xilinx-of.c
> index e8f4f36..a6f21b8 100644
> --- a/drivers/usb/host/ehci-xilinx-of.c
> +++ b/drivers/usb/host/ehci-xilinx-of.c
> @@ -29,6 +29,7 @@
> 
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> +#include <linux/of_address.h>
> 
>  /**
>  * ehci_xilinx_of_setup - Initialize the device for ehci_reset()
> --
> 1.5.5.6
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
> 
> 
> -- 
> Best Regards.
> Harry Wei.
> Do what u like!
