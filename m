From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH anybus v1 3/4] bus: support HMS Anybus-S bus.
Date: Thu, 25 Oct 2018 13:08:35 +0200
Message-ID: <CACRpkdbtR7mi1VPhA6dpX05-gqDQABKGLRVV7-tmRYzDfP+SQg@mail.gmail.com>
References: <20181024142456.10084-1-svendev@arcx.com> <20181024142456.10084-4-svendev@arcx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024142456.10084-4-svendev@arcx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: svendev@arcx.com
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, john.garry@huawei.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, Icenowy Zheng <icenowy@aosc.io>, yuanzhichang@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi Sven,

thanks for your patch!

On Wed, Oct 24, 2018 at 4:25 PM Sven Van Asbroeck <svendev@arcx.com> wrote:

> This driver implementation is designed to be almost completely independent
> from the way the Anybus-S hardware is accessed by the SoC. All it needs is:
>
> - a regmap which accesses the underlying Anybus-S dpram by whatever means;
> - an interrupt line, ultimately connected to the Anybus-S card;
> - a reset function.

Overall this commit message is a good start! You explain what this thing is
and what it does.

What you need to add is a bit of how the driver is architected. That can also
be added as comment in the header of the driver file, maybe that is even
better, i.e. here:

+// SPDX-License-Identifier: GPL-2.0
+/*
+ * HMS Anybus-S Host Driver

<architecture description goes here>

This is really needed because the driver is starting threads and
running completions and tasks and whatnot to the left and
right, and when random people come in to maintain this code they
will be puzzled. You need an overarching description of how the
driver is constructed here.

Please add proper kerneldoc to the struct anybus_host
also "buss" is a germanism isn't it?  It should be just "anybus"?

> +struct anybuss_host {
> +       struct device *dev;
> +       struct device *parent;
> +       struct anybuss_client *client;

There as well?

Just search/replace "s/buss/bus/g" everywhere I suspect.

> +static irqreturn_t irq_handler(int irq, void *data)
> +{
> +       struct anybuss_host *cd = data;
> +       int ind_ab;
> +
> +       /* reading the anybus indicator register acks the interrupt */
> +       ind_ab = read_ind_ab(cd->regmap);
> +       if (ind_ab < 0)
> +               return IRQ_NONE;
> +       atomic_set(&cd->ind_ab, ind_ab);
> +       complete(&cd->card_boot);
> +       wake_up(&cd->wq);
> +       return IRQ_HANDLED;
> +}

It looks a bit like you reinvent threaded interrupts but enlighten me
on the architecture and I might be able to get it.

> +static int task_fn_power_on_2(struct anybuss_host *cd,
> +                               struct ab_task *t)
> +{
> +       if (completion_done(&cd->card_boot)) {
> +               cd->power_on = true;
> +               return 0;
> +       }
> +       if (time_after(jiffies, t->start_jiffies + TIMEOUT)) {
> +               disable_irq(cd->irq);
> +               ab_reset(cd, true);
> +               dev_err(cd->dev, "power on timed out");
> +               return -ETIMEDOUT;
> +       }
> +       return -EINPROGRESS;
> +}
> +
> +static int task_fn_power_on(struct anybuss_host *cd,
> +                               struct ab_task *t)
> +{
> +       unsigned int dummy;
> +
> +       if (cd->power_on)
> +               return 0;
> +       /* anybus docs: prevent false 'init done' interrupt by
> +        * doing a dummy read of IND_AB register while in reset.
> +        */
> +       regmap_read(cd->regmap, REG_IND_AB, &dummy);
> +       reinit_completion(&cd->card_boot);
> +       enable_irq(cd->irq);
> +       ab_reset(cd, false);
> +       t->task_fn = task_fn_power_on_2;
> +       return -EINPROGRESS;
> +}

This looks complex. Why can't you just sleep() and then
retry this instead of shuffleing around different "tasks"?
Are you actually modeling a state machine? In that case
I can kind of understand it, then you just need one
thread/work and assign it an enum of states or
something, maybe name that "state" rather than task
so we see what is going on.

> +static int task_fn_area_3(struct anybuss_host *cd, struct ab_task *t)
> +static int task_fn_area_2(struct anybuss_host *cd, struct ab_task *t)
> +static int task_fn_area(struct anybuss_host *cd, struct ab_task *t)
> +static struct ab_task *
> +create_area_reader(struct kmem_cache *qcache, u16 flags, u16 addr,
> +                               size_t count)
> +static struct ab_task *
> +create_area_writer(struct kmem_cache *qcache, u16 flags, u16 addr,
> +                               const void *buf, size_t count)
> +static struct ab_task *
> +create_area_user_writer(struct kmem_cache *qcache, u16 flags, u16 addr,
> +                               const void __user *buf, size_t count)

So there are many different tasks going on.

Are they just created to get something going in process context?

> +static void softint_ack(struct anybuss_host *cd)
> +static void process_softint(struct anybuss_host *cd)

This looks like MSI (message signalled interrupt) and makes me think
that you should probably involve the irqchip maintainers. Interrupts
shall be represented in the irqchip abstraction.

> +int anybuss_client_driver_register(struct anybuss_client_driver *drv)
> +{
> +       drv->driver.bus = &anybus_bus;
> +       return driver_register(&drv->driver);
> +}

There is nice use of the bus abstractions here.

> +       cd->reset = pdata->reset;

This callback thing to handle reset doesn't seem right.

The kernel has a reset for assert/deassert och just assert()
reset handling that you can find in
drivers/reset/*

Maybe that is what you should be using instead of
rolling your own reset handling?

> +       cd->reset(parent, true);

So this would just be something like
#include <linux/reset.h>

r = devm_reset_control_get_exclusive(dev, id);
ret = reset_control_assert(r);

> +       regmap_bulk_read(cd->regmap, REG_SERIAL_NO, val, 4);
> +       dev_info(dev, "Serial number: %02X%02X%02X%02X",
> +               val[0], val[1], val[2], val[3]);

This looks like device-unique data so please do this:

#include <linux/random.h>

add_device_randomness(val, 4);

I guess I can provide better review once you add some
information on this task state machine business and how
it is engineered, looking forward to the next iteration!

Yours,
Linus Walleij
