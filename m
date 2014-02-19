From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: dts: Enable SAI ALSA SoC DAI device for Vybrid
 VF610 TOWER board.
Date: Wed, 19 Feb 2014 15:11:56 +0800
Message-ID: <20140219071154.GG3010@S2101-09.ap.freescale.net>
References: <1392788323-6092-1-git-send-email-Li.Xiubo@freescale.com>
 <1392788323-6092-3-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392788323-6092-3-git-send-email-Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 19, 2014 at 01:38:41PM +0800, Xiubo Li wrote:
> This patch adds and enables the SAI device.
> 
> Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

The patch subject can be a little short like

  ARM: dts: vf610-twr: Enable SAI ALSA SoC DAI device

Shawn

> ---
>  arch/arm/boot/dts/vf610-twr.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/vf610-twr.dts b/arch/arm/boot/dts/vf610-twr.dts
> index e3a3805..8217854 100644
> --- a/arch/arm/boot/dts/vf610-twr.dts
> +++ b/arch/arm/boot/dts/vf610-twr.dts
> @@ -127,9 +127,27 @@
>  				VF610_PAD_PTB5__UART1_RX		0x21a1
>  			>;
>  		};
> +
> +		pinctrl_sai2: sai2grp {
> +		      fsl,pins = <
> +			      VF610_PAD_PTA16__SAI2_TX_BCLK   0x02ed
> +			      VF610_PAD_PTA18__SAI2_TX_DATA   0x02ee
> +			      VF610_PAD_PTA19__SAI2_TX_SYNC   0x02ed
> +			      VF610_PAD_PTA21__SAI2_RX_BCLK   0x02ed
> +			      VF610_PAD_PTA22__SAI2_RX_DATA   0x02ed
> +			      VF610_PAD_PTA23__SAI2_RX_SYNC   0x02ed
> +			      VF610_PAD_PTB18__EXT_AUDIO_MCLK 0x02ed
> +			>;
> +		};
>  	};
>  };
>  
> +&sai2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai2>;
> +	status = "okay";
> +};
> +
>  &uart1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_uart1>;
> -- 
> 1.8.4
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
