From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: Using DT overlays for adding virtual hardware
Date: Fri, 10 Jun 2016 16:57:29 +0200
Message-ID: <575AD559.3020403@siemens.com>
References: <575828C0.5000008@siemens.com>
 <999B1CFF-C204-4C19-AE76-AF9DB54E51E4@konsulko.com>
 <57584A2C.4030507@siemens.com> <3626899.Rd8tgT5L4H@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <jailhouse-dev+bncBCJI7SMNV4NBBXNK5O5AKGQECEOTZBA@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
In-Reply-To: <3626899.Rd8tgT5L4H@wuerfel>
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jailhouse <jailhouse-dev@googlegroups.com>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@denx.de>, Antonios Motakis <antonios.motakis@huawei.com>
List-Id: devicetree@vger.kernel.org

On 2016-06-09 09:22, Arnd Bergmann wrote:
> On Wednesday, June 8, 2016 6:39:08 PM CEST Jan Kiszka wrote:
>>>>
>>>
>>> I just don=E2=80=99t see how an ACPI based hypervisor can ever be certi=
fied for
>>> safety critical applications. It might be possible but it should be
>>> an enormous undertaking; perhaps a subset without AML, but then again
>>> can you even boot an ACPI box without it?
>>
>> ACPI is out of scope for us. We will probably continue to feed the
>> hypervisor with static platform information, generated in advance and
>> validated. Can be DT-based one day, but even that is more complex to
>> parse than our current structures.
>>
>> But does ACPI usually mean that the kernel no longer has DT support and
>> would not be able to handle any overlay? That could be a killer.
>=20
> The kernel always has DT support built-in, but there may be some code
> paths that do not look at DT properties when it was booted from ACPI.
>=20
> In particular, communicating things like interrupt mappings may be
> hard, as they are represented very differently on ACPI, so you no
> longer have an 'interrupt-parent' node to point to from your overlay.
>=20
> It's hard to say how things would work out when trying to load DT
> overlays in this configuration. My guess is that it's actually
> easier to do on x86 (which doesn't normally rely on ACPI for
> describing the core system) than on arm64.

OK. But let's see if there are really systems with ACPI and without
pre-existing PCI. Currently, I would say the probability is low, because
ACPI means server, and servers love PCI...

>=20
>>> DT is safer since it contains state only.
>>>
>>>> To be clear, I'm not arguing *against* overlays as such, just making
>>>> sure that we're not prematurely choosing a solution just becasue it's
>>>> the one we're aware of.
>>
>> I'm open for any suggestion that is simple. Maybe we can extend a
>> trivial existing pci host driver (like pci-host-generic) to work also
>> without DT overlays - also fine, at least from Jailhose POV. However,
>> any unneeded kernel patch is even better.
>=20
> A few more observations:
>=20
> - you can easily have an arbitrary number of PCI host bridges, so you
>   can always add another PCI bridge just for the virtual devices even
>   on systems that have access to physical PCI devices in passthrough.
>=20
> - PCIe hotplugging seems well-defined enough to just make that work,
>   without needing DT overlays.

The point is about adding virtual devices when there is no physical PCI
- when there is, we can already sneak them in between physical ones.

Granted, when we run out of free slots, there is a need to do more,
either via virtual bridges (but hypervisor is the last place we'd like
to touch), by enforcing Linux to scan on slots outside of the physical
topology or by making it create bridge stubs for virtual devices that
are not assigned to a physical bus. But that's all PCI topics, not
directly related to the original point of adding the host bridge.

>=20
> - The really tricky question is what to do about passthrough of
>   host devices that are not PCI. The current generation of server
>   class arm64 machines tend to have a bunch of those, and the
>   expectation seems to be that hardware passthrough is the only
>   way to get decent I/O performance to make up for the relatively
>   slow CPU cores. If you are only concerned about emulated devices,
>   that won't be a problem though.

Yes, that is tricky, but more from the analytical POV: which devices or
which parts of devices can we hand out to guests without jeopardizing
the system integrity? No generic answers here, for sure.

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
