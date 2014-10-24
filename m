From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv0 2/2] arm: mvebu: clarify (e)SATA ports info in NETGEAR
 ReadyNAS 102 .dts file
Date: Fri, 24 Oct 2014 23:22:07 +0200
Message-ID: <20141024212207.GC6436@lunn.ch>
References: <cover.1414185031.git.arno@natisbad.org>
 <4af680f9a68281755e31df2491f0590046138230.1414185031.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4af680f9a68281755e31df2491f0590046138230.1414185031.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johan Kristell <johan.kristell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 24, 2014 at 11:22:16PM +0200, Arnaud Ebalard wrote:
> 
> On NETGEAR ReadyNAS 102, the two disks are connected to the external
> Marvell 88SE9170 SATA Controller connected to the PCIe bus. The rear
> eSATA port is connected to the native Armada 370 SATA controller.
> 
> This patch updates the comments in .dts file wrt SATA interfaces and
> reduces the number of ports for native Armada 370 interface from 1
> to 2.

Typ0. 

Jason, can you swap the 1 and 2 around when you commit?
Save having a v2.

Otherwise

Acked-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

	  Andrew


> 
> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
> ---
>  arch/arm/boot/dts/armada-370-netgear-rn102.dts | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/armada-370-netgear-rn102.dts b/arch/arm/boot/dts/armada-370-netgear-rn102.dts
> index f79579bdf8fe..1e38628f4060 100644
> --- a/arch/arm/boot/dts/armada-370-netgear-rn102.dts
> +++ b/arch/arm/boot/dts/armada-370-netgear-rn102.dts
> @@ -35,7 +35,7 @@
>  		pcie-controller {
>  			status = "okay";
>  
> -			/* Connected to Marvell SATA controller */
> +			/* Connected to Marvell 88SE9170 SATA controller */
>  			pcie@1,0 {
>  				/* Port 0, Lane 0 */
>  				status = "okay";
> @@ -53,8 +53,9 @@
>  				status = "okay";
>  			};
>  
> +			/* eSATA interface */
>  			sata@a0000 {
> -				nr-ports = <2>;
> +				nr-ports = <1>;
>  				status = "okay";
>  			};
>  
> -- 
> 2.1.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
