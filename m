From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [patch 2/2] dts: spear: Add missing i2c1 interrupt
Date: Fri, 20 Jun 2014 10:12:46 +0530
Message-ID: <CAOh2x==eh=k-LWK89QY_B0f9e7ctZE035NQm_vumayBYf3Mtnw@mail.gmail.com>
References: <20140619215347.139324048@linutronix.de>
	<20140619215557.875556819@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140619215557.875556819-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 20, 2014 at 3:26 AM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> Signed-off-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/spear320.dtsi |    5 +++++
>  1 file changed, 5 insertions(+)
>
> Index: linux/arch/arm/boot/dts/spear320.dtsi
> ===================================================================
> --- linux.orig/arch/arm/boot/dts/spear320.dtsi
> +++ linux/arch/arm/boot/dts/spear320.dtsi
> @@ -123,6 +123,11 @@
>                                 status = "disabled";
>                         };
>
> +                       i2c1: i2c@a7000000 {
> +                               interrupts = <21>;
> +                               interrupt-parent = <&shirq>;
> +                       };

Isn't this already available ?

                        i2c1: i2c@a7000000 {
                                #address-cells = <1>;
                                #size-cells = <0>;
                                compatible = "snps,designware-i2c";
                                reg = <0xa7000000 0x1000>;
                                interrupts = <21>;
                                interrupt-parent = <&shirq>;
                                status = "disabled";
                        };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
