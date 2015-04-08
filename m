From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] [RFC] OF: probe order dependency aware of_platform_populate
Date: Wed, 8 Apr 2015 12:16:38 +0300
Message-ID: <2B8BD326-8A21-45F3-8276-DF3B303B11D8@konsulko.com>
References: <1418731891-24768-1-git-send-email-pantelis.antoniou@konsulko.com> <20150319191834.5346CC40A35@trevor.secretlab.ca> <8E250936-B06C-40B4-8C34-557D2361CAF6@konsulko.com> <CAMuHMdU=Zh00DnkAdAJBaAVn8LthYoRoGCVdFAhxQmWaEGHfkw@mail.gmail.com> <1B3AF599-4A64-4FB0-BFB0-0C0544917C6C@konsulko.com> <CAMuHMdWgAzkAJ-ix9NYc46yJRGPHCpmimOjF=HUYprxdgtzkaw@mail.gmail.com> <20150402023803.E6A4DC4076D@trevor.secretlab.ca> <CAMuHMdWVTsog2_9iyUEBWm-7xonvNibTTbOY5YxvpAhffUXdcg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdWVTsog2_9iyUEBWm-7xonvNibTTbOY5YxvpAhffUXdcg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

> On Apr 8, 2015, at 11:42 , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> =
wrote:
>=20
> Hi Grant,
>=20
> On Thu, Apr 2, 2015 at 4:38 AM, Grant Likely <grant.likely@secretlab.=
ca> wrote:
>> On Mon, 30 Mar 2015 15:27:27 +0200
>> , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
>> wrote:
>>> On Tue, Mar 24, 2015 at 6:56 PM, Pantelis Antoniou
>>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>>> On Mar 24, 2015, at 07:50 , Geert Uytterhoeven <geert@linux-m68k.=
org> wrote:
>>>>> IIUC, this would fix the issue I worked around in "ARM: shmobile:=
 r8a73a4:
>>>>> Move pfc node to work around probe ordering bug"?
>>>>> https://git.kernel.org/cgit/linux/kernel/git/horms/renesas.git/co=
mmit/?h=3Dr8a73a4-ccf-and-multiplatform-for-v4.1&id=3De4ba0a9bddff3ba52=
cec100414d2f178440efc91
>=20
>> There are two ways to fix this so that .dtb order doesn't matter. Th=
e
>> dirty hack is to change the pfc driver to use subsys_initcall (level=
 4)
>> or later so that it happens after the devices are registered. The se=
cond
>=20
> I've just tried that, and it doesn't work.
>=20
>> solution is to make the pfc drivers able to return -EPROBE_DEFER, bu=
t
>> that also requires fixing deferred probe to start retrying devices
>> before late_initcall time. Right now there is a holdoff flag that
>=20
> All the pfc driver can detect is that some platform_device.resource[i=
] are
> empty (resource_type zero). Returning -EPROBE_DEFER won't help,
> as the resource won't change later.
>=20
> The problem is not the initialization order of the device drivers, bu=
t the
> creation order of the platform devices.
>=20
> of_device_alloc() silently (except for the pr_debug() message) ignore=
s
> any failures to setup IRQ resources. Hence platform devices for inter=
rupt
> providers must be created before platform devices for interrupt consu=
mers,
> which is what the reordering in DT fixes.
>=20
> See also the information in the commit message linked at the top.
>=20

=46WIW I=E2=80=99ve been digging deeper in the rabbit hole=E2=80=A6

We do have some ugly warts in our core code. For instance the mess with=
 the interrupt
controllers being not created normally but by a special linker section =
magic.

Then we have dma controllers needing to be registered at subsys_initcal=
l() for obvious reasons.

I suspect things are similar for all subsystem services drivers.

The good thing about dependency tracking is that all of this is solved =
automatically.
Since the devices will have references to the interrupt controller node=
 it will be shoved in front
of the dependency list. Same thing with dma, iommu etc.

I will have something that works shortly, but I would prefer to start s=
ome kind of discussion
about what to do about device dependencies in the core, and not hack so=
mething for just the OF
case.

What do you guys think?

> Gr{oetje,eeting}s,
>=20
>                        Geert
>=20

Regards

=E2=80=94 Pantelis

> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>=20
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
>                                -- Linus Torvalds

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
