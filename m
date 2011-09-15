From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 5/5] ARM: gic: add OF based initialization
Date: Thu, 15 Sep 2011 13:25:52 +0530
Message-ID: <CAJuYYwSFu2HC+u2NY41+yw9tEyy85RKa4Dpm3SL+jbwS_OOA0A@mail.gmail.com>
References: <1316017900-19918-1-git-send-email-robherring2@gmail.com>
	<1316017900-19918-6-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1316017900-19918-6-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, marc.zyngier@arm.com, jamie@jamieiles.com, b-cousson@ti.com, shawn.guo@linaro.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 14 September 2011 22:01, Rob Herring <robherring2@gmail.com> wrote:
> From: Rob Herring <rob.herring@calxeda.com>
>
> This adds gic initialization using device tree data. The initializati=
on
> functions are intended to be called by a generic OF interrupt
> controller parsing function once the right pieces are in place.
>
> PPIs are handled using 3rd cell of interrupts properties to specify t=
he cpu
> mask the PPI is assigned to.
>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> ---
> =A0Documentation/devicetree/bindings/arm/gic.txt | =A0 53 +++++++++++=
+++++++++++++
> =A0arch/arm/common/gic.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 55 +++++++++++++++++++++++--
> =A0arch/arm/include/asm/hardware/gic.h =A0 =A0 =A0 =A0 =A0 | =A0 10 +=
++++
> =A03 files changed, 114 insertions(+), 4 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/arm/gic.txt

[...]


> diff --git a/arch/arm/common/gic.c b/arch/arm/common/gic.c
> index d1ccc72..14de380 100644
> --- a/arch/arm/common/gic.c
> +++ b/arch/arm/common/gic.c

[...]

> +void __init gic_of_init(struct device_node *node, struct device_node=
 *parent)
> +{
> + =A0 =A0 =A0 void __iomem *cpu_base;
> + =A0 =A0 =A0 void __iomem *dist_base;
> + =A0 =A0 =A0 int irq;
> + =A0 =A0 =A0 struct irq_domain *domain =3D &gic_data[gic_cnt].domain=
;
> +
> + =A0 =A0 =A0 if (WARN_ON(!node))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 dist_base =3D of_iomap(node, 0);
> + =A0 =A0 =A0 WARN(!dist_base, "unable to map gic dist registers\n");
> +
> + =A0 =A0 =A0 cpu_base =3D of_iomap(node, 1);
> + =A0 =A0 =A0 WARN(!cpu_base, "unable to map gic cpu registers\n");
> +
> + =A0 =A0 =A0 domain->nr_irq =3D gic_irq_count(dist_base);
> + =A0 =A0 =A0 domain->irq_base =3D irq_alloc_descs(-1, 0, domain->nr_=
irq, numa_node_id());

=46or exynos4, all the interrupts originating from GIC are statically
mapped to start from 32 in the linux virq space (GIC SPI interrupts
start from 64). In the above code, since irq_base would be 0 for
exynos4, the interrupt mapping is not working correctly. In your
previous version of the patch, you have given a option to the platform
code to choose the offset. Could that option be added to this series
also. Or a provision to use platform specific translate function
instead of the irq_domain_simple translator.

Thanks,
Thomas.

[...]
