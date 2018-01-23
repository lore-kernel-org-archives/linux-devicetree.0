From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] rock64: dts: fix gmac2io stability issues
Date: Tue, 23 Jan 2018 13:52:56 +0100
Message-ID: <26154377.eZ6VsJ1LtB@diego>
References: <20180122174628.15613-1-ayufan@ayufan.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180122174628.15613-1-ayufan-1nXcilf+G7OHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kamil =?utf-8?B?VHJ6Y2nFhHNraQ==?= <ayufan-1nXcilf+G7OHXe+LvDLADg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Joseph Chen <chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Liang Chen <cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kamil,

Thanks for figuring out the source of the gmac instability :-) .

I've applied the patch as fix for 4.16 but corrected some small issues while 
doing so:
- The subject should be something like
	"arm64: dts: rockchip: fix rock64 gmac2io stability issues"
  The prefixes to use vary per subsystem, so it's best to use git log to
  look at previous commits

Am Montag, 22. Januar 2018, 18:46:22 CET schrieb Kamil Trzciński:
> This commit enables thresh dma mode as this forces to disable checksuming,
> and chooses delay values which make the interface stable.
> 
> These changes are needed, because ROCK64 is faced with two problems:
> 1. tx checksuming does not work with packets larger than 1498,
> 2. the default delays for tx/rx are not stable when using 1Gbps connection.
> 
> Delays were found out with:
> https://github.com/ayufan-rock64/linux-build/tree/master/recipes/gmac-delays
> -test
> 
> Change-Id: Ie894df4b52122988da683c02e3a05d635a5c7b84

That is some gerrit thingy which should not be part when sending patches 
upstream.

> Signed-off-by: Kamil Trzciński <ayufan-1nXcilf+G7OHXe+LvDLADg@public.gmane.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3328-rock64.dts | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
> b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts index
> 5602ec01fed9..bcc0bb35d840 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
> @@ -132,8 +132,6 @@
>  	assigned-clocks = <&cru SCLK_MAC2IO>, <&cru SCLK_MAC2IO_EXT>;
>  	assigned-clock-parents = <&gmac_clkin>, <&gmac_clkin>;
>  	clock_in_out = "input";
> -	/* shows instability at 1GBit right now */
> -	max-speed = <100>;
>  	phy-supply = <&vcc_io>;
>  	phy-mode = "rgmii";
>  	pinctrl-names = "default";
> @@ -141,8 +139,9 @@
>  	snps,reset-gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
>  	snps,reset-active-low;
>  	snps,reset-delays-us = <0 10000 50000>;
> -	tx_delay = <0x26>;
> -	rx_delay = <0x11>;
> +	snps,force_thresh_dma_mode;

With the exception of compatible, reg, interrupts and status, I try to keep
other properties alphabetically sorted in Rockchip dts, so I've moved the
snps,force_thres_dma_mode up between pinctrl-0 and snps-reset-gpio.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
