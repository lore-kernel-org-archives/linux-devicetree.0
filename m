From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: Using DT overlays for adding virtual hardware
Date: Wed, 8 Jun 2016 19:31:34 +0300
Message-ID: <999B1CFF-C204-4C19-AE76-AF9DB54E51E4@konsulko.com>
References: <575828C0.5000008@siemens.com> <20160608151745.GB13355@leverpostej> <28BC1AEC-6A7D-4A97-82F4-5670E884C41D@konsulko.com> <20160608162343.GD13355@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <jailhouse-dev+bncBCV5BG4UVENBB2UQ4G5AKGQEURBK2BA@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
In-Reply-To: <20160608162343.GD13355@leverpostej>
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jailhouse <jailhouse-dev@googlegroups.com>, =?utf-8?Q?M=C3=A5ns_Rullg=C3=A5rd?= <mans@denx.de>, Antonios Motakis <antonios.motakis@huawei.com>
List-Id: devicetree@vger.kernel.org

Hi Mark,

> On Jun 8, 2016, at 19:23 , Mark Rutland <mark.rutland@arm.com> wrote:
>=20
> On Wed, Jun 08, 2016 at 06:57:37PM +0300, Pantelis Antoniou wrote:
>> Hi Mark,
>>=20
>>> On Jun 8, 2016, at 18:17 , Mark Rutland <mark.rutland@arm.com> wrote:
>>>=20
>>> On Wed, Jun 08, 2016 at 04:16:32PM +0200, Jan Kiszka wrote:
>>>> Hi all,
>>>>=20
>>>> already started the discussion off-list with Pantelis, but it's better
>>>> done in public:
>>>>=20
>>>> I'm currently exploring ways to make Linux recognize dynamically added
>>>> virtual hardware when running under the Jailhouse hypervisor [1]. We
>>>> need to load drivers for inter-partition communication devices that on=
ly
>>>> appear after Jailhouse started (which is done from within Linux, i.e.
>>>> long after boot) or when a partition was added later on. Probably, we
>>>> will simply add a virtual PCI host bridge on systems without physical
>>>> PCI and let the IPC device be explored that way (already works on x86)=
.
>>>> Still, that leaves us with hotplug and unplug on hypervisor activation
>>>> and deactivation.
>>>=20
>>> If I've understood correctly you want to use overlays to inject the
>>> virtual PCI host bridge?
>>>=20
>>> Given that you know precisely what you want to inject, I'm not sure I
>>> see the value of using an overlay.=20
>>>=20
>>> Is there some reason you can't just create a device without having to g=
o
>>> via an intermediate step? As I understand it, Xen does that for (some)
>>> virtual devices provided to Dom0 and DomU.
>>=20
>> As far as I understand it PCI is just one of the cases. You could concei=
vably
>> inject any kind of virtio device like serial/storage networking etc.
>=20
> Sure, but we already have PCI transport for virtio devices, and per the
> above PCI is the transport used on x86, so I assume that the devices we
> really care about are going to be PCI anyhow.
>=20

PCI on VMs is a hack, it=E2=80=99s all emulated.

We=E2=80=99re using it as crutch because it=E2=80=99s ubiquitous and is cap=
able
of probing, but it comes with a considerable amount of baggage.
Jailhouse is a particular kind of a hypervisor where it is intended for
safety critical applications and designed to be certified as such.
The less amount of code it contains the better, and much easier to certify.=
=20

>> The question is since overlays exist and do work, why should he do anyth=
ing else
>> besides using them?
>=20
> For one thing, they only work with DT, and there are ACPI ARM server
> platforms out there, for which people may wish to use jailhouse. Tying
> this to DT is not necessarily the best idea.
>=20

I just don=E2=80=99t see how an ACPI based hypervisor can ever be certified=
 for
safety critical applications. It might be possible but it should be
an enormous undertaking; perhaps a subset without AML, but then again
can you even boot an ACPI box without it?

DT is safer since it contains state only.

> To be clear, I'm not arguing *against* overlays as such, just making
> sure that we're not prematurely choosing a solution just becasue it's
> the one we're aware of.
>=20
> Thanks,
> Mark.

Regards

=E2=80=94 Pantelis

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
