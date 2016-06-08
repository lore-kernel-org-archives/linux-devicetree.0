From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: Using DT overlays for adding virtual hardware
Date: Wed, 8 Jun 2016 18:57:37 +0300
Message-ID: <28BC1AEC-6A7D-4A97-82F4-5670E884C41D@konsulko.com>
References: <575828C0.5000008@siemens.com> <20160608151745.GB13355@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <jailhouse-dev+bncBCV5BG4UVENBB5MA4G5AKGQESMFFCQA@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
In-Reply-To: <20160608151745.GB13355@leverpostej>
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

> On Jun 8, 2016, at 18:17 , Mark Rutland <mark.rutland@arm.com> wrote:
>=20
> On Wed, Jun 08, 2016 at 04:16:32PM +0200, Jan Kiszka wrote:
>> Hi all,
>>=20
>> already started the discussion off-list with Pantelis, but it's better
>> done in public:
>>=20
>> I'm currently exploring ways to make Linux recognize dynamically added
>> virtual hardware when running under the Jailhouse hypervisor [1]. We
>> need to load drivers for inter-partition communication devices that only
>> appear after Jailhouse started (which is done from within Linux, i.e.
>> long after boot) or when a partition was added later on. Probably, we
>> will simply add a virtual PCI host bridge on systems without physical
>> PCI and let the IPC device be explored that way (already works on x86).
>> Still, that leaves us with hotplug and unplug on hypervisor activation
>> and deactivation.
>=20
> If I've understood correctly you want to use overlays to inject the
> virtual PCI host bridge?
>=20
> Given that you know precisely what you want to inject, I'm not sure I
> see the value of using an overlay.=20
>=20
> Is there some reason you can't just create a device without having to go
> via an intermediate step? As I understand it, Xen does that for (some)
> virtual devices provided to Dom0 and DomU.
>=20

As far as I understand it PCI is just one of the cases. You could conceivab=
ly
inject any kind of virtio device like serial/storage networking etc.

The question is since overlays exist and do work, why should he do anything=
 else
besides using them? I doubt he=E2=80=99s interested in writing yet another =
driver for
something that already exists and works.

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
