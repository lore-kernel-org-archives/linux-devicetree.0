MIME-Version: 1.0
Date: Fri, 9 Aug 2019 08:08:35 -0600
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
	<CAL_Jsq+-xWLkvku-nLmJnFvbuS=dSD=9dG=GS4uBUqL50tdcDg@mail.gmail.com>
	<06c95f15-d577-e43d-e046-ee222f86c406@mentor.com>
	<CAL_JsqLQvjtnfUsZ2RP4eozvdwMLzNxtgmT+XFaxW4xzoFjL=w@mail.gmail.com>
	<f1616784-4dbf-d0fa-b33e-c85fd569383a@mentor.com>
	<CACRpkdZ+vXG-mGjn0Tt5gyGowAuxiCSQNdjEPGTP9qj23CwkSw@mail.gmail.com>
In-Reply-To: <CACRpkdZ+vXG-mGjn0Tt5gyGowAuxiCSQNdjEPGTP9qj23CwkSw@mail.gmail.com>
Message-ID: <CAL_JsqLp___2O-naU+2PPQy0QmJX6+aN3hByz-OB9+qFvWgN9Q@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Harish Jenny K N <harish_kandiga@mentor.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Aug 5, 2019 at 5:15 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Jul 10, 2019 at 10:28 AM Harish Jenny K N
> <harish_kandiga@mentor.com> wrote:
> > On 09/07/19 9:38 PM, Rob Herring wrote:
>
> > >> This device tree binding models gpio inverters in the device tree to properly describe the hardware.
> > >
> > > We already define the active state of GPIOs in the consumers. If
> > > there's an inverter in the middle, the consumer active state is simply
> > > inverted. I don't agree that that is a hack as Linus said without some
> > > reasoning why an inverter needs to be modeled in DT. Anything about
> > > what 'userspace' needs is not a reason. That's a Linux thing that has
> > > little to do with hardware description.
>
> There is some level of ambition here which is inherently a bit fuzzy
> around the edges. ("How long is the coast of Britain?" comes to mind.)
>
> Surely the intention of device tree is not to recreate the schematic
> in all detail. What we want is a model of the hardware that will
> suffice for the operating system usecases.
>
> But sometimes the DTS files will become confusing: why is this
> component using GPIO_ACTIVE_LOW when another system
> doesn't have that flag? If there is an explicit inverter, the
> DTS gets more readable for a human.
>
> But arguable that is case for adding inverters as syntactic
> sugar in the DTS compiler instead...

If you really want something more explicit, then add a new GPIO
'inverted' flag. Then a device can always have the same HIGH/LOW flag.
That also solves the abstract it for userspace problem.

> > Yes we are talking about the hardware level inversions here.
> > The usecase is for those without the gpio consumer driver.
> > The usecase started with the concept of allowing an abstraction
> > of the underlying hardware for the userland controlling program
> > such that this program does not care whether the GPIO lines
> > are inverted or not physically. In other words, a single userland
> > controlling program can work unmodified across a variety of
> > hardware platforms with the device tree mapping the logical
> > to physical relationship of the GPIO hardware.
> > I totally understand anything about what 'userspace' needs is
> > not a reason, but this is not restricted to userspace alone as
> > kernel drivers may need this just as much. Also we are
> > just modelling/describing the hardware state in the device tree.
>
> The kernel also has a need to model inverters and it has come
> up from time to time, but I don't remember these instances
> right off the top of my head.

The only thing I can think of is an inverter needing its power supply
turned on. Seems a bit silly to have such fine grained control, but
who knows.

> I am not sure userspace needs are of zero concerns either.

No, but kernel vs. userspace is all a black box from a DT perspective
and not a distinction that we can design bindings around.

> Sure, for anything reimplementing what I have listed in
> Documentation/driver-api/gpio/drivers-on-gpio.rst
> it is just abuse of the ABI, but things like industrial control
> systems and other one-offs have this need to run the
> same binary unmodified for measuring the trigger level
> of water in some tank or so, they can't create kernel
> drivers for that kind of stuff.

The userspace interface already passes the flags for the gpio lines,
why can't a userspace program honor them? You can't have it both ways:
low level GPIO access and abstracted to not care about the details.

Rob
