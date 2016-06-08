From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: Using DT overlays for adding virtual hardware
Date: Wed, 8 Jun 2016 18:39:08 +0200
Message-ID: <57584A2C.4030507@siemens.com>
References: <575828C0.5000008@siemens.com>
 <20160608151745.GB13355@leverpostej>
 <28BC1AEC-6A7D-4A97-82F4-5670E884C41D@konsulko.com>
 <20160608162343.GD13355@leverpostej>
 <999B1CFF-C204-4C19-AE76-AF9DB54E51E4@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <jailhouse-dev+bncBCJI7SMNV4NBBMEU4G5AKGQEBPJGDGA@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
In-Reply-To: <999B1CFF-C204-4C19-AE76-AF9DB54E51E4@konsulko.com>
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jailhouse <jailhouse-dev@googlegroups.com>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@denx.de>, Antonios Motakis <antonios.motakis@huawei.com>
List-Id: devicetree@vger.kernel.org

On 2016-06-08 18:31, Pantelis Antoniou wrote:
> Hi Mark,
>=20
>> On Jun 8, 2016, at 19:23 , Mark Rutland <mark.rutland@arm.com> wrote:
>>
>> On Wed, Jun 08, 2016 at 06:57:37PM +0300, Pantelis Antoniou wrote:
>>> Hi Mark,
>>>
>>>> On Jun 8, 2016, at 18:17 , Mark Rutland <mark.rutland@arm.com> wrote:
>>>>
>>>> On Wed, Jun 08, 2016 at 04:16:32PM +0200, Jan Kiszka wrote:
>>>>> Hi all,
>>>>>
>>>>> already started the discussion off-list with Pantelis, but it's bette=
r
>>>>> done in public:
>>>>>
>>>>> I'm currently exploring ways to make Linux recognize dynamically adde=
d
>>>>> virtual hardware when running under the Jailhouse hypervisor [1]. We
>>>>> need to load drivers for inter-partition communication devices that o=
nly
>>>>> appear after Jailhouse started (which is done from within Linux, i.e.
>>>>> long after boot) or when a partition was added later on. Probably, we
>>>>> will simply add a virtual PCI host bridge on systems without physical
>>>>> PCI and let the IPC device be explored that way (already works on x86=
).
>>>>> Still, that leaves us with hotplug and unplug on hypervisor activatio=
n
>>>>> and deactivation.
>>>>
>>>> If I've understood correctly you want to use overlays to inject the
>>>> virtual PCI host bridge?
>>>>
>>>> Given that you know precisely what you want to inject, I'm not sure I
>>>> see the value of using an overlay.=20
>>>>
>>>> Is there some reason you can't just create a device without having to =
go
>>>> via an intermediate step? As I understand it, Xen does that for (some)
>>>> virtual devices provided to Dom0 and DomU.
>>>
>>> As far as I understand it PCI is just one of the cases. You could conce=
ivably
>>> inject any kind of virtio device like serial/storage networking etc.
>>
>> Sure, but we already have PCI transport for virtio devices, and per the
>> above PCI is the transport used on x86, so I assume that the devices we
>> really care about are going to be PCI anyhow.
>>
>=20
> PCI on VMs is a hack, it=E2=80=99s all emulated.
>=20
> We=E2=80=99re using it as crutch because it=E2=80=99s ubiquitous and is c=
apable
> of probing, but it comes with a considerable amount of baggage.
> Jailhouse is a particular kind of a hypervisor where it is intended for
> safety critical applications and designed to be certified as such.
> The less amount of code it contains the better, and much easier to certif=
y.=20

That's true, but we already have to live with PCI on x86, thus the code
is there, and it's more and more present on ARM[64] as well.

We are trying hard to make it simple, primarily for the hypervisor, and
if it is simpler to plug a trivial virtual PCI bridge than to emulate
individual platform IPC devices - also fine.

>=20
>>> The question is since overlays exist and do work, why should he do anyt=
hing else
>>> besides using them?
>>
>> For one thing, they only work with DT, and there are ACPI ARM server
>> platforms out there, for which people may wish to use jailhouse. Tying
>> this to DT is not necessarily the best idea.
>>
>=20
> I just don=E2=80=99t see how an ACPI based hypervisor can ever be certifi=
ed for
> safety critical applications. It might be possible but it should be
> an enormous undertaking; perhaps a subset without AML, but then again
> can you even boot an ACPI box without it?

ACPI is out of scope for us. We will probably continue to feed the
hypervisor with static platform information, generated in advance and
validated. Can be DT-based one day, but even that is more complex to
parse than our current structures.

But does ACPI usually mean that the kernel no longer has DT support and
would not be able to handle any overlay? That could be a killer.

>=20
> DT is safer since it contains state only.
>=20
>> To be clear, I'm not arguing *against* overlays as such, just making
>> sure that we're not prematurely choosing a solution just becasue it's
>> the one we're aware of.

I'm open for any suggestion that is simple. Maybe we can extend a
trivial existing pci host driver (like pci-host-generic) to work also
without DT overlays - also fine, at least from Jailhose POV. However,
any unneeded kernel patch is even better.

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
