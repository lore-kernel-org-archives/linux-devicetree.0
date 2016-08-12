From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH RESEND v2 3/3] ehci-platform: add the max clock number
 to 4
Date: Fri, 12 Aug 2016 11:28:49 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1608121128340.2361-100000@iolanthe.rowland.org>
References: <20160812030622.4492-3-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160812030622.4492-3-icenowy@aosc.xyz>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Tony Prisk <linux@prisktech.co.nz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Reinder de Haan <patchesrdh@mveas.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 12 Aug 2016, Icenowy Zheng wrote:

> Allwinner A64 EHCI requires 4 clocks to be enabled.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  drivers/usb/host/ehci-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
> index 6816b8c..876dca4 100644
> --- a/drivers/usb/host/ehci-platform.c
> +++ b/drivers/usb/host/ehci-platform.c
> @@ -38,7 +38,7 @@
>  #include "ehci.h"
>  
>  #define DRIVER_DESC "EHCI generic platform driver"
> -#define EHCI_MAX_CLKS 3
> +#define EHCI_MAX_CLKS 4
>  #define EHCI_MAX_RSTS 3
>  #define hcd_to_ehci_priv(h) ((struct ehci_platform_priv *)hcd_to_ehci(h)->priv)

Acked-by: Alan Stern <stern@rowland.harvard.edu>
