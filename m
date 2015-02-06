From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/1] arm: Fix unavailable MTD userland devices on Excito
 B3 boards
Date: Fri, 06 Feb 2015 10:09:44 +0100
Message-ID: <54D484D8.8090801@free-electrons.com>
References: <1423212311-10793-1-git-send-email-gordon@bosvangennip.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423212311-10793-1-git-send-email-gordon-PMRpws9CsXpfxmBXdGbrbQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gordon Bos <gordon-PMRpws9CsXpfxmBXdGbrbQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Gordon,


On 06/02/2015 09:45, Gordon Bos wrote:
> Excito B3 boards use SPI flash for booting and several userland
> functions require access to this flash memory, including power down
> control. However /proc/mtd shows an empty list and the userland
> tools respond with "device not found".

The change in arm/boot/dts don't go through the device tree subsystem
but through the arm-soc one. Especially it it is only a fix and if
you don't introduce or modifying a binding. For this kind of patch
you should cc the mvebu maintainers (I added the others one)

However it seems that the get_maintainer.pl script is misleading on this
point we should maybe be updating the MAINTAINERS file.

> 
> Change driver reference for spi@10600 to M25P80
> 
> Verified on my own Excito B3

This change looks OK for me however it is too late to merge it
and it will be part of the next merge window.

Andrew, as you initially wrote this dts would you have a look on it?

As it is a fix we will also apply to the stable branches. It would
help if you could tell us since when this bug is present.


Thanks,

Gregory


> 
> Signed-off-by: Gordon Bos <gordon-PMRpws9CsXpfxmBXdGbrbQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/kirkwood-b3.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/kirkwood-b3.dts b/arch/arm/boot/dts/kirkwood-b3.dts
> index c9247f8..4b1e414 100644
> --- a/arch/arm/boot/dts/kirkwood-b3.dts
> +++ b/arch/arm/boot/dts/kirkwood-b3.dts
> @@ -71,10 +71,10 @@
>  		spi@10600 {
>  			status = "okay";
>  
> -			m25p16@0 {
> +			m25p80@0 {
>  				#address-cells = <1>;
>  				#size-cells = <1>;
> -				compatible = "st,m25p16";
> +				compatible = "st,m25p80";
>  				reg = <0>;
>  				spi-max-frequency = <40000000>;
>  				mode = <0>;
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
