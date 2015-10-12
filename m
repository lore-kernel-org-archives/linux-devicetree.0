From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/2] arm: mvebu: disable unused Armada RTC on ReadyNAS
 102, 104 and 2120
Date: Mon, 12 Oct 2015 16:21:12 +0200
Message-ID: <20151012142112.GA30801@lunn.ch>
References: <cover.1444428035.git.arno@natisbad.org>
 <2e62abb84de02c0495bde9d60a90282deae40967.1444428035.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2e62abb84de02c0495bde9d60a90282deae40967.1444428035.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, TuxOholic <tuxoholic-PkbjNfxxIASELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 10, 2015 at 12:10:24AM +0200, Arnaud Ebalard wrote:
> 
> By default, armada-370-xp.dtsi file has internal RTC enabled.
> NETGEAR ReadyNAS 102, 104 and 2120 all use an Intersil ISL12057
> I2C RTC chip. The internal RTC not being disabled in the .dts
> files of those devices result in the following useless first
> line during boot:
> 
> [    4.500056] rtc-mv d0010300.rtc: internal RTC not ticking
> [    4.505684] i2c /dev entries driver
> [    4.513246] rtc-isl12057 0-0068: rtc core: registered rtc-isl12057 as rtc0
> 
> This patch marks Armada internal RTC as disabled in individual .dts
> files of those devices.
> 
> Reported-by: TuxOholic <tuxoholic-PkbjNfxxIASELgA04lAiVw@public.gmane.org>
> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>

Acked-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

Thanks Arnaud

       Andrew


> ---
>  arch/arm/boot/dts/armada-370-netgear-rn102.dts | 6 ++++++
>  arch/arm/boot/dts/armada-370-netgear-rn104.dts | 6 ++++++
>  arch/arm/boot/dts/armada-xp-netgear-rn2120.dts | 6 ++++++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/armada-370-netgear-rn102.dts b/arch/arm/boot/dts/armada-370-netgear-rn102.dts
> index a31207860f34..5851964196bd 100644
> --- a/arch/arm/boot/dts/armada-370-netgear-rn102.dts
> +++ b/arch/arm/boot/dts/armada-370-netgear-rn102.dts
> @@ -82,6 +82,12 @@
>  		};
>  
>  		internal-regs {
> +
> +			/* RTC is provided by Intersil ISL12057 I2C RTC chip */
> +			rtc@10300 {
> +				status = "disabled";
> +			};
> +
>  			serial@12000 {
>  				status = "okay";
>  			};
> diff --git a/arch/arm/boot/dts/armada-370-netgear-rn104.dts b/arch/arm/boot/dts/armada-370-netgear-rn104.dts
> index 00540f292979..b0b07ba677b9 100644
> --- a/arch/arm/boot/dts/armada-370-netgear-rn104.dts
> +++ b/arch/arm/boot/dts/armada-370-netgear-rn104.dts
> @@ -82,6 +82,12 @@
>  		};
>  
>  		internal-regs {
> +
> +			/* RTC is provided by Intersil ISL12057 I2C RTC chip */
> +			rtc@10300 {
> +				status = "disabled";
> +			};
> +
>  			serial@12000 {
>  				status = "okay";
>  			};
> diff --git a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
> index 1516fc2627f9..85b2f87c0b8a 100644
> --- a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
> +++ b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
> @@ -88,6 +88,12 @@
>  		};
>  
>  		internal-regs {
> +
> +			/* RTC is provided by Intersil ISL12057 I2C RTC chip */
> +			rtc@10300 {
> +				status = "disabled";
> +			};
> +
>  			/* Two rear eSATA ports */
>  			sata@a0000 {
>  				nr-ports = <2>;
> -- 
> 2.5.3
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
