From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: dt: mvebu: ix4-300d: move partitions to
 partition sub-node
Date: Sat, 28 Nov 2015 18:00:36 +0100
Message-ID: <20151128170036.GH32356@lunn.ch>
References: <1448709248-21177-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1448709248-21177-3-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448709248-21177-3-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 28, 2015 at 12:14:06PM +0100, Sebastian Hesselbarth wrote:
> NAND flash partitions should be part of a partitions sub-node
> not the flash node itself. Move the partitions which will also
> allow different bootloaders get rid of the stock partitions
> easily by removing the partitions node.
> 
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


Humm, did not know that. Quoting Documentation/devicetree/bindings/mtd/partition.txt:

      The partition table should be a subnode of the mtd node and
      should be named 'partitions'. Partitions are defined in subnodes
      of the partitions node.

      For backwards compatibility partitions as direct subnodes of the
      mtd device are supported. This use is discouraged.

It also looks like none of the other MVEBU maintainers know that
either, since a quick look at the .dts files shows very few have a
partitions node.

Acked-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

Thanks
	Andrew

> ---
> Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> 
> Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> 
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> 
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org> 
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> 
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org> 
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> 
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> 
> Cc: Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org 
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org 
> ---
>  arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts | 67 +++++++++++++------------
>  1 file changed, 36 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> index 30a0a6eac645..76781fd18624 100644
> --- a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> +++ b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> @@ -151,37 +151,42 @@
>  				marvell,nand-enable-arbiter;
>  				nand-on-flash-bbt;
>  
> -				partition@0 {
> -					label = "u-boot";
> -					reg = <0x0000000 0xe0000>;
> -					read-only;
> -				};
> -
> -				partition@e0000 {
> -					label = "u-boot-env";
> -					reg = <0xe0000 0x20000>;
> -					read-only;
> -				};
> -
> -				partition@100000 {
> -					label = "u-boot-env2";
> -					reg = <0x100000 0x20000>;
> -					read-only;
> -				};
> -
> -				partition@120000 {
> -					label = "zImage";
> -					reg = <0x120000 0x400000>;
> -				};
> -
> -				partition@520000 {
> -					label = "initrd";
> -					reg = <0x520000 0x400000>;
> -				};
> -
> -				partition@xE00000 {
> -					label = "boot";
> -					reg = <0xE00000 0x3F200000>;
> +				partitions {
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					partition@0 {
> +						label = "u-boot";
> +						reg = <0x0000000 0xe0000>;
> +						read-only;
> +					};
> +
> +					partition@e0000 {
> +						label = "u-boot-env";
> +						reg = <0xe0000 0x20000>;
> +						read-only;
> +					};
> +
> +					partition@100000 {
> +						label = "u-boot-env2";
> +						reg = <0x100000 0x20000>;
> +						read-only;
> +					};
> +
> +					partition@120000 {
> +						label = "zImage";
> +						reg = <0x120000 0x400000>;
> +					};
> +
> +					partition@520000 {
> +						label = "initrd";
> +						reg = <0x520000 0x400000>;
> +					};
> +
> +					partition@xE00000 {
> +						label = "boot";
> +						reg = <0xE00000 0x3F200000>;
> +					};
>  				};
>  			};
>  		};
> -- 
> 2.1.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
