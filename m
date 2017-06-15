From: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH v6 7/8] arm64: dts: hikey960: add device node for pmic and
 regulators
Date: Thu, 15 Jun 2017 16:01:05 +0100
Message-ID: <5942A131.9020607@hisilicon.com>
References: <20170608220841.26531-1-guodong.xu@linaro.org>
 <20170608220841.26531-8-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170608220841.26531-8-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, riku.voipio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Guodong,

On 2017/6/8 23:08, Guodong Xu wrote:
> From: Wang Xiaoyin <hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> 
> add device node for hi6421 pmic core and hi6421v530
> voltage regulator,include LDO(1,3,9,11,15,16)
> 
> Signed-off-by: Wang Xiaoyin <hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Thanks!
Acked-by: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>

So the whole patch set can be picked up by the Lee
to avoid dependence issue.

BR,
Wei

> ---
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 46 +++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> index ca448f0..e579333 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> @@ -97,6 +97,52 @@
>  			default-state = "off";
>  		};
>  	};
> +
> +	pmic: pmic@fff34000 {
> +		compatible = "hisilicon,hi6421v530-pmic";
> +		reg = <0x0 0xfff34000 0x0 0x1000>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		regulators {
> +			ldo3: LDO3 { /* HDMI */
> +				regulator-name = "VOUT3_1V85";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <2200000>;
> +				regulator-enable-ramp-delay = <120>;
> +			};
> +
> +			ldo9: LDO9 { /* SDCARD I/O */
> +				regulator-name = "VOUT9_1V8_2V95";
> +				regulator-min-microvolt = <1750000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-enable-ramp-delay = <240>;
> +			};
> +
> +			ldo11: LDO11 { /* Low Speed Connector */
> +				regulator-name = "VOUT11_1V8_2V95";
> +				regulator-min-microvolt = <1750000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-enable-ramp-delay = <240>;
> +			};
> +
> +			ldo15: LDO15 { /* UFS VCC */
> +				regulator-name = "VOUT15_3V0";
> +				regulator-min-microvolt = <1750000>;
> +				regulator-max-microvolt = <3000000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-enable-ramp-delay = <120>;
> +			};
> +
> +			ldo16: LDO16 { /* SD VDD */
> +				regulator-name = "VOUT16_2V95";
> +				regulator-min-microvolt = <1750000>;
> +				regulator-max-microvolt = <3000000>;
> +				regulator-enable-ramp-delay = <360>;
> +			};
> +		};
> +	};
>  };
>  
>  &i2c0 {
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
