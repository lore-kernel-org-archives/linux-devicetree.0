From: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: Re: [PATCHv2 2/5] arm: mvebu: support for SMP on 98DX3336 SoC
Date: Thu, 5 Jan 2017 20:49:49 +0000
Message-ID: <b71083040acf4fbb9341be3c1e70a930@svr-chch-ex1.atlnz.lc>
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
 <20170105033641.6212-3-chris.packham@alliedtelesis.co.nz>
 <5edb6751-d15b-6654-f4ae-adf38fafb8a4@gmail.com>
 <dd384eda81d2420dafe740bf5bb4dae0@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Chris Brand <chris.brand-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Juri Lelli <juri.lelli-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/01/17 17:46, Chris Packham wrote:=0A=
> On 05/01/17 17:04, Florian Fainelli wrote:=0A=
>> Le 01/04/17 =E0 19:36, Chris Packham a =E9crit :=0A=
>>> +}=0A=
>>> +=0A=
>>> +static int __init mv98dx3236_resume_init(void)=0A=
>>> +{=0A=
>>> +	struct device_node *np;=0A=
>>> +	struct resource res;=0A=
>>> +	int ret =3D 0;=0A=
>>> +=0A=
>>> +	np =3D of_find_matching_node(NULL, of_mv98dx3236_resume_table);=0A=
>>> +	if (!np)=0A=
>>> +		return 0;=0A=
>>=0A=
>> Can't this function be implemented as a smp_ops::smp_init_cpus instead=
=0A=
>> of having this initialization done at arch_initcall time?=0A=
>>=0A=
>=0A=
> I'll look into it. My initial reaction is no because I still need=0A=
> armada_xp_smp_init_cpus().=0A=
>=0A=
=0A=
I looked at this. I could write a mv98dx3236_smp_init_cpus() that calls =0A=
armada_xp_smp_init_cpus() and inits the resume controller address. My =0A=
original reason for this approach was to parallel mvebu_v7_pmsu_init. I =0A=
won't do anything just yet but is there any downside to the current =0A=
approach?=0A=
=0A=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
