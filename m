From: thesven73@gmail.com
Subject: Re: [PATCH anybus v1 3/4] bus: support HMS Anybus-S bus.
Date: Tue, 30 Oct 2018 09:50:41 -0400
Message-ID: <20181030135041.5593-1-TheSven73@googlemail.com>
References: <CACRpkdYVN-s7shQmPkRjB9sxwi32TiKhmd_vKU+Jm--vGy2dSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYVN-s7shQmPkRjB9sxwi32TiKhmd_vKU+Jm--vGy2dSA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: svendev@arcx.com, lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, linus.walleij@linaro.org, maxime.ripard@bootlin.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

>> struct anybus_s_host *cd = data;
>> drivers/bus/anybus-s-host.c
>> include/linux/anybus-s-client.h
>
> Hm I think this looks pretty neat actually. Anyways, in the overall
> architecture explain the three Anybus:es and why things pertaining
> to Anybus-s are named as they are.

Ok, so should I rename anybuss -> anybus[_|-]s ?
Or maybe wait until a future patch iteration?

> OK but you also have an atomic_set() going on and the struct completion
> already contains a waitqueue and I start to worry about overuse of
> primitives here. How does ps aux look on your system when running this?

ps -aux only lists a single kernel thread associated with this driver,
no other theads, as it should:

$ ps
...
   78 root     [anybuss-host.0.]
...

> It's just that when you do things like this:
> 
>    complete(&cd->card_boot);
>    wake_up(&cd->wq);
>
> I start asking: OK so why is that waitqueue not woken up from
> wherever you are doing wait_for_completion()? I hope it is not
> because you are waiting for the completion in the very same
> waitqueue. That would be really messy.

The two primitives are there because the irq handler is dual purpose, and that
is because the interrupt is dual purpose:
- complete card boot while in the initialization stage
- tell the driver that something has happened while running

You may have a point about the atomic_set(). I'll think about why it's there,
and move it out if unnecessary. Or document why we need it there.

> Nah one irq handler is fine, but you can have an optional
> bottom half:
>
> request_threaded_irq(irq, fastpath, slowpath...):

I don't think any of these abstractions fit :(
Let's wait for the v2 patch with the architecture doc, and you will see why I
believe that's the case. We can then take the discussion from there.

> OK I honestly don't know what is the best way. But what about
> calling that "task" a "state" instead so we know what is going
> on (i.e. you are switching between different states in process
> context).

Let's wait for the architecture docs in the v2 patch.

> Silly question but why does userspace need to know about
> this software interrupt? Can't you just hide that?
> Userspace ABIs should be minimal.

I agree, but in this case the "s/w interrupt" indicates to the user that
someone on the network changed the contents of the card's internal memory.

A client application using this driver will typically sit in a loop, running
poll()/select() on this driver's devnode, waking up when someone modifies
the internal memory.

Example, imagine the card's internal memory is 10 bytes in size.
The internal memory is exposed over the network, and anyone may read
or change it.

|T.h.e. .Q.u.i.c.k]	original contents
				read("/dev/profinet0", 10) => "The Quick"
				poll("/dev/profinet0", PRI|ERR) blocks
|T.h.X. .Q.u.i.c.k]	someone on the network changed position 2, interrupt !
				poll("/dev/profinet0", PRI|ERR) releases
				read("/dev/profinet0", 10) => "ThX Quick"	

Perhaps there is a better / clearer abstraction to accomplish this?

>> Wait... are you talking about
>> reset_controller_add_lookup() / devm_reset_control_get_exclusive() ?
>> That's new to me, and only used in a single driver right now. Would that work?
>
> Yeah I think so.

Good ! I'll put that mechanism in v2, which should be ready soon.

Yours,
Sven
