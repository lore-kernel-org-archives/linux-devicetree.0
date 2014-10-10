From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 3/3] ls1021a-twr/qe: add qe node to ls1-twr
Date: Fri, 10 Oct 2014 13:08:31 -0500
Message-ID: <1412964511.13320.606.camel@snotra.buserror.net>
References: <1412923798-9757-1-git-send-email-B45475@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412923798-9757-1-git-send-email-B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org, R63061-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2014-10-10 at 14:49 +0800, Zhao Qiang wrote:
> add qe node to ls1021atwr fdt.
> 
> Signed-off-by: Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm/boot/dts/ls1021a-twr.dts | 24 +++++++++++++++
>  arch/arm/boot/dts/ls1021a.dtsi    | 64 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 88 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/ls1021a-twr.dts b/arch/arm/boot/dts/ls1021a-twr.dts
> index a52be7b..415387f 100755
> --- a/arch/arm/boot/dts/ls1021a-twr.dts
> +++ b/arch/arm/boot/dts/ls1021a-twr.dts
> @@ -164,6 +164,30 @@
>  	};
>  };
>  
> +&uqe {
> +	tdma: ucc@2000 {
> +		compatible = "fsl,ucc-tdm";

Binding?

> +		rx-clock-name = "clk8";
> +		tx-clock-name = "clk9";
> +		fsl,rx-sync-clock = "rsync_pin";
> +		fsl,tx-sync-clock = "tsync_pin";
> +		fsl,tx-timeslot = <0xfffffffe>;
> +		fsl,rx-timeslot = <0xfffffffe>;
> +		fsl,tdm-framer-type = "e1";
> +		fsl,tdm-mode = "normal";
> +		fsl,tdm-id = <0>;
> +		fsl,siram-entry-id = <0>;
> +	};
> +
> +	serial: ucc@2200 {
> +		device_type = "serial";
> +		compatible = "ucc_uart";
> +		port-number = <1>;
> +		rx-clock-name = "brg2";
> +		tx-clock-name = "brg2";
> +	};

Binding for ucc_uart?  Why device_type?

> +};
> +
>  &pwm6 {
>  	status = "okay";
>  };
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
> index 80747dc..3f2ab89 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -314,6 +314,70 @@
>  			status = "disabled";
>  		};
>  
> +		uqe: uqe@2400000 {

How does "uqe" differ from "qe"?

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
