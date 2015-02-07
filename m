From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/5] ARM: dts: pxa: add clocks
Date: Sat, 07 Feb 2015 15:56:25 +0300
Message-ID: <54D60B79.5060206@cogentembedded.com>
References: <1423312760-15871-1-git-send-email-robert.jarzmik@free.fr> <1423312760-15871-2-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423312760-15871-2-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 2/7/2015 3:39 PM, Robert Jarzmik wrote:

> Add clocks to the IPs already described in the pxa device-tree
> files. There are more clocks in the clock tree than IPs described in the
> current pxa device-tree.

> This patch ensures that :
>   - the current description is correct
>   - the clocks are actually claimed, so that clock framework doesn't
>     disable them automatically (unused clocks shutdown)

> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> ---
>   arch/arm/boot/dts/pxa27x.dtsi | 31 ++++++++++++++++++++++++++++---
>   1 file changed, 28 insertions(+), 3 deletions(-)

> diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
> index 98b560e..e8d5097 100644
> --- a/arch/arm/boot/dts/pxa27x.dtsi
> +++ b/arch/arm/boot/dts/pxa27x.dtsi
[...]
> @@ -12,36 +12,62 @@
>   			marvell,intc-nr-irqs = <34>;
>   		};
>
> +		gpio: gpio@40e00000 {
> +			compatible = "intel,pxa27x-gpio";
> +			clocks = <&pxa2xx_clks CLK_NONE>;
> +		};
> +
> +		ffuart: uart@40100000 {
> +			clocks = <&pxa2xx_clks CLK_FFUART>;
> +		};
> +
> +		btuart: uart@40200000 {
> +			clocks = <&pxa2xx_clks CLK_BTUART>;
> +		};
> +
> +		stuart: uart@40700000 {
> +			clocks = <&pxa2xx_clks CLK_STUART>;
> +		};
> +

    The ePAPR standard tells to call such nodes "serial", not "uart".

[...]

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
