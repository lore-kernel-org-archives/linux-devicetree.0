From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 15/15] arm64: dts: allwinner: a64: Add
 Video Engine node
Date: Fri, 07 Dec 2018 22:22:30 +0100
Message-ID: <2823800.C4zEU5jiS7@jernej-laptop>
References: <20181205092444.29497-1-paul.kocialkowski@bootlin.com> <20181205092444.29497-16-paul.kocialkowski@bootlin.com>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDP4JJM5QYGRBG6JVPQAKGQEFZPJC5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181205092444.29497-16-paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

Dne sreda, 05. december 2018 ob 10:24:44 CET je Paul Kocialkowski napisal(a):
> This adds the Video Engine node for the A64. Since it can map the whole
> DRAM range, there is no particular need for a reserved memory node
> (unlike platforms preceding the A33).
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi index
> 8557d52c7c99..8d024c10d7cb 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -397,6 +397,17 @@
>  			};
>  		};
> 
> +		video-codec@1c0e000 {
> +			compatible = "allwinner,sun50i-h5-video-engine";

You meant A64 instead of H5, right?

Best regards,
Jernej

> +			reg = <0x01c0e000 0x1000>;
> +			clocks = <&ccu CLK_BUS_VE>, <&ccu CLK_VE>,
> +				 <&ccu CLK_DRAM_VE>;
> +			clock-names = "ahb", "mod", "ram";
> +			resets = <&ccu RST_BUS_VE>;
> +			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +			allwinner,sram = <&ve_sram 1>;
> +		};
> +
>  		mmc0: mmc@1c0f000 {
>  			compatible = "allwinner,sun50i-a64-mmc";
>  			reg = <0x01c0f000 0x1000>;
