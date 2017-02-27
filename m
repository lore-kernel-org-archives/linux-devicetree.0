From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] usb: usb251xb: dt: add unit suffix to oc-delay and
 power-on-time
Date: Mon, 27 Feb 2017 14:47:21 -0600
Message-ID: <20170227204721.ty75cvjzuj6ggybs@rob-hp-laptop>
References: <1487667379-2075-1-git-send-email-richard.leitner@skidata.com>
 <1487667379-2075-3-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1487667379-2075-3-git-send-email-richard.leitner@skidata.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <richard.leitner@skidata.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, dev@g0hl1n.net
List-Id: devicetree@vger.kernel.org

On Tue, Feb 21, 2017 at 09:56:18AM +0100, Richard Leitner wrote:
> Rename oc-delay-* to oc-delay-us and make it expect a time value.
> Furthermore add -ms suffix to power-on-time. These changes were
> suggested by Rob Herring in https://lkml.org/lkml/2017/2/15/1283.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  Documentation/devicetree/bindings/usb/usb251xb.txt |  9 +++---
>  drivers/usb/misc/usb251xb.c                        | 32 +++++++++++++---------
>  2 files changed, 24 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
> index a5efd10..4d6bd73 100644
> --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
> +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
> @@ -31,7 +31,8 @@ Optional properties :
>  	(default is individual)
>   - dynamic-power-switching : enable auto-switching from self- to bus-powered
>  	operation if the local power source is removed or unavailable
> - - oc-delay-{100us,4ms,8ms,16ms} : set over current timer delay (default is 8ms)
> + - oc-delay-us : microseconds over current timer delay, valid values are 100,
> +	4000, 8000 (default) and 16000. All other values are rounded up.
>   - compound-device : indicated the hub is part of a compound device
>   - port-mapping-mode : enable port mapping mode
>   - string-support : enable string descriptor support (required for manufacturer,
> @@ -40,9 +41,9 @@ Optional properties :
>  	device connected.
>   - sp-disabled-ports : Specifies the ports which will be self-power disabled
>   - bp-disabled-ports : Specifies the ports which will be bus-power disabled
> - - power-on-time : Specifies the time it takes from the time the host initiates
> -	the power-on sequence to a port until the port has adequate power. The
> -	value is given in ms in a 0 - 510 range (default is 100ms).
> + - power-on-time-ms : Specifies the time it takes from the time the host
> +	initiates the power-on sequence to a port until the port has adequate
> +	power. The value is given in ms in a 0 - 510 range (default is 100ms).

Okay for the binding, but...

>  
>  Examples:
>  	usb2512b@2c {
> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index 3f9c306..58b887a 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c
> @@ -375,18 +375,24 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>  	if (of_get_property(np, "dynamic-power-switching", NULL))
>  		hub->conf_data2 |= BIT(7);
>  
> -	if (of_get_property(np, "oc-delay-100us", NULL)) {
> -		hub->conf_data2 &= ~BIT(5);
> -		hub->conf_data2 &= ~BIT(4);
> -	} else if (of_get_property(np, "oc-delay-4ms", NULL)) {
> -		hub->conf_data2 &= ~BIT(5);
> -		hub->conf_data2 |= BIT(4);
> -	} else if (of_get_property(np, "oc-delay-8ms", NULL)) {
> -		hub->conf_data2 |= BIT(5);
> -		hub->conf_data2 &= ~BIT(4);
> -	} else if (of_get_property(np, "oc-delay-16ms", NULL)) {
> -		hub->conf_data2 |= BIT(5);
> -		hub->conf_data2 |= BIT(4);
> +	if (!of_property_read_u32(np, "oc-delay-us", property_u32)) {
> +		if (*property_u32 < 100) {

What does the time control? A protection mechanism or just to filter 
notifications? For the former, it seems like you would want the time 
specified to be a maximum. So for example if the user says 150us, then 
you want to make sure the OC condition doesn't exceed that time and 
therefore set it to 100us.

Or you could require exact values and set a default if the value doesn't 
match.

> +			/* 100 us*/
> +			hub->conf_data2 &= ~BIT(5);
> +			hub->conf_data2 &= ~BIT(4);
> +		} else if (*property_u32 < 4000) {
> +			/* 4 ms */
> +			hub->conf_data2 &= ~BIT(5);
> +			hub->conf_data2 |= BIT(4);
> +		} else if (*property_u32 < 8000) {
> +			/* 8 ms */
> +			hub->conf_data2 |= BIT(5);
> +			hub->conf_data2 &= ~BIT(4);
> +		} else {
> +			/* 16 ms */
> +			hub->conf_data2 |= BIT(5);
> +			hub->conf_data2 |= BIT(4);
> +		}
>  	}
>  
>  	if (of_get_property(np, "compound-device", NULL))
> @@ -433,7 +439,7 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>  	}
>  
>  	hub->power_on_time = USB251XB_DEF_POWER_ON_TIME;
> -	if (!of_property_read_u32(np, "power-on-time", property_u32))
> +	if (!of_property_read_u32(np, "power-on-time-ms", property_u32))
>  		hub->power_on_time = min_t(u8, be32_to_cpu(*property_u32) / 2,

This is a bug. property_u32 is already in cpu endianness.

>  					   255);
>  
> -- 
> 2.1.4
> 
