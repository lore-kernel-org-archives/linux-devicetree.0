From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: vf610-twr: Add PWM0's pinctrl node
Date: Mon, 24 Mar 2014 10:48:20 +0800
Message-ID: <20140324024818.GA10184@dragon>
References: <1395292325-8497-1-git-send-email-Li.Xiubo@freescale.com>
 <1395292325-8497-3-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395292325-8497-3-git-send-email-Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 20, 2014 at 01:12:04PM +0800, Xiubo Li wrote:
> Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Patch #2 and #3 can be reasonably merged into one.

Shawn

> ---
>  arch/arm/boot/dts/vf610-twr.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/vf610-twr.dts b/arch/arm/boot/dts/vf610-twr.dts
> index f3af8ea..3fabdb5 100644
> --- a/arch/arm/boot/dts/vf610-twr.dts
> +++ b/arch/arm/boot/dts/vf610-twr.dts
> @@ -213,6 +213,17 @@
>  			>;
>  		};
>  
> +		pinctrl_pwm0: pwm0grp {
> +			fsl,pins = <
> +				VF610_PAD_PTB0__FTM0_CH0		0x1582
> +				VF610_PAD_PTB1__FTM0_CH1		0x1582
> +				VF610_PAD_PTB2__FTM0_CH2		0x1582
> +				VF610_PAD_PTB3__FTM0_CH3		0x1582
> +				VF610_PAD_PTB6__FTM0_CH6		0x1582
> +				VF610_PAD_PTB7__FTM0_CH7		0x1582
> +			>;
> +		};
> +
>  		pinctrl_sai2: sai2grp {
>  			fsl,pins = <
>  				VF610_PAD_PTA16__SAI2_TX_BCLK		0x02ed
> -- 
> 1.8.4
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
