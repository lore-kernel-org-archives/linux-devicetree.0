From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCH 4/4] ARM: mvebu: add Device Tree description of RTC on Armada 38x
Date: Wed, 14 Jan 2015 00:03:12 +0100
Message-ID: <874mrui8r3.fsf@natisbad.org>
References: <1420817565-28800-1-git-send-email-gregory.clement@free-electrons.com>
	<1420817565-28800-5-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Gregory,

Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:

> The Marvell Armada 38x SoCs contains an RTC which differs from the RTC
> used in the other mvebu SoCs until now. This commit adds the Device
> Tree description of this interface at the SoC level.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/boot/dts/armada-38x.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
> index 04fe80d101f8..22909add8889 100644
> --- a/arch/arm/boot/dts/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/armada-38x.dtsi
> @@ -466,6 +466,12 @@
>  				clocks = <&gateclk 4>;
>  			};
>  
> +			rtc@184a8 {
> +				compatible = "marvell,armada-380-rtc";
> +				reg = <0xa3800 0x20>, <0x184a0 0x0c>;
> +				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +

Out of curiosity, why not naming the node rtc@a3800? Main argument:
least expectation principle when reading the .dtsi and expecting
increasing addresses. Or did I miss sth else?


>  			sata@a8000 {
>  				compatible = "marvell,armada-380-ahci";
>  				reg = <0xa8000 0x2000>;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
