From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>
Subject: Re: [PATCH] gpio: add gpio_of_helper
Date: Thu, 23 Oct 2014 08:32:40 +0200
Message-ID: <5448A108.4070108@aksignal.cz>
References: <4b0bcf4679163c0da53e412a47eecd4bb03849b8.1413966148.git.jiri.prchal@aksignal.cz> <CAAVeFuJrmea6yZn2J28ihs3+=FYkZ2QxDv6F7qiq+TPpv_odpw@mail.gmail.com> <E5E0C172-C51D-46DC-AE15-71308BDC9829@antoniou-consulting.com> <CAAVeFuLh99MJXNNuh=L37pNzgun-Qi=3J4uK4eUSC5Qy107Gzw@mail.gmail.com> <E44127F1-1B6B-4BB0-866A-7B142F295FAE@antoniou-consulting.com> <CAAVeFuKj66r4UNZ33z3BT5m=7iB3tMC-u_eUDcJmvaNFj-0y5Q@mail.gmail.com>
Reply-To: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuKj66r4UNZ33z3BT5m=7iB3tMC-u_eUDcJmvaNFj-0y5Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



Dne 23.10.2014 v 07:08 Alexandre Courbot napsal(a):
> On Wed, Oct 22, 2014 at 6:58 PM, Pantelis Antoniou
> <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
>> Hi Alexandre,
>>
>>> On Oct 22, 2014, at 12:41 PM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>>>
>>> On Wed, Oct 22, 2014 at 6:24 PM, Pantelis Antoniou
>>> <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
>>>> Hi Alexandre,
>>>>
>>>>> On Oct 22, 2014, at 12:18 PM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
>>>>>
>>>>> On Wed, Oct 22, 2014 at 5:26 PM, Jiri Prchal <jiri.prchal@aksigna=
l.cz> wrote:
>>>>>> This patch adds new driver "gpio-of-helper", witch has possibili=
ty to export
>>>>>> gpios defined in dt. It exports them in defined name under
>>>>>> /sysfs/class/gpio/name.
>>>>>> It's rebased from Pantelis Antoniou patch to new kernel.
>>>>>> Usage example:
>>>>>>        gpio {
>>>>>>                compatible =3D "gpio-of-helper";
>>>>>>                status =3D "okay";
>>>>>>                pinctrl-names =3D "default";
>>>>>>                pinctrl-0 =3D <&pinctrl_gpio>;
>>>>>>
>>>>>>                gsm_on {
>>>>>>                        gpio-name =3D "gsm_on";
>>>>>>                        gpio =3D <&pioB 13 GPIO_ACTIVE_HIGH>;
>>>>>>                        output;
>>>>>>                        init-low;
>>>>>>                };
>>>>>>        };
>>>>>>
>>>>>> This patch needs Alexey Ignatov [PATCH] gpiolib: allow exporting=
 gpios with
>>>>>> custom names.
>>>>>
>>>>> We will need to see whether the pre-requisite patch can get merge=
d
>>>>> first, but there are a couple of things that are wrong with your =
patch
>>>>> anyway:
>>>>>
>>>>> - it is missing a bindings documentation
>>>>> - it is using the legacy integer GPIOs instead of the descriptor
>>>>> interface (see include/linux/gpio/consumer.h). Since this is DT-b=
ased,
>>>>> there is absolutely no reason to not use the descriptors interfac=
e.
>>>>> - it seems quite long for what it needs to do
>>>>> - the MODULE_AUTHOR has not signed-off this patch (?)
>>>>>
>>>>> But what makes me nervous is that this encourages more usage of t=
he
>>>>> sysfs interface, an in a way that is potentially harmful.
>>>>>
>>>>> Also, I don't know if the DT people will be happy with this idea.
>>>>> Since this concerns DT, please also add the devicetree list and g=
et a
>>>>> Acked-by for the bindings you want to push by a DT maintainer.
>>>>
>>>> Since I=E2=80=99m the original perpetrator, let me put a few words=
 here for posterity.
>>>>
>>>> This patch was meant as a quick and dirty method for doing the aut=
omatic export
>>>> and pinmux configuration from DT on a 3.8 kernel. The kernel APIs =
have moved on
>>>> since. It wasn=E2=80=99t meant to be submitted for mainline right =
as it is.
>>>>
>>>> Unfortunately (or fortunately for many people) it does what a lot =
of people need
>>>> i.e. configures a board with heavily pinmuxed GPIO right at boot t=
ime.
>>>>
>>>> I=E2=80=99m open at having a small discussion about how to do what=
 the users of this patch
>>>> do =E2=80=98right=E2=80=99.
>>>
>>> Sure, although the discussion might turn out to not be that "small"=
=2E :)
>>>
>>
>> Heh ;)
>>
>>> Pinmux configuration sounds like a job for pinmux more than GPIO, a=
nd
>>> exporting potentially many GPIOs to user-space sounds like a work f=
or
>>> a proper driver.
>>>
>>
>> I=E2=80=99m afraid that=E2=80=99s not the case. A great many users d=
o not require anything
>> more than setting a pinmux and the GPIO configuration (input/output)=
=2E
>> They can then do low speed I/O using the sysfs interface, without ha=
ving to
>> use any complex APIs (shell works just fine).
>>
>> Think of stuff like controlling a sprinkler valve, or something like=
 a mechanical
>> door detection open state.
>
> That sounds like any kind of arbitrary device that can be temporarily
> connected to a set of GPIOs that will be bit-banged. Is my
> interpretation correct?

Not only temporarily. For example on/off switch of some hw on board lik=
e gsm modem.
Or some optocoupler isoleted in/outs for general use from userspace.
>
> In that case, I seriously doubt that this should be part of the DT.
> Right now the DT is part of the firmware, and an immutable descriptio=
n
> of the hardware layout of a board - definitely such devices do not fi=
t
This is our case of gpio. It's like LEDs, they are hw layout of board,
but they are in/out instead of LEDs are only output.
> into that definition. This might change once the Device Tree Overlays
> are merged, but we are not there yet. If the DT maintainers say this
> is a valid use-case for overlays, then I will reconsider my position,
> but in any case it really looks like this could/should be done from
> user-space.
I don't think so as I explained - HW layout of boerd.
In other way I'm looking forward for DT overlays.
>
> You have almost all the necessary pieces: you can export, configure
> and manipulate any GPIO from the sysfs interface. The only thing you
> would be missing is a way to give a name to a GPIO, something that ca=
n
> easily be fixed.
But isn't it nice to have already exported gpios which are layouted out
from board. All other unexported gpios aren't connected to anywhere on
board. So user don't have to export or unexport anything.
>
> Since the devices you want to configure that way are typically
> removable or usage-specific, why would you want to store that
> information all the way up into the firmware? A commonly accepted
> wisdom is that what can be done in user-space should be done in
> user-space, and it really looks like this applies here.
They are NOT removable.
>
> Say you buy a Jetson TK1 to control that sprinkler valve (a good use
> for all these GPU cores!). The mainline DT has no knowledge about the
> valve, so using your proposed way you will have to re-build and flash
> a custom device tree just to be able to use your sprinkler. If you
> decide to assign your board to something else, you will need another
> DT.
But if you buy more "real world ready" board with for example 8 power
outputs for sprinkler valves, why has user think about what gpio to
export, if there could be valve0 - 7 ready. If he will use only valve0
does not mater, all unused gpio can't be used for anything else since
they has layout for valves.
>
> Instead, have a shell script or a systemd unit tmpfile that will
> perform the correct setup at boot time. Then you can easily switch
> usages from user-space (systemctl stop sprinkler && systemctl start
> doordetect). This is much, much more flexible. At least until the
> Device Tree Overlays are merged, but even then this seems overkill.
I seriously think about it, but I think if LEDs are in DT, GPIOs should
be there too. In other way, I don't like exporting without given name.
>
> So I don't see any good reason to accept this patch for now. I'm read=
y
> to discuss and work on the required improvements to the sysfs
> interface though - actually this might be a good opportunity to write
> a better alternative sysfs interface that does not depend on the
> integer GPIO space, something I have in mind since some time already.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
