From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm: dts: ls1021a: fix the value of TMR_FIPER1
Date: Wed, 29 Nov 2017 14:55:59 +0800
Message-ID: <20171129065558.GK9376@dragon>
References: <20171110015847.29635-1-yangbo.lu@nxp.com>
 <DB6PR0401MB2536A92B16A744BB51BA0197F8260@DB6PR0401MB2536.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <DB6PR0401MB2536A92B16A744BB51BA0197F8260-2mNvjAGDOPkZcyyZo0JLBI3W/0Ik+aLCnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Y.b. Lu" <yangbo.lu-3arQi8VN3Tc@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 24, 2017 at 02:31:13AM +0000, Y.b. Lu wrote:
> Any comments?
> 
> +Shawn

Please resend with me on copy.

> 
> Thanks.
> 
> -----Original Message-----
> From: Yangbo Lu [mailto:yangbo.lu-3arQi8VN3Tc@public.gmane.org] 
> Sent: 2017年11月10日 9:59
> To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>; Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> Cc: Y.b. Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>
> Subject: [PATCH] arm: dts: ls1021a: fix the value of TMR_FIPER1

ARM: dts: ...

> 
> The timer fixed interval period pulse generator register is used to generate periodic pulses. The down count register loads the value programmed in the fixed period interval (FIPER). At every tick of the timer accumulator overflow, the counter decrements by the value of TMR_CTRL[TCLK_PERIOD]. It generates a pulse when the down counter value reaches zero. It reloads the down counter in the cycle following a pulse. To use the TMR_FIPER1 register to generate a 1 PPS event, the value

Please wrap the commit log properly.

Shawn

> (10^9 nanoseconds) - TCLK_PERIOD should be programmed.
> It should be 999999995 not 999999990 since TCLK_PERIOD is 5.
> 
> Signed-off-by: Yangbo Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/arm/boot/dts/ls1021a.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi index 9319e1f0f1d8..10e536f338f7 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -575,7 +575,7 @@
>  			fsl,tclk-period = <5>;
>  			fsl,tmr-prsc    = <2>;
>  			fsl,tmr-add     = <0xaaaaaaab>;
> -			fsl,tmr-fiper1  = <999999990>;
> +			fsl,tmr-fiper1  = <999999995>;
>  			fsl,tmr-fiper2  = <99990>;
>  			fsl,max-adj     = <499999999>;
>  		};
> --
> 2.14.1
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
