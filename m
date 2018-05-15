Return-Path: <SRS0=t5sx=IC=verge.net.au=horms@kernel.org>
Date: Tue, 15 May 2018 09:54:28 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH/RFC v3 3/4] usb: gadget: udc: renesas_usb3: use usb role
 switch API
Message-ID: <20180515075428.6fvkwv2tz6v7cnyj@verge.net.au>
References: <1526289360-3997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526289360-3997-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526289360-3997-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, May 14, 2018 at 06:15:59PM +0900, Yoshihiro Shimoda wrote:
> This patch uses usb role switch API if the register suceeeded.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/usb/gadget/udc/renesas_usb3.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
> index c878449..bfb5803 100644
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -657,7 +657,11 @@ static void _usb3_set_mode(struct renesas_usb3 *usb3, bool host)
>  
>  static void usb3_set_mode(struct renesas_usb3 *usb3, bool host)
>  {
> -	_usb3_set_mode(usb3, host);
> +	if (usb3->role_sw)
> +		usb_role_switch_set_role(usb3->role_sw, host ?
> +					 USB_ROLE_HOST : USB_ROLE_DEVICE);
> +	else
> +		_usb3_set_mode(usb3, host);
>  }
>  
>  static void usb3_vbus_out(struct renesas_usb3 *usb3, bool enable)
> @@ -672,8 +676,8 @@ static void usb3_mode_config(struct renesas_usb3 *usb3, bool host, bool a_dev)
>  {
>  	unsigned long flags;
>  
> -	spin_lock_irqsave(&usb3->lock, flags);
>  	usb3_set_mode(usb3, host);
> +	spin_lock_irqsave(&usb3->lock, flags);

Hi Shimoda-san,

could you clarify why moving this lock is safe?

>  	usb3_vbus_out(usb3, a_dev);
>  	/* for A-Peripheral or forced B-device mode */
>  	if ((!host && a_dev) ||
> -- 
> 1.9.1
> 
