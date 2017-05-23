From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v3 4/5] ARM: dts: stm32: enable CRC32 on stm32429-disco
 board
Date: Tue, 23 May 2017 15:59:29 +0200
Message-ID: <d1a3a862-715f-f440-e25b-38cc5ddbad09@st.com>
References: <cover.1495463449.git.cosardindar@gmail.com>
 <43babcf91eb49c5dffc4164b87839eeb537f0ee1.1495463449.git.cosardindar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <43babcf91eb49c5dffc4164b87839eeb537f0ee1.1495463449.git.cosardindar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cosar Dindar <cosardindar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, fabien.dessenne-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 05/22/2017 04:34 PM, Cosar Dindar wrote:
> Enable the CRC32 crypto on stm32429-disco board.
>
> Signed-off-by: Cosar Dindar <cosardindar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---


Will be applied in STM32 branch for next pull request.

Thanks
Alex

>  arch/arm/boot/dts/stm32f429-disco.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
> index 191fa50..ae47cde 100644
> --- a/arch/arm/boot/dts/stm32f429-disco.dts
> +++ b/arch/arm/boot/dts/stm32f429-disco.dts
> @@ -102,6 +102,10 @@
>  	clock-frequency = <8000000>;
>  };
>
> +&crc {
> +	status = "okay";
> +};
> +
>  &rtc {
>  	assigned-clocks = <&rcc 1 CLK_RTC>;
>  	assigned-clock-parents = <&rcc 1 CLK_LSI>;
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
