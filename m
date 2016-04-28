Return-Path: <jon.mason@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <1461866399-1725-4-git-send-email-chris.brand@broadcom.com>
References: <1461866399-1725-1-git-send-email-chris.brand@broadcom.com>
	<1461866399-1725-4-git-send-email-chris.brand@broadcom.com>
Date: Thu, 28 Apr 2016 14:11:45 -0400
Message-ID: <CAC3K-4oMNmiT6rtqYh3sCHx=uw2kBD23f3=i8ZdjL=F2VtRgZA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm: modify Broadcom CPU enable method
From: Jon Mason <jon.mason@broadcom.com>
Content-Type: multipart/alternative; boundary=14dae9340bb990d3f905318f7552
To: Chris Brand <chris.brand@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, " "@lbrmn-lnxub61.ric.broadcom.com
List-ID: <devicetree@vger.kernel.org>

--14dae9340bb990d3f905318f7552
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 28, 2016 at 1:59 PM, Chris Brand <chris.brand@broadcom.com>
wrote:

> Commit 84320e1a635fcf90cff4185f029ce9e31bf1d4a7
> ("ARM: BCM: Clean up SMP support for Broadcom Kona") moved the
> "secondary-boot-reg" property from the "cpus" node to the individual "cpu"
> nodes but negelected to actually support multiple "secondary-boot-reg"
> properties.
>
> This patchset rectifies that omission. Note that the behaviour is changed
> slightly in that the "secondary-boot-reg" property is now read in
> smp_boot_secondary() rather than smp_prepare_cpus(). This means that any
> omissions will now only be reported when and if the cpu in question is
> being
> brought up. It also means that an omission for one cpu will not force
> uniprocessor mode.
>
> Signed-off-by: Chris Brand <chris.brand@broadcom.com>
>

Looks good to me.  Also, I verified that it works on NSP.

Reviewed-and-Tested-by: Jon Mason <jonmason@broadcom.com>



> ---
>  arch/arm/mach-bcm/platsmp.c | 116
> ++++++++++++++------------------------------
>  1 file changed, 37 insertions(+), 79 deletions(-)
>
> diff --git a/arch/arm/mach-bcm/platsmp.c b/arch/arm/mach-bcm/platsmp.c
> index cfae9c71fb74..5e53cf2fc052 100644
> --- a/arch/arm/mach-bcm/platsmp.c
> +++ b/arch/arm/mach-bcm/platsmp.c
> @@ -37,9 +37,6 @@
>  #define OF_SECONDARY_BOOT      "secondary-boot-reg"
>  #define MPIDR_CPUID_BITMASK    0x3
>
> -/* I/O address of register used to coordinate secondary core startup */
> -static u32     secondary_boot_addr;
> -
>  /*
>   * Enable the Cortex A9 Snoop Control Unit
>   *
> @@ -81,20 +78,40 @@ static int __init scu_a9_enable(void)
>         return 0;
>  }
>
> -static int nsp_write_lut(void)
> +static u32 secondary_boot_addr_for(unsigned int cpu)
> +{
> +       u32 secondary_boot_addr = 0;
> +       struct device_node *cpu_node = of_get_cpu_node(cpu, NULL);
> +
> +        if (!cpu_node) {
> +               pr_err("Failed to find device tree node for CPU%u\n", cpu);
> +               return 0;
> +       }
> +
> +       if (of_property_read_u32(cpu_node,
> +                                OF_SECONDARY_BOOT,
> +                                &secondary_boot_addr))
> +               pr_err("required secondary boot register not specified for
> CPU%u\n",
> +                       cpu);
> +
> +       of_node_put(cpu_node);
> +
> +       return secondary_boot_addr;
> +}
> +
> +static int nsp_write_lut(unsigned int cpu)
>  {
>         void __iomem *sku_rom_lut;
>         phys_addr_t secondary_startup_phy;
> +       const u32 secondary_boot_addr = secondary_boot_addr_for(cpu);
>
> -       if (!secondary_boot_addr) {
> -               pr_warn("required secondary boot register not
> specified\n");
> +       if (!secondary_boot_addr)
>                 return -EINVAL;
> -       }
>
>         sku_rom_lut = ioremap_nocache((phys_addr_t)secondary_boot_addr,
> -
>  sizeof(secondary_boot_addr));
> +                                     sizeof(phys_addr_t));
>         if (!sku_rom_lut) {
> -               pr_warn("unable to ioremap SKU-ROM LUT register\n");
> +               pr_warn("unable to ioremap SKU-ROM LUT register for cpu
> %u\n", cpu);
>                 return -ENOMEM;
>         }
>
> @@ -113,70 +130,12 @@ static int nsp_write_lut(void)
>
>  static void __init bcm_smp_prepare_cpus(unsigned int max_cpus)
>  {
> -       static cpumask_t only_cpu_0 = { CPU_BITS_CPU0 };
> -       struct device_node *cpus_node = NULL;
> -       struct device_node *cpu_node = NULL;
> -       int ret;
> -
> -       /*
> -        * This function is only called via smp_ops->smp_prepare_cpu().
> -        * That only happens if a "/cpus" device tree node exists
> -        * and has an "enable-method" property that selects the SMP
> -        * operations defined herein.
> -        */
> -       cpus_node = of_find_node_by_path("/cpus");
> -       if (!cpus_node)
> -               return;
> -
> -       for_each_child_of_node(cpus_node, cpu_node) {
> -               u32 cpuid;
> -
> -               if (of_node_cmp(cpu_node->type, "cpu"))
> -                       continue;
> -
> -               if (of_property_read_u32(cpu_node, "reg", &cpuid)) {
> -                       pr_debug("%s: missing reg property\n",
> -                                    cpu_node->full_name);
> -                       ret = -ENOENT;
> -                       goto out;
> -               }
> -
> -               /*
> -                * "secondary-boot-reg" property should be defined only
> -                * for secondary cpu
> -                */
> -               if ((cpuid & MPIDR_CPUID_BITMASK) == 1) {
> -                       /*
> -                        * Our secondary enable method requires a
> -                        * "secondary-boot-reg" property to specify a
> register
> -                        * address used to request the ROM code boot a
> secondary
> -                        * core. If we have any trouble getting this we
> fall
> -                        * back to uniprocessor mode.
> -                        */
> -                       if (of_property_read_u32(cpu_node,
> -                                               OF_SECONDARY_BOOT,
> -                                               &secondary_boot_addr)) {
> -                               pr_warn("%s: no" OF_SECONDARY_BOOT
> "property\n",
> -                                       cpu_node->name);
> -                               ret = -ENOENT;
> -                               goto out;
> -                       }
> -               }
> -       }
> -
> -       /*
> -        * Enable the SCU on Cortex A9 based SoCs. If -ENOENT is
> -        * returned, the SoC reported a uniprocessor configuration.
> -        * We bail on any other error.
> -        */
> -       ret = scu_a9_enable();
> -out:
> -       of_node_put(cpu_node);
> -       of_node_put(cpus_node);
> +       const cpumask_t only_cpu_0 = { CPU_BITS_CPU0 };
>
> -       if (ret) {
> +       /* Enable the SCU on Cortex A9 based SoCs */
> +       if (scu_a9_enable()) {
>                 /* Update the CPU present map to reflect uniprocessor mode
> */
> -               pr_warn("disabling SMP\n");
> +               pr_warn("failed to enable A9 SCU - disabling SMP\n");
>                 init_cpu_present(&only_cpu_0);
>         }
>  }
> @@ -207,6 +166,7 @@ static int kona_boot_secondary(unsigned int cpu,
> struct task_struct *idle)
>         u32 cpu_id;
>         u32 boot_val;
>         bool timeout = false;
> +       const u32 secondary_boot_addr = secondary_boot_addr_for(cpu);
>
>         cpu_id = cpu_logical_map(cpu);
>         if (cpu_id & ~BOOT_ADDR_CPUID_MASK) {
> @@ -214,13 +174,11 @@ static int kona_boot_secondary(unsigned int cpu,
> struct task_struct *idle)
>                 return -EINVAL;
>         }
>
> -       if (!secondary_boot_addr) {
> -               pr_err("required secondary boot register not specified\n");
> +       if (!secondary_boot_addr)
>                 return -EINVAL;
> -       }
>
> -       boot_reg = ioremap_nocache(
> -                       (phys_addr_t)secondary_boot_addr, sizeof(u32));
> +       boot_reg = ioremap_nocache((phys_addr_t)secondary_boot_addr,
> +                                  sizeof(phys_addr_t));
>         if (!boot_reg) {
>                 pr_err("unable to map boot register for cpu %u\n", cpu_id);
>                 return -ENOMEM;
> @@ -263,7 +221,7 @@ static int nsp_boot_secondary(unsigned int cpu, struct
> task_struct *idle)
>          * After wake up, secondary core branches to the startup
>          * address programmed at SKU ROM LUT location.
>          */
> -       ret = nsp_write_lut();
> +       ret = nsp_write_lut(cpu);
>         if (ret) {
>                 pr_err("unable to write startup addr to SKU ROM LUT\n");
>                 goto out;
> @@ -276,12 +234,12 @@ out:
>         return ret;
>  }
>
> -static const struct smp_operations bcm_smp_ops __initconst = {
> +static const struct smp_operations kona_smp_ops __initconst = {
>         .smp_prepare_cpus       = bcm_smp_prepare_cpus,
>         .smp_boot_secondary     = kona_boot_secondary,
>  };
>  CPU_METHOD_OF_DECLARE(bcm_smp_bcm281xx, "brcm,bcm11351-cpu-method",
> -                       &bcm_smp_ops);
> +                       &kona_smp_ops);
>
>  static const struct smp_operations nsp_smp_ops __initconst = {
>         .smp_prepare_cpus       = bcm_smp_prepare_cpus,
> --
> 1.9.1
>
>

--14dae9340bb990d3f905318f7552
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Apr 28, 2016 at 1:59 PM, Chris Brand <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:chris.brand@broadcom.com" target=3D"_blank">chris.brand@broad=
com.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,2=
04,204);border-left-style:solid;padding-left:1ex">Commit 84320e1a635fcf90cf=
f4185f029ce9e31bf1d4a7<br>
(&quot;ARM: BCM: Clean up SMP support for Broadcom Kona&quot;) moved the<br=
>
&quot;secondary-boot-reg&quot; property from the &quot;cpus&quot; node to t=
he individual &quot;cpu&quot;<br>
nodes but negelected to actually support multiple &quot;secondary-boot-reg&=
quot;<br>
properties.<br>
<br>
This patchset rectifies that omission. Note that the behaviour is changed<b=
r>
slightly in that the &quot;secondary-boot-reg&quot; property is now read in=
<br>
smp_boot_secondary() rather than smp_prepare_cpus(). This means that any<br=
>
omissions will now only be reported when and if the cpu in question is bein=
g<br>
brought up. It also means that an omission for one cpu will not force<br>
uniprocessor mode.<br>
<br>
Signed-off-by: Chris Brand &lt;<a href=3D"mailto:chris.brand@broadcom.com">=
chris.brand@broadcom.com</a>&gt;<br></blockquote><div><br></div><div>Looks =
good to me.=C2=A0 Also, I verified that it works on NSP.</div><div><br></di=
v><div>Reviewed-and-Tested-by: Jon Mason &lt;<a href=3D"mailto:jonmason@bro=
adcom.com">jonmason@broadcom.com</a>&gt;</div><div><br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:soli=
d;padding-left:1ex">
---<br>
=C2=A0arch/arm/mach-bcm/platsmp.c | 116 ++++++++++++++---------------------=
---------<br>
=C2=A01 file changed, 37 insertions(+), 79 deletions(-)<br>
<br>
diff --git a/arch/arm/mach-bcm/platsmp.c b/arch/arm/mach-bcm/platsmp.c<br>
index cfae9c71fb74..5e53cf2fc052 100644<br>
--- a/arch/arm/mach-bcm/platsmp.c<br>
+++ b/arch/arm/mach-bcm/platsmp.c<br>
@@ -37,9 +37,6 @@<br>
=C2=A0#define OF_SECONDARY_BOOT=C2=A0 =C2=A0 =C2=A0 &quot;secondary-boot-re=
g&quot;<br>
=C2=A0#define MPIDR_CPUID_BITMASK=C2=A0 =C2=A0 0x3<br>
<br>
-/* I/O address of register used to coordinate secondary core startup */<br=
>
-static u32=C2=A0 =C2=A0 =C2=A0secondary_boot_addr;<br>
-<br>
=C2=A0/*<br>
=C2=A0 * Enable the Cortex A9 Snoop Control Unit<br>
=C2=A0 *<br>
@@ -81,20 +78,40 @@ static int __init scu_a9_enable(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
-static int nsp_write_lut(void)<br>
+static u32 secondary_boot_addr_for(unsigned int cpu)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 secondary_boot_addr =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *cpu_node =3D of_get_cpu_nod=
e(cpu, NULL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!cpu_node) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;Failed=
 to find device tree node for CPU%u\n&quot;, cpu);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_property_read_u32(cpu_node,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OF_SECONDARY_BOOT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;secondary_boot_addr))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;requir=
ed secondary boot register not specified for CPU%u\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cpu);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(cpu_node);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return secondary_boot_addr;<br>
+}<br>
+<br>
+static int nsp_write_lut(unsigned int cpu)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void __iomem *sku_rom_lut;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 phys_addr_t secondary_startup_phy;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const u32 secondary_boot_addr =3D secondary_boo=
t_addr_for(cpu);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!secondary_boot_addr) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_warn(&quot;requi=
red secondary boot register not specified\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!secondary_boot_addr)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sku_rom_lut =3D ioremap_nocache((phys_addr_t)se=
condary_boot_addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0sizeof(secondary_boot_addr));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(phys_addr=
_t));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!sku_rom_lut) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_warn(&quot;unabl=
e to ioremap SKU-ROM LUT register\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_warn(&quot;unabl=
e to ioremap SKU-ROM LUT register for cpu %u\n&quot;, cpu);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -113,70 +130,12 @@ static int nsp_write_lut(void)<br>
<br>
=C2=A0static void __init bcm_smp_prepare_cpus(unsigned int max_cpus)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0static cpumask_t only_cpu_0 =3D { CPU_BITS_CPU0=
 };<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *cpus_node =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *cpu_node =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This function is only called via smp_ops-&gt=
;smp_prepare_cpu().<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * That only happens if a &quot;/cpus&quot; dev=
ice tree node exists<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * and has an &quot;enable-method&quot; propert=
y that selects the SMP<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * operations defined herein.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cpus_node =3D of_find_node_by_path(&quot;/cpus&=
quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cpus_node)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_child_of_node(cpus_node, cpu_node) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cpuid;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_node_cmp(cpu=
_node-&gt;type, &quot;cpu&quot;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_property_rea=
d_u32(cpu_node, &quot;reg&quot;, &amp;cpuid)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pr_debug(&quot;%s: missing reg property\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_node-&gt;full_name=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D -ENOENT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto out;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * &quot;secondary-=
boot-reg&quot; property should be defined only<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * for secondary cp=
u<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((cpuid &amp; MP=
IDR_CPUID_BITMASK) =3D=3D 1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * Our secondary enable method requires a<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * &quot;secondary-boot-reg&quot; property to specify a register<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * address used to request the ROM code boot a secondary<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * core. If we have any trouble getting this we fall<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * back to uniprocessor mode.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (of_property_read_u32(cpu_node,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0OF_SECONDARY_BOOT,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&amp;secondary_boot_addr)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_warn(&quot;%s: no&quot; OF_SECONDA=
RY_BOOT &quot;property\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_node-=
&gt;name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENOENT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Enable the SCU on Cortex A9 based SoCs. If -=
ENOENT is<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * returned, the SoC reported a uniprocessor co=
nfiguration.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * We bail on any other error.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D scu_a9_enable();<br>
-out:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(cpu_node);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(cpus_node);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const cpumask_t only_cpu_0 =3D { CPU_BITS_CPU0 =
};<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable the SCU on Cortex A9 based SoCs */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (scu_a9_enable()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Update the CPU p=
resent map to reflect uniprocessor mode */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_warn(&quot;disab=
ling SMP\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_warn(&quot;faile=
d to enable A9 SCU - disabling SMP\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 init_cpu_present(&a=
mp;only_cpu_0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
@@ -207,6 +166,7 @@ static int kona_boot_secondary(unsigned int cpu, struct=
 task_struct *idle)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 cpu_id;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 boot_val;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool timeout =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const u32 secondary_boot_addr =3D secondary_boo=
t_addr_for(cpu);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_id =3D cpu_logical_map(cpu);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu_id &amp; ~BOOT_ADDR_CPUID_MASK) {<br>
@@ -214,13 +174,11 @@ static int kona_boot_secondary(unsigned int cpu, stru=
ct task_struct *idle)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!secondary_boot_addr) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;requir=
ed secondary boot register not specified\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!secondary_boot_addr)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0boot_reg =3D ioremap_nocache(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(phys_addr_t)secondary_boot_addr, sizeof(u32));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0boot_reg =3D ioremap_nocache((phys_addr_t)secon=
dary_boot_addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(phys_addr_t));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!boot_reg) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;unable=
 to map boot register for cpu %u\n&quot;, cpu_id);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
@@ -263,7 +221,7 @@ static int nsp_boot_secondary(unsigned int cpu, struct =
task_struct *idle)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* After wake up, secondary core branches =
to the startup<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* address programmed at SKU ROM LUT locat=
ion.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D nsp_write_lut();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D nsp_write_lut(cpu);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;unable=
 to write startup addr to SKU ROM LUT\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
@@ -276,12 +234,12 @@ out:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static const struct smp_operations bcm_smp_ops __initconst =3D {<br>
+static const struct smp_operations kona_smp_ops __initconst =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .smp_prepare_cpus=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 bcm_smp_prepare_cpus,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .smp_boot_secondary=C2=A0 =C2=A0 =C2=A0=3D kona=
_boot_secondary,<br>
=C2=A0};<br>
=C2=A0CPU_METHOD_OF_DECLARE(bcm_smp_bcm281xx, &quot;brcm,bcm11351-cpu-metho=
d&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;bcm_smp_ops);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;kona_smp_ops);<br>
<br>
=C2=A0static const struct smp_operations nsp_smp_ops __initconst =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .smp_prepare_cpus=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 bcm_smp_prepare_cpus,<br>
<span class=3D""><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div></div>

--14dae9340bb990d3f905318f7552--
