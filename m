From: Rongrong Zou <zourongrong@huawei.com>
Subject: Re: [PATCH v1 3/3] ARM64 LPC: update binding doc
Date: Tue, 12 Jan 2016 19:05:29 +0800
Message-ID: <5694DDF9.1050902@huawei.com>
References: <1451396032-23708-1-git-send-email-zourongrong@gmail.com>
 <CABTftiT1+AmrNjiAie-T6on-oWA4Zz73+Tj2pQrixMT3o475uw@mail.gmail.com>
 <568912EE.9030009@huawei.com> <15026471.7nGZ0rWlIf@wuerfel>
 <20160111161415.GM13633@e106497-lin.cambridge.arm.com>
 <56946768.7090805@gmail.com>
 <20160112090722.GN13633@e106497-lin.cambridge.arm.com>
 <5694C6A4.8060308@huawei.com>
 <20160112101418.GO13633@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160112101418.GO13633@e106497-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: liviu.dudau@arm.com
Cc: Rongrong Zou <zourongrong@gmail.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, Corey Minyard <minyard@acm.org>, gregkh@linuxfoundation.org, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linuxarm@huawei.com, benh@kernel.crashing.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2016/1/12 18:14, liviu.dudau@arm.com =E5=86=99=E9=81=93:
> On Tue, Jan 12, 2016 at 05:25:56PM +0800, Rongrong Zou wrote:
>> =E5=9C=A8 2016/1/12 17:07, liviu.dudau@arm.com =E5=86=99=E9=81=93:
>>> On Tue, Jan 12, 2016 at 10:39:36AM +0800, Rongrong Zou wrote:
>>>> On 2016/1/12 0:14, liviu.dudau@arm.com wrote:
>>>>> On Mon, Jan 04, 2016 at 12:13:05PM +0100, Arnd Bergmann wrote:
>>>>>> On Sunday 03 January 2016 20:24:14 Rongrong Zou wrote:
>>>>>>> =E5=9C=A8 2015/12/31 23:00, Rongrong Zou =E5=86=99=E9=81=93:
>>>>>>>> 2015-12-31 22:40 GMT+08:00 Arnd Bergmann <arnd@arndb.de <mailt=
o:arnd@arndb.de>>:
>>>>>>>>   > On Thursday 31 December 2015 22:12:19 Rongrong Zou wrote:
>>>>>>>>   > > =E5=9C=A8 2015/12/30 17:06, Arnd Bergmann =E5=86=99=E9=81=
=93:
>>>>>>>>   > > > On Tuesday 29 December 2015 21:33:52 Rongrong Zou wrot=
e:
>>>>>>>>   >
>>>>>>>>   > The DT sample above looks good in principle. I believe wha=
t you are missing
>>>>>>>>   > here is code in your driver to scan the child nodes to cre=
ate the platform
>>>>>>>>   > devices. of_bus_isa_translate() should work with your defi=
nition here
>>>>>>>>   > and create the correct IORESOURCE_IO resources. You don't =
have any MMIO
>>>>>>>>   > resources, so the absence of a ranges property is ok. Mayb=
e all you
>>>>>>>>   > are missing is a call to of_platform_populate() or of_plat=
form_bus_probe()?
>>>>>>>>   >
>>>>>>>>
>>>>>>>> You are right. thanks, i'll try on test board .  if i get the =
correct result , the new patch
>>>>>>>> will be sent later. By the way, it's my another email account =
use when i at home.
>>>>>>>
>>>>>>> I tried, and there need some additional changes.
>>>>>>>
>>>>>>> isa@a01b0000 {
>>>>>>>
>>>>>>> /*the node name should start with "isa", because of below defin=
ition
>>>>>>> * static int of_bus_isa_match(struct device_node *np)
>>>>>>> * {
>>>>>>> *	return !strcmp(np->name, "isa");
>>>>>>> * }
>>>>>>
>>>>>> Looks good. It would be nicer to match on device_type than on na=
me,
>>>>>> but this is ancient code and it's probably best not to touch it
>>>>>> so we don't accidentally break some old SPARC or PPC system.
>>>>>>
>>>>>>> */
>>>>>>> 	compatible =3D "low-pin-count";
>>>>>>> 	device_type =3D "isa";
>>>>>>> 	#address-cells =3D <2>;
>>>>>>> 	#size-cells =3D <1>;
>>>>>>> 	reg =3D <0x0 0xa01b0000 0x0 0x10000>;
>>>>>>> 	ranges =3D <0x1 0x0 0x0 0x0 0x1000>;
>>>>>>> /*
>>>>>>> *  ranges is required, then i can get the IORESOURCE_IO <0xe4,4=
> from "reg =3D <0x1, 0x000000e4, 4>".
>>>>>>> *
>>>>>>> */
>>>>>>> 	ipmi_0:ipmi@000000e4{
>>>>>>> 		device_type =3D "ipmi";
>>>>>>> 		compatible =3D "ipmi-bt";
>>>>>>> 		reg =3D <0x1 0x000000e4 0x4>;
>>>>>>> };
>>>>>>>
>>>>>>
>>>>>> This looks wrong: the property above says that the I/O port rang=
e is
>>>>>> translated to MMIO address 0x00000000 to 0x00010000, which is no=
t
>>>>>> true on your hardware. I think this needs to be changed in the c=
ode
>>>>>> so the ranges property is not required for I/O ports.
>>>>>>
>>>>>>> drivers\of\address.c
>>>>>>> static int __of_address_to_resource(struct device_node *dev,
>>>>>>>                   const __be32 *addrp, u64 size, unsigned int f=
lags,
>>>>>>>                   const char *name, struct resource *r)
>>>>>>> {
>>>>>>>           u64 taddr;
>>>>>>>
>>>>>>>           if ((flags & (IORESOURCE_IO | IORESOURCE_MEM)) =3D=3D=
 0)
>>>>>>>                   return -EINVAL;
>>>>>>>           taddr =3D of_translate_address(dev, addrp);
>>>>>>>           if (taddr =3D=3D OF_BAD_ADDR)
>>>>>>>                   return -EINVAL;
>>>>>>>           memset(r, 0, sizeof(struct resource));
>>>>>>>           if (flags & IORESOURCE_IO) {
>>>>>>>                   unsigned long port;
>>>>>>>
>>>>>>> /**************************************************************=
***/
>>>>>>> /*legacy port(< 0x1000) is reserved, and need no translation he=
re*/
>>>>>>> /**************************************************************=
***/
>>>>>>>                   if(taddr + size < PCIBIOS_MIN_IO){
>>>>>>>                           r->start =3D taddr;
>>>>>>>                           r->end =3D taddr + size - 1;
>>>>>>>                   }
>>>>>>
>>>>>> I don't like having a special case based on the address here,
>>>>>> the same kind of hack might be needed for PCI I/O spaces in
>>>>>> hardware that uses an indirect method like your LPC bus
>>>>>> does, and the code above will not work on any LPC implementation
>>>>>> that correctly multiplexes its I/O ports with the first PCI doma=
in.
>>>>>>
>>>>>> I think it would be better to avoid translating the port into
>>>>>> a physical address to start with just to translate it back into
>>>>>> a port number, what we need instead is the offset between the
>>>>>> bus specific port number and the linux port number. I've added
>>>>>> Liviu to Cc, he wrote this code originally and may have some ide=
a
>>>>>> of how we could do that.
>>>>>
>>>>> Hi,
>>>>
>>>> Hi Liviu,
>>>>
>>>> Thanks for reviewing this.
>>>>
>>>>>
>>>>> Getting back to work after a longer holiday, my brain might not b=
e running
>>>>> at full speed here, so I'm trying to clarify things a bit here.
>>>>>
>>>>> It looks to me like Rongrong is trying to trap the inb()/outb() c=
alls that he
>>>>> added to arm64 by patch 1/3 and redirect those operations to the =
memory
>>>>> mapped LPC driver. I think the whole redirection and registration=
 of inb/outb
>>>>> ops can be made cleaner, so that the general concept resembles th=
e DMA ops
>>>>> registration? (I have this mental picture that what Rongrong is t=
rying to do
>>>>> is similar to what a DMA engine does, except this is slowing down=
 things to
>>>>> byte level). If that is done properly in the parent node, then we=
 should not
>>>>> care what the PCIBIOS_MIN_IO value is as the inb()/outb() calls w=
ill always
>>>>> go through the redirection for the children.
>>>>>
>>>>> As for the ranges property: does he wants the ipmi-bt driver to s=
ee in the
>>>>> reg property the legacy ISA I/O ports values or the CPU addresses=
? If the former,
>>>>> then I agree that the range property should not be required, but =
also the
>>>>> reg values need to be changed (drop the top bit). If the later, t=
hen the
>>>>> ranges property is required to do the proper translation.
>>>>
>>>> The former, thanks.
>>>>
>>>>>
>>>>> Rongrong, removing the ranges property and with a reg =3D <0xe4 0=
x4> property
>>>>> in the ipmi-bt node, what IO_RESOURCE type resources do you get b=
ack from
>>>>> the of_address_to_resource() translation?
>>>>
>>>> I want to get IORESOURCE_IO type resource, but if the parent node =
drop the
>>>> "rangs" property, the of_address_to_resource() translation will re=
turn with -EINVAL.
>>>
>>> Have you tracked what part of the code is sensitive to the presence=
 of "ranges"
>>> property? Does of_get_address() call returns the IO_RESOURCE flag s=
et without "ranges"?
>>>
>>
>>
>> Yes, IO_RESOURCE flag can be get without "ranges".
>> I tracked the code, it is at of_translate_one(), Below is the callin=
g infomation.
>>
>> of_address_to_resource-> __of_address_to_resource ->of_translate_add=
ress->
>> __of_translate_address(dev, in_addr, "ranges")->of_translate_one()
>>
>>
>> static int of_translate_one(struct device_node *parent, struct of_bu=
s *bus,
>> 			    struct of_bus *pbus, __be32 *addr,
>> 			    int na, int ns, int pna, const char *rprop)
>> {
>> 	const __be32 *ranges;
>> 	unsigned int rlen;
>> 	int rone;
>> 	u64 offset =3D OF_BAD_ADDR;
>>
>> 	ranges =3D of_get_property(parent, rprop, &rlen);
>> 	if (ranges =3D=3D NULL && !of_empty_ranges_quirk(parent)) {
>> 		pr_debug("OF: no ranges; cannot translate\n");
>> 		return 1;
>> 	}
>> 	...
>> }
>
> OK, looking at of_translate_one() comments it looks like a missing "r=
anges" property is
> only accepted on PowerPC. I suggest you have an empty "ranges" proper=
ty in your isa
> parent node, that will signal to the OF parsing code that the mapping=
 is 1:1. Then have
> the IPMI node use the reg =3D <0x0 0xe4 4>; property values instead o=
f reg =3D <0x1 0xe4 4>;

But in this condition, I still can't get the right resource type IORESO=
URCE_IO, I just get
the MMIO resource E4:E7. Please see the url at https://lkml.org/lkml/20=
16/1/5/199, the empty
ranges has been discussed.


>
> Best regards,
> Liviu
>
>>
>>> Best regards,
>>> Liviu
>>>
>>>>
>>>>>
>>>>> Best regards,
>>>>> Liviu
>>>>>
>>>>>
>>>>>>
>>>>>> 	Arnd
>>>>>>
>>>>>
>>>> Regards,
>>>> Rongrong
>>>>
>>>
>> --
>> Regards,
>> Rongrong
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>


--=20
Regards,
Rongrong
