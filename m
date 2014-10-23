From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
Subject: Re: [PATCH] gpio: add gpio_of_helper
Date: Thu, 23 Oct 2014 11:38:30 +0200
Message-ID: <5448CC96.2060204@aksignal.cz>
References: <4b0bcf4679163c0da53e412a47eecd4bb03849b8.1413966148.git.jiri.prchal@aksignal.cz> <CAAVeFuJrmea6yZn2J28ihs3+=FYkZ2QxDv6F7qiq+TPpv_odpw@mail.gmail.com> <E5E0C172-C51D-46DC-AE15-71308BDC9829@antoniou-consulting.com> <CAAVeFuLh99MJXNNuh=L37pNzgun-Qi=3J4uK4eUSC5Qy107Gzw@mail.gmail.com> <E44127F1-1B6B-4BB0-866A-7B142F295FAE@antoniou-consulting.com> <CAAVeFuKj66r4UNZ33z3BT5m=7iB3tMC-u_eUDcJmvaNFj-0y5Q@mail.gmail.com> <54489EC9.4020108@aksignal.cz> <CAAVeFuK4HxzwKye-RJCMeOSHNGNcvXV49hxnKL+u6ttidze7Tg@mail.gmail.com>
Reply-To: jiri.prchal@aksignal.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuK4HxzwKye-RJCMeOSHNGNcvXV49hxnKL+u6ttidze7Tg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Pantelis Antoniou <panto@antoniou-consulting.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org



Dne 23.10.2014 v 10:53 Alexandre Courbot napsal(a):
> On Thu, Oct 23, 2014 at 3:23 PM, Ji=C5=99=C3=AD Prchal <jiri.prchal@a=
ksignal.cz> wrote:
>>
>>
>> Dne 23.10.2014 v 07:08 Alexandre Courbot napsal(a):
>>
>>> On Wed, Oct 22, 2014 at 6:58 PM, Pantelis Antoniou
>>> <panto@antoniou-consulting.com> wrote:
>>>>
>>>> Hi Alexandre,
>>>>
>>>>> On Oct 22, 2014, at 12:41 PM, Alexandre Courbot <gnurou@gmail.com=
>
>>>>> wrote:
>>>>>
>>>>> On Wed, Oct 22, 2014 at 6:24 PM, Pantelis Antoniou
>>>>> <panto@antoniou-consulting.com> wrote:
>>>>>>
>>>>>> Hi Alexandre,
>>>>>>
>>>>>>> On Oct 22, 2014, at 12:18 PM, Alexandre Courbot <gnurou@gmail.c=
om>
>>>>>>> wrote:
>>>>>>>
>>>>>>> On Wed, Oct 22, 2014 at 5:26 PM, Jiri Prchal <jiri.prchal@aksig=
nal.cz>
>>>>>>> wrote:
>>>>>>>>
>>>>>>>> This patch adds new driver "gpio-of-helper", witch has possibi=
lity to
>>>>>>>> export
>>>>>>>> gpios defined in dt. It exports them in defined name under
>>>>>>>> /sysfs/class/gpio/name.
>>>>>>>> It's rebased from Pantelis Antoniou patch to new kernel.
>>>>>>>> Usage example:
>>>>>>>>         gpio {
>>>>>>>>                 compatible =3D "gpio-of-helper";
>>>>>>>>                 status =3D "okay";
>>>>>>>>                 pinctrl-names =3D "default";
>>>>>>>>                 pinctrl-0 =3D <&pinctrl_gpio>;
>>>>>>>>
>>>>>>>>                 gsm_on {
>>>>>>>>                         gpio-name =3D "gsm_on";
>>>>>>>>                         gpio =3D <&pioB 13 GPIO_ACTIVE_HIGH>;
>>>>>>>>                         output;
>>>>>>>>                         init-low;
>>>>>>>>                 };
>>>>>>>>         };
>>>>>>>>
>>>>>>>> This patch needs Alexey Ignatov [PATCH] gpiolib: allow exporti=
ng
>>>>>>>> gpios with
>>>>>>>> custom names.
>>>>>>>
>>>>>>>
>>>>>>> We will need to see whether the pre-requisite patch can get mer=
ged
>>>>>>> first, but there are a couple of things that are wrong with you=
r patch
>>>>>>> anyway:
>>>>>>>
>>>>>>> - it is missing a bindings documentation
>>>>>>> - it is using the legacy integer GPIOs instead of the descripto=
r
>>>>>>> interface (see include/linux/gpio/consumer.h). Since this is DT=
-based,
>>>>>>> there is absolutely no reason to not use the descriptors interf=
ace.
>>>>>>> - it seems quite long for what it needs to do
>>>>>>> - the MODULE_AUTHOR has not signed-off this patch (?)
>>>>>>>
>>>>>>> But what makes me nervous is that this encourages more usage of=
 the
>>>>>>> sysfs interface, an in a way that is potentially harmful.
>>>>>>>
>>>>>>> Also, I don't know if the DT people will be happy with this ide=
a.
>>>>>>> Since this concerns DT, please also add the devicetree list and=
 get a
>>>>>>> Acked-by for the bindings you want to push by a DT maintainer.
>>>>>>
>>>>>>
>>>>>> Since I=E2=80=99m the original perpetrator, let me put a few wor=
ds here for
>>>>>> posterity.
>>>>>>
>>>>>> This patch was meant as a quick and dirty method for doing the
>>>>>> automatic export
>>>>>> and pinmux configuration from DT on a 3.8 kernel. The kernel API=
s have
>>>>>> moved on
>>>>>> since. It wasn=E2=80=99t meant to be submitted for mainline righ=
t as it is.
>>>>>>
>>>>>> Unfortunately (or fortunately for many people) it does what a lo=
t of
>>>>>> people need
>>>>>> i.e. configures a board with heavily pinmuxed GPIO right at boot=
 time.
>>>>>>
>>>>>> I=E2=80=99m open at having a small discussion about how to do wh=
at the users of
>>>>>> this patch
>>>>>> do =E2=80=98right=E2=80=99.
>>>>>
>>>>>
>>>>> Sure, although the discussion might turn out to not be that "smal=
l". :)
>>>>>
>>>>
>>>> Heh ;)
>>>>
>>>>> Pinmux configuration sounds like a job for pinmux more than GPIO,=
 and
>>>>> exporting potentially many GPIOs to user-space sounds like a work=
 for
>>>>> a proper driver.
>>>>>
>>>>
>>>> I=E2=80=99m afraid that=E2=80=99s not the case. A great many users=
 do not require
>>>> anything
>>>> more than setting a pinmux and the GPIO configuration (input/outpu=
t).
>>>> They can then do low speed I/O using the sysfs interface, without =
having
>>>> to
>>>> use any complex APIs (shell works just fine).
>>>>
>>>> Think of stuff like controlling a sprinkler valve, or something li=
ke a
>>>> mechanical
>>>> door detection open state.
>>>
>>>
>>> That sounds like any kind of arbitrary device that can be temporari=
ly
>>> connected to a set of GPIOs that will be bit-banged. Is my
>>> interpretation correct?
>>
>>
>> Not only temporarily. For example on/off switch of some hw on board =
like gsm
>> modem.
>
> ... which should be handled in-kernel.
How to? It's just connected to ttyS and after apply power it has to be =
switched
on by pulling some pin.
>
>> Or some optocoupler isoleted in/outs for general use from userspace.
>
> ... which should thus be configured from userspace.
Why not from dt?
>
>>>
>>>
>>> In that case, I seriously doubt that this should be part of the DT.
>>> Right now the DT is part of the firmware, and an immutable descript=
ion
>>> of the hardware layout of a board - definitely such devices do not =
fit
>>
>> This is our case of gpio. It's like LEDs, they are hw layout of boar=
d,
>> but they are in/out instead of LEDs are only output.
>>>
>>> into that definition. This might change once the Device Tree Overla=
ys
>>> are merged, but we are not there yet. If the DT maintainers say thi=
s
>>> is a valid use-case for overlays, then I will reconsider my positio=
n,
>>> but in any case it really looks like this could/should be done from
>>> user-space.
>>
>> I don't think so as I explained - HW layout of boerd.
>
> If it is a static hardware layout that makes the case even clearer -
> these devices should have a proper kernel driver that configures thes=
e
> GPIOs, and exports a proper interface to userspace, not just raw
> GPIOs.
But we don't need anything else just raw named gpio.
>
>> In other way I'm looking forward for DT overlays.
>>>
>>>
>>> You have almost all the necessary pieces: you can export, configure
>>> and manipulate any GPIO from the sysfs interface. The only thing yo=
u
>>> would be missing is a way to give a name to a GPIO, something that =
can
>>> easily be fixed.
>>
>> But isn't it nice to have already exported gpios which are layouted =
out
>> from board. All other unexported gpios aren't connected to anywhere =
on
>> board. So user don't have to export or unexport anything.
>>>
>>>
>>> Since the devices you want to configure that way are typically
>>> removable or usage-specific, why would you want to store that
>>> information all the way up into the firmware? A commonly accepted
>>> wisdom is that what can be done in user-space should be done in
>>> user-space, and it really looks like this applies here.
>>
>> They are NOT removable.
>>>
>>>
>>> Say you buy a Jetson TK1 to control that sprinkler valve (a good us=
e
>>> for all these GPU cores!). The mainline DT has no knowledge about t=
he
>>> valve, so using your proposed way you will have to re-build and fla=
sh
>>> a custom device tree just to be able to use your sprinkler. If you
>>> decide to assign your board to something else, you will need anothe=
r
>>> DT.
>>
>> But if you buy more "real world ready" board with for example 8 powe=
r
>> outputs for sprinkler valves, why has user think about what gpio to
>> export, if there could be valve0 - 7 ready. If he will use only valv=
e0
>> does not mater, all unused gpio can't be used for anything else sinc=
e
>> they has layout for valves.
>
> The problem is indeed different.
>
> If your sprinkler valves are wired on your board and the lines cannot
> be used for anything else, then what you need is a driver for the
> valve that will acquire the GPIOs and export its own userspace
> interface under /sys/.
>
> You device tree must reflect the layout of the board ; in this case
> "here is a valve that uses this GPIO active-low". Saying "this GPIO i=
s
> output active-low and named valve0" is not a good description of your
> hardware.
Maybe I didn't give good example.
There is a board. It has 8 outputs. They are relay outputs. Let's give =
them
rel0 - 7 name. And user can same of them use for valve, some for light.=
=2E.
Ant board has 8 inputs. They are optocoupler isolated. And user can som=
e of
them use to get water level, light...
>
>>>
>>>
>>> Instead, have a shell script or a systemd unit tmpfile that will
>>> perform the correct setup at boot time. Then you can easily switch
>>> usages from user-space (systemctl stop sprinkler && systemctl start
>>> doordetect). This is much, much more flexible. At least until the
>>> Device Tree Overlays are merged, but even then this seems overkill.
>>
>> I seriously think about it, but I think if LEDs are in DT, GPIOs sho=
uld
>> be there too. In other way, I don't like exporting without given nam=
e.
>
> LEDs are actually a perfect example of what you should do. They are a
> simple device often plugged to a GPIO that controls them. We could
> very well do what you propose: export GPIOs named "ledXX" and call it
> a day. Instead we have a driver that exports a proper device node in
> /sys with the operations that are relevant to a LED.
>
> Once your GPIOs are assigned to a given function, they are not
> "general purpose" anymore. Therefore you should expose the right
> abstraction to your users, even if that means writing some more code.
So making some kind of device "inout" wold be good idea?

> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
