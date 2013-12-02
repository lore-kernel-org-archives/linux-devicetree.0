From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm: at91: sama5d3: enable qt1070 as a wakeup source
Date: Mon, 2 Dec 2013 09:32:25 +0100
Message-ID: <529C4599.4030601@atmel.com>
References: <1385972988-20157-1-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385972988-20157-1-git-send-email-voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/12/2013 09:29, Bo Shen :
> Enable qt1070 keyboard as a wakeup source on sama5d3xek board.
>
> Signed-off-by: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Thanks,

> ---
>   arch/arm/boot/dts/sama5d3xdm.dtsi |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/sama5d3xdm.dtsi b/arch/arm/boot/dts/sama5d3xdm.dtsi
> index 1c296d6..f9bdde5 100644
> --- a/arch/arm/boot/dts/sama5d3xdm.dtsi
> +++ b/arch/arm/boot/dts/sama5d3xdm.dtsi
> @@ -18,6 +18,7 @@
>   					interrupts = <31 0x0>;
>   					pinctrl-names = "default";
>   					pinctrl-0 = <&pinctrl_qt1070_irq>;
> +					wakeup-source;
>   				};
>   			};
>
>


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
