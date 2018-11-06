From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH anybus v3 1/6] misc: support the Arcx anybus bridge
Date: Tue, 6 Nov 2018 12:30:55 -0600
Message-ID: <CAL_Jsq+YeW+BtVh=L8PBjXYLj9sp91BcUQrJJrwnmChRnXoK_w@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-2-TheSven73@googlemail.com> <20181105212049.GA320@bogus>
 <CAGngYiUZTm-r0KJ07tKsPmgKCUWcqAOx2S82iLPRjkcDiw0R3g@mail.gmail.com>
 <CAL_JsqLgz9Z3J0x+QFU6jHOoHn6A1KASc+HbVLnW1=ow0RHv6w@mail.gmail.com> <CAGngYiXczK6dsfyDGxe1ym-vQQfH5XS0jeEkuWW_og23JmTAZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGngYiXczK6dsfyDGxe1ym-vQQfH5XS0jeEkuWW_og23JmTAZg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Sven Van Asbroeck <svendev@arcx.com>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Garry <john.garry@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 6, 2018 at 8:46 AM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> On Tue, Nov 6, 2018 at 8:58 AM Rob Herring <robh@kernel.org> wrote:
>
> > It doesn't really sound like the host should be in DT. The bridge
> > should register itself as an anybus provider and that should in turn
> > enable the anybus host protocol.
>
> Very good point. Just to make sure we're on the same page, could you point
> me to a relevant example where something registers as a provider?

Not sure exactly. Perhaps I2C SMBus functions that implement the
register access protocol on top of I2C bus.

> v1 of this patch did not have the host in DT. The host just required platform
> data with a regmap and a reset (the interrupt was passed via resources):
>
> struct anybuss_host_pdata {
>     struct regmap *regmap;
>     void (*reset)(struct device *dev, bool reset);
> };
>
> But there were problems with this approach.

A block diagram would help. Something that shows the host SoC, your
CPLD, reset, irq, etc.

> The review feedback told me that my self-rolled reset callback should really
> be a reset controller. I looked for ways to pass a handle to a reset controller
> via platform data. This has recently been introduced via:

Maybe an overkill for 1 reset.

>
> reset_controller_add_lookup()
>
> This binds a client device to a reset controller, without using the devicetree,
> so the device can grab its controller via (devm_)reset_control_get*. Great!
> But... to make the binding, you have to specify the full device names of the
> controllers and client devices. See this example from psc-da850.c:
>
> static struct reset_control_lookup da850_psc0_reset_lookup_table[] = {
>     RESET_LOOKUP("da850-psc0", 15, "davinci-rproc.0", NULL),
> };
>
> I very quickly found myself in ida_simple_get() hell, trying to second-guess
> what the devices I was creating, would be called !
>
> So instead I put the host in DT, then I could easily connect the reset
> controller. This also greatly simplified the bridge driver, a lot of boilerplate
> would simply disappear.

If the host is not a h/w component, but just a s/w protocol then it
doesn't belong in DT. Perhaps it could be a library which the bridge
driver can call into.

What are the resets connected to? The slots? Maybe you should model
the slots in DT.

Rob
