From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv0 1/2] arm: mvebu: fix LED color in NETGEAR ReadyNAS 102
 .dts file
Date: Fri, 24 Oct 2014 23:20:38 +0200
Message-ID: <20141024212038.GB6436@lunn.ch>
References: <cover.1414185031.git.arno@natisbad.org>
 <4eb4049d934a3a8fe9f7235dafb6842422792566.1414185031.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4eb4049d934a3a8fe9f7235dafb6842422792566.1414185031.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johan Kristell <johan.kristell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 24, 2014 at 11:22:01PM +0200, Arnaud Ebalard wrote:
> 
> When writing initial .dts file for NETGEAR ReadyNAS 102, I put the wrong color
> for backup and SATA leds (green instead of blue for all three).
> 
> Reported-by: Johan Kristell <johan.kristell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>

Acked-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

	  Andrew

> ---
>  arch/arm/boot/dts/armada-370-netgear-rn102.dts | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/armada-370-netgear-rn102.dts b/arch/arm/boot/dts/armada-370-netgear-rn102.dts
> index 3aebd93cc33c..f79579bdf8fe 100644
> --- a/arch/arm/boot/dts/armada-370-netgear-rn102.dts
> +++ b/arch/arm/boot/dts/armada-370-netgear-rn102.dts
> @@ -204,20 +204,20 @@
>  			default-state = "keep";
>  		};
>  
> -		green-sata1-led {
> -			label = "rn102:green:sata1";
> +		blue-sata1-led {
> +			label = "rn102:blue:sata1";
>  			gpios = <&gpio0 15 GPIO_ACTIVE_LOW>;
>  			default-state = "on";
>  		};
>  
> -		green-sata2-led {
> -			label = "rn102:green:sata2";
> +		blue-sata2-led {
> +			label = "rn102:blue:sata2";
>  			gpios = <&gpio0 14 GPIO_ACTIVE_LOW>;
>  			default-state = "on";
>  		};
>  
> -		green-backup-led {
> -			label = "rn102:green:backup";
> +		blue-backup-led {
> +			label = "rn102:blue:backup";
>  			gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
>  			default-state = "on";
>  		};
> -- 
> 2.1.1
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
