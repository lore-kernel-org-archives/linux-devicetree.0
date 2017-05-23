From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v3 3/5] ARM: dts: stm32: Add CRC support to stm32f429
Date: Tue, 23 May 2017 15:59:13 +0200
Message-ID: <3ae8fbbc-8ff1-904f-abd7-cbdf65245cff@st.com>
References: <cover.1495463449.git.cosardindar@gmail.com>
 <c6975a76f3437b3111c1c9f5560ad78951baa774.1495463449.git.cosardindar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c6975a76f3437b3111c1c9f5560ad78951baa774.1495463449.git.cosardindar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cosar Dindar <cosardindar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, fabien.dessenne-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 05/22/2017 04:34 PM, Cosar Dindar wrote:
> Add CRC32 Crypto support to stm32f429.
>
> Signed-off-by: Cosar Dindar <cosardindar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Will be applied in STM32 branch for next pull request.

Thanks
Alex

> ---
>  arch/arm/boot/dts/stm32f429.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
> index b2a2b5c..18343de 100644
> --- a/arch/arm/boot/dts/stm32f429.dtsi
> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> @@ -766,6 +766,13 @@
>  			};
>  		};
>
> +		crc: crc@40023000 {
> +			compatible = "st,stm32f4-crc";
> +			reg = <0x40023000 0x400>;
> +			clocks = <&rcc 0 STM32F4_AHB1_CLOCK(CRC)>;
> +			status = "disabled";
> +		};
> +
>  		rcc: rcc@40023810 {
>  			#reset-cells = <1>;
>  			#clock-cells = <2>;
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
