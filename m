From: thesven73@gmail.com
Subject: Re: [PATCH anybus v1 3/4] bus: support HMS Anybus-S bus.
Date: Thu, 25 Oct 2018 11:20:58 -0400
Message-ID: <20181025152058.9176-1-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: svendev@arcx.com, lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, yuanzhichang@hisilicon.com, stuyoder@gmail.com, linus.walleij@linaro.org, maxime.ripard@bootlin.com, bogdan.purcareata@nxp.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Linus, thanks a million for the detailed patch review, you've given this
patch a lot more attention than I was expecting. Great !!

> What you need to add is a bit of how the driver is architected.

I agree. Written once, read/maintained 100s of times, right?

> This is really needed because the driver is starting threads and
> running completions and tasks and whatnot to the left and
> right, and when random people come in to maintain this code they
> will be puzzled. 

I had originally architected this driver to be much simpler, with everything
running in the context of the userspace threads (except obviously the
interrupt). But it stood zero chance, the presence of the soft interrupt + the
h/w requirement to lock/unlock the region when acking the soft interrupt meant
that there were circular locking dependencies that always resulted in
deadlock :(

This single-thread message-queue architecture is harder to understand,
but much easier and safer in terms of synchronization.

I find it hard myself to keep track of functions that run in userland thread
context, and those that run in the kernel thread. Should I prefix kernel thread
functions with kt_* just to keep them apart?

> also "buss" is a germanism isn't it?  It should be just "anybus"?

There are several different types of anybus:
Anybus-M
Anybus-S
Anybus-CompactCOM

This driver implements Anybus-S only. I had originally prefixed files and
functions with anybus-s and anybus_s respectively, but it looked horrible
visually:

struct anybus_s_host *cd = data;
drivers/bus/anybus-s-host.c
include/linux/anybus-s-client.h

I'm completely open to suggestions on this one.
anybuss?
anybus-s?
just anybus?

>> +static irqreturn_t irq_handler(int irq, void *data)
>> +{
>> +       struct anybuss_host *cd = data;
>> +       int ind_ab;
>> +
>> +       /* reading the anybus indicator register acks the interrupt */
>> +       ind_ab = read_ind_ab(cd->regmap);
>> +       if (ind_ab < 0)
>> +               return IRQ_NONE;
>> +       atomic_set(&cd->ind_ab, ind_ab);
>> +       complete(&cd->card_boot);
>> +       wake_up(&cd->wq);
>> +       return IRQ_HANDLED;
>> +}

> It looks a bit like you reinvent threaded interrupts but enlighten me
> on the architecture and I might be able to get it.

HMS Industrial Networks designed the anybus interrupt line to be dual purpose.
In addition to being a 'real' interrupt during normal operation, it also signals
that the card has initialized when coming out of reset. As this is a one-time
thing, it needs a 'struct completion', not a wait_queue.

It is of course possible to emulate a struct completion using a waitqueue and
an atomic variable, but wasn't struct completion invented to eliminate the
subtle dangers of this?

So this is why the irq_handler has to call both complete() and wake_up(), so
it can't be modelled by a threaded interrupt.

Maybe if we use two separate irq_handlers: put the first one in place during
initialization, then when the card is initialized, remove it and put a threaded
one in place? Would this be a bit too complicated?

> This looks complex. Why can't you just sleep() and then
> retry this instead of shuffleing around different "tasks"?
> Are you actually modeling a state machine? In that case
> I can kind of understand it, then you just need one
> thread/work and assign it an enum of states or
> something, maybe name that "state" rather than task
> so we see what is going on.

Yes, I am modeling a state machine.
When userspace asks the anybus to do something, it throws a task into a queue,
and waits on the completion of that task.
The anybus processes the tasks sequentially, each task will go through
multiple states before completing:

userspace processes 	A	B	C
			|	|	|
			v	v	v
			-----------------
			| task waiting	|
			| task waiting	|
			| task waiting	|
			|---------------|
			| task running	|
			-----------------
				^
				|
			-----------------
			| anybus process |
			| single-thread	 |
			| h/w access	 |
			------------------

There is only one single kernel thread that accesses the hardware and the queue.
This prevents various subtle synchronization/deadlock issues related to the
soft interrupts.

The tasks change state by re-assigning their own task_fn callback:

function do_state_1(self) {
	...
	if (need state 2)
		self->task_fn = do_state_2;
}

function do_state_2(self) {
	...
	if (need_state_1)
		self->task_fn = do_state_1;
}

I could have opted for a classic state machine in a single callback:

function do_state(self) {
	switch (self->state) {
	case state_1:
		...
		if (need_state_2)
			self->state = state_2;
		break;
	case state_2:
		...
		if (need_state_1)
			self->state = state_1;
		break;
	}
}

But the former seemed easier to understand.
Obviously it's more important that it's easy to understand not to me, but to
most developers who read the code. So tell me if the callback approach is
too exotic.

>> +static void softint_ack(struct anybuss_host *cd)
>> +static void process_softint(struct anybuss_host *cd)
>
> This looks like MSI (message signalled interrupt) and makes me think
> that you should probably involve the irqchip maintainers. Interrupts
> shall be represented in the irqchip abstraction.

This is not a *real* software interrupt - it's just a bit in an internal
register that gets set by the anybus on a certain condition, and needs
to be ACKed. When the bit is set, the bus driver then tells userspace
about it - anyone who is running poll/select on the sysfs node or devnode.

The anybus documentation calls this a 'software interrupt'.

>> +       cd->reset = pdata->reset;
>
> This callback thing to handle reset doesn't seem right.

I agree, and I've gone through the exact same thought process before.

Right now I'm using platform_data for the bus driver's dependencies:
(the irq is passed out-of-band, via platform_get_resource())

+/**
+ * Platform data of the Anybus-S host controller.
+ *
+ * @regmap: provides access to the card dpram.
+ *		MUST NOT use caching
+ *		MUST NOT sleep
+ * @reset:  controls the card reset line.
+ */
+struct anybuss_host_pdata {
+	struct regmap *regmap;
+	anybuss_reset_t reset;
+};

Now imagine that the underlying anybus bridge is defined as a reset controller.
I could not find a way to pass a reset controller handle through platform_data.
It seemed possible via the devicetree only. I was developing on 4.9 at the time.

So what if we pass the dependencies not via platform_data, but via the
devicetree? In that case, I cannot find a way to pass the struct regmap
via the devicetree...

Wait... are you talking about
reset_controller_add_lookup() / devm_reset_control_get_exclusive() ?
That's new to me, and only used in a single driver right now. Would that work?
