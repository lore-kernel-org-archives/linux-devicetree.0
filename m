From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 3/4] arm64: dts: marvell: adjust to the latest mv-xor-v2 DT binding
Date: Thu, 30 Jun 2016 13:50:12 +0200
Message-ID: <87h9cax5e3.fsf@free-electrons.com>
References: <1466080116-26777-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1466080116-26777-4-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466080116-26777-4-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
	(Thomas Petazzoni's message of "Thu, 16 Jun 2016 14:28:35 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thomas,
 
 On jeu., juin 16 2016, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> As suggested by Rob Herring, we should:
>
>  1/ Use a SoC-specific compatible string in addition to the more generic
>     one.
>
>  2/ The generic compatible string has been changed from
>     "marvell,mv-xor-v2" to "marvell,xor-v2".
>
> We simply reflect the changes made to the Device Tree bindings to the
> relevant Marvell 7K/8K Device Tree files.

Applied on mvebu/dt64

Thanks,

Gregory
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> index 20d256b..eab1a42 100644
> --- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> @@ -141,7 +141,7 @@
>  			};
>  
>  			xor@400000 {
> -				compatible = "marvell,mv-xor-v2";
> +				compatible = "marvell,armada-7k-xor", "marvell,xor-v2";
>  				reg = <0x400000 0x1000>,
>  				      <0x410000 0x1000>;
>  				msi-parent = <&gic_v2m0>;
> @@ -149,7 +149,7 @@
>  			};
>  
>  			xor@420000 {
> -				compatible = "marvell,mv-xor-v2";
> +				compatible = "marvell,armada-7k-xor", "marvell,xor-v2";
>  				reg = <0x420000 0x1000>,
>  				      <0x430000 0x1000>;
>  				msi-parent = <&gic_v2m0>;
> @@ -157,7 +157,7 @@
>  			};
>  
>  			xor@440000 {
> -				compatible = "marvell,mv-xor-v2";
> +				compatible = "marvell,armada-7k-xor", "marvell,xor-v2";
>  				reg = <0x440000 0x1000>,
>  				      <0x450000 0x1000>;
>  				msi-parent = <&gic_v2m0>;
> @@ -165,7 +165,7 @@
>  			};
>  
>  			xor@460000 {
> -				compatible = "marvell,mv-xor-v2";
> +				compatible = "marvell,armada-7k-xor", "marvell,xor-v2";
>  				reg = <0x460000 0x1000>,
>  				      <0x470000 0x1000>;
>  				msi-parent = <&gic_v2m0>;
> -- 
> 2.7.4
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
