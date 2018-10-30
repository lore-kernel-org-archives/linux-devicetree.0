From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH anybus v1 3/4] bus: support HMS Anybus-S bus.
Date: Tue, 30 Oct 2018 10:55:54 +0100
Message-ID: <CACRpkdYVN-s7shQmPkRjB9sxwi32TiKhmd_vKU+Jm--vGy2dSA@mail.gmail.com>
References: <20181025152058.9176-1-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025152058.9176-1-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: svendev@arcx.com, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, john.garry@huawei.com, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, Icenowy Zheng <icenowy@aosc.io>, yuanzhichang@hisilicon.com, Stuart Yoder <stuyoder@gmai>
List-Id: devicetree@vger.kernel.org

Hi Sven,

some tries to answer questions... (I am no expert in this but
I try my best)

On Thu, Oct 25, 2018 at 5:21 PM <thesven73@gmail.com> wrote:

> I had originally architected this driver to be much simpler, with everything
> running in the context of the userspace threads (except obviously the
> interrupt). But it stood zero chance, the presence of the soft interrupt + the
> h/w requirement to lock/unlock the region when acking the soft interrupt meant
> that there were circular locking dependencies that always resulted in
> deadlock :(

I think the kernel should run all hardware drivers so IMO you did the
right thing.

> > also "buss" is a germanism isn't it?  It should be just "anybus"?
>
> There are several different types of anybus:
> Anybus-M
> Anybus-S
> Anybus-CompactCOM
>
> This driver implements Anybus-S only. I had originally prefixed files and
> functions with anybus-s and anybus_s respectively, but it looked horrible
> visually:
>
> struct anybus_s_host *cd = data;
> drivers/bus/anybus-s-host.c
> include/linux/anybus-s-client.h

Hm I think this looks pretty neat actually. Anyways, in the overall
architecture explain the three Anybus:es and why things pertaining
to Anybus-s are named as they are.

> >> +static irqreturn_t irq_handler(int irq, void *data)
> >> +{
> >> +       struct anybuss_host *cd = data;
> >> +       int ind_ab;
> >> +
> >> +       /* reading the anybus indicator register acks the interrupt */
> >> +       ind_ab = read_ind_ab(cd->regmap);
> >> +       if (ind_ab < 0)
> >> +               return IRQ_NONE;
> >> +       atomic_set(&cd->ind_ab, ind_ab);
> >> +       complete(&cd->card_boot);
> >> +       wake_up(&cd->wq);
> >> +       return IRQ_HANDLED;
> >> +}
>
> > It looks a bit like you reinvent threaded interrupts but enlighten me
> > on the architecture and I might be able to get it.
>
> HMS Industrial Networks designed the anybus interrupt line to be dual purpose.
> In addition to being a 'real' interrupt during normal operation, it also signals
> that the card has initialized when coming out of reset. As this is a one-time
> thing, it needs a 'struct completion', not a wait_queue.

OK but you also have an atomic_set() going on and the struct completion
already contains a waitqueue and I start to worry about overuse of
primitives here. How does ps aux look on your system when running this?

> It is of course possible to emulate a struct completion using a waitqueue and
> an atomic variable, but wasn't struct completion invented to eliminate the
> subtle dangers of this?

The completion is a waitqueue entry and a spinlock, essentially.
But you're right, if you're waiting in process context for something
to happen, such as an ack interrupt for something you initiated,
a completion is the right abstraction to use.

> So this is why the irq_handler has to call both complete() and wake_up(), so
> it can't be modelled by a threaded interrupt.

It's just that when you do things like this:

   complete(&cd->card_boot);
   wake_up(&cd->wq);

I start asking: OK so why is that waitqueue not woken up from
wherever you are doing wait_for_completion()? I hope it is not
because you are waiting for the completion in the very same
waitqueue. That would be really messy.

So I guess what we like is clear program flow, as easy as possible
to follow what happens in the driver.

> Maybe if we use two separate irq_handlers: put the first one in place during
> initialization, then when the card is initialized, remove it and put a threaded
> one in place? Would this be a bit too complicated?

Nah one irq handler is fine, but you can have an optional
bottom half:

request_threaded_irq(irq, fastpath, slowpath...):

>From fastpath you return IRQ_WAKE_THREAD only
if you want to continue running the slowpath callback
in process context, else just complete() and
return IRQ_HANDLED and the slowpath thread will not be
executed.

> Yes, I am modeling a state machine.
> When userspace asks the anybus to do something, it throws a task into a queue,
> and waits on the completion of that task.
> The anybus processes the tasks sequentially, each task will go through
> multiple states before completing:
>
> userspace processes     A       B       C
>                         |       |       |
>                         v       v       v
>                         -----------------
>                         | task waiting  |
>                         | task waiting  |
>                         | task waiting  |
>                         |---------------|
>                         | task running  |
>                         -----------------
>                                 ^
>                                 |
>                         -----------------
>                         | anybus process |
>                         | single-thread  |
>                         | h/w access     |
>                         ------------------
>
> There is only one single kernel thread that accesses the hardware and the queue.
> This prevents various subtle synchronization/deadlock issues related to the
> soft interrupts.

This should all go into the comment section on the top of the
C file so we understand what is going on :)
(Good explanation BTW.)

> The tasks change state by re-assigning their own task_fn callback:
>
> function do_state_1(self) {
>         ...
>         if (need state 2)
>                 self->task_fn = do_state_2;
> }
>
> function do_state_2(self) {
>         ...
>         if (need_state_1)
>                 self->task_fn = do_state_1;
> }
>
> I could have opted for a classic state machine in a single callback:
>
> function do_state(self) {
>         switch (self->state) {
>         case state_1:
>                 ...
>                 if (need_state_2)
>                         self->state = state_2;
>                 break;
>         case state_2:
>                 ...
>                 if (need_state_1)
>                         self->state = state_1;
>                 break;
>         }
> }
>
> But the former seemed easier to understand.

OK I honestly don't know what is the best way. But what about
calling that "task" a "state" instead so we know what is going
on (i.e. you are switching between different states in process
context).

> >> +static void softint_ack(struct anybuss_host *cd)
> >> +static void process_softint(struct anybuss_host *cd)
> >
> > This looks like MSI (message signalled interrupt) and makes me think
> > that you should probably involve the irqchip maintainers. Interrupts
> > shall be represented in the irqchip abstraction.
>
> This is not a *real* software interrupt - it's just a bit in an internal
> register that gets set by the anybus on a certain condition, and needs
> to be ACKed. When the bit is set, the bus driver then tells userspace
> about it - anyone who is running poll/select on the sysfs node or devnode.
>
> The anybus documentation calls this a 'software interrupt'.

OK I get it... I think.

Silly question but why does userspace need to know about
this software interrupt? Can't you just hide that?
Userspace ABIs should be minimal.

> Right now I'm using platform_data for the bus driver's dependencies:
> (the irq is passed out-of-band, via platform_get_resource())
(...)
> +/**
> + * Platform data of the Anybus-S host controller.
> + *
> + * @regmap: provides access to the card dpram.
> + *             MUST NOT use caching
> + *             MUST NOT sleep
> + * @reset:  controls the card reset line.
> + */
> +struct anybuss_host_pdata {
> +       struct regmap *regmap;
> +       anybuss_reset_t reset;
> +};
>
> Now imagine that the underlying anybus bridge is defined as a reset controller.
> I could not find a way to pass a reset controller handle through platform_data.
> It seemed possible via the devicetree only. I was developing on 4.9 at the time.

I don't get the question. The reset controller is a provider just
like a clock controller or regulator. You look up the resource
associated with your device.

The platform_data is surely associated with a struct device *
and the reset controller handle should be associated with the
same struct device* and obtained with
[devm_]reset_control_get().

If you mean that you can't figure out how to associate a reset
controller handle with a device in the first place, then we need
to fix the reset controller subsystem to provide a mechanism for
that if there is not one already, not work around its shortcomings.
But reset_controller_add_lookup() seems to do what you want.
See for example drivers/clk/davinci/psc-da850.c
for an example of how to use that.

> So what if we pass the dependencies not via platform_data, but via the
> devicetree? In that case, I cannot find a way to pass the struct regmap
> via the devicetree...

The abstraction you associate resources with is struct device *
not device tree (nodes).

When I pass struct regmap to subdrivers I usually define a struct
that I pass in driver_data one way or another.
Sometimes I look up the driver_data of a parent by just
walking the ->parent hierarchy in struct device.

> Wait... are you talking about
> reset_controller_add_lookup() / devm_reset_control_get_exclusive() ?
> That's new to me, and only used in a single driver right now. Would that work?

Yeah I think so.

Yours,
Linus Walleij
