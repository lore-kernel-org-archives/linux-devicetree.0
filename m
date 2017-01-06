From: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: Re: [PATCHv3 2/5] arm: mvebu: support for SMP on 98DX3336 SoC
Date: Fri, 6 Jan 2017 08:41:13 +0000
Message-ID: <231adc7f589743e7a425be19cc28047a@svr-chch-ex1.atlnz.lc>
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
 <20170106041517.9589-1-chris.packham@alliedtelesis.co.nz>
 <20170106041517.9589-3-chris.packham@alliedtelesis.co.nz>
 <20170106063602.GM17126@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chris Brand <chris.brand-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Juri Lelli <juri.lelli-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/01/17 19:44, Stephen Boyd wrote:=0A=
> On 01/06, Chris Packham wrote:=0A=
>> diff --git a/arch/arm/mach-mvebu/platsmp.c b/arch/arm/mach-mvebu/platsmp=
.c=0A=
>> index 46c742d3bd41..3c9ab9a008ad 100644=0A=
>> --- a/arch/arm/mach-mvebu/platsmp.c=0A=
>> +++ b/arch/arm/mach-mvebu/platsmp.c=0A=
>> @@ -182,5 +182,48 @@ const struct smp_operations armada_xp_smp_ops __ini=
tconst =3D {=0A=
>>  #endif=0A=
>>  };=0A=
>>=0A=
>> +static int mv98dx3236_boot_secondary(unsigned int cpu, struct task_stru=
ct *idle)=0A=
>> +{=0A=
>> +	int ret, hw_cpu;=0A=
>> +=0A=
>> +	pr_info("Booting CPU %d\n", cpu);=0A=
>=0A=
> Doesn't the core already print something when bringing up CPUs?=0A=
> This message seems redundant.=0A=
>=0A=
=0A=
Copied from armada_xp_boot_secondary but that's no reason to keep it. =0A=
Will remove in v4.=0A=
=0A=
>> +=0A=
>> +	hw_cpu =3D cpu_logical_map(cpu);=0A=
>> +	set_secondary_cpu_clock(hw_cpu);=0A=
>> +	mv98dx3236_resume_set_cpu_boot_addr(hw_cpu,=0A=
>> +					    armada_xp_secondary_startup);=0A=
>> +=0A=
>> +	/*=0A=
>> +	 * This is needed to wake up CPUs in the offline state after=0A=
>> +	 * using CPU hotplug.=0A=
>> +	 */=0A=
>> +	arch_send_wakeup_ipi_mask(cpumask_of(cpu));=0A=
>> +=0A=
>> +	/*=0A=
>> +	 * This is needed to take secondary CPUs out of reset on the=0A=
>> +	 * initial boot.=0A=
>> +	 */=0A=
>> +	ret =3D mvebu_cpu_reset_deassert(hw_cpu);=0A=
>> +	if (ret) {=0A=
>> +		pr_warn("unable to boot CPU: %d\n", ret);=0A=
>> +		return ret;=0A=
>> +	}=0A=
>> +=0A=
>> +	return 0;=0A=
>> +}=0A=
>> +=0A=
>> +struct smp_operations mv98dx3236_smp_ops __initdata =3D {=0A=
>=0A=
> static const __initconst?=0A=
>=0A=
=0A=
Will do.=0A=
=0A=
>> +	.smp_init_cpus		=3D armada_xp_smp_init_cpus,=0A=
>> +	.smp_prepare_cpus	=3D armada_xp_smp_prepare_cpus,=0A=
>> +	.smp_boot_secondary	=3D mv98dx3236_boot_secondary,=0A=
>> +	.smp_secondary_init     =3D armada_xp_secondary_init,=0A=
>> +#ifdef CONFIG_HOTPLUG_CPU=0A=
>> +	.cpu_die		=3D armada_xp_cpu_die,=0A=
>> +	.cpu_kill               =3D armada_xp_cpu_kill,=0A=
>> +#endif=0A=
>> +};=0A=
>> +=0A=
>>  CPU_METHOD_OF_DECLARE(armada_xp_smp, "marvell,armada-xp-smp",=0A=
>>  		      &armada_xp_smp_ops);=0A=
>> +CPU_METHOD_OF_DECLARE(mv98dx3236_smp, "marvell,98dx3236-smp",=0A=
>> +		      &mv98dx3236_smp_ops);=0A=
>> diff --git a/arch/arm/mach-mvebu/pmsu-98dx3236.c b/arch/arm/mach-mvebu/p=
msu-98dx3236.c=0A=
>> new file mode 100644=0A=
>> index 000000000000..1052674dd439=0A=
>> --- /dev/null=0A=
>> +++ b/arch/arm/mach-mvebu/pmsu-98dx3236.c=0A=
>> @@ -0,0 +1,52 @@=0A=
>> +/**=0A=
>> + * CPU resume support for 98DX3236 internal CPU (a.k.a. MSYS).=0A=
>> + */=0A=
>> +=0A=
>> +#define pr_fmt(fmt) "mv98dx3236-resume: " fmt=0A=
>> +=0A=
>> +#include <linux/kernel.h>=0A=
>> +#include <linux/init.h>=0A=
>> +#include <linux/of_address.h>=0A=
>> +#include <linux/io.h>=0A=
>> +#include "common.h"=0A=
>> +=0A=
>> +static void __iomem *mv98dx3236_resume_base;=0A=
>> +#define MV98DX3236_CPU_RESUME_CTRL_OFFSET	0x08=0A=
>> +#define MV98DX3236_CPU_RESUME_ADDR_OFFSET	0x04=0A=
>> +=0A=
>> +static const struct of_device_id of_mv98dx3236_resume_table[] =3D {=0A=
>> +	{.compatible =3D "marvell,98dx3336-resume-ctrl",},=0A=
>> +	{ /* end of list */ },=0A=
>> +};=0A=
>> +=0A=
>> +void mv98dx3236_resume_set_cpu_boot_addr(int hw_cpu, void *boot_addr)=
=0A=
>> +{=0A=
>> +	WARN_ON(hw_cpu !=3D 1);=0A=
>> +=0A=
>> +	writel(0, mv98dx3236_resume_base + MV98DX3236_CPU_RESUME_CTRL_OFFSET);=
=0A=
>> +	writel(virt_to_phys(boot_addr), mv98dx3236_resume_base +=0A=
>> +	       MV98DX3236_CPU_RESUME_ADDR_OFFSET);=0A=
>> +}=0A=
>> +=0A=
>> +static int __init mv98dx3236_resume_init(void)=0A=
>> +{=0A=
>> +	struct device_node *np;=0A=
>> +	void __iomem *base;=0A=
>> +=0A=
>> +	np =3D of_find_matching_node(NULL, of_mv98dx3236_resume_table);=0A=
>> +	if (!np)=0A=
>> +		return 0;=0A=
>=0A=
> Is there any reason we can't just look for this node from the=0A=
> smp_ops and map it if it isn't mapped yet? Seems simpler than a=0A=
> whole new file and initcall.=0A=
>=0A=
=0A=
That's at least 2 votes for rolling it into platsmp.c. The amount of =0A=
code has been significantly reduced so I think I will do it for v4.=0A=
=0A=
>> +=0A=
>> +	base =3D of_io_request_and_map(np, 0, of_node_full_name(np));=0A=
>> +	if (IS_ERR(base)) {=0A=
>> +		pr_err("unable to map registers\n");=0A=
>=0A=
> Doesn't of_io_request_and_map() spit out an error on failure=0A=
> already?=0A=
>=0A=
=0A=
Not that I can see. But as has been previously mentioned a CPU failing =0A=
to come online is reasonably obvious already.=0A=
=0A=
>> +		of_node_put(np);=0A=
>=0A=
> This could be done before the if statement and then the duplicate=0A=
> statement deleted.=0A=
>=0A=
=0A=
Will do.=0A=
=0A=
>> +		return PTR_ERR(mv98dx3236_resume_base);=0A=
>=0A=
> Should be PTR_ERR(base)?=0A=
=0A=
Yes. I decided to add the local variable at the last minute.=0A=
=0A=
>=0A=
>> +	}=0A=
>> +=0A=
>> +	mv98dx3236_resume_base =3D base;=0A=
>> +	of_node_put(np);=0A=
>> +	return 0;=0A=
>> +}=0A=
>=0A=
=0A=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
