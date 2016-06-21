From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: Using DT overlays for adding virtual hardware
Date: Tue, 21 Jun 2016 16:29:22 +0300
Message-ID: <62ECA37D-D133-4901-B739-DB17D72F0B79@konsulko.com>
References: <575828C0.5000008@siemens.com> <20160608151745.GB13355@leverpostej> <28BC1AEC-6A7D-4A97-82F4-5670E884C41D@konsulko.com> <20160608162343.GD13355@leverpostej> <999B1CFF-C204-4C19-AE76-AF9DB54E51E4@konsulko.com> <57584A2C.4030507@siemens.com> <5759069B.4080800@siemens.com> <57691342.2020502@siemens.com> <CFCE0FAF-991B-487B-A684-09A04EFC3F46@konsulko.com> <57692378.8010909@siemens.com> <EA3C5627-67A4-4120-BA56-D563F2D91CF8@konsulko.com> <57692856.3090303@siemens.com> <D5A6C7EA-1E54-472B-BB65-041E5730790F@konsulko.com> <57692C3F.8000600@siemens.com> <57693D42.8070501@siemens.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <jailhouse-dev+bncBCV5BG4UVENBBNUCUW5QKGQELZZLW3A@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
In-Reply-To: <57693D42.8070501@siemens.com>
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jailhouse <jailhouse-dev@googlegroups.com>, =?utf-8?Q?M=C3=A5ns_Rullg=C3=A5rd?= <mans@denx.de>, Antonios Motakis <antonios.motakis@huawei.com>
List-Id: devicetree@vger.kernel.org

Hi Jan,

> On Jun 21, 2016, at 16:12 , Jan Kiszka <jan.kiszka@siemens.com> wrote:
>=20
> On 2016-06-21 13:59, Jan Kiszka wrote:
>> On 2016-06-21 13:45, Pantelis Antoniou wrote:
>>> Hi Jan,
>>>=20
>>>> On Jun 21, 2016, at 14:43 , Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>=20
>>>> On 2016-06-21 13:35, Pantelis Antoniou wrote:
>>>>> Hi Jan,
>>>>>=20
>>>>>> On Jun 21, 2016, at 14:22 , Jan Kiszka <jan.kiszka@siemens.com> wrot=
e:
>>>>>>=20
>>>>>> On 2016-06-21 12:24, Pantelis Antoniou wrote:
>>>>>>> Hi Jan,
>>>>>>>=20
>>>>>>>> On Jun 21, 2016, at 13:13 , Jan Kiszka <jan.kiszka@siemens.com> wr=
ote:
>>>>>>>>=20
>>>>>>>> Hi Pantelis,
>>>>>>>>=20
>>>>>>>> coming back to this topic:
>>>>>>>>=20
>>>>>>>> On 2016-06-09 08:03, Jan Kiszka wrote:
>>>>>>>>> OK, trial and error, and some interesting insights: I've played w=
ith DT
>>>>>>>>> fragments and the overlay configfs patch of Pantelis [1] to have =
a
>>>>>>>>> convenient start. Interestingly, I wasn't able to load a fragment=
 that
>>>>>>>>> followed the format specification for overlays ("Failed to resolv=
e
>>>>>>>>> tree"). By chance, I got this one working:
>>>>>>>>>=20
>>>>>>>>> /dts-v1/;
>>>>>>>>> / {
>>>>>>>>> 	fragment {
>>>>>>>>> 		target-path =3D "/soc@01c00000";
>>>>>>>>> 		__overlay__ {
>>>>>>>>> 			#address-cells =3D <2>;
>>>>>>>>> 			#size-cells =3D <2>;
>>>>>>>>>=20
>>>>>>>>> 			vpci@0x2000000 {
>>>>>>>>> 				compatible =3D "pci-host-cam-generic";
>>>>>>>>> 				device_type =3D "pci";
>>>>>>>>> 				#address-cells =3D <3>;
>>>>>>>>> 				#size-cells =3D <2>;
>>>>>>>>> 				reg =3D <0 0x2000000 0 0x1000000>;
>>>>>>>>> 				ranges =3D
>>>>>>>>> 					<0x02000000 0x00 0x10000000 0x00 0x10000000 0x00 0x30000000>=
;
>>>>>>>>> 			};
>>>>>>>>> 		};
>>>>>>>>> 	};
>>>>>>>>> };
>>>>>>>>>=20
>>>>>>>>> It successfully makes a BananaPi kernel add a pci host with the
>>>>>>>>> specified config space and MMIO window.
>>>>>>>>>=20
>>>>>>>>> [   81.619583] PCI host bridge /soc@01c00000/vpci@0x2000000 range=
s:
>>>>>>>>> [   81.619610]   No bus range found for /soc@01c00000/vpci@0x2000=
000, using [bus 00-ff]
>>>>>>>>> [   81.619634]   MEM 0x10000000..0x3fffffff -> 0x10000000
>>>>>>>>> [   81.620482] pci-host-generic 2000000.vpci: ECAM at [mem 0x0200=
0000-0x02ffffff] for [bus 00-ff]
>>>>>>>>> [   81.620779] pci-host-generic 2000000.vpci: PCI host bridge to =
bus 0000:00
>>>>>>>>> [   81.620801] pci_bus 0000:00: root bus resource [bus 00-ff]
>>>>>>>>> [   81.620814] pci_bus 0000:00: root bus resource [mem 0x10000000=
-0x3fffffff]
>>>>>>>>> [   81.620851] PCI: bus0: Fast back to back transfers enabled
>>>>>>>>>=20
>>>>>>>>> So, no /plugin/ statement, no phandles resolution. This format ev=
en
>>>>>>>>> builds with the in-kernel dtc. Any explanations? Does the code ma=
ke
>>>>>>>>> sense (at least it builds without warnings)?
>>>>>>>>>=20
>>>>>>>>> Now I need to back this with some code in Jailhouse.
>>>>>>>>=20
>>>>>>>> Meanwhile I got a virtual PCI device recognized by Linux when runn=
ing
>>>>>>>> over Jailhouse. However, my hack above doesn't get me to proper
>>>>>>>> interrupt mapping yet. This is what I was trying with upstream dtc=
:
>>>>>>>>=20
>>>>>>>> /dts-v1/;
>>>>>>>> / {
>>>>>>>> 	compatible =3D "lemaker,bananapi", "allwinner,sun7i-a20";
>>>>>>>>=20
>>>>>>>> 	fragment@0 {
>>>>>>>> 		target-path =3D "/soc@01c00000";
>>>>>>>> 		__overlay__ {
>>>>>>>> 			#address-cells =3D <2>;
>>>>>>>> 			#size-cells =3D <2>;
>>>>>>>>=20
>>>>>>>> 			vpci@2000000 {
>>>>>>>> 				compatible =3D "pci-host-ecam-generic";
>>>>>>>> 				device_type =3D "pci";
>>>>>>>> 				bus-range =3D <0 0>;
>>>>>>>> 				#address-cells =3D <3>;
>>>>>>>> 				#size-cells =3D <2>;
>>>>>>>> 				#interrupt-cells =3D <1>;
>>>>>>>> 				interrupt-map-mask =3D <0 0 0 7>;
>>>>>>>> 				interrupt-map =3D <0 0 0 1 &gic 0 0 0 123 4>,
>>>>>>>> 						<0 0 0 2 &gic 0 0 0 124 4>,
>>>>>>>> 						<0 0 0 3 &gic 0 0 0 125 4>,
>>>>>>>> 						<0 0 0 4 &gic 0 0 0 126 4>;
>>>>>>>> 				reg =3D <0 0x2000000 0 0x100000>;
>>>>>>>> 				ranges =3D
>>>>>>>> 					<0x02000000 0x00 0x10000000 0x00 0x10000000 0x00 0x30000000>;
>>>>>>>> 			};
>>>>>>>> 		};
>>>>>>>> 	};
>>>>>>>>=20
>>>>>>>> 	gic: fragment@1 {
>>>>>>>> 		target-path =3D "/soc@01c00000/interrupt-controller@01c81000";
>>>>>>>> 		__overlay__ {
>>>>>>>> 		};
>>>>>>>> 	};
>>>>>>>> };
>>>>>>>>=20
>>>>>>>=20
>>>>>>> ^ This is not going to work: You need the reference to the real gic=
 not the empty fragment
>>>>>>> here that has a target there.
>>>>>>>=20
>>>>>>> You need to compile with the correct dtc, and you also need to comp=
ile the base dts
>>>>>>> with dtc too, using the -@ flag. You can hack around it by adding s=
omething like
>>>>>>>=20
>>>>>>> __symbols__ {
>>>>>>> 	gic =3D "/soc@01c00000/interrupt-controller@01c81000=E2=80=9D;
>>>>>>> };
>>>>>>>=20
>>>>>>> But you really need the __symbols__ node of the base dts generated =
by the dtc proper cause
>>>>>>> the above is a dirty hack.
>>>>>>>=20
>>>>>>=20
>>>>>> OK, re-building the kernel with DTC=3D"/your/dtc -@", thus building =
the
>>>>>> base dtb with symbols, fixes proper overlay format loading.
>>>>>>=20
>>>>>> However, no luck yet with the interrupt topic - maybe a different is=
sue.
>>>>>> Digging deeper=E2=80=A6
>>>>>>=20
>>>>> Remove the gic: fragment and build both the kernel and the overlay wi=
th the -@ option.
>>>>> That=E2=80=99s what makes it not to work.
>>>>=20
>>>> That's what I did, of course.
>>>>=20
>>>> I've now
>>>>=20
>>>> /dts-v1/;
>>>> // magic:		0xd00dfeed
>>>> // totalsize:		0x448 (1096)
>>>> // off_dt_struct:	0x38
>>>> // off_dt_strings:	0x3c0
>>>> // off_mem_rsvmap:	0x28
>>>> // version:		17
>>>> // last_comp_version:	16
>>>> // boot_cpuid_phys:	0x0
>>>> // size_dt_strings:	0x88
>>>> // size_dt_struct:	0x388
>>>>=20
>>>> / {
>>>>   compatible =3D "lemaker,bananapi", "allwinner,sun7i-a20";
>>>>   fragment@0 {
>>>>       target =3D <0xffffffff>;
>>>>       __overlay__ {
>>>>           #address-cells =3D <0x00000002>;
>>>>           #size-cells =3D <0x00000002>;
>>>>           vpci@2000000 {
>>>>               compatible =3D "pci-host-ecam-generic";
>>>>               device_type =3D "pci";
>>>>               bus-range =3D <0x00000000 0x00000000>;
>>>>               #address-cells =3D <0x00000003>;
>>>>               #size-cells =3D <0x00000002>;
>>>>               #interrupt-cells =3D <0x00000001>;
>>>>               interrupt-map-mask =3D <0x00000000 0x00000000 0x00000000=
 0x00000007>;
>>>>               interrupt-map =3D <0x00000000 0x00000000 0x00000000 0x00=
000001 0xffffffff 0x00000000 0x00000000 0x00000000 0x0000007b 0x00000004 0x=
00000000 0x00000000 0x00000000 0x00000002 0xffffffff 0x00000000 0x00000000 =
0x00000000 0x0000007c 0x00000004 0x00000000 0x00000000 0x00000000 0x0000000=
3 0xffffffff 0x00000000 0x00000000 0x00000000 0x0000007d 0x00000004 0x00000=
000 0x00000000 0x00000000 0x00000004 0xffffffff 0x00000000 0x00000000 0x000=
00000 0x0000007e 0x00000004>;
>>>>               reg =3D <0x00000000 0x02000000 0x00000000 0x00100000>;
>>>>               ranges =3D <0x02000000 0x00000000 0x10000000 0x00000000 =
0x10000000 0x00000000 0x30000000>;
>>>>           };
>>>>       };
>>>>   };
>>>>   __symbols__ {
>>>>   };
>>>>   __fixups__ {
>>>>       soc =3D "/fragment@0:target:0";
>>>>       gic =3D "/fragment@0/__overlay__/vpci@2000000:interrupt-map:16",=
 "/fragment@0/__overlay__/vpci@2000000:interrupt-map:56", "/fragment@0/__ov=
erlay__/vpci@2000000:interrupt-map:96", "/fragment@0/__overlay__/vpci@20000=
00:interrupt-map:136";
>>>>   };
>>>>   __local_fixups__ {
>>>>   };
>>>> };
>>>>=20
>>>> and a base dtb with a symbols section and all the required ones
>>>> included.
>>>>=20
>>>=20
>>> OK, this should make things work. Did you try sticking this in the base=
 dts and see if it works there?
>>=20
>> Can't do this because Linux needs that tree to boot and Jailhouse with
>> its virtual PCI controller comes after that only.
>>=20
>> I'll debug what's happing behind the curtains regarding PCI interrupt
>> mapping, maybe that will give a clue.
>=20
> That happens when someone without much clue about this device tree
> thingy hacks fragments together from all over the place (wouldn't have
> happened if the related specs were more readable). The problem was with
> the width of the interrupt-map parent part. This now works:
>=20

+1 on the unreadable specs. I would vote for a more verbose definition if t=
hat
would make things more readable.

> /dts-v1/;
> /plugin/;
> / {
> 	compatible =3D "lemaker,bananapi", "allwinner,sun7i-a20";
>=20
> 	fragment {
> 		target-path =3D "/soc@01c00000";
> 		__overlay__ {
> 			#address-cells =3D <1>;
> 			#size-cells =3D <1>;
>=20
> 			vpci@2000000 {
> 				compatible =3D "pci-host-ecam-generic";
> 				device_type =3D "pci";
> 				bus-range =3D <0 0>;
> 				#address-cells =3D <3>;
> 				#size-cells =3D <2>;
> 				#interrupt-cells =3D <1>;
> 				interrupt-map-mask =3D <0 0 0 7>;
> 				interrupt-map =3D <0 0 0 1 &gic 0 123 4>,
> 						<0 0 0 2 &gic 0 124 4>,
> 						<0 0 0 3 &gic 0 125 4>,
> 						<0 0 0 4 &gic 0 126 4>;
> 				reg =3D <0x2000000 0x100000>;
> 				ranges =3D
> 					<0x02000000 0x00 0x10000000 0x10000000 0x00 0x30000000>;
> 			};
> 		};
> 	};
> };
>=20
> I'm sure there are more hidden bugs in this fragment, anyway:
>=20
> linux:~ # cat /proc/interrupts=20
>           CPU0       CPU1      =20
> ...
> 126:          0          0     GIC-0 155 Level     ivshm-net
>=20
> Yeah... Time to wire things up in the hypervisor.
>=20
> Jan
>=20
> --=20
> Siemens AG, Corporate Technology, CT RDA ITP SES-DE
> Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
