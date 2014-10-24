From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
Subject: Re: [PATCH] gpio: add gpio_of_helper
Date: Fri, 24 Oct 2014 09:31:44 +0200
Message-ID: <544A0060.60404@aksignal.cz>
References: <4b0bcf4679163c0da53e412a47eecd4bb03849b8.1413966148.git.jiri.prchal@aksignal.cz> <CAAVeFuJrmea6yZn2J28ihs3+=FYkZ2QxDv6F7qiq+TPpv_odpw@mail.gmail.com> <E5E0C172-C51D-46DC-AE15-71308BDC9829@antoniou-consulting.com> <CAAVeFuLh99MJXNNuh=L37pNzgun-Qi=3J4uK4eUSC5Qy107Gzw@mail.gmail.com> <E44127F1-1B6B-4BB0-866A-7B142F295FAE@antoniou-consulting.com> <CAAVeFuKj66r4UNZ33z3BT5m=7iB3tMC-u_eUDcJmvaNFj-0y5Q@mail.gmail.com> <54489EC9.4020108@aksignal.cz> <CAAVeFuK4HxzwKye-RJCMeOSHNGNcvXV49hxnKL+u6ttidze7Tg@mail.gmail.com> <F82900FA-5999-4B39-8E7E-6FAA99ABDB2D@antoniou-consulting.com> <CAAVeFuKd7s3qgud0buWgHeSSjOXjVC5M82bjy4m3=B7Tr2OPzw@mail.gmail.com>
Reply-To: jiri.prchal@aksignal.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuKd7s3qgud0buWgHeSSjOXjVC5M82bjy4m3=B7Tr2OPzw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi all,

Dne 24.10.2014 v 08:23 Alexandre Courbot napsal(a):
> Added the DT maintainers and fixed the DT mailing-list's address so
> this discussion becomes visible to them as well.
>
> On Thu, Oct 23, 2014 at 8:23 PM, Pantelis Antoniou
> <panto@antoniou-consulting.com> wrote:
>> Hi Alexandre,
>>
>>> On Oct 23, 2014, at 11:53 AM, Alexandre Courbot <gnurou@gmail.com> =
wrote:
>>>
>>> On Thu, Oct 23, 2014 at 3:23 PM, Ji=C5=99=C3=AD Prchal <jiri.prchal=
@aksignal.cz> wrote:
>>>>
>>>>
>>>> Dne 23.10.2014 v 07:08 Alexandre Courbot napsal(a):
>>>>
>>>>> On Wed, Oct 22, 2014 at 6:58 PM, Pantelis Antoniou
>>>>> <panto@antoniou-consulting.com> wrote:
>>>>>>
>>>>>> Hi Alexandre,
>>>>>>
>>>>>>> On Oct 22, 2014, at 12:41 PM, Alexandre Courbot <gnurou@gmail.c=
om>
>>>>>>> wrote:
>>>>>>>
>>>>>>> On Wed, Oct 22, 2014 at 6:24 PM, Pantelis Antoniou
>>>>>>> <panto@antoniou-consulting.com> wrote:
>>>>>>>>
>>>>>>>> Hi Alexandre,
>>>>>>>>
>>>>>>>>> On Oct 22, 2014, at 12:18 PM, Alexandre Courbot <gnurou@gmail=
=2Ecom>
>>>>>>>>> wrote:
>>>>>>>>>
>>>>>>>>> On Wed, Oct 22, 2014 at 5:26 PM, Jiri Prchal <jiri.prchal@aks=
ignal.cz>
>>>>>>>>> wrote:
>>>>>>>>>>
>>>>>>>>>> This patch adds new driver "gpio-of-helper", witch has possi=
bility to
>>>>>>>>>> export
>>>>>>>>>> gpios defined in dt. It exports them in defined name under
>>>>>>>>>> /sysfs/class/gpio/name.
>>>>>>>>>> It's rebased from Pantelis Antoniou patch to new kernel.
>>>>>>>>>> Usage example:
>>>>>>>>>>        gpio {
>>>>>>>>>>                compatible =3D "gpio-of-helper";
>>>>>>>>>>                status =3D "okay";
>>>>>>>>>>                pinctrl-names =3D "default";
>>>>>>>>>>                pinctrl-0 =3D <&pinctrl_gpio>;
>>>>>>>>>>
>>>>>>>>>>                gsm_on {
>>>>>>>>>>                        gpio-name =3D "gsm_on";
>>>>>>>>>>                        gpio =3D <&pioB 13 GPIO_ACTIVE_HIGH>;
>>>>>>>>>>                        output;
>>>>>>>>>>                        init-low;
>>>>>>>>>>                };
>>>>>>>>>>        };
>>>>>>>>>>
>>>>>>>>>> This patch needs Alexey Ignatov [PATCH] gpiolib: allow expor=
ting
>>>>>>>>>> gpios with
>>>>>>>>>> custom names.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> We will need to see whether the pre-requisite patch can get m=
erged
>>>>>>>>> first, but there are a couple of things that are wrong with y=
our patch
>>>>>>>>> anyway:
>>>>>>>>>
>>>>>>>>> - it is missing a bindings documentation
>>>>>>>>> - it is using the legacy integer GPIOs instead of the descrip=
tor
>>>>>>>>> interface (see include/linux/gpio/consumer.h). Since this is =
DT-based,
>>>>>>>>> there is absolutely no reason to not use the descriptors inte=
rface.
>>>>>>>>> - it seems quite long for what it needs to do
>>>>>>>>> - the MODULE_AUTHOR has not signed-off this patch (?)
>>>>>>>>>
>>>>>>>>> But what makes me nervous is that this encourages more usage =
of the
>>>>>>>>> sysfs interface, an in a way that is potentially harmful.
>>>>>>>>>
>>>>>>>>> Also, I don't know if the DT people will be happy with this i=
dea.
>>>>>>>>> Since this concerns DT, please also add the devicetree list a=
nd get a
>>>>>>>>> Acked-by for the bindings you want to push by a DT maintainer=
=2E
>>>>>>>>
>>>>>>>>
>>>>>>>> Since I=E2=80=99m the original perpetrator, let me put a few w=
ords here for
>>>>>>>> posterity.
>>>>>>>>
>>>>>>>> This patch was meant as a quick and dirty method for doing the
>>>>>>>> automatic export
>>>>>>>> and pinmux configuration from DT on a 3.8 kernel. The kernel A=
PIs have
>>>>>>>> moved on
>>>>>>>> since. It wasn=E2=80=99t meant to be submitted for mainline ri=
ght as it is.
>>>>>>>>
>>>>>>>> Unfortunately (or fortunately for many people) it does what a =
lot of
>>>>>>>> people need
>>>>>>>> i.e. configures a board with heavily pinmuxed GPIO right at bo=
ot time.
>>>>>>>>
>>>>>>>> I=E2=80=99m open at having a small discussion about how to do =
what the users of
>>>>>>>> this patch
>>>>>>>> do =E2=80=98right=E2=80=99.
>>>>>>>
>>>>>>>
>>>>>>> Sure, although the discussion might turn out to not be that "sm=
all". :)
>>>>>>>
>>>>>>
>>>>>> Heh ;)
>>>>>>
>>>>>>> Pinmux configuration sounds like a job for pinmux more than GPI=
O, and
>>>>>>> exporting potentially many GPIOs to user-space sounds like a wo=
rk for
>>>>>>> a proper driver.
>>>>>>>
>>>>>>
>>>>>> I=E2=80=99m afraid that=E2=80=99s not the case. A great many use=
rs do not require
>>>>>> anything
>>>>>> more than setting a pinmux and the GPIO configuration (input/out=
put).
>>>>>> They can then do low speed I/O using the sysfs interface, withou=
t having
>>>>>> to
>>>>>> use any complex APIs (shell works just fine).
>>>>>>
>>>>>> Think of stuff like controlling a sprinkler valve, or something =
like a
>>>>>> mechanical
>>>>>> door detection open state.
>>>>>
>>>>>
>>>>> That sounds like any kind of arbitrary device that can be tempora=
rily
>>>>> connected to a set of GPIOs that will be bit-banged. Is my
>>>>> interpretation correct?
>>>>
>>>>
>>>> Not only temporarily. For example on/off switch of some hw on boar=
d like gsm
>>>> modem.
>>>
>>> ... which should be handled in-kernel.
>>>
>>
>> Not really. This is part of some kind user-space ABI but which has t=
o do
>> with the mapping of an named GPIO in the board schematics to user-sp=
ace.
>>
>>>> Or some optocoupler isoleted in/outs for general use from userspac=
e.
>>>
>>> ... which should thus be configured from userspace.
>>>
>>
>> No. It is used from userspace, but the the configuration of such is =
performed
>> by board specific means in the kernel.
>>
>>>>>
>>>>>
>>>>> In that case, I seriously doubt that this should be part of the D=
T.
>>>>> Right now the DT is part of the firmware, and an immutable descri=
ption
>>>>> of the hardware layout of a board - definitely such devices do no=
t fit
>>>>
>>>> This is our case of gpio. It's like LEDs, they are hw layout of bo=
ard,
>>>> but they are in/out instead of LEDs are only output.
>>>>>
>>>>> into that definition. This might change once the Device Tree Over=
lays
>>>>> are merged, but we are not there yet. If the DT maintainers say t=
his
>>>>> is a valid use-case for overlays, then I will reconsider my posit=
ion,
>>>>> but in any case it really looks like this could/should be done fr=
om
>>>>> user-space.
>>>>
>>>> I don't think so as I explained - HW layout of boerd.
>>>
>>> If it is a static hardware layout that makes the case even clearer =
-
>>> these devices should have a proper kernel driver that configures th=
ese
>>> GPIOs, and exports a proper interface to userspace, not just raw
>>> GPIOs.
>>
>> Raw GPIOs is what the user-space application wants to use. There is =
no
>> higher abstraction possible.
>
> Why can't the application use something else than raw GPIOs? Don't yo=
u
> have its source code?
>
>>
>> What these applications need are:
>>
>> 1. A way to map a GPIO to a name that is board invariant. Many board=
s
>> move GPIOs around but the function typically stays the same. So for
>> instance rev-0 might have GARAGE_DOOR to GPIO_A10, and on subsequent
>> revision rev-1 it might be GARAGE_DOOR to GPIO_B08. The user-space
>> application that controls everything does not want to deal with revi=
sions
>> ideally, just to know that the named GARAGE_DOOR gpio exists.
>
> This sounds pretty much like you are asking to register
> application-specific configuration into the DT.
Not application specific, it's board hw specific.
>
>>
>> 2. A way to have the pinmux configuration of said GPIO configured wi=
thout
>> having to do anything explicit. I.e. on am335x the pinmux configurat=
ion is
>> decoupled from the GPIO driver; having a GPIO configured as a GPIO d=
oes not
>> alter the pinmux settings.
>
> Shouldn't that be fixed in the pinmux/GPIO kernel drivers? I am not
> too familiar with pinmux, but IIUC pixmux configuration when GPIOs ar=
e
> requested is something that is commonly done.
>
>>
>> 3. The user-space facing API must be simple, preferably file based l=
ike the
>> sysfs method right now. It is very simple to use even from within sc=
ripts.
>
> That we definitely agree, and as of today there are many ways to do t=
his:
> 1) A dedicated driver that exposes exactly the right interface to
> sysfs. I know it may seem overkill, but we have drivers for other
> simple things like GPIO-controlled LEDs.
Let me ask: what is the difference between kernel exported gpios and us=
er space?
User-space interface is good enough for usage gpios, so why write other=
 driver
doing the same. What only we like is export board layout gpio from kern=
el
using dt.
> 2) If you think writing a driver is not worth the effort, you can
> already export and configure (and I'm willing to discuss the
> possibility to add "give names" to that list) GPIOs, from user-space.
>
> I understand that you want to keep the GPIO exporting/configuration
> from the DT to have all the board-specific settings in one place, but
> my understanding of the device tree is that it is supposed to say "I
> have a garage door control device connected to this GPIO", not "expor=
t
> this GPIO as input active-low, and name it GARAGE_DOOR".
Exactly we like to export "out0" ... "out7". If user will use some of t=
hem for
"GARAGE_DOOR" is up to him. But he knows that somewhere on some connect=
or on
the board is "out0" and he will find "out0" in "sysfs". Not strange "gp=
ioA25"
and set by default as input.
Thats all what we need.
>
>>
>>>
>>>> In other way I'm looking forward for DT overlays.
>>>>>
>>>>>
>>>>> You have almost all the necessary pieces: you can export, configu=
re
>>>>> and manipulate any GPIO from the sysfs interface. The only thing =
you
>>>>> would be missing is a way to give a name to a GPIO, something tha=
t can
>>>>> easily be fixed.
>>>>
>>>> But isn't it nice to have already exported gpios which are layoute=
d out
>>>> from board. All other unexported gpios aren't connected to anywher=
e on
>>>> board. So user don't have to export or unexport anything.
>>>>>
>>>>>
>>>>> Since the devices you want to configure that way are typically
>>>>> removable or usage-specific, why would you want to store that
>>>>> information all the way up into the firmware? A commonly accepted
>>>>> wisdom is that what can be done in user-space should be done in
>>>>> user-space, and it really looks like this applies here.
>>>>
>>>> They are NOT removable.
>>>>>
>>>>>
>>>>> Say you buy a Jetson TK1 to control that sprinkler valve (a good =
use
>>>>> for all these GPU cores!). The mainline DT has no knowledge about=
 the
>>>>> valve, so using your proposed way you will have to re-build and f=
lash
>>>>> a custom device tree just to be able to use your sprinkler. If yo=
u
>>>>> decide to assign your board to something else, you will need anot=
her
>>>>> DT.
>>>>
>>>> But if you buy more "real world ready" board with for example 8 po=
wer
>>>> outputs for sprinkler valves, why has user think about what gpio t=
o
>>>> export, if there could be valve0 - 7 ready. If he will use only va=
lve0
>>>> does not mater, all unused gpio can't be used for anything else si=
nce
>>>> they has layout for valves.
>>>
>>> The problem is indeed different.
>>>
>>> If your sprinkler valves are wired on your board and the lines cann=
ot
>>> be used for anything else, then what you need is a driver for the
>>> valve that will acquire the GPIOs and export its own userspace
>>> interface under /sys/.
>>>
>>> You device tree must reflect the layout of the board ; in this case
>>> "here is a valve that uses this GPIO active-low". Saying "this GPIO=
 is
>>> output active-low and named valve0" is not a good description of yo=
ur
>>> hardware.
>>>
>>
>> There is no higher layer driver API. We don=E2=80=99t want to litter=
 the kernel
>> with =E2=80=98valve=E2=80=99 drivers, there=E2=80=99s no such thing.=
 There=E2=80=99s only digital I/Os
>> that=E2=80=99s connected to low speed devices.
>>
>> If we are going for a higher layer API that would be something very =
thin
>> like a user-space GPIO driver. Do you see the conundrum?
>
> Could you maybe point me to references of the hardware (both the
> devices connected to the GPIOs and the board itself if the specs are
> available) so I can understand the issue fully?
Short example:
		in13 {
			gpio-name =3D "in13";
			input;
			gpio =3D <&pioC 18 GPIO_ACTIVE_LOW>;
		};
		in14 {
			gpio-name =3D "in14";
			input;
			gpio =3D <&pioC 20 GPIO_ACTIVE_LOW>;
		};
		in17 {
			gpio-name =3D "in17";
			input;
			gpio =3D <&pioC 16 GPIO_ACTIVE_LOW>;
		};
		out18 {
			gpio-name =3D "out18";
			gpio =3D <&pioA 30 GPIO_ACTIVE_HIGH>;
			output;
			init-low;
		};
		out19 {
			gpio-name =3D "out19";
			gpio =3D <&pioA 31 GPIO_ACTIVE_HIGH>;
			output;
			init-low;
		};
		out20 {
			gpio-name =3D "out20";
			gpio =3D <&pioA 29 GPIO_ACTIVE_HIGH>;
			output;
			init-low;
		};

>>
>>>>>
>>>>>
>>>>> Instead, have a shell script or a systemd unit tmpfile that will
>>>>> perform the correct setup at boot time. Then you can easily switc=
h
>>>>> usages from user-space (systemctl stop sprinkler && systemctl sta=
rt
>>>>> doordetect). This is much, much more flexible. At least until the
>>>>> Device Tree Overlays are merged, but even then this seems overkil=
l.
>>>>
>>>> I seriously think about it, but I think if LEDs are in DT, GPIOs s=
hould
>>>> be there too. In other way, I don't like exporting without given n=
ame.
>>>
>>> LEDs are actually a perfect example of what you should do. They are=
 a
>>> simple device often plugged to a GPIO that controls them. We could
>>> very well do what you propose: export GPIOs named "ledXX" and call =
it
>>> a day. Instead we have a driver that exports a proper device node i=
n
>>> /sys with the operations that are relevant to a LED.
>>>
>>> Once your GPIOs are assigned to a given function, they are not
>>> "general purpose" anymore. Therefore you should expose the right
>>> abstraction to your users, even if that means writing some more cod=
e.
>>
>> Please, try to understand how our users use our linux kernel drivers=
=2E
>
> In that case my problem is precisely that there is no kernel driver.
>
> Anyway, the first question to answer is "is it reasonable to export
> and configure GPIOs from the Device Tree", and it concerns the DT
> maintainers mostly ; so let's hear what they think about this first.
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
