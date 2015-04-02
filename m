From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] [RFC] OF: probe order dependency aware
 of_platform_populate
Date: Wed, 01 Apr 2015 19:38:03 -0700
Message-ID: <20150402023803.E6A4DC4076D@trevor.secretlab.ca>
References: <1418731891-24768-1-git-send-email-pantelis.antoniou@konsulko.com>
	<20150319191834.5346CC40A35@trevor.secretlab.ca>
	<8E250936-B06C-40B4-8C34-557D2361CAF6@konsulko.com>
	<CAMuHMdU=Zh00DnkAdAJBaAVn8LthYoRoGCVdFAhxQmWaEGHfkw@mail.gmail.com>
	<1B3AF599-4A64-4FB0-BFB0-0C0544917C6C@konsulko.com>
	<CAMuHMdWgAzkAJ-ix9NYc46yJRGPHCpmimOjF=HUYprxdgtzkaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdWgAzkAJ-ix9NYc46yJRGPHCpmimOjF=HUYprxdgtzkaw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 30 Mar 2015 15:27:27 +0200
, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
 wrote:
> Hi Pantelis,
>=20
> On Tue, Mar 24, 2015 at 6:56 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >> On Mar 24, 2015, at 07:50 , Geert Uytterhoeven <geert@linux-m68k.o=
rg> wrote:
> >> On Fri, Mar 20, 2015 at 12:39 PM, Pantelis Antoniou
> >> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >>>> On Mar 19, 2015, at 21:18 , Grant Likely <grant.likely@secretlab=
=2Eca> wrote:
> >>>> On Tue, 16 Dec 2014 14:11:31 +0200
> >>>> , Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >>>> wrote:
> >>>>> A nice side-effect of the changes in DTC for supporting overlay=
s
> >>>>> is that it is now possible to do dependency tracking of platfor=
m
> >>>>> devices automatically.
> >>>>>
> >>>>> This patch implements dependency aware probe order for users
> >>>>> of of_platform_populate.
> >>>>>
> >>>>> There are no changes in the syntax of the DTS bindings, the
> >>>>> dependency is generated automatically by the use of phandle
> >>>>> references.
> >>>>
> >>>> Do you have measurements showing improvement? Conceptually, I do=
n't have
> >>>> a problem with having a small scale solution like this, but I wa=
nt proof
> >>>> that it actively makes things better, and is worth the extra com=
plexity.
> >>>> It's not an easy block of code to understand.
> >>>
> >>> I will be the first to admit that the code it=E2=80=99s a bit har=
d to follow, but
> >>> that=E2=80=99s the nature of trees and recursion.
> >>>
> >>> FWIW I=E2=80=99ve been booting with this applied for a month with=
 no adverse effects,
> >>> besides the fact that there dependency cycles which I would file =
as a bug.
> >>
> >> IIUC, this would fix the issue I worked around in "ARM: shmobile: =
r8a73a4:
> >> Move pfc node to work around probe ordering bug"?
> >> https://git.kernel.org/cgit/linux/kernel/git/horms/renesas.git/com=
mit/?h=3Dr8a73a4-ccf-and-multiplatform-for-v4.1&id=3De4ba0a9bddff3ba52c=
ec100414d2f178440efc91
> >
> > A victim^Wtester! Yeah, it=E2=80=99s supposed to do that, but no gu=
arantees, this is an RFC.
> >
> > I would be happy to know if it solves your problem or not, please k=
eep me in the loop.
> >
> >> I'll give it a try when I'm back from ELC...
>=20
> And so I did. I
>   1. Moved the pfc node in arch/arm/boot/dts/r8a73a4.dtsi back betwee=
n dmac
>      and i2c5.
>   2. Applied your patch,
>   3. Disabled the check for "/__local_fixups__" in
>      __of_platform_populate_scan().
>   4. Added support for "interrupts-extended" (gmail-whitespace-damage=
d patch
>      at the end of this email),
>   5. Enabled DEBUG,
>   6. Uncommented all your debug pr_info() calls (except the one for
>      "interrupts", as it references non-existing variables!).
>=20
> But it didn't make any difference. The debug log below shows that it =
detects
> the dependency of pfc@e6050000 on irqc0 (interrupt-controller@e61c000=
0)
> irqc1 (interrupt-controller@e61c0200), but it doesn't reorder the nod=
es,
> so pfc is still initialized first:

I talked to Pantelis about this while we were at ELC. Even if it did
correctly reorder the registration and solved your problem, it won't
help at all for most devices registered by the of_platform_populate()
call.

The core device model is oportunistic about when drivers get bound to
devices. Both drivers and devices can be registered at any time. When a
device is registered, it kernel tries to bind it against all available
drivers, and similarly when a driver is registered the kernel tries to
bind it with all unbound devices.

In the normal case, of_platform_populate() is called at arch_initcall
(level 3).  Most drivers are registered at device_initcall (level 6).
The only reason reordering works for you is because both the renesas pf=
c
irqc drivers use postcore_initcall (level 2). Therefore, both drivers
get registered before of_platform_populate() which makes device
registration order matter. If the devices were registered before the
drivers, then it would be kernel link order which determines the
behaviour.

There are two ways to fix this so that .dtb order doesn't matter. The
dirty hack is to change the pfc driver to use subsys_initcall (level 4)
or later so that it happens after the devices are registered. The secon=
d
solution is to make the pfc drivers able to return -EPROBE_DEFER, but
that also requires fixing deferred probe to start retrying devices
before late_initcall time. Right now there is a holdoff flag that
prevents any retries before late_initcall(). It was done that way
because the defer workqueue conflicted with some of the initcalls in a
bad way.

We could add a manual walk of the queue between each initcall level
without using the workqueue. That would solve the problem.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
