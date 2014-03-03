From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH 1/3] soc: Introduce drivers/soc place-holder for SOC specific drivers
Date: Mon, 3 Mar 2014 10:13:57 -0600
Message-ID: <2DD4A0BB-509F-4F76-AA03-0CAFC9CEFE97@codeaurora.org>
References: <1393629520-12713-1-git-send-email-santosh.shilimkar@ti.com> <1393629520-12713-2-git-send-email-santosh.shilimkar@ti.com> <20140302171206.6adbea6f@alan.etchedpixels.co.uk> <20140302204822.GA16158@quad.lixom.net>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140302204822.GA16158@quad.lixom.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, devicetree <devicetree@vger.kernel.org>, Paul Walmsley <paul@pwsan.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Sandeep Nair <sandeep_n@ti.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


On Mar 2, 2014, at 2:48 PM, Olof Johansson <olof@lixom.net> wrote:

> On Sun, Mar 02, 2014 at 05:12:06PM +0000, One Thousand Gnomes wrote:
>> On Fri, 28 Feb 2014 18:18:38 -0500
>> Santosh Shilimkar <santosh.shilimkar@ti.com> wrote:
>>=20
>>> Based on earlier thread "https://lkml.org/lkml/2013/10/7/662" and
>>> further discussion at Kernel Summit'2013, it was agreed to create
>>> 'driver/soc' for drivers which are quite SOC specific.
>>>=20
>>> Lets take the discussion forward with this patch.
>>=20
>> So what happens if you put something in say soc/banana and 3 months =
later
>> the same IP block shows up in two other devices both of which have t=
heir
>> own soc/ directory already ?
>=20
> This isn't so much about IP blocks as about all the other glue logic =
and
> management functions that vendors so far seem to implement in their o=
wn ways.
>=20
> I don't remember the name we agreed on, I don't think it was drivers/=
soc --
> partly because naming it that brings up the kinds of questions you ha=
ve.
> Paul took it upon himself to start sorting this out (and merge throug=
h us on
> arm-soc), so he hopefully remembers better than me. :)

I think it was drivers/soc for the case that Paul was going to look at.=
  I=92d expect we=92d go with drivers/soc/<VENDOR> to reduce churn betw=
een newer SoC families from a company sharing something with an older o=
ne, etc.

>=20
>> What happens when the same blocks shows up on both a SoC and
>> later externally ?
>>=20
>> Where does a soc specifc gpio driver go ?
>=20
> drivers/gpio, of course. This isn't changing that.
>=20
>> It seems to me we've got a lot of confusion here because drivers/ is
>> split by type, and we've also got arch/* machine specific drivers an=
d
>> we've got drivers/platform which is intended as far as I can see for
>> everything you'd put in drivers/soc except for that which goes in ar=
ch/*
>> anyway.
>>=20
>> If QMSS is arm specific why isn't it in arch/arm, if it's not why is=
n't
>> it in drivers/platform ?
>=20
> drivers/platform are for specific vendor platforms. I.e. various lapt=
op
> vendors, a few server vendors, etc. Code for a whole silicon vendor's=
 driver
> does not belong there.
>>=20
>> Just trying to understand the point of drivers/soc.=20
>=20
> Shortcutting most of the discussion by focusing on this question. ;)
>=20
> We've been struggling to find a home for some of the code that we wan=
t to keep
> in the kernel tree, and we sat down to talk with (among others) Greg =
at KS to
> try to figure out how to move forward.

We talked about drivers/lib and drivers/soc back at KS.  Greg was going=
 to start of drivers/lib and Paul was going to look at drivers/soc.

> The code isn't the pure drivers. Those we find homes for. GPIO, for e=
xample, is
> a clear choice: they go under drivers/gpio. IRQ controllers under
> drivers/irqchip, etc. We've been good at finding the places for these=
,
> including making new homes for them where none was before (pinctrl an=
d clk
> subsystems come to mind).
>=20
> The type of code we were still looking for a home for is the glue cod=
e that
> tends to be shared between drivers. For example, on a communication c=
hip it
> might be queue managers that are shared between SATA, DMA engine, Eth=
ernet
> controllers, crypto engines, etc. There's no obvious place for us to =
locate
> that today. Most of this code is handled like a library with the driv=
ers
> calling into it.
>=20
> So, again, it's not for drivers as much as for shared management code=
=2E It will
> not be used for drivers (the Keystone patch adds an actual driver, so=
 we need
> to talk about that as well :).
>=20
> And as with all other code in the kernel: If we find that more than o=
ne
> vendor has something compatible, we make them refactor and share the
> code when we discover it. It's a method we use now and it's working p=
retty
> well.
>=20
> Finally, your question on why we're not locating this under arch/*? I=
t's not
> architecture-dependent code, some vendors have several SoCs that are =
very
> similar but with different cores of different architectures (MIPS, AR=
M,
> PowerPC, ARM64, etc). So a location outside of arch/ is needed.
>=20
>=20
> -Olof

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
