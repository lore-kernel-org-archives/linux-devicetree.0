From: Lee Jones <ljkenny.mailinglists-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: GIC: Create common infrastructure for GIC DT
 bindings
Date: Fri, 23 Mar 2012 11:08:01 +0000
Message-ID: <CANmRt2hfNxpD56d+OwnkrONCcW5vkGQjQHfu=Ax-=74tRPZONA@mail.gmail.com>
References: <4bfe7af3761f6f40506a2089fd67866015f6d7f3.1332488625.git.viresh.kumar@st.com>
 <23b4d2ea357a7a785b6c42d0fa7ae9478bad552b.1332488625.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4414342784898197733=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <23b4d2ea357a7a785b6c42d0fa7ae9478bad552b.1332488625.git.viresh.kumar-qxv4g6HH51o@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, srinidhi.kasagar-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sr-ynQEQJNshbs@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============4414342784898197733==
Content-Type: multipart/alternative; boundary=047d7b2edf03b37cf304bbe709f4

--047d7b2edf03b37cf304bbe709f4
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 23, 2012 at 7:49 AM, Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org> wrote:

> Few platforms define there own struct of_device_id[] for GIC. They don't
> do anything specific in init_irq() other than of_irq_init().
>
> This patch creates this struct array in gic.c and make other platforms use
> it.
>
> Signed-off-by: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
> ---
>  arch/arm/common/gic.c               |   10 ++++++++++
>  arch/arm/include/asm/hardware/gic.h |    1 +
>  arch/arm/mach-exynos/common.c       |    9 +--------
>  arch/arm/mach-highbank/highbank.c   |    7 +------
>  arch/arm/mach-imx/mach-imx6q.c      |    2 +-
>  arch/arm/mach-tegra/common.c        |    7 +------
>  arch/arm/mach-ux500/cpu.c           |    7 +------
>  arch/arm/mach-vexpress/v2m.c        |   12 +-----------
>  8 files changed, 17 insertions(+), 38 deletions(-)
>
> diff --git a/arch/arm/common/gic.c b/arch/arm/common/gic.c
> index aa52699..77afdae 100644
> --- a/arch/arm/common/gic.c
> +++ b/arch/arm/common/gic.c
> @@ -781,4 +781,14 @@ int __init gic_of_init(struct device_node *node,
> struct device_node *parent)
>        gic_cnt++;
>        return 0;
>  }
> +
> +static const struct of_device_id gic_of_match[] __initconst = {
> +       { .compatible = "arm,cortex-a9-gic", .data = gic_of_init, },
> +       { /* Sentinel */ }
> +};
> +
> +void __init gic_init_irq(void)
> +{
> +       of_irq_init(gic_of_match);
> +}
>  #endif
> diff --git a/arch/arm/include/asm/hardware/gic.h
> b/arch/arm/include/asm/hardware/gic.h
> index 4b1ce6c..7bce4bd 100644
> --- a/arch/arm/include/asm/hardware/gic.h
> +++ b/arch/arm/include/asm/hardware/gic.h
> @@ -42,6 +42,7 @@ void gic_init_bases(unsigned int, int, void __iomem *,
> void __iomem *,
>                    u32 offset, struct device_node *);
>  int gic_of_init(struct device_node *node, struct device_node *parent);
>  void gic_secondary_init(unsigned int);
> +void __init gic_init_irq(void);
>  void gic_handle_irq(struct pt_regs *regs);
>  void gic_cascade_irq(unsigned int gic_nr, unsigned int irq);
>  void gic_raise_softirq(const struct cpumask *mask, unsigned int irq);
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index 85ed8b5..76f6079 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -502,13 +502,6 @@ static void __init combiner_init(unsigned int
> combiner_nr, void __iomem *base,
>        }
>  }
>
> -#ifdef CONFIG_OF
> -static const struct of_device_id exynos4_dt_irq_match[] = {
> -       { .compatible = "arm,cortex-a9-gic", .data = gic_of_init, },
> -       {},
> -};
> -#endif
> -
>  void __init exynos4_init_irq(void)
>  {
>        int irq;
> @@ -520,7 +513,7 @@ void __init exynos4_init_irq(void)
>                gic_init_bases(0, IRQ_PPI(0), S5P_VA_GIC_DIST,
> S5P_VA_GIC_CPU, gic_bank_offset, NULL);
>  #ifdef CONFIG_OF
>        else
> -               of_irq_init(exynos4_dt_irq_match);
> +               gic_init_irq();
>  #endif
>
>        for (irq = 0; irq < EXYNOS4_MAX_COMBINER_NR; irq++) {
> diff --git a/arch/arm/mach-highbank/highbank.c
> b/arch/arm/mach-highbank/highbank.c
> index 410a112..42b30c6 100644
> --- a/arch/arm/mach-highbank/highbank.c
> +++ b/arch/arm/mach-highbank/highbank.c
> @@ -80,14 +80,9 @@ void highbank_set_cpu_jump(int cpu, void *jump_addr)
>                          HB_JUMP_TABLE_PHYS(cpu) + 15);
>  }
>
> -const static struct of_device_id irq_match[] = {
> -       { .compatible = "arm,cortex-a9-gic", .data = gic_of_init, },
> -       {}
> -};
> -
>  static void __init highbank_init_irq(void)
>  {
> -       of_irq_init(irq_match);
> +       gic_init_irq();
>        l2x0_of_init(0, ~0UL);
>  }
>
> diff --git a/arch/arm/mach-imx/mach-imx6q.c
> b/arch/arm/mach-imx/mach-imx6q.c
> index 7696dfa..ebaf6c5 100644
> --- a/arch/arm/mach-imx/mach-imx6q.c
> +++ b/arch/arm/mach-imx/mach-imx6q.c
> @@ -105,7 +105,6 @@ static int __init imx6q_gpio_add_irq_domain(struct
> device_node *np,
>  }
>
>  static const struct of_device_id imx6q_irq_match[] __initconst = {
> -       { .compatible = "arm,cortex-a9-gic", .data = gic_of_init, },
>        { .compatible = "fsl,imx6q-gpio", .data =
> imx6q_gpio_add_irq_domain, },
>        { /* sentinel */ }
>  };
> @@ -115,6 +114,7 @@ static void __init imx6q_init_irq(void)
>        l2x0_of_init(0, ~0UL);
>        imx_src_init();
>        imx_gpc_init();
> +       gic_init_irq();
>        of_irq_init(imx6q_irq_match);
>  }
>
> diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c
> index 22df10f..c8d6208 100644
> --- a/arch/arm/mach-tegra/common.c
> +++ b/arch/arm/mach-tegra/common.c
> @@ -52,15 +52,10 @@ u32 tegra_uart_config[3] = {
>  };
>
>  #ifdef CONFIG_OF
> -static const struct of_device_id tegra_dt_irq_match[] __initconst = {
> -       { .compatible = "arm,cortex-a9-gic", .data = gic_of_init },
> -       { }
> -};
> -
>  void __init tegra_dt_init_irq(void)
>  {
>        tegra_init_irq();
> -       of_irq_init(tegra_dt_irq_match);
> +       gic_init_irq();
>  }
>  #endif
>
> diff --git a/arch/arm/mach-ux500/cpu.c b/arch/arm/mach-ux500/cpu.c
> index d11f389..3bb6f13 100644
> --- a/arch/arm/mach-ux500/cpu.c
> +++ b/arch/arm/mach-ux500/cpu.c
> @@ -30,11 +30,6 @@
>
>  void __iomem *_PRCMU_BASE;
>
> -static const struct of_device_id ux500_dt_irq_match[] = {
> -       { .compatible = "arm,cortex-a9-gic", .data = gic_of_init, },
> -       {},
> -};
> -
>  void __init ux500_init_irq(void)
>  {
>        void __iomem *dist_base;
> @@ -51,7 +46,7 @@ void __init ux500_init_irq(void)
>
>  #ifdef CONFIG_OF
>        if (of_have_populated_dt())
> -               of_irq_init(ux500_dt_irq_match);
> +               gic_init_irq();
>        else
>  #endif
>                gic_init(0, 29, dist_base, cpu_base);
> diff --git a/arch/arm/mach-vexpress/v2m.c b/arch/arm/mach-vexpress/v2m.c
> index 47cdcca..3d875f2 100644
> --- a/arch/arm/mach-vexpress/v2m.c
> +++ b/arch/arm/mach-vexpress/v2m.c
> @@ -619,16 +619,6 @@ void __init v2m_dt_init_early(void)
>        versatile_sched_clock_init(v2m_sysreg_base + V2M_SYS_24MHZ,
> 24000000);
>  }
>
> -static  struct of_device_id vexpress_irq_match[] __initdata = {
> -       { .compatible = "arm,cortex-a9-gic", .data = gic_of_init, },
> -       {}
> -};
> -
> -static void __init v2m_dt_init_irq(void)
> -{
> -       of_irq_init(vexpress_irq_match);
> -}
> -
>  static void __init v2m_dt_timer_init(void)
>  {
>        struct device_node *node;
> @@ -677,7 +667,7 @@ DT_MACHINE_START(VEXPRESS_DT, "ARM-Versatile Express")
>        .dt_compat      = v2m_dt_match,
>        .map_io         = v2m_dt_map_io,
>        .init_early     = v2m_dt_init_early,
> -       .init_irq       = v2m_dt_init_irq,
> +       .init_irq       = gic_init_irq,
>        .timer          = &v2m_dt_timer,
>        .init_machine   = v2m_dt_init,
>        .handle_irq     = gic_handle_irq,


Looks sensible.

For the ux500 stuff:

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

>

--047d7b2edf03b37cf304bbe709f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote">On Fri, Mar 23, 2012 at 7:49 AM, Viresh Kuma=
r <span dir=3D"ltr">&lt;<a href=3D"mailto:viresh.kumar-qxv4g6HH51o@public.gmane.org">viresh.kumar=
@st.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Few platforms define there own struct of_device_id[] for GIC. They don&#39;=
t<br>
do anything specific in init_irq() other than of_irq_init().<br>
<br>
This patch creates this struct array in gic.c and make other platforms use =
it.<br>
<br>
Signed-off-by: Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar-qxv4g6HH51o@public.gmane.org">vire=
sh.kumar-qxv4g6HH51o@public.gmane.org</a>&gt;<br>
---<br>
=C2=A0arch/arm/common/gic.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 10 ++++++++++<br>
=C2=A0arch/arm/include/asm/hardware/gic.h | =C2=A0 =C2=A01 +<br>
=C2=A0arch/arm/mach-exynos/common.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A09 +=
--------<br>
=C2=A0arch/arm/mach-highbank/highbank.c =C2=A0 | =C2=A0 =C2=A07 +------<br>
=C2=A0arch/arm/mach-imx/mach-imx6q.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +=
-<br>
=C2=A0arch/arm/mach-tegra/common.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A07 +------<br>
=C2=A0arch/arm/mach-ux500/cpu.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
 =C2=A07 +------<br>
=C2=A0arch/arm/mach-vexpress/v2m.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 12 +=
-----------<br>
=C2=A08 files changed, 17 insertions(+), 38 deletions(-)<br>
<br>
diff --git a/arch/arm/common/gic.c b/arch/arm/common/gic.c<br>
index aa52699..77afdae 100644<br>
--- a/arch/arm/common/gic.c<br>
+++ b/arch/arm/common/gic.c<br>
@@ -781,4 +781,14 @@ int __init gic_of_init(struct device_node *node, struc=
t device_node *parent)<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_cnt++;<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
+<br>
+static const struct of_device_id gic_of_match[] __initconst =3D {<br>
+ =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;arm,cortex-a9-gic&quot;, .da=
ta =3D gic_of_init, },<br>
+ =C2=A0 =C2=A0 =C2=A0 { /* Sentinel */ }<br>
+};<br>
+<br>
+void __init gic_init_irq(void)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 of_irq_init(gic_of_match);<br>
+}<br>
=C2=A0#endif<br>
diff --git a/arch/arm/include/asm/hardware/gic.h b/arch/arm/include/asm/har=
dware/gic.h<br>
index 4b1ce6c..7bce4bd 100644<br>
--- a/arch/arm/include/asm/hardware/gic.h<br>
+++ b/arch/arm/include/asm/hardware/gic.h<br>
@@ -42,6 +42,7 @@ void gic_init_bases(unsigned int, int, void __iomem *, vo=
id __iomem *,<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 o=
ffset, struct device_node *);<br>
=C2=A0int gic_of_init(struct device_node *node, struct device_node *parent)=
;<br>
=C2=A0void gic_secondary_init(unsigned int);<br>
+void __init gic_init_irq(void);<br>
=C2=A0void gic_handle_irq(struct pt_regs *regs);<br>
=C2=A0void gic_cascade_irq(unsigned int gic_nr, unsigned int irq);<br>
=C2=A0void gic_raise_softirq(const struct cpumask *mask, unsigned int irq);=
<br>
diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c<=
br>
index 85ed8b5..76f6079 100644<br>
--- a/arch/arm/mach-exynos/common.c<br>
+++ b/arch/arm/mach-exynos/common.c<br>
@@ -502,13 +502,6 @@ static void __init combiner_init(unsigned int combiner=
_nr, void __iomem *base,<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-#ifdef CONFIG_OF<br>
-static const struct of_device_id exynos4_dt_irq_match[] =3D {<br>
- =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;arm,cortex-a9-gic&quot;, .da=
ta =3D gic_of_init, },<br>
- =C2=A0 =C2=A0 =C2=A0 {},<br>
-};<br>
-#endif<br>
-<br>
=C2=A0void __init exynos4_init_irq(void)<br>
=C2=A0{<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0int irq;<br>
@@ -520,7 +513,7 @@ void __init exynos4_init_irq(void)<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_init_bases(0, I=
RQ_PPI(0), S5P_VA_GIC_DIST, S5P_VA_GIC_CPU, gic_bank_offset, NULL);<br>
=C2=A0#ifdef CONFIG_OF<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_irq_init(exynos4_dt_i=
rq_match);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gic_init_irq();<br>
=C2=A0#endif<br>
<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (irq =3D 0; irq &lt; EXYNOS4_MAX_COMBINER_N=
R; irq++) {<br>
diff --git a/arch/arm/mach-highbank/highbank.c b/arch/arm/mach-highbank/hig=
hbank.c<br>
index 410a112..42b30c6 100644<br>
--- a/arch/arm/mach-highbank/highbank.c<br>
+++ b/arch/arm/mach-highbank/highbank.c<br>
@@ -80,14 +80,9 @@ void highbank_set_cpu_jump(int cpu, void *jump_addr)<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0HB_JUMP_TABLE_PHYS(cpu) + 15);<br>
=C2=A0}<br>
<br>
-const static struct of_device_id irq_match[] =3D {<br>
- =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;arm,cortex-a9-gic&quot;, .da=
ta =3D gic_of_init, },<br>
- =C2=A0 =C2=A0 =C2=A0 {}<br>
-};<br>
-<br>
=C2=A0static void __init highbank_init_irq(void)<br>
=C2=A0{<br>
- =C2=A0 =C2=A0 =C2=A0 of_irq_init(irq_match);<br>
+ =C2=A0 =C2=A0 =C2=A0 gic_init_irq();<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0l2x0_of_init(0, ~0UL);<br>
=C2=A0}<br>
<br>
diff --git a/arch/arm/mach-imx/mach-imx6q.c b/arch/arm/mach-imx/mach-imx6q.=
c<br>
index 7696dfa..ebaf6c5 100644<br>
--- a/arch/arm/mach-imx/mach-imx6q.c<br>
+++ b/arch/arm/mach-imx/mach-imx6q.c<br>
@@ -105,7 +105,6 @@ static int __init imx6q_gpio_add_irq_domain(struct devi=
ce_node *np,<br>
=C2=A0}<br>
<br>
=C2=A0static const struct of_device_id imx6q_irq_match[] __initconst =3D {<=
br>
- =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;arm,cortex-a9-gic&quot;, .da=
ta =3D gic_of_init, },<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;fsl,imx6q-gpio&quot;, .=
data =3D imx6q_gpio_add_irq_domain, },<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ /* sentinel */ }<br>
=C2=A0};<br>
@@ -115,6 +114,7 @@ static void __init imx6q_init_irq(void)<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0l2x0_of_init(0, ~0UL);<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0imx_src_init();<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0imx_gpc_init();<br>
+ =C2=A0 =C2=A0 =C2=A0 gic_init_irq();<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_irq_init(imx6q_irq_match);<br>
=C2=A0}<br>
<br>
diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c<br=
>
index 22df10f..c8d6208 100644<br>
--- a/arch/arm/mach-tegra/common.c<br>
+++ b/arch/arm/mach-tegra/common.c<br>
@@ -52,15 +52,10 @@ u32 tegra_uart_config[3] =3D {<br>
=C2=A0};<br>
<br>
=C2=A0#ifdef CONFIG_OF<br>
-static const struct of_device_id tegra_dt_irq_match[] __initconst =3D {<br=
>
- =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;arm,cortex-a9-gic&quot;, .da=
ta =3D gic_of_init },<br>
- =C2=A0 =C2=A0 =C2=A0 { }<br>
-};<br>
-<br>
=C2=A0void __init tegra_dt_init_irq(void)<br>
=C2=A0{<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0tegra_init_irq();<br>
- =C2=A0 =C2=A0 =C2=A0 of_irq_init(tegra_dt_irq_match);<br>
+ =C2=A0 =C2=A0 =C2=A0 gic_init_irq();<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
diff --git a/arch/arm/mach-ux500/cpu.c b/arch/arm/mach-ux500/cpu.c<br>
index d11f389..3bb6f13 100644<br>
--- a/arch/arm/mach-ux500/cpu.c<br>
+++ b/arch/arm/mach-ux500/cpu.c<br>
@@ -30,11 +30,6 @@<br>
<br>
=C2=A0void __iomem *_PRCMU_BASE;<br>
<br>
-static const struct of_device_id ux500_dt_irq_match[] =3D {<br>
- =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;arm,cortex-a9-gic&quot;, .da=
ta =3D gic_of_init, },<br>
- =C2=A0 =C2=A0 =C2=A0 {},<br>
-};<br>
-<br>
=C2=A0void __init ux500_init_irq(void)<br>
=C2=A0{<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *dist_base;<br>
@@ -51,7 +46,7 @@ void __init ux500_init_irq(void)<br>
<br>
=C2=A0#ifdef CONFIG_OF<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_have_populated_dt())<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_irq_init(ux500_dt_irq=
_match);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gic_init_irq();<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0#endif<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_init(0, 29, dis=
t_base, cpu_base);<br>
diff --git a/arch/arm/mach-vexpress/v2m.c b/arch/arm/mach-vexpress/v2m.c<br=
>
index 47cdcca..3d875f2 100644<br>
--- a/arch/arm/mach-vexpress/v2m.c<br>
+++ b/arch/arm/mach-vexpress/v2m.c<br>
@@ -619,16 +619,6 @@ void __init v2m_dt_init_early(void)<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0versatile_sched_clock_init(v2m_sysreg_base + V2=
M_SYS_24MHZ, 24000000);<br>
=C2=A0}<br>
<br>
-static =C2=A0struct of_device_id vexpress_irq_match[] __initdata =3D {<br>
- =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;arm,cortex-a9-gic&quot;, .da=
ta =3D gic_of_init, },<br>
- =C2=A0 =C2=A0 =C2=A0 {}<br>
-};<br>
-<br>
-static void __init v2m_dt_init_irq(void)<br>
-{<br>
- =C2=A0 =C2=A0 =C2=A0 of_irq_init(vexpress_irq_match);<br>
-}<br>
-<br>
=C2=A0static void __init v2m_dt_timer_init(void)<br>
=C2=A0{<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *node;<br>
@@ -677,7 +667,7 @@ DT_MACHINE_START(VEXPRESS_DT, &quot;ARM-Versatile Expre=
ss&quot;)<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0.dt_compat =C2=A0 =C2=A0 =C2=A0=3D v2m_dt_match=
,<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0.map_io =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D v2m_dt_=
map_io,<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0.init_early =C2=A0 =C2=A0 =3D v2m_dt_init_early=
,<br>
- =C2=A0 =C2=A0 =C2=A0 .init_irq =C2=A0 =C2=A0 =C2=A0 =3D v2m_dt_init_irq,<=
br>
+ =C2=A0 =C2=A0 =C2=A0 .init_irq =C2=A0 =C2=A0 =C2=A0 =3D gic_init_irq,<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0.timer =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &a=
mp;v2m_dt_timer,<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0.init_machine =C2=A0 =3D v2m_dt_init,<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0.handle_irq =C2=A0 =C2=A0 =3D gic_handle_irq,</=
blockquote><div><br></div><div>Looks sensible.</div><div><br></div><div>For=
 the ux500 stuff:</div><div><br></div><div>Acked-by:=C2=A0Lee Jones &lt;<a =
href=3D"mailto:lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">=C2=A0</blockquote></div><br>

--047d7b2edf03b37cf304bbe709f4--

--===============4414342784898197733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4414342784898197733==--
