From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] [RFC] OF: probe order dependency aware of_platform_populate
Date: Thu, 2 Apr 2015 18:40:07 +0300
Message-ID: <070D5F6B-CDC0-44C5-9627-75D200C78B87@konsulko.com>
References: <1418731891-24768-1-git-send-email-pantelis.antoniou@konsulko.com> <20150319191834.5346CC40A35@trevor.secretlab.ca> <8E250936-B06C-40B4-8C34-557D2361CAF6@konsulko.com> <CAMuHMdU=Zh00DnkAdAJBaAVn8LthYoRoGCVdFAhxQmWaEGHfkw@mail.gmail.com> <1B3AF599-4A64-4FB0-BFB0-0C0544917C6C@konsulko.com> <CAMuHMdWgAzkAJ-ix9NYc46yJRGPHCpmimOjF=HUYprxdgtzkaw@mail.gmail.com> <20150402023803.E6A4DC4076D@trevor.secretlab.ca>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150402023803.E6A4DC4076D-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

> On Apr 2, 2015, at 05:38 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
>=20
> On Mon, 30 Mar 2015 15:27:27 +0200
> , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> wrote:
>> Hi Pantelis,
>>=20
>> On Tue, Mar 24, 2015 at 6:56 PM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>> On Mar 24, 2015, at 07:50 , Geert Uytterhoeven <geert@linux-m68k.o=
rg> wrote:
>>>> On Fri, Mar 20, 2015 at 12:39 PM, Pantelis Antoniou
>>>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>>>> On Mar 19, 2015, at 21:18 , Grant Likely <grant.likely@secretlab=
=2Eca> wrote:
>>>>>> On Tue, 16 Dec 2014 14:11:31 +0200
>>>>>> , Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>>>>> wrote:
>>>>>>> A nice side-effect of the changes in DTC for supporting overlay=
s
>>>>>>> is that it is now possible to do dependency tracking of platfor=
m
>>>>>>> devices automatically.
>>>>>>>=20
>>>>>>> This patch implements dependency aware probe order for users
>>>>>>> of of_platform_populate.
>>>>>>>=20
>>>>>>> There are no changes in the syntax of the DTS bindings, the
>>>>>>> dependency is generated automatically by the use of phandle
>>>>>>> references.
>>>>>>=20
>>>>>> Do you have measurements showing improvement? Conceptually, I do=
n't have
>>>>>> a problem with having a small scale solution like this, but I wa=
nt proof
>>>>>> that it actively makes things better, and is worth the extra com=
plexity.
>>>>>> It's not an easy block of code to understand.
>>>>>=20
>>>>> I will be the first to admit that the code it=E2=80=99s a bit har=
d to follow, but
>>>>> that=E2=80=99s the nature of trees and recursion.
>>>>>=20
>>>>> FWIW I=E2=80=99ve been booting with this applied for a month with=
 no adverse effects,
>>>>> besides the fact that there dependency cycles which I would file =
as a bug.
>>>>=20
>>>> IIUC, this would fix the issue I worked around in "ARM: shmobile: =
r8a73a4:
>>>> Move pfc node to work around probe ordering bug"?
>>>> https://git.kernel.org/cgit/linux/kernel/git/horms/renesas.git/com=
mit/?h=3Dr8a73a4-ccf-and-multiplatform-for-v4.1&id=3De4ba0a9bddff3ba52c=
ec100414d2f178440efc91
>>>=20
>>> A victim^Wtester! Yeah, it=E2=80=99s supposed to do that, but no gu=
arantees, this is an RFC.
>>>=20
>>> I would be happy to know if it solves your problem or not, please k=
eep me in the loop.
>>>=20
>>>> I'll give it a try when I'm back from ELC...
>>=20
>> And so I did. I
>>  1. Moved the pfc node in arch/arm/boot/dts/r8a73a4.dtsi back betwee=
n dmac
>>     and i2c5.
>>  2. Applied your patch,
>>  3. Disabled the check for "/__local_fixups__" in
>>     __of_platform_populate_scan().
>>  4. Added support for "interrupts-extended" (gmail-whitespace-damage=
d patch
>>     at the end of this email),
>>  5. Enabled DEBUG,
>>  6. Uncommented all your debug pr_info() calls (except the one for
>>     "interrupts", as it references non-existing variables!).
>>=20
>> But it didn't make any difference. The debug log below shows that it=
 detects
>> the dependency of pfc@e6050000 on irqc0 (interrupt-controller@e61c00=
00)
>> irqc1 (interrupt-controller@e61c0200), but it doesn't reorder the no=
des,
>> so pfc is still initialized first:
>=20
> I talked to Pantelis about this while we were at ELC. Even if it did
> correctly reorder the registration and solved your problem, it won't
> help at all for most devices registered by the of_platform_populate()
> call.
>=20
> The core device model is oportunistic about when drivers get bound to
> devices. Both drivers and devices can be registered at any time. When=
 a
> device is registered, it kernel tries to bind it against all availabl=
e
> drivers, and similarly when a driver is registered the kernel tries t=
o
> bind it with all unbound devices.
>=20
> In the normal case, of_platform_populate() is called at arch_initcall
> (level 3).  Most drivers are registered at device_initcall (level 6).
> The only reason reordering works for you is because both the renesas =
pfc
> irqc drivers use postcore_initcall (level 2). Therefore, both drivers
> get registered before of_platform_populate() which makes device
> registration order matter. If the devices were registered before the
> drivers, then it would be kernel link order which determines the
> behaviour.
>=20
> There are two ways to fix this so that .dtb order doesn't matter. The
> dirty hack is to change the pfc driver to use subsys_initcall (level =
4)
> or later so that it happens after the devices are registered. The sec=
ond
> solution is to make the pfc drivers able to return -EPROBE_DEFER, but
> that also requires fixing deferred probe to start retrying devices
> before late_initcall time. Right now there is a holdoff flag that
> prevents any retries before late_initcall(). It was done that way
> because the defer workqueue conflicted with some of the initcalls in =
a
> bad way.
>=20
> We could add a manual walk of the queue between each initcall level
> without using the workqueue. That would solve the problem.
>=20

I=E2=80=99ve been spending some time getting things to work properly ta=
king into
account the essentially random way that drivers are registered.

My complete understanding is this:

The platform devices that are part of any directly reachable from root =
simple busses
are registered sometime on init_machine() at arch_initcall() time.

The drivers are registered at device_initcall() but not all of them. So=
me of them
are _required_ to be initialized earlier in order for the devices to be=
 instantiated first.
=46or instance dma engine drivers.

I am toying with marking drivers that have been matched with devices an=
d not instantiating
them immediately, and that might work. Perhaps an easier solution would=
 be just to delay
device register to be performed at the the end device_initcall() since =
all the drivers would
be registered and the device matched immediately.
=20
I don=E2=80=99t know if that will make things go kaboom on some $RANDOM=
_ARCH though.

Does anything come to mind?

IMHO getting this right might make the holdoff hacks go away completely=
=2E

> g.

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
