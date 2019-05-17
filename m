Return-Path: <guoren@kernel.org>
MIME-Version: 1.0
References: <1557741339-29331-1-git-send-email-guoren@kernel.org> <1557741339-29331-2-git-send-email-guoren@kernel.org>
In-Reply-To: <1557741339-29331-2-git-send-email-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 17 May 2019 14:37:44 +0800
Message-ID: <CAJF2gTSL4v5NV5MUZO814Qv9zem+7ddFVENVq5k8qQA0oANbYA@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] irqchip/irq-csky-mpintc: Add triger type and priority
Content-Type: multipart/alternative; boundary="0000000000007a28f105890f9f0f"
To: marc.zyngier@arm.com, robh+dt@kernel.org
Cc: mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jason@lakedaemon.net, tglx@linutronix.de, Ren Guo <ren_guo@c-sky.com>
List-ID: <devicetree@vger.kernel.org>

--0000000000007a28f105890f9f0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marc,

ping ... Any advice about the patch ? :)

Thx
 Guo Ren

<guoren@kernel.org> =E4=BA=8E2019=E5=B9=B45=E6=9C=8813=E6=97=A5=E5=91=A8=E4=
=B8=80 =E4=B8=8B=E5=8D=885:55=E5=86=99=E9=81=93=EF=BC=9A

> From: Guo Ren <ren_guo@c-sky.com>
>
> Support 4 triger types:
>  - IRQ_TYPE_LEVEL_HIGH
>  - IRQ_TYPE_LEVEL_LOW
>  - IRQ_TYPE_EDGE_RISING
>  - IRQ_TYPE_EDGE_FALLING
>
> Support 0-255 priority setting for each irq.
>
> All of above could be set in DeviceTree file and it still compatible
> with the old DeviceTree format.
>
> Changes for V3:
>  - Use IRQ_TYPE_LEVEL_HIGH as default instead of IRQ_TYPE_NONE
>  - Remove unnecessary loop in csky_mpintc_handler
>
> Changes for V2:
>  - Fixup this_cpu_read() preempted problem.
>  - Optimize the coding style.
>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> ---
>  drivers/irqchip/irq-csky-mpintc.c | 113
> +++++++++++++++++++++++++++++++++++---
>  1 file changed, 106 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/irqchip/irq-csky-mpintc.c
> b/drivers/irqchip/irq-csky-mpintc.c
> index c67c961..5bc0868 100644
> --- a/drivers/irqchip/irq-csky-mpintc.c
> +++ b/drivers/irqchip/irq-csky-mpintc.c
> @@ -17,6 +17,7 @@
>  #include <asm/reg_ops.h>
>
>  static struct irq_domain *root_domain;
> +
>  static void __iomem *INTCG_base;
>  static void __iomem *INTCL_base;
>
> @@ -29,11 +30,13 @@ static void __iomem *INTCL_base;
>
>  #define INTCG_ICTLR    0x0
>  #define INTCG_CICFGR   0x100
> +#define INTCG_CIPRTR   0x200
>  #define INTCG_CIDSTR   0x1000
>
>  #define INTCL_PICTLR   0x0
> +#define INTCL_CFGR     0x14
> +#define INTCL_PRTR     0x20
>  #define INTCL_SIGR     0x60
> -#define INTCL_HPPIR    0x68
>  #define INTCL_RDYIR    0x6c
>  #define INTCL_SENR     0xa0
>  #define INTCL_CENR     0xa4
> @@ -41,21 +44,66 @@ static void __iomem *INTCL_base;
>
>  static DEFINE_PER_CPU(void __iomem *, intcl_reg);
>
> +static unsigned long *__trigger;
> +static unsigned long *__priority;
> +
> +#define IRQ_OFFSET(irq) ((irq < COMM_IRQ_BASE) ? irq : (irq -
> COMM_IRQ_BASE))
> +
> +#define TRIG_BYTE_OFFSET(i)    ((((i) * 2) / 32) * 4)
> +#define TRIG_BIT_OFFSET(i)      (((i) * 2) % 32)
> +
> +#define PRI_BYTE_OFFSET(i)     ((((i) * 8) / 32) * 4)
> +#define PRI_BIT_OFFSET(i)       (((i) * 8) % 32)
> +
> +#define TRIG_VAL(trigger, irq) (trigger <<
> TRIG_BIT_OFFSET(IRQ_OFFSET(irq)))
> +#define TRIG_VAL_MSK(irq)          (~(3 <<
> TRIG_BIT_OFFSET(IRQ_OFFSET(irq))))
> +#define PRI_VAL(priority, irq) (priority <<
> PRI_BIT_OFFSET(IRQ_OFFSET(irq)))
> +#define PRI_VAL_MSK(irq)         (~(0xff <<
> PRI_BIT_OFFSET(IRQ_OFFSET(irq))))
> +
> +#define TRIG_BASE(irq) \
> +       (TRIG_BYTE_OFFSET(IRQ_OFFSET(irq)) + ((irq < COMM_IRQ_BASE) ? \
> +       (this_cpu_read(intcl_reg) + INTCL_CFGR) : (INTCG_base +
> INTCG_CICFGR)))
> +
> +#define PRI_BASE(irq) \
> +       (PRI_BYTE_OFFSET(IRQ_OFFSET(irq)) + ((irq < COMM_IRQ_BASE) ? \
> +       (this_cpu_read(intcl_reg) + INTCL_PRTR) : (INTCG_base +
> INTCG_CIPRTR)))
> +
> +static DEFINE_SPINLOCK(setup_lock);
> +static void setup_trigger_priority(unsigned long irq, unsigned long
> trigger,
> +                                  unsigned long priority)
> +{
> +       unsigned int tmp;
> +
> +       spin_lock(&setup_lock);
> +
> +       /* setup trigger */
> +       tmp =3D readl_relaxed(TRIG_BASE(irq)) & TRIG_VAL_MSK(irq);
> +
> +       writel_relaxed(tmp | TRIG_VAL(trigger, irq), TRIG_BASE(irq));
> +
> +       /* setup priority */
> +       tmp =3D readl_relaxed(PRI_BASE(irq)) & PRI_VAL_MSK(irq);
> +
> +       writel_relaxed(tmp | PRI_VAL(priority, irq), PRI_BASE(irq));
> +
> +       spin_unlock(&setup_lock);
> +}
> +
>  static void csky_mpintc_handler(struct pt_regs *regs)
>  {
>         void __iomem *reg_base =3D this_cpu_read(intcl_reg);
>
> -       do {
> -               handle_domain_irq(root_domain,
> -                                 readl_relaxed(reg_base + INTCL_RDYIR),
> -                                 regs);
> -       } while (readl_relaxed(reg_base + INTCL_HPPIR) & BIT(31));
> +       handle_domain_irq(root_domain,
> +               readl_relaxed(reg_base + INTCL_RDYIR), regs);
>  }
>
>  static void csky_mpintc_enable(struct irq_data *d)
>  {
>         void __iomem *reg_base =3D this_cpu_read(intcl_reg);
>
> +       setup_trigger_priority(d->hwirq, __trigger[d->hwirq],
> +                                __priority[d->hwirq]);
> +
>         writel_relaxed(d->hwirq, reg_base + INTCL_SENR);
>  }
>
> @@ -73,6 +121,28 @@ static void csky_mpintc_eoi(struct irq_data *d)
>         writel_relaxed(d->hwirq, reg_base + INTCL_CACR);
>  }
>
> +static int csky_mpintc_set_type(struct irq_data *d, unsigned int type)
> +{
> +       switch (type & IRQ_TYPE_SENSE_MASK) {
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               __trigger[d->hwirq] =3D 0;
> +               break;
> +       case IRQ_TYPE_LEVEL_LOW:
> +               __trigger[d->hwirq] =3D 1;
> +               break;
> +       case IRQ_TYPE_EDGE_RISING:
> +               __trigger[d->hwirq] =3D 2;
> +               break;
> +       case IRQ_TYPE_EDGE_FALLING:
> +               __trigger[d->hwirq] =3D 3;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
>  #ifdef CONFIG_SMP
>  static int csky_irq_set_affinity(struct irq_data *d,
>                                  const struct cpumask *mask_val,
> @@ -105,6 +175,7 @@ static struct irq_chip csky_irq_chip =3D {
>         .irq_eoi        =3D csky_mpintc_eoi,
>         .irq_enable     =3D csky_mpintc_enable,
>         .irq_disable    =3D csky_mpintc_disable,
> +       .irq_set_type   =3D csky_mpintc_set_type,
>  #ifdef CONFIG_SMP
>         .irq_set_affinity =3D csky_irq_set_affinity,
>  #endif
> @@ -125,9 +196,29 @@ static int csky_irqdomain_map(struct irq_domain *d,
> unsigned int irq,
>         return 0;
>  }
>
> +static int csky_irq_domain_xlate_cells(struct irq_domain *d,
> +               struct device_node *ctrlr, const u32 *intspec,
> +               unsigned int intsize, unsigned long *out_hwirq,
> +               unsigned int *out_type)
> +{
> +       if (WARN_ON(intsize < 1))
> +               return -EINVAL;
> +
> +       *out_hwirq =3D intspec[0];
> +       if (intsize > 1)
> +               *out_type =3D intspec[1] & IRQ_TYPE_SENSE_MASK;
> +       else
> +               *out_type =3D IRQ_TYPE_LEVEL_HIGH;
> +
> +       if (intsize > 2)
> +               __priority[*out_hwirq] =3D intspec[2];
> +
> +       return 0;
> +}
> +
>  static const struct irq_domain_ops csky_irqdomain_ops =3D {
>         .map    =3D csky_irqdomain_map,
> -       .xlate  =3D irq_domain_xlate_onecell,
> +       .xlate  =3D csky_irq_domain_xlate_cells,
>  };
>
>  #ifdef CONFIG_SMP
> @@ -161,6 +252,14 @@ csky_mpintc_init(struct device_node *node, struct
> device_node *parent)
>         if (ret < 0)
>                 nr_irq =3D INTC_IRQS;
>
> +       __priority =3D kcalloc(nr_irq, sizeof(unsigned long), GFP_KERNEL)=
;
> +       if (__priority =3D=3D NULL)
> +               return -ENXIO;
> +
> +       __trigger  =3D kcalloc(nr_irq, sizeof(unsigned long), GFP_KERNEL)=
;
> +       if (__trigger =3D=3D NULL)
> +               return -ENXIO;
> +
>         if (INTCG_base =3D=3D NULL) {
>                 INTCG_base =3D ioremap(mfcr("cr<31, 14>"),
>                                      INTCL_SIZE*nr_cpu_ids + INTCG_SIZE);
> --
> 2.7.4
>
>

--0000000000007a28f105890f9f0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Marc,<br><br>ping ... Any advice about the patch ? :)<b=
r><br>Thx<br>=C2=A0Guo Ren</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">&lt;<a href=3D"mailto:guoren@kernel.org">guoren@k=
ernel.org</a>&gt; =E4=BA=8E2019=E5=B9=B45=E6=9C=8813=E6=97=A5=E5=91=A8=E4=
=B8=80 =E4=B8=8B=E5=8D=885:55=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">From: Guo Ren &lt;<a href=3D"mailt=
o:ren_guo@c-sky.com" target=3D"_blank">ren_guo@c-sky.com</a>&gt;<br>
<br>
Support 4 triger types:<br>
=C2=A0- IRQ_TYPE_LEVEL_HIGH<br>
=C2=A0- IRQ_TYPE_LEVEL_LOW<br>
=C2=A0- IRQ_TYPE_EDGE_RISING<br>
=C2=A0- IRQ_TYPE_EDGE_FALLING<br>
<br>
Support 0-255 priority setting for each irq.<br>
<br>
All of above could be set in DeviceTree file and it still compatible<br>
with the old DeviceTree format.<br>
<br>
Changes for V3:<br>
=C2=A0- Use IRQ_TYPE_LEVEL_HIGH as default instead of IRQ_TYPE_NONE<br>
=C2=A0- Remove unnecessary loop in csky_mpintc_handler<br>
<br>
Changes for V2:<br>
=C2=A0- Fixup this_cpu_read() preempted problem.<br>
=C2=A0- Optimize the coding style.<br>
<br>
Signed-off-by: Guo Ren &lt;<a href=3D"mailto:ren_guo@c-sky.com" target=3D"_=
blank">ren_guo@c-sky.com</a>&gt;<br>
Cc: Marc Zyngier &lt;<a href=3D"mailto:marc.zyngier@arm.com" target=3D"_bla=
nk">marc.zyngier@arm.com</a>&gt;<br>
---<br>
=C2=A0drivers/irqchip/irq-csky-mpintc.c | 113 +++++++++++++++++++++++++++++=
++++++---<br>
=C2=A01 file changed, 106 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/drivers/irqchip/irq-csky-mpintc.c b/drivers/irqchip/irq-csky-m=
pintc.c<br>
index c67c961..5bc0868 100644<br>
--- a/drivers/irqchip/irq-csky-mpintc.c<br>
+++ b/drivers/irqchip/irq-csky-mpintc.c<br>
@@ -17,6 +17,7 @@<br>
=C2=A0#include &lt;asm/reg_ops.h&gt;<br>
<br>
=C2=A0static struct irq_domain *root_domain;<br>
+<br>
=C2=A0static void __iomem *INTCG_base;<br>
=C2=A0static void __iomem *INTCL_base;<br>
<br>
@@ -29,11 +30,13 @@ static void __iomem *INTCL_base;<br>
<br>
=C2=A0#define INTCG_ICTLR=C2=A0 =C2=A0 0x0<br>
=C2=A0#define INTCG_CICFGR=C2=A0 =C2=A00x100<br>
+#define INTCG_CIPRTR=C2=A0 =C2=A00x200<br>
=C2=A0#define INTCG_CIDSTR=C2=A0 =C2=A00x1000<br>
<br>
=C2=A0#define INTCL_PICTLR=C2=A0 =C2=A00x0<br>
+#define INTCL_CFGR=C2=A0 =C2=A0 =C2=A00x14<br>
+#define INTCL_PRTR=C2=A0 =C2=A0 =C2=A00x20<br>
=C2=A0#define INTCL_SIGR=C2=A0 =C2=A0 =C2=A00x60<br>
-#define INTCL_HPPIR=C2=A0 =C2=A0 0x68<br>
=C2=A0#define INTCL_RDYIR=C2=A0 =C2=A0 0x6c<br>
=C2=A0#define INTCL_SENR=C2=A0 =C2=A0 =C2=A00xa0<br>
=C2=A0#define INTCL_CENR=C2=A0 =C2=A0 =C2=A00xa4<br>
@@ -41,21 +44,66 @@ static void __iomem *INTCL_base;<br>
<br>
=C2=A0static DEFINE_PER_CPU(void __iomem *, intcl_reg);<br>
<br>
+static unsigned long *__trigger;<br>
+static unsigned long *__priority;<br>
+<br>
+#define IRQ_OFFSET(irq) ((irq &lt; COMM_IRQ_BASE) ? irq : (irq - COMM_IRQ_=
BASE))<br>
+<br>
+#define TRIG_BYTE_OFFSET(i)=C2=A0 =C2=A0 ((((i) * 2) / 32) * 4)<br>
+#define TRIG_BIT_OFFSET(i)=C2=A0 =C2=A0 =C2=A0 (((i) * 2) % 32)<br>
+<br>
+#define PRI_BYTE_OFFSET(i)=C2=A0 =C2=A0 =C2=A0((((i) * 8) / 32) * 4)<br>
+#define PRI_BIT_OFFSET(i)=C2=A0 =C2=A0 =C2=A0 =C2=A0(((i) * 8) % 32)<br>
+<br>
+#define TRIG_VAL(trigger, irq) (trigger &lt;&lt; TRIG_BIT_OFFSET(IRQ_OFFSE=
T(irq)))<br>
+#define TRIG_VAL_MSK(irq)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (~(3 &lt;&lt; =
TRIG_BIT_OFFSET(IRQ_OFFSET(irq))))<br>
+#define PRI_VAL(priority, irq) (priority &lt;&lt; PRI_BIT_OFFSET(IRQ_OFFSE=
T(irq)))<br>
+#define PRI_VAL_MSK(irq)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(~(0xff &lt;&lt;=
 PRI_BIT_OFFSET(IRQ_OFFSET(irq))))<br>
+<br>
+#define TRIG_BASE(irq) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(TRIG_BYTE_OFFSET(IRQ_OFFSET(irq)) + ((irq &lt;=
 COMM_IRQ_BASE) ? \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(this_cpu_read(intcl_reg) + INTCL_CFGR) : (INTC=
G_base + INTCG_CICFGR)))<br>
+<br>
+#define PRI_BASE(irq) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(PRI_BYTE_OFFSET(IRQ_OFFSET(irq)) + ((irq &lt; =
COMM_IRQ_BASE) ? \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(this_cpu_read(intcl_reg) + INTCL_PRTR) : (INTC=
G_base + INTCG_CIPRTR)))<br>
+<br>
+static DEFINE_SPINLOCK(setup_lock);<br>
+static void setup_trigger_priority(unsigned long irq, unsigned long trigge=
r,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long priority)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int tmp;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock(&amp;setup_lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* setup trigger */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D readl_relaxed(TRIG_BASE(irq)) &amp; TRI=
G_VAL_MSK(irq);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(tmp | TRIG_VAL(trigger, irq), TR=
IG_BASE(irq));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* setup priority */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D readl_relaxed(PRI_BASE(irq)) &amp; PRI_=
VAL_MSK(irq);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(tmp | PRI_VAL(priority, irq), PR=
I_BASE(irq));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;setup_lock);<br>
+}<br>
+<br>
=C2=A0static void csky_mpintc_handler(struct pt_regs *regs)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void __iomem *reg_base =3D this_cpu_read(intcl_=
reg);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handle_domain_irq(r=
oot_domain,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0readl_relaxed(reg_base + INTCL=
_RDYIR),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} while (readl_relaxed(reg_base + INTCL_HPPIR) =
&amp; BIT(31));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0handle_domain_irq(root_domain,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0readl_relaxed(reg_b=
ase + INTCL_RDYIR), regs);<br>
=C2=A0}<br>
<br>
=C2=A0static void csky_mpintc_enable(struct irq_data *d)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void __iomem *reg_base =3D this_cpu_read(intcl_=
reg);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0setup_trigger_priority(d-&gt;hwirq, __trigger[d=
-&gt;hwirq],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __priority[d-&gt;hwirq]);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 writel_relaxed(d-&gt;hwirq, reg_base + INTCL_SE=
NR);<br>
=C2=A0}<br>
<br>
@@ -73,6 +121,28 @@ static void csky_mpintc_eoi(struct irq_data *d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 writel_relaxed(d-&gt;hwirq, reg_base + INTCL_CA=
CR);<br>
=C2=A0}<br>
<br>
+static int csky_mpintc_set_type(struct irq_data *d, unsigned int type)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (type &amp; IRQ_TYPE_SENSE_MASK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case IRQ_TYPE_LEVEL_HIGH:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__trigger[d-&gt;hwi=
rq] =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case IRQ_TYPE_LEVEL_LOW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__trigger[d-&gt;hwi=
rq] =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case IRQ_TYPE_EDGE_RISING:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__trigger[d-&gt;hwi=
rq] =3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case IRQ_TYPE_EDGE_FALLING:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__trigger[d-&gt;hwi=
rq] =3D 3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0#ifdef CONFIG_SMP<br>
=C2=A0static int csky_irq_set_affinity(struct irq_data *d,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct cpumask *mask_val=
,<br>
@@ -105,6 +175,7 @@ static struct irq_chip csky_irq_chip =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .irq_eoi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D csky_mp=
intc_eoi,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .irq_enable=C2=A0 =C2=A0 =C2=A0=3D csky_mpintc_=
enable,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .irq_disable=C2=A0 =C2=A0 =3D csky_mpintc_disab=
le,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_set_type=C2=A0 =C2=A0=3D csky_mpintc_set_t=
ype,<br>
=C2=A0#ifdef CONFIG_SMP<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .irq_set_affinity =3D csky_irq_set_affinity,<br=
>
=C2=A0#endif<br>
@@ -125,9 +196,29 @@ static int csky_irqdomain_map(struct irq_domain *d, un=
signed int irq,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
+static int csky_irq_domain_xlate_cells(struct irq_domain *d,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node =
*ctrlr, const u32 *intspec,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int intsiz=
e, unsigned long *out_hwirq,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int *out_t=
ype)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (WARN_ON(intsize &lt; 1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*out_hwirq =3D intspec[0];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (intsize &gt; 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*out_type =3D intsp=
ec[1] &amp; IRQ_TYPE_SENSE_MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*out_type =3D IRQ_T=
YPE_LEVEL_HIGH;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (intsize &gt; 2)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__priority[*out_hwi=
rq] =3D intspec[2];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0static const struct irq_domain_ops csky_irqdomain_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .map=C2=A0 =C2=A0 =3D csky_irqdomain_map,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.xlate=C2=A0 =3D irq_domain_xlate_onecell,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.xlate=C2=A0 =3D csky_irq_domain_xlate_cells,<b=
r>
=C2=A0};<br>
<br>
=C2=A0#ifdef CONFIG_SMP<br>
@@ -161,6 +252,14 @@ csky_mpintc_init(struct device_node *node, struct devi=
ce_node *parent)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nr_irq =3D INTC_IRQ=
S;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__priority =3D kcalloc(nr_irq, sizeof(unsigned =
long), GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (__priority =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENXIO;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__trigger=C2=A0 =3D kcalloc(nr_irq, sizeof(unsi=
gned long), GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (__trigger =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENXIO;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (INTCG_base =3D=3D NULL) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INTCG_base =3D iore=
map(mfcr(&quot;cr&lt;31, 14&gt;&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INTCL_SIZE*nr_cp=
u_ids + INTCG_SIZE);<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div>

--0000000000007a28f105890f9f0f--
