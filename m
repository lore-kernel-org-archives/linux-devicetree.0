From: Youlin Pei <youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] binding: irqchip: mtk-cirq: Add binding document
Date: Tue, 15 Nov 2016 11:09:49 +0800
Message-ID: <1479179389.10566.11.camel@mtksdaap41>
References: <1478001122-8664-1-git-send-email-youlin.pei@mediatek.com>
         <1478001122-8664-2-git-send-email-youlin.pei@mediatek.com>
         <20161109182613.7tvzewua6ewxdvjc@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161109182613.7tvzewua6ewxdvjc@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chieh-jay.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2016-11-09 at 12:26 -0600, Rob Herring wrote:
> On Tue, Nov 01, 2016 at 07:52:00PM +0800, Youlin Pei wrote:
> > This commit adds the device tree binding document for
> > the mediatek cirq.
> > 
> > Signed-off-by: Youlin Pei <youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../interrupt-controller/mediatek,cirq.txt         |   30 ++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
> > new file mode 100644
> > index 0000000..84e8123
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
> > @@ -0,0 +1,30 @@
> > +* Mediatek 27xx cirq
> > +
> > +In Mediatek SOCs, the CIRQ is a low power interrupt controller designed to
> > +works outside MCUSYS which comprises with Cortex-Ax cores,CCI and GIC.
> 
> s/works/work/

will fix in next version.

> 
> > +The external interrupts (outside MCUSYS) will feed through CIRQ and connect
> > +to GIC in MCUSYS. When CIRQ is enabled, it will record the edge-sensitive
> > +interrupts and generated a pulse signal to parent interrupt controller when
> 
> s/generated/generate/

will fix in next version.

> 
> > +flush command is executed. With CIRQ, MCUSYS can be completely turned off
> > +to improve the system power consumption without losing interrupts.
> > +
> > +Required properties:
> > +- compatible: should be: "mediatek,mtk-cirq".
> 
> This should be SoC specific. This is fine as a fallback if the same 
> block is in many SoCs, but mediatek and mtk is a bit redundant.
> 

In next version, i will improve as following:
- compatible: Should be one of 
  - "mediatek,mt2701-cirq" for mt2701 CIRQ
  - "mediatek,mt8173-cirq" for mt8173 CIRQ
  - "mediatek,mt8135-cirq" for mt8135 CIRQ
  and "mediatek,cirq" as a fallback.

> > +- interrupt-controller : Identifies the node as an interrupt controller.
> > +- #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
> > +- interrupt-parent: phandle of irq parent for cirq. The parent must
> > +  use the same interrupt-cells format as GIC.
> > +- reg: Physical base address of the cirq registers and length of memory
> > +  mapped region.
> > +- mediatek,ext-irq-start: Identifies external irq start number in different
> > +  SOCs.
> 
> Wouldn't this always be 32 if the GIC is the parent? If 32 is the common 
> case, then use the SoC compatible to determine this value.
> 

ext-irq-start is not always 32. In different Socs, this value is
different.
Thanks a lot!

> > +
> > +Example:
> > +	cirq: interrupt-controller@10204000 {
> > +		compatible = "mediatek,mtk-cirq";
> > +		interrupt-controller;
> > +		#interrupt-cells = <3>;
> > +		interrupt-parent = <&sysirq>;
> > +		reg = <0 0x10204000 0 0x4000>;
> > +		mediatek,ext-irq-start = <32>;
> > +	};
> > -- 
> > 1.7.9.5
> > 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
