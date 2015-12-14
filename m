From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/4] ARM: dts: lpc18xx: add EEPROM memory node
Date: Mon, 14 Dec 2015 10:05:51 +0000
Message-ID: <566E947F.2030805@linaro.org>
References: <1447790576-29410-1-git-send-email-ariel@vanguardiasur.com.ar> <1447790576-29410-4-git-send-email-ariel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447790576-29410-4-git-send-email-ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Joachim,

Could you take this DT patches via your tree, I picked up the nvmem patches.

thanks,
srini


On 17/11/15 20:02, Ariel D'Alessandro wrote:
> Add node for the NXP LPC18xx EEPROM memory which can be found in
> NXP LPC185x/3x and LPC435x/3x/2x/1x devices.
>
> Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
> ---
>   arch/arm/boot/dts/lpc18xx.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/lpc18xx.dtsi b/arch/arm/boot/dts/lpc18xx.dtsi
> index 52591d8..43e99cf 100644
> --- a/arch/arm/boot/dts/lpc18xx.dtsi
> +++ b/arch/arm/boot/dts/lpc18xx.dtsi
> @@ -166,6 +166,18 @@
>   			status = "disabled";
>   		};
>
> +		eeprom: eeprom@4000e000 {
> +			compatible = "nxp,lpc1857-eeprom";
> +			reg =	<0x4000e000 0x1000>,
> +				<0x20040000 0x4000>;
> +			reg-names = "reg", "mem";
> +			clocks = <&ccu1 CLK_CPU_EEPROM>;
> +			clock-names = "eeprom";
> +			resets = <&rgu 27>;
> +			interrupts = <4>;
> +			status = "disabled";
> +		};
> +
>   		mac: ethernet@40010000 {
>   			compatible = "nxp,lpc1850-dwmac", "snps,dwmac-3.611", "snps,dwmac";
>   			reg = <0x40010000 0x2000>;
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
