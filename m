From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v3 4/6] mfd: dt: Add bindings for the Aspeed LPC Host
 Controller (LHC)
Date: Thu, 8 Dec 2016 12:42:30 +1030
Message-ID: <CACPK8XfuZ14Ud3Kginut7f0-_-UjTB-=Pma-9WwNecF93k0Ktg@mail.gmail.com>
References: <20161206025321.1792-1-andrew@aj.id.au> <20161206025321.1792-5-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161206025321.1792-5-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 6, 2016 at 1:23 PM, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org> wrote:
> The LPC bus pinmux configuration on fifth generation Aspeed SoCs depends
> on bits in both the System Control Unit and the LPC Host Controller.
>
> The Aspeed LPC Host Controller is described as a child node of the
> LPC host-range syscon device for arbitration of access by the host
> controller and pinmux drivers.
>
> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt         | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> index a97131aba446..9de318ef72da 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -109,3 +109,25 @@ lpc: lpc@1e789000 {
>         };
>  };
>
> +Host Node Children
> +==================
> +
> +LPC Host Controller
> +-------------------
> +
> +The Aspeed LPC Host Controller configures the Low Pin Count (LPC) bus behaviour
> +between the host and the baseboard management controller. The registers exist
> +in the "host" portion of the Aspeed LPC controller, which must be the parent of
> +the LPC host controller node.
> +
> +Required properties:
> +- compatible:          "aspeed,ast2500-lhc";

Can you remind me why this binding doesn't cover the ast2400?

Cheers,

Joel

> +- reg:                 contains offset/length value of the LHC memory
> +                       region.
> +
> +Example:
> +
> +lhc: lhc@20 {
> +       compatible = "aspeed,ast2500-lhc";
> +       reg = <0x20 0x24 0x48 0x8>;
> +};
> --
> 2.9.3
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
