From: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC 3/3] arm64: dts: register Hi6220's coresight debug
 module
Date: Wed, 15 Feb 2017 14:19:58 -0700
Message-ID: <20170215211958.GC29730@linaro.org>
References: <1486966298-16767-1-git-send-email-leo.yan@linaro.org>
 <1486966298-16767-4-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486966298-16767-4-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 13, 2017 at 02:11:38PM +0800, Leo Yan wrote:
> Bind coresight debug driver for Hi6220.

Bindings for the coresight debug driver...

> 
> Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../boot/dts/hisilicon/hikey_6220_coresight.dtsi   | 73 ++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hikey_6220_coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hikey_6220_coresight.dtsi
> index 77c2aab..e14d75c 100644
> --- a/arch/arm64/boot/dts/hisilicon/hikey_6220_coresight.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hikey_6220_coresight.dtsi
> @@ -15,6 +15,79 @@
>  		#size-cells = <2>;
>  		compatible = "arm,amba-bus";
>  		ranges;
> +
> +		debug@0,f6590000 {

Simply use "debug@f6590000", the "0," isn't required.

> +			compatible = "arm,coresight-debug","arm,primecell";
> +			reg = <0 0xf6590000 0 0x1000>;
> +			default_enable;

What is the "default_enable" for ?

> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu0>;
> +		};
> +
> +		debug@1,f6592000 {
> +			compatible = "arm,coresight-debug","arm,primecell";
> +			reg = <0 0xf6592000 0 0x1000>;
> +			default_enable;
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu1>;
> +		};
> +
> +		debug@2,f6594000 {
> +			compatible = "arm,coresight-debug","arm,primecell";
> +			reg = <0 0xf6594000 0 0x1000>;
> +			default_enable;
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu2>;
> +		};
> +
> +		debug@3,f6596000 {
> +			compatible = "arm,coresight-debug","arm,primecell";
> +			reg = <0 0xf6596000 0 0x1000>;
> +			default_enable;
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu3>;
> +		};
> +
> +		debug@4,f65d0000 {
> +			compatible = "arm,coresight-debug","arm,primecell";
> +			reg = <0 0xf65d0000 0 0x1000>;
> +			default_enable;
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu4>;
> +		};
> +
> +		debug@5,f65d2000 {
> +			compatible = "arm,coresight-debug","arm,primecell";
> +			reg = <0 0xf65d2000 0 0x1000>;
> +			default_enable;
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu5>;
> +		};
> +
> +		debug@6,f65d4000 {
> +			compatible = "arm,coresight-debug","arm,primecell";
> +			reg = <0 0xf65d4000 0 0x1000>;
> +			default_enable;
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu6>;
> +		};
> +
> +		debug@7,f65d6000 {
> +			compatible = "arm,coresight-debug","arm,primecell";
> +			reg = <0 0xf65d6000 0 0x1000>;
> +			default_enable;
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu7>;
> +		};
> +
>  		etm@0,f659c000 {
>  			compatible = "arm,coresight-etm4x","arm,primecell";
>  			reg = <0 0xf659c000 0 0x1000>;
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
