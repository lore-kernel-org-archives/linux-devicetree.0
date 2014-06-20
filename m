From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [patch 1/2] dts: spear: Fix sdhci compatible
Date: Fri, 20 Jun 2014 10:17:15 +0530
Message-ID: <CAOh2x=k_r3oH-bFPYctarQci3G6yi2U7WxhsR7U2UvU+BzMAjw@mail.gmail.com>
References: <20140619215347.139324048@linutronix.de>
	<20140619215557.784621009@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140619215557.784621009-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 20, 2014 at 3:26 AM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> Make it match the bindings and the implementation.
>
> Signed-off-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/spear320.dtsi |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Index: linux/arch/arm/boot/dts/spear320.dtsi
> ===================================================================
> --- linux.orig/arch/arm/boot/dts/spear320.dtsi
> +++ linux/arch/arm/boot/dts/spear320.dtsi
> @@ -48,7 +48,7 @@
>                 };
>
>                 sdhci@70000000 {
> -                       compatible = "st,sdhci-spear";
> +                       compatible = "st,spear300-sdhci";
>                         reg = <0x70000000 0x100>;
>                         interrupts = <10>;
>                         interrupt-parent = <&shirq>;

Acked-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
