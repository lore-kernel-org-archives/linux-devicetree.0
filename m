From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] usb: renesas_usbhs: Use devm_usb_get_phy_by_phandle()
Date: Tue, 28 Jun 2016 15:57:10 -0500
Message-ID: <20160628205710.GU3737@rob-hp-laptop>
References: <1467029359-6812-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1467029359-6812-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467029359-6812-4-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 27, 2016 at 09:09:19PM +0900, Yoshihiro Shimoda wrote:
> This patch uses devm_usb_get_phy_by_phandle() instead of usb_get_phy()
> for device tree environment. This change is not compabile with the
> previous code, but it is no problem because nobody calls usb_bind_phy()
> for this driver now.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 3 ++-
>  drivers/usb/renesas_usbhs/mod_gadget.c                  | 7 ++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> index b604056..a419aea 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> @@ -24,8 +24,9 @@ Optional properties:
>    - renesas,buswait: Integer to use BUSWAIT register
>    - renesas,enable-gpio: A gpio specifier to check GPIO determining if USB
>  			 function should be enabled
> -  - phys: phandle + phy specifier pair
> +  - phys: phandle of *Generic PHY* + phy specifier pair
>    - phy-names: must be "usb"
> +  - usb-phy: phandle of usb phy

No. The binding should not change based on which kernel subsystem 
handles this. The USB-PHY code should learn to parse 'phys' if you want 
to use that subsystem.

>    - dmas: Must contain a list of references to DMA specifiers.
>    - dma-names : named "ch%d", where %d is the channel number ranging from zero
>                  to the number of channels (DnFIFOs) minus one.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
