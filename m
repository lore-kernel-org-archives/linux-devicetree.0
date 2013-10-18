From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3] gpio: add export with name from dts
Date: Fri, 18 Oct 2013 11:36:01 +0100
Message-ID: <20131018103601.GC29779@e106331-lin.cambridge.arm.com>
References: <1382011682-18595-1-git-send-email-jiri.prchal@aksignal.cz>
 <20131017150455.GH24056@e106331-lin.cambridge.arm.com>
 <CAAVeFuJCamVumTphu-Wv2DSgepwoPgYXnCGdK=L8oem-3-K+gA@mail.gmail.com>
 <5260DD62.2060706@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5260DD62.2060706@aksignal.cz>
Sender: linux-gpio-owner@vger.kernel.org
To: =?utf-8?B?SmnFmcOt?= Prchal <jiri.prchal@aksignal.cz>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "blogic@openwrt.org" <blogic@openwrt.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "acourbot@nvidia.com" <acourbot@nvidia.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "cooloney@gmail.com" <cooloney@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 18, 2013 at 08:04:02AM +0100, Ji=C5=99=C3=AD Prchal wrote:
> Hi all,

Hi Ji=C5=99=C3=AD,

>=20
> Dne 17.10.2013 20:03, Alexandre Courbot napsal(a):
> > On Thu, Oct 17, 2013 at 8:04 AM, Mark Rutland <mark.rutland@arm.com=
> wrote:
> >> Hello Jiri,
> >>
> >> On Thu, Oct 17, 2013 at 01:08:02PM +0100, Jiri Prchal wrote:
> >>> Add export possibility to sysfs with given name in device tree. I=
t is nice for
> >>> users to have board specific gpios exported at boot-time and with=
 their names.
> >>> It renames some functions in gpiolib and adds name as parameter. =
If it is passed
> >>> NULL as name everything works like before, export by chip name.
> >>> It can be done by extra function export_with_name without changin=
g original
> >>> export function but I think there would not to be twice almost th=
e same.
> >>> Even if gpio sysfs interface is almost to be deprecated, I would =
like to add
> >>> this, cause new chardev interface is in farness future.
> >>> Rebased from older unapplyed patch: [PATCH] owrt: GPIO: add gpio_=
export_with_name.
> >>> v3:
> >>> change to "linux,gpio-export"
> >>> removed arrays of gpios, just one child node -> one GPIO line
> >>> simplified node properties like as it's in gpio-leds
> >>> if not label -> uses child node name
> >>>
> >>> Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
> >>> ---
> >>>   Documentation/devicetree/bindings/gpio/gpio.txt |   44 ++++++++=
++++++++++
> >>>   drivers/gpio/gpiolib-of.c                       |   56 ++++++++=
+++++++++++++++
> >>>   drivers/gpio/gpiolib.c                          |   27 +++++++-=
---
> >>>   include/asm-generic/gpio.h                      |    6 ++-
> >>>   include/linux/gpio.h                            |   23 ++++++++=
+-
> >>>   5 files changed, 144 insertions(+), 12 deletions(-)
> >>
> >> As I mentioned on v1 of this patch [1], I do not think that this i=
s the
> >> right way to go about exporting GPIOs to userspace. Why do we need=
 a
> >> binding for a non-device to tell Linux (specifically Linux) whethe=
r or
> >> not to represent a device to userspace, and how to do so?
> >>
> >> Why can this policy not be handled within the GPIO framework, or w=
ithin
> >> GPIO drivers?
> >
> > Pretty much agree with Mark here. There is no reason to limit this
> > naming feature (which I'm not opposed to fundamentally) to the devi=
ce
> > tree. Besides gpio_export_with_link() does something suspisciously
> > similar, and better-suited in my opinion: the GPIO keeps its
> > hard-coded, predictable name but is also accessible through a link
> > under the device that uses it. Since GPIOs are typically used as
> > functions for devices this seems to make the most sense.
> >
> > But maybe I'm missing your point - could you describe a concrete
> > use-case for this feature that can *not* be achieved using
> > gpio_export_with_link()?
>=20
> The concrete use-case is that I have two boards with same I/O on them=
, but they use
> two different SoC. And I like to shadow it to users. On one board is =
some I/O on
> pioC16 and on the other it is on pioA30 for example.
> I'd like to prepare I/O just with right board names for example in11.
> I'm trying to do something like GPIOs LEDs, I like that interface, bu=
t I need it
> for both direction.
> So where else give the name then in DT. And why not to export it ther=
e. Just like
> LEDs.

The LED bindings represent devices attached to GPIO pins. This binding
appears to describe the GPIO pins themselves. There are already binding=
s
for the GPIO pins.

If there is information associated with the GPIO pins themselves, that
should be described in the GPIO bindings. If we want to export named
pins in sysfs, that is the duty of the GPIO framework and GPIO drivers.
I do not believe having a binding for a non-device that exists solely t=
o
express a naming preference makes any sense.

We have a similar issue with assigning names to serial devices, and the
approach taken there was to use an /aliases node. The same approach
might be applicable here, but I see no reason to have this binding.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
