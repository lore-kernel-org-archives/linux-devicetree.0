From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/6] clocksource: Add a new timer-ingenic driver
Date: Mon, 8 Jan 2018 19:09:46 -0600
Message-ID: <CAL_JsqKAJwkpGigZ3sH8YYqj3Xm-+b9KnJBpLMkt_g8TKNgd4A@mail.gmail.com>
References: <20171229125942.27305-2-paul@crapouillou.net> <20180101143344.2099-1-paul@crapouillou.net>
 <20180101143344.2099-5-paul@crapouillou.net> <20180103210840.hsh4kghuxz7btu5f@rob-hp-laptop>
 <1515016576.1642.2@smtp.crapouillou.net> <CAL_Jsq+DQnfX29AOJWMtH9ZB7=neOVwiyZggEuwOmazzVQ6MVg@mail.gmail.com>
 <1515196105.2058.1@smtp.crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515196105.2058.1-nb6JAIIttxhEPksTRSfcJOTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 5, 2018 at 5:48 PM, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org> wrote:
> Hi Rob,
>
>
> Le sam. 6 janv. 2018 à 0:27, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> a écrit :
>>
>> On Wed, Jan 3, 2018 at 3:56 PM, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
>> wrote:
>>>
>>>  Hi,
>>>
>>>  Le mer. 3 janv. 2018 à 22:08, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> a écrit :
>>>>
>>>>
>>>>  On Mon, Jan 01, 2018 at 03:33:43PM +0100, Paul Cercueil wrote:
>>>>>
>>>>>
>>>>>   This driver will use the TCU (Timer Counter Unit) present on the
>>>>> Ingenic
>>>>>   JZ47xx SoCs to provide the kernel with a clocksource and timers.
>>>>>
>>>>>   Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
>>>>>   ---
>>>>>    .../devicetree/bindings/timer/ingenic,tcu.txt      |  35 +++
>>>>
>>>>
>>>>
>>>>  Separate patch please.
>>>
>>>
>>>
>>>  OK.
>>>
>>>
>>>>>    drivers/clocksource/Kconfig                        |   8 +
>>>>>    drivers/clocksource/Makefile                       |   1 +
>>>>>    drivers/clocksource/timer-ingenic.c                | 256
>>>>>  +++++++++++++++++++++
>>>>>    4 files changed, 300 insertions(+)
>>>>>    create mode 100644
>>>>>  Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>>>>>    create mode 100644 drivers/clocksource/timer-ingenic.c
>>>>>
>>>>>    v2: Use SPDX identifier for the license
>>>>>
>>>>>   diff --git a/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>>>>>  b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>>>>>   new file mode 100644
>>>>>   index 000000000000..e4944972ea53
>>>>>   --- /dev/null
>>>>>   +++ b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>>>>>   @@ -0,0 +1,35 @@
>>>>>   +Ingenic JZ47xx SoCs Timer/Counter Unit driver
>>>>>   +---------------------------------------------
>>>>>   +
>>>>>   +Required properties:
>>>>>   +
>>>>>   +- compatible : should be "ingenic,<socname>-tcu". Valid strings are:
>>>>>   +  * ingenic,jz4740-tcu
>>>>>   +  * ingenic,jz4770-tcu
>>>>>   +  * ingenic,jz4780-tcu
>>>>>   +- interrupt-parent : phandle of the TCU interrupt controller.
>>>>>   +- interrupts : Specifies the interrupts the controller is connected
>>>>> to.
>>>>>   +- clocks : List of phandle & clock specifiers for the TCU clocks.
>>>>>   +- clock-names : List of name strings for the TCU clocks.
>>>>>   +- ingenic,channels: a list of TCU channels to be used as timers.
>>>>
>>>>
>>>>
>>>>  Why is this needed? This looks like you are trying to assign certain
>>>>  timers to clocksource and clockevent. A common problem, but one that
>>>>  should be decided by describing h/w features. There must be some
>>>>  property present or missing to make you decide to use a given channel
>>>> or
>>>>  not.
>>>
>>>
>>>
>>>  Well, it's not easy; some TCU channels will be used as PWM, and there's
>>> no
>>>  way
>>>  to know that when the clocksource driver probes. And which ones are PWM
>>> /
>>>  which
>>>  ones are not, is board-specific. If you have a better solution though, I
>>>  take it.
>>
>>
>> Aren't the PWMs connected to something? Describe those in DT and then
>> you can find the free ones.
>>
>> Rob
>
>
> The ingenic PWM driver just creates a PWM chip with 8 channels. Then it's up
> to
> the various clients (backlight, rumble...) to request a channel using the
> PWM API,
> from their own driver node or pdata. Besides you can also request PWM
> channels
> from sysfs... I can't detect all of that...

You are describing things in terms of kernel implementation details.
Bindings should reflect the h/w design and be independent of the OS
design.

Backlight, rumble, etc. should all have clients described in DT. While
not efficient, you can iterate over all "pwms" properties in the DT
and map out the used channels. For userspace, it should get whatever
is left over (not used as a timer nor PWM requested by a kernel
driver)

You need to think about it in terms of what feature each channel has
or doesn't have. For example, I'm using PWM channel 2 because that
drives PWM2 pin which is enabled on board X (either the pin mode or
the connection of the PWM signal should be described). Or I'm using
timer 3 because it runs in low-power mode (then you have an "enabled
in low power" flag for that timer/channel). See the OMAP timers for an
example of having multiple timers and needing to pick certain ones.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
