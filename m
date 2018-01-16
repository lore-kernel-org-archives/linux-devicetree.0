From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: at91: nattis: use up-to-date mtd partitions
Date: Tue, 16 Jan 2018 17:30:15 +0100
Message-ID: <20180116163015.GG2678@piout.net>
References: <20180116160835.27943-1-peda@axentia.se>
 <20180116160835.27943-2-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180116160835.27943-2-peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 16/01/2018 at 17:08:33 +0100, Peter Rosin wrote:
> The nattis currently relies on the cmdline to correctly configure the
> MTD partition table, and the one given in the device tree is simply
> ignored. Which is fortunate, since the device tree partition table is
> bonkers and does not match reality.
> 

Shouldn't it be simply removed then?

> So, in order to avoid confusion, fix the device tree partition table
> to match what is expected (i.e. what is normally provided on the cmdline).
> In particular, the rootfs partition should be mtd6.
> 
> Fixes: 0e4323899973 ("ARM: dts: at91: add devicetree for the Axentia Nattis with Natte power")
> Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> ---
>  arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
> index 3ea1d26e1c68..4882bd6d38c1 100644
> --- a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
> +++ b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
> @@ -216,24 +216,29 @@
>  			reg = <0x0 0x40000>;
>  		};
>  
> -		bootloader@40000 {
> -			label = "bootloader";
> -			reg = <0x40000 0x80000>;
> +		barebox@40000 {
> +			label = "barebox";
> +			reg = <0x40000 0x60000>;
>  		};
>  
> -		bootloaderenv@c0000 {
> -			label = "bootloader env";
> -			reg = <0xc0000 0xc0000>;
> +		bareboxenv@c0000 {
> +			label = "bareboxenv";
> +			reg = <0xc0000 0x40000>;
>  		};
>  
> -		dtb@180000 {
> -			label = "device tree";
> -			reg = <0x180000 0x80000>;
> +		bareboxenv2@100000 {
> +			label = "bareboxenv2";
> +			reg = <0x100000 0x40000>;
> +		};
> +
> +		oftree@180000 {
> +			label = "oftree";
> +			reg = <0x180000 0x20000>;
>  		};
>  
>  		kernel@200000 {
>  			label = "kernel";
> -			reg = <0x200000 0x600000>;
> +			reg = <0x200000 0x500000>;
>  		};
>  
>  		rootfs@800000 {
> -- 
> 2.11.0
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
