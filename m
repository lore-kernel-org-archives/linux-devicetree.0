From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: Using DT overlays for adding virtual hardware
Date: Thu, 9 Jun 2016 08:03:07 +0200
Message-ID: <5759069B.4080800@siemens.com>
References: <575828C0.5000008@siemens.com>
 <20160608151745.GB13355@leverpostej>
 <28BC1AEC-6A7D-4A97-82F4-5670E884C41D@konsulko.com>
 <20160608162343.GD13355@leverpostej>
 <999B1CFF-C204-4C19-AE76-AF9DB54E51E4@konsulko.com>
 <57584A2C.4030507@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <jailhouse-dev+bncBCJI7SMNV4NBBUUN4S5AKGQEXUCO6DA@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
In-Reply-To: <57584A2C.4030507@siemens.com>
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jailhouse <jailhouse-dev@googlegroups.com>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@denx.de>, Antonios Motakis <antonios.motakis@huawei.com>
List-Id: devicetree@vger.kernel.org

On 2016-06-08 18:39, Jan Kiszka wrote:
>>>> The question is since overlays exist and do work, why should he do any=
thing else
>>>> besides using them?
>>>
>>> For one thing, they only work with DT, and there are ACPI ARM server
>>> platforms out there, for which people may wish to use jailhouse. Tying
>>> this to DT is not necessarily the best idea.
>>>
>>
>> I just don=E2=80=99t see how an ACPI based hypervisor can ever be certif=
ied for
>> safety critical applications. It might be possible but it should be
>> an enormous undertaking; perhaps a subset without AML, but then again
>> can you even boot an ACPI box without it?
>=20
> ACPI is out of scope for us. We will probably continue to feed the
> hypervisor with static platform information, generated in advance and
> validated. Can be DT-based one day, but even that is more complex to
> parse than our current structures.
>=20
> But does ACPI usually mean that the kernel no longer has DT support and
> would not be able to handle any overlay? That could be a killer.

However, I suspect that those machines with ACPI will also come with
PCI, in which case we do not need the virtual host bridge anyway.

>=20
>>
>> DT is safer since it contains state only.
>>
>>> To be clear, I'm not arguing *against* overlays as such, just making
>>> sure that we're not prematurely choosing a solution just becasue it's
>>> the one we're aware of.
>=20
> I'm open for any suggestion that is simple. Maybe we can extend a
> trivial existing pci host driver (like pci-host-generic) to work also
> without DT overlays - also fine, at least from Jailhose POV. However,
> any unneeded kernel patch is even better.

OK, trial and error, and some interesting insights: I've played with DT
fragments and the overlay configfs patch of Pantelis [1] to have a
convenient start. Interestingly, I wasn't able to load a fragment that
followed the format specification for overlays ("Failed to resolve
tree"). By chance, I got this one working:

/dts-v1/;
/ {
	fragment {
		target-path =3D "/soc@01c00000";
		__overlay__ {
			#address-cells =3D <2>;
			#size-cells =3D <2>;

			vpci@0x2000000 {
				compatible =3D "pci-host-cam-generic";
				device_type =3D "pci";
				#address-cells =3D <3>;
				#size-cells =3D <2>;
				reg =3D <0 0x2000000 0 0x1000000>;
				ranges =3D
					<0x02000000 0x00 0x10000000 0x00 0x10000000 0x00 0x30000000>;
			};
		};
	};
};

It successfully makes a BananaPi kernel add a pci host with the
specified config space and MMIO window.

[   81.619583] PCI host bridge /soc@01c00000/vpci@0x2000000 ranges:
[   81.619610]   No bus range found for /soc@01c00000/vpci@0x2000000, using=
 [bus 00-ff]
[   81.619634]   MEM 0x10000000..0x3fffffff -> 0x10000000
[   81.620482] pci-host-generic 2000000.vpci: ECAM at [mem 0x02000000-0x02f=
fffff] for [bus 00-ff]
[   81.620779] pci-host-generic 2000000.vpci: PCI host bridge to bus 0000:0=
0
[   81.620801] pci_bus 0000:00: root bus resource [bus 00-ff]
[   81.620814] pci_bus 0000:00: root bus resource [mem 0x10000000-0x3ffffff=
f]
[   81.620851] PCI: bus0: Fast back to back transfers enabled

So, no /plugin/ statement, no phandles resolution. This format even
builds with the in-kernel dtc. Any explanations? Does the code make
sense (at least it builds without warnings)?

Now I need to back this with some code in Jailhouse.

Jan

[1] https://github.com/pantoniou/linux-beagle-track-mainline/commit/160e68e=
c89eca33e8ed0abb13d52c07c54d7fc10

--=20
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
