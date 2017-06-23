From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH/RFC] phy: renesas: rcar-gen3-usb2-clksel: Add R-Car Gen3
 USB 2.0 clock selector PHY
Date: Fri, 23 Jun 2017 13:20:51 -0500
Message-ID: <20170623182051.eznaqqyr6dcrdjdg@rob-hp-laptop>
References: <1497526462-9179-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497526462-9179-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 15, 2017 at 08:34:22PM +0900, Yoshihiro Shimoda wrote:
> USB 2.0 PHY of R-Car Gen3 can change the clock source from an oscillator
> to an external clock via a register. So, this patch adds support
> the clock source selector as a generic PHY driver.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
>  This patch is based on the latest linux-phy.git / next branch
>  (commit id = 787f24543c4a599e5d9d311a3fce839ce87bbff0)
> 
>  I'm not sure this driver ss OK or not as a generic phy driver.
>  So, I send this patch as RFC.
> 
>  .../bindings/phy/rcar-gen3-phy-usb2-clksel.txt     |  58 +++++++++
>  drivers/phy/renesas/Kconfig                        |   8 ++
>  drivers/phy/renesas/Makefile                       |   1 +
>  drivers/phy/renesas/phy-rcar-gen3-usb2-clksel.c    | 129 +++++++++++++++++++++
>  4 files changed, 196 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2-clksel.txt
>  create mode 100644 drivers/phy/renesas/phy-rcar-gen3-usb2-clksel.c
> 
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2-clksel.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2-clksel.txt
> new file mode 100644
> index 0000000..71b2f1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2-clksel.txt
> @@ -0,0 +1,58 @@
> +* Renesas R-Car generation 3 USB 2.0 clock selector PHY
> +
> +This file provides information on what the device node for the R-Car generation
> +3 USB 2.0 clock selector PHY contains.

Is this a phy or just a clock selector and nothing else? It sounds more 
like the latter and you should use the clock binding. Whether this is a 
phy driver in the kernel is a separate question really.

> +
> +If you connect an external clock to the USB_EXTAL pin, you can use the
> +"renesas,usb_extal_only" property for it.
> +If you connect an oscillator to both the USB_XTAL and USB_EXTAL, this module
> +is not needed because this is default setting.
> +
> +Case 1: An external clock connects to R-Car SoC
> +	+----------+   +--- R-Car ---------------------+
> +	|External  |---|USB_EXTAL ---> all usb channels|
> +	|clock     |   |USB_XTAL                       |
> +	+----------+   +-------------------------------+
> +In this case, we need this driver with "usb-extal-only" property.
> +
> +Case 2: An oscillator connects to R-Car SoC
> +	+----------+   +--- R-Car ---------------------+
> +	|Oscillator|---|USB_EXTAL -+-> all usb channels|
> +	|          |---|USB_XTAL --+                   |
> +	+----------+   +-------------------------------+
> +In this case, we don't need this selector.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
