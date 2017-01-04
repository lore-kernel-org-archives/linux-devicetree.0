From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/5] mfd: dt: ranges, #address-cells and #size-cells
 as optional properties
Date: Wed, 4 Jan 2017 11:36:08 +0000
Message-ID: <20170104113608.GC27589@dell>
References: <20161220071535.27542-1-andrew@aj.id.au>
 <20161220071535.27542-3-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161220071535.27542-3-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 20 Dec 2016, Andrew Jeffery wrote:

> Whilst describing a device and not a bus, simple-mfd is modelled on
> simple-bus where child nodes are iterated and registered as platform
> devices. Some complex devices, e.g. the Aspeed LPC controller, can
> benefit from address space mapping such that child nodes can use the
> regs property to describe their resource offsets within the
> multi-function device.
> 
> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/mfd.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/mfd.txt b/Documentation/devicetree/bindings/mfd/mfd.txt
> index f1fceeda12f1..bcb6abb9d413 100644
> --- a/Documentation/devicetree/bindings/mfd/mfd.txt
> +++ b/Documentation/devicetree/bindings/mfd/mfd.txt
> @@ -25,6 +25,16 @@ Optional properties:
>    be used. In the latter case the child devices will be determined by the
>    operating system.
>  
> +- ranges: Describes the address mapping relationship to the parent. Should set
> +  the child's base address to 0, the physical address within parent's address
> +  space, and the length of the address map.
> +
> +- #address-cells: Specifies the number of cells used to represent physical base
> +  addresses. Must be present if ranges is used.
> +
> +- #size-cells: Specifies the number of cells used to represent the size of an
> +  address. Must be present if ranges is used.
> +
>  Example:
>  
>  foo@1000 {

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
