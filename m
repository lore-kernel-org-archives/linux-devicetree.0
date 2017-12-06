From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: rtc: add bindings for i.MX53 SRTC
Date: Wed, 6 Dec 2017 15:54:36 -0600
Message-ID: <20171206215436.lwttn445wjilh3wo@rob-hp-laptop>
References: <20171205140646.30367-1-linux-kernel-dev@beckhoff.com>
 <20171205140646.30367-2-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171205140646.30367-2-linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>, Patrick Bruenn <p.bruenn-QonKdJ6Bx351MdP9MKMqoLNAH6kLmebB@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Juergen Borleis <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Noel Vellemans <Noel.Vellemans-8UENEgx6w+makBO8gow8eQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 05, 2017 at 03:06:42PM +0100, linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org wrote:
> From: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
> 
> Document the binding for i.MX53 SRTC implemented by rtc-mxc_v2
> 
> Signed-off-by: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org><Paste>
> 
> ---
> 
> To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
> To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM)
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list)
> Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> Cc: Juergen Borleis <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Noel Vellemans <Noel.Vellemans-8UENEgx6w+makBO8gow8eQ@public.gmane.org>
> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> (maintainer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
> Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> (maintainer:ARM PORT)
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
> 
> Cc: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
> Cc: Lothar Waﬂmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/rtc/rtc-mxc_v2.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mxc_v2.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-mxc_v2.txt b/Documentation/devicetree/bindings/rtc/rtc-mxc_v2.txt
> new file mode 100644
> index 000000000000..796e7f4995db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-mxc_v2.txt
> @@ -0,0 +1,17 @@
> +* i.MX53 Real Time Clock controller
> +
> +Required properties:
> +- compatible: should be: "fsl,imx53-rtc"
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +- clocks: should contain the phandle for the rtc clock

Shouldn't there be more than 1 here. From what I remember, the ipg clock 
and the 32k clock?

> +- interrupts: rtc alarm interrupt
> +
> +Example:
> +
> +srtc@53fa4000 {

rtc@...

> +	compatible = "fsl,imx53-rtc";
> +	reg = <0x53fa4000 0x4000>;
> +	interrupts = <24>;
> +	clocks = <&clks IMX5_CLK_SRTC_GATE>;
> +};
> --
> 2.11.0
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
