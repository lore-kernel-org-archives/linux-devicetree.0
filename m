From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: mvebu: add sdram controller node to Armada-38x
Date: Wed, 10 Jan 2018 09:31:37 +0100
Message-ID: <87tvvu6ro6.fsf@free-electrons.com>
References: <20180108223158.21930-1-chris.packham@alliedtelesis.co.nz>
        <20180108223158.21930-3-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180108223158.21930-3-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> (Chris
        Packham's message of "Tue, 9 Jan 2018 11:31:57 +1300")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Chris,
 
 On mar., janv. 09 2018, Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> wrote:

> The Armada-38x uses an SDRAM controller that is compatible with the
> Armada-XP. The key difference is the width of the bus (XP is 64/32, 38x
> is 32/16). The SDRAM controller registers are the same between the two
> SoCs.
>
> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> ---
>  arch/arm/boot/dts/armada-38x.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
> index 00ff549d4e39..6d34c5ec178f 100644
> --- a/arch/arm/boot/dts/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/armada-38x.dtsi
> @@ -138,6 +138,11 @@
>  			#size-cells = <1>;
>  			ranges = <0 MBUS_ID(0xf0, 0x01) 0 0x100000>;
>  
> +			sdramc@1400 {

Could you add a label? Thanks to this it would be possible to
enable/disable it at board level in a esay way.

> +				compatible = "marvell,armada-xp-sdram-controller";
> +				reg = <0x1400 0x500>;

What about adding status = "disabled" ?

Thanks to this we can enable it at board level only if we really want
it, it would avoid nasty regression on boards that don't need it, if an
issue occurs. Unless you are sure that it is completely safe to enable
it for everyone.

Thanks,

Gregory


> +			};
> +
>  			L2: cache-controller@8000 {
>  				compatible = "arm,pl310-cache";
>  				reg = <0x8000 0x1000>;
> -- 
> 2.15.1
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
