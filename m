From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: Using DT overlays for adding virtual hardware
Date: Tue, 21 Jun 2016 13:24:43 +0300
Message-ID: <CFCE0FAF-991B-487B-A684-09A04EFC3F46@konsulko.com>
References: <575828C0.5000008@siemens.com> <20160608151745.GB13355@leverpostej> <28BC1AEC-6A7D-4A97-82F4-5670E884C41D@konsulko.com> <20160608162343.GD13355@leverpostej> <999B1CFF-C204-4C19-AE76-AF9DB54E51E4@konsulko.com> <57584A2C.4030507@siemens.com> <5759069B.4080800@siemens.com> <57691342.2020502@siemens.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <jailhouse-dev+bncBCV5BG4UVENBB35LUS5QKGQE2HNIN3Y@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
In-Reply-To: <57691342.2020502@siemens.com>
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

> On Jun 21, 2016, at 13:13 , Jan Kiszka <jan.kiszka@siemens.com> wrote:
>=20
> Hi Pantelis,
>=20
> coming back to this topic:
>=20
> On 2016-06-09 08:03, Jan Kiszka wrote:
>> OK, trial and error, and some interesting insights: I've played with DT
>> fragments and the overlay configfs patch of Pantelis [1] to have a
>> convenient start. Interestingly, I wasn't able to load a fragment that
>> followed the format specification for overlays ("Failed to resolve
>> tree"). By chance, I got this one working:
>>=20
>> /dts-v1/;
>> / {
>> 	fragment {
>> 		target-path =3D "/soc@01c00000";
>> 		__overlay__ {
>> 			#address-cells =3D <2>;
>> 			#size-cells =3D <2>;
>>=20
>> 			vpci@0x2000000 {
>> 				compatible =3D "pci-host-cam-generic";
>> 				device_type =3D "pci";
>> 				#address-cells =3D <3>;
>> 				#size-cells =3D <2>;
>> 				reg =3D <0 0x2000000 0 0x1000000>;
>> 				ranges =3D
>> 					<0x02000000 0x00 0x10000000 0x00 0x10000000 0x00 0x30000000>;
>> 			};
>> 		};
>> 	};
>> };
>>=20
>> It successfully makes a BananaPi kernel add a pci host with the
>> specified config space and MMIO window.
>>=20
>> [   81.619583] PCI host bridge /soc@01c00000/vpci@0x2000000 ranges:
>> [   81.619610]   No bus range found for /soc@01c00000/vpci@0x2000000, us=
ing [bus 00-ff]
>> [   81.619634]   MEM 0x10000000..0x3fffffff -> 0x10000000
>> [   81.620482] pci-host-generic 2000000.vpci: ECAM at [mem 0x02000000-0x=
02ffffff] for [bus 00-ff]
>> [   81.620779] pci-host-generic 2000000.vpci: PCI host bridge to bus 000=
0:00
>> [   81.620801] pci_bus 0000:00: root bus resource [bus 00-ff]
>> [   81.620814] pci_bus 0000:00: root bus resource [mem 0x10000000-0x3fff=
ffff]
>> [   81.620851] PCI: bus0: Fast back to back transfers enabled
>>=20
>> So, no /plugin/ statement, no phandles resolution. This format even
>> builds with the in-kernel dtc. Any explanations? Does the code make
>> sense (at least it builds without warnings)?
>>=20
>> Now I need to back this with some code in Jailhouse.
>=20
> Meanwhile I got a virtual PCI device recognized by Linux when running
> over Jailhouse. However, my hack above doesn't get me to proper
> interrupt mapping yet. This is what I was trying with upstream dtc:
>=20
> /dts-v1/;
> / {
> 	compatible =3D "lemaker,bananapi", "allwinner,sun7i-a20";
>=20
> 	fragment@0 {
> 		target-path =3D "/soc@01c00000";
> 		__overlay__ {
> 			#address-cells =3D <2>;
> 			#size-cells =3D <2>;
>=20
> 			vpci@2000000 {
> 				compatible =3D "pci-host-ecam-generic";
> 				device_type =3D "pci";
> 				bus-range =3D <0 0>;
> 				#address-cells =3D <3>;
> 				#size-cells =3D <2>;
> 				#interrupt-cells =3D <1>;
> 				interrupt-map-mask =3D <0 0 0 7>;
> 				interrupt-map =3D <0 0 0 1 &gic 0 0 0 123 4>,
> 						<0 0 0 2 &gic 0 0 0 124 4>,
> 						<0 0 0 3 &gic 0 0 0 125 4>,
> 						<0 0 0 4 &gic 0 0 0 126 4>;
> 				reg =3D <0 0x2000000 0 0x100000>;
> 				ranges =3D
> 					<0x02000000 0x00 0x10000000 0x00 0x10000000 0x00 0x30000000>;
> 			};
> 		};
> 	};
>=20
> 	gic: fragment@1 {
> 		target-path =3D "/soc@01c00000/interrupt-controller@01c81000";
> 		__overlay__ {
> 		};
> 	};
> };
>=20

^ This is not going to work: You need the reference to the real gic not the=
 empty fragment
here that has a target there.

You need to compile with the correct dtc, and you also need to compile the =
base dts
with dtc too, using the -@ flag. You can hack around it by adding something=
 like

__symbols__ {
	gic =3D "/soc@01c00000/interrupt-controller@01c81000=E2=80=9D;
};

But you really need the __symbols__ node of the base dts generated by the d=
tc proper cause
the above is a dirty hack.


> And this is what Linux detects on that PCI bus:
>=20
> 00:0f.0 RAM memory: Red Hat, Inc Inter-VM shared memory
>        Subsystem: Red Hat, Inc Inter-VM shared memory
>        Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr=
- Stepping- SERR- FastB2B- DisINTx-
>        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <=
TAbort- <MAbort- >SERR- <PERR- INTx-
>        Interrupt: pin A routed to IRQ 17
>        Region 0: Memory at 10000000 (64-bit, non-prefetchable) [size=3D25=
6]
>        Region 4: Memory at 10000100 (64-bit, non-prefetchable) [size=3D32=
]
>        Kernel modules: ivshmem_net
>=20
> However, registering a handler on IRQ 17 fails (-EINVAL).
>=20
>=20
> With your dtc [2] (dtc -@ -I dts -O dtb -o vpci-bpi.dtb vpci-bpi.dts)
> and this fragment, I'm still not able to load the blob:
>=20
> /dts-v1/;
> /plugin/;
> / {
> 	compatible =3D "lemaker,bananapi", "allwinner,sun7i-a20";
>=20
> 	fragment@0 {
> 		target-path =3D "/soc@01c00000";
> 		__overlay__ {
> 			#address-cells =3D <2>;
> 			#size-cells =3D <2>;
>=20
> 			vpci@2000000 {
> 				compatible =3D "pci-host-ecam-generic";
> 				device_type =3D "pci";
> 				bus-range =3D <0 0>;
> 				#address-cells =3D <3>;
> 				#size-cells =3D <2>;
> 				#interrupt-cells =3D <1>;
> 				interrupt-map-mask =3D <0 0 0 7>;
> 				interrupt-map =3D <0 0 0 1 &gic 0 0 0 123 4>,
> 						<0 0 0 2 &gic 0 0 0 124 4>,
> 						<0 0 0 3 &gic 0 0 0 125 4>,
> 						<0 0 0 4 &gic 0 0 0 126 4>;
> 				reg =3D <0 0x2000000 0 0x100000>;
> 				ranges =3D
> 					<0x02000000 0x00 0x10000000 0x00 0x10000000 0x00 0x30000000>;
> 			};
> 		};
> 	};
> };
>=20

Please try this branch of dtc; it=E2=80=99s a wip of what I=E2=80=99m tryin=
g to push to upstream.

https://github.com/pantoniou/dtc/tree/dgibson-overlay-panto

> Any suggestions? Any patches I'm missing in upstream to make that work?
>=20
> Jan
>=20

Regards

=E2=80=94 Pantelis

> [1] https://github.com/pantoniou/linux-beagle-track-mainline/commit/160e6=
8ec89eca33e8ed0abb13d52c07c54d7fc10
> [2] https://github.com/pantoniou/dtc/tree/dgibson-overlay-panto
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
