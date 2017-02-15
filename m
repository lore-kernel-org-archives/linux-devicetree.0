From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/6] ARM: dts: Fix typo in armada-xp-98dx4251
Date: Wed, 15 Feb 2017 15:35:14 +0100
Message-ID: <87zihncyjh.fsf@free-electrons.com>
References: <20170207202815.20226-1-chris.packham@alliedtelesis.co.nz>
        <20170207202815.20226-2-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170207202815.20226-2-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> (Chris
        Packham's message of "Wed, 8 Feb 2017 09:28:10 +1300")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Chris,
 
 On mar., févr. 07 2017, Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> wrote:

> The compatible should be 98dx4251 not 98dx4521.
>
> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>

Applied on mvebu/dt

If it's too late for a PR to arm-soc I will move it in mvebu/fixes once
the v4.11-rc1 will be released.

Thanks,

Gregory

> ---
>
> Notes:
>     Changes in v2
>     - new
>
>  arch/arm/boot/dts/armada-xp-98dx4251.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/armada-xp-98dx4251.dtsi b/arch/arm/boot/dts/armada-xp-98dx4251.dtsi
> index 4b0533a4ccb7..b9d9b269efb4 100644
> --- a/arch/arm/boot/dts/armada-xp-98dx4251.dtsi
> +++ b/arch/arm/boot/dts/armada-xp-98dx4251.dtsi
> @@ -49,7 +49,7 @@
>  
>  / {
>  	model = "Marvell 98DX4251 SoC";
> -	compatible = "marvell,armadaxp-98dx4521", "marvell,armadaxp-98dx3236", "marvell,armadaxp", "marvell,armada-370-xp";
> +	compatible = "marvell,armadaxp-98dx4251", "marvell,armadaxp-98dx3236", "marvell,armadaxp", "marvell,armada-370-xp";
>  
>  	cpus {
>  		cpu@1 {
> -- 
> 2.11.0.24.ge6920cf
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
