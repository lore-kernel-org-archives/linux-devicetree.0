From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a7795: Move nodes which have
 no reg property out of bus
Date: Mon, 27 Nov 2017 12:04:31 +0100
Message-ID: <20171127110430.ulgjrzgy3pdugs2s@verge.net.au>
References: <20171124105234.25774-1-horms+renesas@verge.net.au>
 <CAMuHMdW9V6Bkh5uS9qNA7awtygEs=qRd7jigwSHmpV2VM3n9dA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdW9V6Bkh5uS9qNA7awtygEs=qRd7jigwSHmpV2VM3n9dA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 24, 2017 at 12:09:47PM +0100, Geert Uytterhoeven wrote:
> On Fri, Nov 24, 2017 at 11:52 AM, Simon Horman
> <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> > Move pmu_a5[73], timer and thermal-zones nodes from soc node to root node.
> > The nodes that have been moved do not have any register properties and thus
> > shouldn't be placed on the bus.
> >
> > This problem is flagged by the compiler as follows:
> > $ make
> > ...
> >   DTC     arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb
> > arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/pmu_a57 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/pmu_a53 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/thermal-zones missing or empty reg/ranges property
> >   DTC     arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb
> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/pmu_a57 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/pmu_a53 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/thermal-zones missing or empty reg/ranges property
> >   DTC     arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb
> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/pmu_a57 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/pmu_a53 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/thermal-zones missing or empty reg/ranges property
> >   DTC     arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dtb
> > arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dtb: Warning (simple_bus_reg): Node /soc/pmu_a57 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dtb: Warning (simple_bus_reg): Node /soc/pmu_a53 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dtb: Warning (simple_bus_reg): Node /soc/thermal-zones missing or empty reg/ranges property
> >   DTC     arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dtb
> > arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/pmu_a57 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/pmu_a53 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/thermal-zones missing or empty reg/ranges property
> >   DTC     arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dtb
> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/pmu_a57 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/pmu_a53 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/thermal-zones missing or empty reg/ranges property
> >   DTC     arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb
> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/pmu_a57 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/pmu_a53 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/thermal-zones missing or empty reg/ranges property
> >
> > Signed-off-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
> > ---
> > v2
> > * Preserve alphabetical order of nodes present in root node.
> 
> Thanks for the update!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

I just noticed that with this patch applied I now see:

arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a57
arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a53
arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a57
arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a53arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (interrupts_property): Missing interrupt-parent for /timer

arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (interrupts_property): Missing interrupt-parent for /timer
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
