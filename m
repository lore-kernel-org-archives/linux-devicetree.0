From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: add gpio_of_helper
Date: Fri, 24 Oct 2014 15:23:43 +0900
Message-ID: <CAAVeFuKd7s3qgud0buWgHeSSjOXjVC5M82bjy4m3=B7Tr2OPzw@mail.gmail.com>
References: <4b0bcf4679163c0da53e412a47eecd4bb03849b8.1413966148.git.jiri.prchal@aksignal.cz>
 <CAAVeFuJrmea6yZn2J28ihs3+=FYkZ2QxDv6F7qiq+TPpv_odpw@mail.gmail.com>
 <E5E0C172-C51D-46DC-AE15-71308BDC9829@antoniou-consulting.com>
 <CAAVeFuLh99MJXNNuh=L37pNzgun-Qi=3J4uK4eUSC5Qy107Gzw@mail.gmail.com>
 <E44127F1-1B6B-4BB0-866A-7B142F295FAE@antoniou-consulting.com>
 <CAAVeFuKj66r4UNZ33z3BT5m=7iB3tMC-u_eUDcJmvaNFj-0y5Q@mail.gmail.com>
 <54489EC9.4020108@aksignal.cz> <CAAVeFuK4HxzwKye-RJCMeOSHNGNcvXV49hxnKL+u6ttidze7Tg@mail.gmail.com>
 <F82900FA-5999-4B39-8E7E-6FAA99ABDB2D@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <F82900FA-5999-4B39-8E7E-6FAA99ABDB2D@antoniou-consulting.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Pantelis Antoniou <panto@antoniou-consulting.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Jiri Prchal <jiri.prchal@aksignal.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Added the DT maintainers and fixed the DT mailing-list's address so
this discussion becomes visible to them as well.

On Thu, Oct 23, 2014 at 8:23 PM, Pantelis Antoniou
<panto@antoniou-consulting.com> wrote:
> Hi Alexandre,
>
>> On Oct 23, 2014, at 11:53 AM, Alexandre Courbot <gnurou@gmail.com> w=
rote:
>>
>> On Thu, Oct 23, 2014 at 3:23 PM, Ji=C5=99=C3=AD Prchal <jiri.prchal@=
aksignal.cz> wrote:
>>>
>>>
>>> Dne 23.10.2014 v 07:08 Alexandre Courbot napsal(a):
>>>
>>>> On Wed, Oct 22, 2014 at 6:58 PM, Pantelis Antoniou
>>>> <panto@antoniou-consulting.com> wrote:
>>>>>
>>>>> Hi Alexandre,
>>>>>
>>>>>> On Oct 22, 2014, at 12:41 PM, Alexandre Courbot <gnurou@gmail.co=
m>
>>>>>> wrote:
>>>>>>
>>>>>> On Wed, Oct 22, 2014 at 6:24 PM, Pantelis Antoniou
>>>>>> <panto@antoniou-consulting.com> wrote:
>>>>>>>
>>>>>>> Hi Alexandre,
>>>>>>>
>>>>>>>> On Oct 22, 2014, at 12:18 PM, Alexandre Courbot <gnurou@gmail.=
com>
>>>>>>>> wrote:
>>>>>>>>
>>>>>>>> On Wed, Oct 22, 2014 at 5:26 PM, Jiri Prchal <jiri.prchal@aksi=
gnal.cz>
>>>>>>>> wrote:
>>>>>>>>>
>>>>>>>>> This patch adds new driver "gpio-of-helper", witch has possib=
ility to
>>>>>>>>> export
>>>>>>>>> gpios defined in dt. It exports them in defined name under
>>>>>>>>> /sysfs/class/gpio/name.
>>>>>>>>> It's rebased from Pantelis Antoniou patch to new kernel.
>>>>>>>>> Usage example:
>>>>>>>>>       gpio {
>>>>>>>>>               compatible =3D "gpio-of-helper";
>>>>>>>>>               status =3D "okay";
>>>>>>>>>               pinctrl-names =3D "default";
>>>>>>>>>               pinctrl-0 =3D <&pinctrl_gpio>;
>>>>>>>>>
>>>>>>>>>               gsm_on {
>>>>>>>>>                       gpio-name =3D "gsm_on";
>>>>>>>>>                       gpio =3D <&pioB 13 GPIO_ACTIVE_HIGH>;
>>>>>>>>>                       output;
>>>>>>>>>                       init-low;
>>>>>>>>>               };
>>>>>>>>>       };
>>>>>>>>>
>>>>>>>>> This patch needs Alexey Ignatov [PATCH] gpiolib: allow export=
ing
>>>>>>>>> gpios with
>>>>>>>>> custom names.
>>>>>>>>
>>>>>>>>
>>>>>>>> We will need to see whether the pre-requisite patch can get me=
rged
>>>>>>>> first, but there are a couple of things that are wrong with yo=
ur patch
>>>>>>>> anyway:
>>>>>>>>
>>>>>>>> - it is missing a bindings documentation
>>>>>>>> - it is using the legacy integer GPIOs instead of the descript=
or
>>>>>>>> interface (see include/linux/gpio/consumer.h). Since this is D=
T-based,
>>>>>>>> there is absolutely no reason to not use the descriptors inter=
face.
>>>>>>>> - it seems quite long for what it needs to do
>>>>>>>> - the MODULE_AUTHOR has not signed-off this patch (?)
>>>>>>>>
>>>>>>>> But what makes me nervous is that this encourages more usage o=
f the
>>>>>>>> sysfs interface, an in a way that is potentially harmful.
>>>>>>>>
>>>>>>>> Also, I don't know if the DT people will be happy with this id=
ea.
>>>>>>>> Since this concerns DT, please also add the devicetree list an=
d get a
>>>>>>>> Acked-by for the bindings you want to push by a DT maintainer.
>>>>>>>
>>>>>>>
>>>>>>> Since I=E2=80=99m the original perpetrator, let me put a few wo=
rds here for
>>>>>>> posterity.
>>>>>>>
>>>>>>> This patch was meant as a quick and dirty method for doing the
>>>>>>> automatic export
>>>>>>> and pinmux configuration from DT on a 3.8 kernel. The kernel AP=
Is have
>>>>>>> moved on
>>>>>>> since. It wasn=E2=80=99t meant to be submitted for mainline rig=
ht as it is.
>>>>>>>
>>>>>>> Unfortunately (or fortunately for many people) it does what a l=
ot of
>>>>>>> people need
>>>>>>> i.e. configures a board with heavily pinmuxed GPIO right at boo=
t time.
>>>>>>>
>>>>>>> I=E2=80=99m open at having a small discussion about how to do w=
hat the users of
>>>>>>> this patch
>>>>>>> do =E2=80=98right=E2=80=99.
>>>>>>
>>>>>>
>>>>>> Sure, although the discussion might turn out to not be that "sma=
ll". :)
>>>>>>
>>>>>
>>>>> Heh ;)
>>>>>
>>>>>> Pinmux configuration sounds like a job for pinmux more than GPIO=
, and
>>>>>> exporting potentially many GPIOs to user-space sounds like a wor=
k for
>>>>>> a proper driver.
>>>>>>
>>>>>
>>>>> I=E2=80=99m afraid that=E2=80=99s not the case. A great many user=
s do not require
>>>>> anything
>>>>> more than setting a pinmux and the GPIO configuration (input/outp=
ut).
>>>>> They can then do low speed I/O using the sysfs interface, without=
 having
>>>>> to
>>>>> use any complex APIs (shell works just fine).
>>>>>
>>>>> Think of stuff like controlling a sprinkler valve, or something l=
ike a
>>>>> mechanical
>>>>> door detection open state.
>>>>
>>>>
>>>> That sounds like any kind of arbitrary device that can be temporar=
ily
>>>> connected to a set of GPIOs that will be bit-banged. Is my
>>>> interpretation correct?
>>>
>>>
>>> Not only temporarily. For example on/off switch of some hw on board=
 like gsm
>>> modem.
>>
>> ... which should be handled in-kernel.
>>
>
> Not really. This is part of some kind user-space ABI but which has to=
 do
> with the mapping of an named GPIO in the board schematics to user-spa=
ce.
>
>>> Or some optocoupler isoleted in/outs for general use from userspace=
=2E
>>
>> ... which should thus be configured from userspace.
>>
>
> No. It is used from userspace, but the the configuration of such is p=
erformed
> by board specific means in the kernel.
>
>>>>
>>>>
>>>> In that case, I seriously doubt that this should be part of the DT=
=2E
>>>> Right now the DT is part of the firmware, and an immutable descrip=
tion
>>>> of the hardware layout of a board - definitely such devices do not=
 fit
>>>
>>> This is our case of gpio. It's like LEDs, they are hw layout of boa=
rd,
>>> but they are in/out instead of LEDs are only output.
>>>>
>>>> into that definition. This might change once the Device Tree Overl=
ays
>>>> are merged, but we are not there yet. If the DT maintainers say th=
is
>>>> is a valid use-case for overlays, then I will reconsider my positi=
on,
>>>> but in any case it really looks like this could/should be done fro=
m
>>>> user-space.
>>>
>>> I don't think so as I explained - HW layout of boerd.
>>
>> If it is a static hardware layout that makes the case even clearer -
>> these devices should have a proper kernel driver that configures the=
se
>> GPIOs, and exports a proper interface to userspace, not just raw
>> GPIOs.
>
> Raw GPIOs is what the user-space application wants to use. There is n=
o
> higher abstraction possible.

Why can't the application use something else than raw GPIOs? Don't you
have its source code?

>
> What these applications need are:
>
> 1. A way to map a GPIO to a name that is board invariant. Many boards
> move GPIOs around but the function typically stays the same. So for
> instance rev-0 might have GARAGE_DOOR to GPIO_A10, and on subsequent
> revision rev-1 it might be GARAGE_DOOR to GPIO_B08. The user-space
> application that controls everything does not want to deal with revis=
ions
> ideally, just to know that the named GARAGE_DOOR gpio exists.

This sounds pretty much like you are asking to register
application-specific configuration into the DT.

>
> 2. A way to have the pinmux configuration of said GPIO configured wit=
hout
> having to do anything explicit. I.e. on am335x the pinmux configurati=
on is
> decoupled from the GPIO driver; having a GPIO configured as a GPIO do=
es not
> alter the pinmux settings.

Shouldn't that be fixed in the pinmux/GPIO kernel drivers? I am not
too familiar with pinmux, but IIUC pixmux configuration when GPIOs are
requested is something that is commonly done.

>
> 3. The user-space facing API must be simple, preferably file based li=
ke the
> sysfs method right now. It is very simple to use even from within scr=
ipts.

That we definitely agree, and as of today there are many ways to do thi=
s:
1) A dedicated driver that exposes exactly the right interface to
sysfs. I know it may seem overkill, but we have drivers for other
simple things like GPIO-controlled LEDs.
2) If you think writing a driver is not worth the effort, you can
already export and configure (and I'm willing to discuss the
possibility to add "give names" to that list) GPIOs, from user-space.

I understand that you want to keep the GPIO exporting/configuration
from the DT to have all the board-specific settings in one place, but
my understanding of the device tree is that it is supposed to say "I
have a garage door control device connected to this GPIO", not "export
this GPIO as input active-low, and name it GARAGE_DOOR".

>
>>
>>> In other way I'm looking forward for DT overlays.
>>>>
>>>>
>>>> You have almost all the necessary pieces: you can export, configur=
e
>>>> and manipulate any GPIO from the sysfs interface. The only thing y=
ou
>>>> would be missing is a way to give a name to a GPIO, something that=
 can
>>>> easily be fixed.
>>>
>>> But isn't it nice to have already exported gpios which are layouted=
 out
>>> from board. All other unexported gpios aren't connected to anywhere=
 on
>>> board. So user don't have to export or unexport anything.
>>>>
>>>>
>>>> Since the devices you want to configure that way are typically
>>>> removable or usage-specific, why would you want to store that
>>>> information all the way up into the firmware? A commonly accepted
>>>> wisdom is that what can be done in user-space should be done in
>>>> user-space, and it really looks like this applies here.
>>>
>>> They are NOT removable.
>>>>
>>>>
>>>> Say you buy a Jetson TK1 to control that sprinkler valve (a good u=
se
>>>> for all these GPU cores!). The mainline DT has no knowledge about =
the
>>>> valve, so using your proposed way you will have to re-build and fl=
ash
>>>> a custom device tree just to be able to use your sprinkler. If you
>>>> decide to assign your board to something else, you will need anoth=
er
>>>> DT.
>>>
>>> But if you buy more "real world ready" board with for example 8 pow=
er
>>> outputs for sprinkler valves, why has user think about what gpio to
>>> export, if there could be valve0 - 7 ready. If he will use only val=
ve0
>>> does not mater, all unused gpio can't be used for anything else sin=
ce
>>> they has layout for valves.
>>
>> The problem is indeed different.
>>
>> If your sprinkler valves are wired on your board and the lines canno=
t
>> be used for anything else, then what you need is a driver for the
>> valve that will acquire the GPIOs and export its own userspace
>> interface under /sys/.
>>
>> You device tree must reflect the layout of the board ; in this case
>> "here is a valve that uses this GPIO active-low". Saying "this GPIO =
is
>> output active-low and named valve0" is not a good description of you=
r
>> hardware.
>>
>
> There is no higher layer driver API. We don=E2=80=99t want to litter =
the kernel
> with =E2=80=98valve=E2=80=99 drivers, there=E2=80=99s no such thing. =
There=E2=80=99s only digital I/Os
> that=E2=80=99s connected to low speed devices.
>
> If we are going for a higher layer API that would be something very t=
hin
> like a user-space GPIO driver. Do you see the conundrum?

Could you maybe point me to references of the hardware (both the
devices connected to the GPIOs and the board itself if the specs are
available) so I can understand the issue fully?

>
>>>>
>>>>
>>>> Instead, have a shell script or a systemd unit tmpfile that will
>>>> perform the correct setup at boot time. Then you can easily switch
>>>> usages from user-space (systemctl stop sprinkler && systemctl star=
t
>>>> doordetect). This is much, much more flexible. At least until the
>>>> Device Tree Overlays are merged, but even then this seems overkill=
=2E
>>>
>>> I seriously think about it, but I think if LEDs are in DT, GPIOs sh=
ould
>>> be there too. In other way, I don't like exporting without given na=
me.
>>
>> LEDs are actually a perfect example of what you should do. They are =
a
>> simple device often plugged to a GPIO that controls them. We could
>> very well do what you propose: export GPIOs named "ledXX" and call i=
t
>> a day. Instead we have a driver that exports a proper device node in
>> /sys with the operations that are relevant to a LED.
>>
>> Once your GPIOs are assigned to a given function, they are not
>> "general purpose" anymore. Therefore you should expose the right
>> abstraction to your users, even if that means writing some more code=
=2E
>
> Please, try to understand how our users use our linux kernel drivers.

In that case my problem is precisely that there is no kernel driver.

Anyway, the first question to answer is "is it reasonable to export
and configure GPIOs from the Device Tree", and it concerns the DT
maintainers mostly ; so let's hear what they think about this first.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
