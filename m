From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCH 1/4] rtc: armada38x: Add the device tree binding documentation
Date: Wed, 14 Jan 2015 00:02:27 +0100
Message-ID: <87iogai8sc.fsf@natisbad.org>
References: <1420817565-28800-1-git-send-email-gregory.clement@free-electrons.com>
	<1420817565-28800-2-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Gregory,

Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:

> The Armada 38x SoCs come with a new RTC which differs from the one
> used in the other mvebu SoCs until now. This patch describes the
> binding of this RTC.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../devicetree/bindings/rtc/armada-380-rtc.txt          | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/armada-380-rtc.txt
>
> diff --git a/Documentation/devicetree/bindings/rtc/armada-380-rtc.txt b/Documentation/devicetree/bindings/rtc/armada-380-rtc.txt
> new file mode 100644
> index 000000000000..2c56bef9dd7e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/armada-380-rtc.txt
> @@ -0,0 +1,17 @@
> +* Real Time Clock of te Armada 38x SoCs
> +
> +RTC controller for the Armada 38x SoCs
> +
> +Required properties:
> +- compatible : Should be "marvell,armada-380-rtc"
> +- reg: physical base address of the controller and length of memory mapped
> +  region. The second entires is for the IP configuration part.
                        ^^^^^^^
                        entry

I had to read probe function to understand precisely the purpose of each
region, i.e. IMHO the description could be made a bit clearer.

> +- interrupts: IRQ line for the RTC.
>
> +
> +Example:
> +
> +rtc@184a8 {
> +	compatible = "marvell,armada-380-rtc";
> +	reg = <0xa3800 0x20>, <0x184a0 0x0c>;
> +	interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
