From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: r7s72100: add ostm to device tree
Date: Sat, 21 Jan 2017 20:38:59 +0300
Message-ID: <4db44120-aa9f-2cb4-aad7-2baa8fcfe7c0@cogentembedded.com>
References: <20170120212055.4157-1-chris.brandt@renesas.com>
 <20170120212055.4157-3-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170120212055.4157-3-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello!

On 1/21/2017 12:20 AM, Chris Brandt wrote:

> Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
> v2:
> * wrap clock lines to avoid 80 char max
> * split into 2 separate channel nodes
> ---
>  arch/arm/boot/dts/r7s72100.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index d5946df..47b2165 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -505,4 +505,20 @@
>  		cap-sdio-irq;
>  		status = "disabled";
>  	};
> +
> +	ostm0: ostm@fcfec000 {

    According to devicetree.org, the node name should be generic, i.e. 
"timer@...".

> +		compatible = "renesas,r7s72100-ostm", "renesas,ostm";
> +		reg = <0xfcfec000 0x30>;
> +		interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
> +		status = "disabled";
> +	};
> +
> +	ostm1: ostm@fcfec400 {

    Likewise.

> +		compatible = "renesas,r7s72100-ostm", "renesas,ostm";
> +		reg = <0xfcfec400 0x30>;
> +		interrupts = <GIC_SPI 103 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&mstp5_clks R7S72100_CLK_OSTM1>;
> +		status = "disabled";
> +	};
>  };

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
