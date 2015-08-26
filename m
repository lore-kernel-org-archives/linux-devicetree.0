From: Caesar Wang <wxt@rock-chips.com>
Subject: Re: [RESEND PATCH v16 4/4] ARM: dts: add the support power-domain
 node on RK3288 SoCs
Date: Wed, 26 Aug 2015 17:24:39 +0800
Message-ID: <55DD85D7.5010208@rock-chips.com>
References: <1440487486-6154-1-git-send-email-wxt@rock-chips.com> <1440487486-6154-5-git-send-email-wxt@rock-chips.com> <7hfv37axhj.fsf@deeprootsystems.com> <CAD=FV=V6oG+9U=W_JZmqCuNo-9-5wW8ffZzG7ZE_3cnSTNAjFQ@mail.gmail.com> <7htwrn6l7g.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7htwrn6l7g.fsf@deeprootsystems.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Russell King <linux@arm.linux.org.uk>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "jinkun.hong" <jinkun.hong@rock-chips.com>, Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org



=E5=9C=A8 2015=E5=B9=B408=E6=9C=8826=E6=97=A5 06:45, Kevin Hilman =E5=86=
=99=E9=81=93:
> Doug Anderson <dianders@chromium.org> writes:
>
>> Kevin,
>>
>> On Tue, Aug 25, 2015 at 2:07 PM, Kevin Hilman <khilman@kernel.org> w=
rote:
>>> Caesar Wang <wxt@rock-chips.com> writes:
>>>
>>>> We can add more domains node in the future.
>>>> This patch add the needed clocks into power-controller.
>>>> As the discuess about all the device clocks being listed in
>>>> the power-domains itself.
>>>>
>>>> There are several reasons as follows:
>>>>
>>>> Firstly, the clocks need be turned off to save power when
>>>> the system enter the suspend state. So we need to enumerate
>>>> the clocks in the dts. In order to power domain can turn on and of=
f.
>>> Yes, but this is the job of device drivers which are runtime PM ada=
pted
>>> to gate their own clocks.  I agree these clocks need to be enumerat=
ed in
>>> the DTS, but they should be in the device nodes.
>> I _think_ what Caesar means is that the alternative to this patch is
>> to leave the clocks on all the time as they were during the early da=
ys
>> of Rockchip (AKA last year).  If the clocks are on all the time then
>> the power domain patches can work fine.  However, once you start
>> letting clocks turn off then you need to make sure that the power
>> domain code turns the back on temporarily.
> Yup, I understand that part, and many SoCs have this same "feature".
>
>>>> Secondly, the reset-circuit should reset be synchronous on RK3288,
>>>> then sync revoked. So we need to enable clocks of all devices.
>>>> In other words, we have to enable the clocks before you operate th=
em
>>>> if all the device clocks are included in someone domians.
>>> Yes, this is pretty common for reset.
>>>
>>>> Someone wish was to get the clocks by reading the clocks from the
>>>> device nodes, We can do that but we can solve the above issues.
>>> I don't follow this sentence.  Are you saying doing that will not s=
olve
>>> the above issues?  Why not?  Please explain.
>>>
>>> If there are non-device clocks that also need to be enabled before
>>> asserting reset, then those are candidates for the power-domain nod=
e,
>>> but not device clocks.
>> It's been a long time and I don't know that I've reviewed every
>> revision of this series, but I think there was a proposal that we
>> shouldn't list clocks here.  Instead we should search through and fi=
nd
>> all devices that refer to this power domain, reach in and find their
>> clocks, and turn them on.  Did I get that right?
> Yes...

Sounds resonable, the domain(e.g. "pd_vio"...) idle will be abnormal bu=
t=20
you have registered all devices.
Why?
AFAIK, you need turn on the noc/ip clocks if we are operating the=20
"pd_vio" domain to enter the idle status.
if the noc is same clock with ip side.  We need turn on the IP side=20
clocks. Otherwise we need turn on the noc clocks.

>> To put things in a
>> concrete way, for pd_vio we'd go through the entire device tree
>> ourselves and find all properties that look like "power-domains =3D
>> <&power RK3288_PD_VIO>;".  We'd then find the parent of those
>> properties and look for a property named "clocks".  We'd then iterat=
e
>> over all those clocks and turn those on.  Did I get that right?
> ... but you make it sound like more work than it is.  The genpd alrea=
dy
> keeps a list of devices that refer to the power domain.  In fact, the
> genpd 'attach' method can be platform-specific, so could be used to k=
eep
> track of a list (or a subset) of clocks which are needed for reset.
>
>> The above doesn't seem like a terribly great idea to me for a number
>> of reasons, including:
>>
>> 1. If I remember correctly, it's important to turn on clocks for
>> devices even if they're not something you're using / have a driver
>> for.  If you don't then the device won't get reset properly and this
>> can affect things like suspend/resume because the hardware in the So=
C
>> will query all devices at suspend time to make sure they're ready.
> Correct.  This condition also exists in the clock framework when unus=
ed
> clocks are disabled, or if you have drivers but PM_RUNTIME is disable=
d
> (which can happen from userspace on a per-device basis) so it needs t=
o
> be understood and managed already.
>
>> If
>> a device is wedged because its clock wasn't on at the right them the=
n
>> it will cause problems.
> Right.  I'm not arguing that the power domain doesn't have to deal wi=
th
> device clocks. It has to for sync reset.  The objection I have have i=
s
> where these clocks are described.
>
>> 2. If we absolutely need to turn all clocks and we get clocks from
>> device tree nodes on then it means we need device tree nodes for eve=
ry
>> device in the domain.
> Isn't that the end goal?
>
>> These would be needed even if there are no
>> accepted bindings for this device yet.  So we'd need to do one of: A=
)
>> Block power domain patches on feature complete bindings for all
>> drivers; B) Make up non-approved compatible strings for all devices
>> and throw them into the DTS; C) Add nodes in the DTS without a
>> compatible string just to satisfy the power domain requirements.  No=
ne
>> of these seem terribly appealing.
> well, I think we can be slightly more accomodating than that and go f=
or
> somewhere in between:
>
> D) In the power-domain DTS, clearly describe why each clock is needed=
 by
> the power-domain.  In particular list out clocks that are not device
> clocks (and why they need to be asserted for reset) and separate thos=
e
> from device clocks which are only listed in the power-domain because
> there is not *yet* a driver/binding for that device node.
>
> Doing it that way also makes it clear that when a new driver/binding =
is
> added, the clocks should be removed from the power-domain node and pu=
t
> into the device node.
>
> Also, this addresses my primary concern that the DTS acurately descri=
bes
> the hardware.  IOW, in hardware, most of these clocks are are propert=
ies
> of devices, not power-domains, and the DT should reflect that.
>
> IMO, if it's not describing the hardware, and is a placeholder until =
a
> driver/binding is in place, it should be properly documented.
>
>> 3. It is entirely possible that there are clocks that will be listed
>> in the individual devices that aren't needed for powering on the pow=
er
>> domain.  I'd tend to believe that PCLK_EDP_CTRL (the pixel clock)
>> doesn't really need to be turned on when adjusting the "VIO" power
>> domain.  Right now Caesar has it listed, but it probably isn't neede=
d
>> (Caesar: can you confirm?).
> Yes, I suspect there are several of those, which is also why I'd like=
 to
> see the clocks in the power-domain node described in detail, and exac=
ly
> why they're needed to be enabled.
>
> Also, in the current proposed DTS, clocks that are listed in both dev=
ice
> nodes and the power domain are also suspicous, especially when the
> device node doesn't have a power-domain property.  (c.f. vop[bl] node=
s
> and ACLK_VOP[01] clocks.)  For that matter, this series doesn't add a=
ny
> devices to the power domains, which makes it even more confusing abou=
t
> how this is meant to work.  IOW, with no devices belonging to
> power-domains, how are the power-domain power_on/power_off callbacks
> being called?

Okay, As the cover-letter lists.
We can add the EDP/VOP domain node to test in next-kernel.

Also, the chromium-3.14 has some devices to complete it.

https://chromium.googlesource.com/chromiumos/third_party/kernel/+/v3.14

----
Thanks,
Caesar


>> 4. It seems just slightly brittle to be reaching into other device
>> nodes and making assumptions about their properties.  Yeah, it's
>> probably safe to assume that "clocks" has a list of clocks and
>> "power-domains" will point to something whose first entry is a
>> phandle, but it still seems just a tad bit like violating an
>> abstraction barrier.
> shmobile is already doing this with platform-specific genpd attach
> callbacks, and using the pm_clk API.  I don't see any issues with tha=
t.
>
>> Anyway, perhaps I'm misunderstanding, or perhaps my concerns are
>> simply not for important things.  If so feel free to yell at me.  ;)
> No need for me to yell. Your concerns are perfectly valid, and it's n=
ot
> my style anyways. ;)
>
> Thanks for the feedback,
>
> Kevin
>
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
