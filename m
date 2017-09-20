From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] usb: usb251xb: Add USB2517/i hub support
Date: Wed, 20 Sep 2017 15:52:35 -0500
Message-ID: <20170920205235.qhxhq3it6377bjcq@rob-hp-laptop>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170915233113.17855-2-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170915233113.17855-2-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Serge Semin <fancer.lancer@gmail.com>
Cc: richard.leitner@skidata.com, gregkh@linuxfoundation.org, mark.rutland@arm.com, Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 16, 2017 at 02:31:09AM +0300, Serge Semin wrote:
> USB2517i hubs are very like USB251xb devices series. They have almost
> the same configuration registers space except number of ports, led
> configurations and lack of battery settings. All these peculiarities
> are reflected in this patch.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/usb251xb.txt |  4 +-

Though Greg wants the code split, I want the binding as one change. H/w 
doesn't gain features one by one.

It's preferred to split bindings to a separate patch.

>  drivers/usb/misc/usb251xb.c                        | 84 +++++++++++++++++++---
>  2 files changed, 78 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
> index 3957d4eda..3d84626d3 100644
> --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
> +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
> @@ -6,7 +6,8 @@ Hi-Speed Controller.
>  Required properties :
>   - compatible : Should be "microchip,usb251xb" or one of the specific types:
>  	"microchip,usb2512b", "microchip,usb2512bi", "microchip,usb2513b",
> -	"microchip,usb2513bi", "microchip,usb2514b", "microchip,usb2514bi"
> +	"microchip,usb2513bi", "microchip,usb2514b", "microchip,usb2514bi",
> +	"microchip,usb2517", "microchip,usb2517i"
>   - reset-gpios : Should specify the gpio for hub reset
>   - reg : I2C address on the selected bus (default is <0x2C>)
>  
> @@ -36,6 +37,7 @@ Optional properties :
>  	an invalid value is given, the default is used instead.
>   - compound-device : indicate the hub is part of a compound device
>   - port-mapping-mode : enable port mapping mode
> + - speed-led-mode : led speed indiation mode selection (usb2517 only)

This is a boolean or has values? What are valid values?

This needs a vendor prefix. Somehow the other properties got in without.

>   - string-support : enable string descriptor support (required for manufacturer,
>  	product and serial string configuration)
>   - non-removable-ports : Should specify the ports which have a non-removable
