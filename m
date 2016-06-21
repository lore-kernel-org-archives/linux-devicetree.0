From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: Using DT overlays for adding virtual hardware
Date: Tue, 21 Jun 2016 15:12:34 +0200
Message-ID: <57693D42.8070501@siemens.com>
References: <575828C0.5000008@siemens.com>
 <20160608151745.GB13355@leverpostej>
 <28BC1AEC-6A7D-4A97-82F4-5670E884C41D@konsulko.com>
 <20160608162343.GD13355@leverpostej>
 <999B1CFF-C204-4C19-AE76-AF9DB54E51E4@konsulko.com>
 <57584A2C.4030507@siemens.com> <5759069B.4080800@siemens.com>
 <57691342.2020502@siemens.com>
 <CFCE0FAF-991B-487B-A684-09A04EFC3F46@konsulko.com>
 <57692378.8010909@siemens.com>
 <EA3C5627-67A4-4120-BA56-D563F2D91CF8@konsulko.com>
 <57692856.3090303@siemens.com>
 <D5A6C7EA-1E54-472B-BB65-041E5730790F@konsulko.com>
 <57692C3F.8000600@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <jailhouse-dev+bncBCJI7SMNV4NBBRP2US5QKGQEFWCZAYQ@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
In-Reply-To: <57692C3F.8000600@siemens.com>
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jailhouse <jailhouse-dev@googlegroups.com>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@denx.de>, Antonios Motakis <antonios.motakis@huawei.com>
List-Id: devicetree@vger.kernel.org

On 2016-06-21 13:59, Jan Kiszka wrote:
> On 2016-06-21 13:45, Pantelis Antoniou wrote:
>> Hi Jan,
>>
>>> On Jun 21, 2016, at 14:43 , Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>
>>> On 2016-06-21 13:35, Pantelis Antoniou wrote:
>>>> Hi Jan,
>>>>
>>>>> On Jun 21, 2016, at 14:22 , Jan Kiszka <jan.kiszka@siemens.com> wrote=
:
>>>>>
>>>>> On 2016-06-21 12:24, Pantelis Antoniou wrote:
>>>>>> Hi Jan,
>>>>>>
>>>>>>> On Jun 21, 2016, at 13:13 , Jan Kiszka <jan.kiszka@siemens.com> wro=
te:
>>>>>>>
>>>>>>> Hi Pantelis,
>>>>>>>
>>>>>>> coming back to this topic:
>>>>>>>
>>>>>>> On 2016-06-09 08:03, Jan Kiszka wrote:
>>>>>>>> OK, trial and error, and some interesting insights: I've played wi=
th DT
>>>>>>>> fragments and the overlay configfs patch of Pantelis [1] to have a
>>>>>>>> convenient start. Interestingly, I wasn't able to load a fragment =
that
>>>>>>>> followed the format specification for overlays ("Failed to resolve
>>>>>>>> tree"). By chance, I got this one working:
>>>>>>>>
>>>>>>>> /dts-v1/;
>>>>>>>> / {
>>>>>>>> 	fragment {
>>>>>>>> 		target-path =3D "/soc@01c00000";
>>>>>>>> 		__overlay__ {
>>>>>>>> 			#address-cells =3D <2>;
>>>>>>>> 			#size-cells =3D <2>;
>>>>>>>>
>>>>>>>> 			vpci@0x2000000 {
>>>>>>>> 				compatible =3D "pci-host-cam-generic";
>>>>>>>> 				device_type =3D "pci";
>>>>>>>> 				#address-cells =3D <3>;
>>>>>>>> 				#size-cells =3D <2>;
>>>>>>>> 				reg =3D <0 0x2000000 0 0x1000000>;
>>>>>>>> 				ranges =3D
>>>>>>>> 					<0x02000000 0x00 0x10000000 0x00 0x10000000 0x00 0x30000000>;
>>>>>>>> 			};
>>>>>>>> 		};
>>>>>>>> 	};
>>>>>>>> };
>>>>>>>>
>>>>>>>> It successfully makes a BananaPi kernel add a pci host with the
>>>>>>>> specified config space and MMIO window.
>>>>>>>>
>>>>>>>> [   81.619583] PCI host bridge /soc@01c00000/vpci@0x2000000 ranges=
:
>>>>>>>> [   81.619610]   No bus range found for /soc@01c00000/vpci@0x20000=
00, using [bus 00-ff]
>>>>>>>> [   81.619634]   MEM 0x10000000..0x3fffffff -> 0x10000000
>>>>>>>> [   81.620482] pci-host-generic 2000000.vpci: ECAM at [mem 0x02000=
000-0x02ffffff] for [bus 00-ff]
>>>>>>>> [   81.620779] pci-host-generic 2000000.vpci: PCI host bridge to b=
us 0000:00
>>>>>>>> [   81.620801] pci_bus 0000:00: root bus resource [bus 00-ff]
>>>>>>>> [   81.620814] pci_bus 0000:00: root bus resource [mem 0x10000000-=
0x3fffffff]
>>>>>>>> [   81.620851] PCI: bus0: Fast back to back transfers enabled
>>>>>>>>
>>>>>>>> So, no /plugin/ statement, no phandles resolution. This format eve=
n
>>>>>>>> builds with the in-kernel dtc. Any explanations? Does the code mak=
e
>>>>>>>> sense (at least it builds without warnings)?
>>>>>>>>
>>>>>>>> Now I need to back this with some code in Jailhouse.
>>>>>>>
>>>>>>> Meanwhile I got a virtual PCI device recognized by Linux when runni=
ng
>>>>>>> over Jailhouse. However, my hack above doesn't get me to proper
>>>>>>> interrupt mapping yet. This is what I was trying with upstream dtc:
>>>>>>>
>>>>>>> /dts-v1/;
>>>>>>> / {
>>>>>>> 	compatible =3D "lemaker,bananapi", "allwinner,sun7i-a20";
>>>>>>>
>>>>>>> 	fragment@0 {
>>>>>>> 		target-path =3D "/soc@01c00000";
>>>>>>> 		__overlay__ {
>>>>>>> 			#address-cells =3D <2>;
>>>>>>> 			#size-cells =3D <2>;
>>>>>>>
>>>>>>> 			vpci@2000000 {
>>>>>>> 				compatible =3D "pci-host-ecam-generic";
>>>>>>> 				device_type =3D "pci";
>>>>>>> 				bus-range =3D <0 0>;
>>>>>>> 				#address-cells =3D <3>;
>>>>>>> 				#size-cells =3D <2>;
>>>>>>> 				#interrupt-cells =3D <1>;
>>>>>>> 				interrupt-map-mask =3D <0 0 0 7>;
>>>>>>> 				interrupt-map =3D <0 0 0 1 &gic 0 0 0 123 4>,
>>>>>>> 						<0 0 0 2 &gic 0 0 0 124 4>,
>>>>>>> 						<0 0 0 3 &gic 0 0 0 125 4>,
>>>>>>> 						<0 0 0 4 &gic 0 0 0 126 4>;
>>>>>>> 				reg =3D <0 0x2000000 0 0x100000>;
>>>>>>> 				ranges =3D
>>>>>>> 					<0x02000000 0x00 0x10000000 0x00 0x10000000 0x00 0x30000000>;
>>>>>>> 			};
>>>>>>> 		};
>>>>>>> 	};
>>>>>>>
>>>>>>> 	gic: fragment@1 {
>>>>>>> 		target-path =3D "/soc@01c00000/interrupt-controller@01c81000";
>>>>>>> 		__overlay__ {
>>>>>>> 		};
>>>>>>> 	};
>>>>>>> };
>>>>>>>
>>>>>>
>>>>>> ^ This is not going to work: You need the reference to the real gic =
not the empty fragment
>>>>>> here that has a target there.
>>>>>>
>>>>>> You need to compile with the correct dtc, and you also need to compi=
le the base dts
>>>>>> with dtc too, using the -@ flag. You can hack around it by adding so=
mething like
>>>>>>
>>>>>> __symbols__ {
>>>>>> 	gic =3D "/soc@01c00000/interrupt-controller@01c81000=E2=80=9D;
>>>>>> };
>>>>>>
>>>>>> But you really need the __symbols__ node of the base dts generated b=
y the dtc proper cause
>>>>>> the above is a dirty hack.
>>>>>>
>>>>>
>>>>> OK, re-building the kernel with DTC=3D"/your/dtc -@", thus building t=
he
>>>>> base dtb with symbols, fixes proper overlay format loading.
>>>>>
>>>>> However, no luck yet with the interrupt topic - maybe a different iss=
ue.
>>>>> Digging deeper=E2=80=A6
>>>>>
>>>> Remove the gic: fragment and build both the kernel and the overlay wit=
h the -@ option.
>>>> That=E2=80=99s what makes it not to work.
>>>
>>> That's what I did, of course.
>>>
>>> I've now
>>>
>>> /dts-v1/;
>>> // magic:		0xd00dfeed
>>> // totalsize:		0x448 (1096)
>>> // off_dt_struct:	0x38
>>> // off_dt_strings:	0x3c0
>>> // off_mem_rsvmap:	0x28
>>> // version:		17
>>> // last_comp_version:	16
>>> // boot_cpuid_phys:	0x0
>>> // size_dt_strings:	0x88
>>> // size_dt_struct:	0x388
>>>
>>> / {
>>>    compatible =3D "lemaker,bananapi", "allwinner,sun7i-a20";
>>>    fragment@0 {
>>>        target =3D <0xffffffff>;
>>>        __overlay__ {
>>>            #address-cells =3D <0x00000002>;
>>>            #size-cells =3D <0x00000002>;
>>>            vpci@2000000 {
>>>                compatible =3D "pci-host-ecam-generic";
>>>                device_type =3D "pci";
>>>                bus-range =3D <0x00000000 0x00000000>;
>>>                #address-cells =3D <0x00000003>;
>>>                #size-cells =3D <0x00000002>;
>>>                #interrupt-cells =3D <0x00000001>;
>>>                interrupt-map-mask =3D <0x00000000 0x00000000 0x00000000=
 0x00000007>;
>>>                interrupt-map =3D <0x00000000 0x00000000 0x00000000 0x00=
000001 0xffffffff 0x00000000 0x00000000 0x00000000 0x0000007b 0x00000004 0x=
00000000 0x00000000 0x00000000 0x00000002 0xffffffff 0x00000000 0x00000000 =
0x00000000 0x0000007c 0x00000004 0x00000000 0x00000000 0x00000000 0x0000000=
3 0xffffffff 0x00000000 0x00000000 0x00000000 0x0000007d 0x00000004 0x00000=
000 0x00000000 0x00000000 0x00000004 0xffffffff 0x00000000 0x00000000 0x000=
00000 0x0000007e 0x00000004>;
>>>                reg =3D <0x00000000 0x02000000 0x00000000 0x00100000>;
>>>                ranges =3D <0x02000000 0x00000000 0x10000000 0x00000000 =
0x10000000 0x00000000 0x30000000>;
>>>            };
>>>        };
>>>    };
>>>    __symbols__ {
>>>    };
>>>    __fixups__ {
>>>        soc =3D "/fragment@0:target:0";
>>>        gic =3D "/fragment@0/__overlay__/vpci@2000000:interrupt-map:16",=
 "/fragment@0/__overlay__/vpci@2000000:interrupt-map:56", "/fragment@0/__ov=
erlay__/vpci@2000000:interrupt-map:96", "/fragment@0/__overlay__/vpci@20000=
00:interrupt-map:136";
>>>    };
>>>    __local_fixups__ {
>>>    };
>>> };
>>>
>>> and a base dtb with a symbols section and all the required ones
>>> included.
>>>
>>
>> OK, this should make things work. Did you try sticking this in the base =
dts and see if it works there?
>=20
> Can't do this because Linux needs that tree to boot and Jailhouse with
> its virtual PCI controller comes after that only.
>=20
> I'll debug what's happing behind the curtains regarding PCI interrupt
> mapping, maybe that will give a clue.

That happens when someone without much clue about this device tree
thingy hacks fragments together from all over the place (wouldn't have
happened if the related specs were more readable). The problem was with
the width of the interrupt-map parent part. This now works:

/dts-v1/;
/plugin/;
/ {
	compatible =3D "lemaker,bananapi", "allwinner,sun7i-a20";

	fragment {
		target-path =3D "/soc@01c00000";
		__overlay__ {
			#address-cells =3D <1>;
			#size-cells =3D <1>;

			vpci@2000000 {
				compatible =3D "pci-host-ecam-generic";
				device_type =3D "pci";
				bus-range =3D <0 0>;
				#address-cells =3D <3>;
				#size-cells =3D <2>;
				#interrupt-cells =3D <1>;
				interrupt-map-mask =3D <0 0 0 7>;
				interrupt-map =3D <0 0 0 1 &gic 0 123 4>,
						<0 0 0 2 &gic 0 124 4>,
						<0 0 0 3 &gic 0 125 4>,
						<0 0 0 4 &gic 0 126 4>;
				reg =3D <0x2000000 0x100000>;
				ranges =3D
					<0x02000000 0x00 0x10000000 0x10000000 0x00 0x30000000>;
			};
		};
	};
};

I'm sure there are more hidden bugs in this fragment, anyway:

linux:~ # cat /proc/interrupts=20
           CPU0       CPU1      =20
...
126:          0          0     GIC-0 155 Level     ivshm-net

Yeah... Time to wire things up in the hypervisor.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
