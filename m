From: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: Re: [PATCHv2 2/5] arm: mvebu: support for SMP on 98DX3336 SoC
Date: Thu, 5 Jan 2017 04:46:32 +0000
Message-ID: <dd384eda81d2420dafe740bf5bb4dae0@svr-chch-ex1.atlnz.lc>
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
 <20170105033641.6212-3-chris.packham@alliedtelesis.co.nz>
 <5edb6751-d15b-6654-f4ae-adf38fafb8a4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Chris Brand <chris.brand-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Juri Lelli <juri.lelli-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/01/17 17:04, Florian Fainelli wrote:=0A=
> Le 01/04/17 =E0 19:36, Chris Packham a =E9crit :=0A=
>> Compared to the armada-xp the 98DX3336 uses different registers to set=
=0A=
>> the boot address for the secondary CPU so a new enable-method is needed.=
=0A=
>> This will only work if the machine definition doesn't define an overall=
=0A=
>> smp_ops because there is not currently a way of overriding this from the=
=0A=
>> device tree if it is set in the machine definition.=0A=
>=0A=
> Not sure I follow you here, in theory, each individual CPU could have a=
=0A=
> different enable-method property, and considering how you leverage=0A=
> existing DTS include files, you should be able to override the DTS with=
=0A=
> the appropriate enable-method, or do you have a different problem?=0A=
>=0A=
=0A=
The problem is I can't override the enable method if it's set in the =0A=
machine definition. It's because the devicetree is looked up first then =0A=
the machine definition overrides it.=0A=
=0A=
Heres an old thread that basically outlines the problem.=0A=
=0A=
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-November/300371.=
html=0A=
=0A=
I posted a few attempts to work around it but there never really was any =
=0A=
consensus reached.=0A=
=0A=
>  mv98dx3236_resume_set_cpu_boot_addr(int hw_cpu, void *boot_addr)=0A=
>> +{=0A=
>> +	WARN_ON(hw_cpu !=3D 1);=0A=
>> +=0A=
>> +	writel(0, mv98dx3236_resume_base + MV98DX3236_CPU_RESUME_CTRL_OFFSET);=
=0A=
>> +	writel(virt_to_phys(boot_addr), mv98dx3236_resume_base +=0A=
>> +	       MV98DX3236_CPU_RESUME_ADDR_OFFSET);=0A=
>=0A=
> I just submitted a patch series that switches such users to=0A=
> __pa_symbol() instead of virt_to_phys() because this is a kernel image=0A=
> symbol. For now this will work as-is, but depending on which patch=0A=
> series makes it first, it may be a good idea to keep this on someone's=0A=
> TODO list (yours or mine). I do expect having to make a second pass of=0A=
> conversions anyway.=0A=
>=0A=
> [1]: https://lkml.org/lkml/2017/1/4/1101=0A=
=0A=
OK I'll keep that in mind.=0A=
=0A=
>=0A=
>> +}=0A=
>> +=0A=
>> +static int __init mv98dx3236_resume_init(void)=0A=
>> +{=0A=
>> +	struct device_node *np;=0A=
>> +	struct resource res;=0A=
>> +	int ret =3D 0;=0A=
>> +=0A=
>> +	np =3D of_find_matching_node(NULL, of_mv98dx3236_resume_table);=0A=
>> +	if (!np)=0A=
>> +		return 0;=0A=
>> +=0A=
>> +	pr_info("Initializing 98DX3236 Resume\n");=0A=
>=0A=
> This can be probably be dropped, you should know fairly quickly if this=
=0A=
> succeeded or not.=0A=
=0A=
Will do.=0A=
=0A=
>=0A=
> Can't this function be implemented as a smp_ops::smp_init_cpus instead=0A=
> of having this initialization done at arch_initcall time?=0A=
>=0A=
=0A=
I'll look into it. My initial reaction is no because I still need =0A=
armada_xp_smp_init_cpus().=0A=
=0A=
>> +=0A=
>> +	if (of_address_to_resource(np, 0, &res)) {=0A=
>> +		pr_err("unable to get resource\n");=0A=
>> +		ret =3D -ENOENT;=0A=
>> +		goto out;=0A=
>> +	}=0A=
>> +=0A=
>> +	if (!request_mem_region(res.start, resource_size(&res),=0A=
>> +				np->full_name)) {=0A=
>> +		pr_err("unable to request region\n");=0A=
>> +		ret =3D -EBUSY;=0A=
>> +		goto out;=0A=
>> +	}=0A=
>=0A=
> You should be able to use of_io_request_and_map() and here.=0A=
>=0A=
=0A=
Will do.=0A=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
