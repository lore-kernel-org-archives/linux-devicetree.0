From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v3 1/6] misc: support the Arcx anybus bridge
Date: Tue, 6 Nov 2018 09:45:55 -0500
Message-ID: <CAGngYiXczK6dsfyDGxe1ym-vQQfH5XS0jeEkuWW_og23JmTAZg@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-2-TheSven73@googlemail.com> <20181105212049.GA320@bogus>
 <CAGngYiUZTm-r0KJ07tKsPmgKCUWcqAOx2S82iLPRjkcDiw0R3g@mail.gmail.com> <CAL_JsqLgz9Z3J0x+QFU6jHOoHn6A1KASc+HbVLnW1=ow0RHv6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLgz9Z3J0x+QFU6jHOoHn6A1KASc+HbVLnW1=ow0RHv6w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sven Van Asbroeck <svendev@arcx.com>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 6, 2018 at 8:58 AM Rob Herring <robh@kernel.org> wrote:

> It doesn't really sound like the host should be in DT. The bridge
> should register itself as an anybus provider and that should in turn
> enable the anybus host protocol.

Very good point. Just to make sure we're on the same page, could you point
me to a relevant example where something registers as a provider?

v1 of this patch did not have the host in DT. The host just required platform
data with a regmap and a reset (the interrupt was passed via resources):

struct anybuss_host_pdata {
    struct regmap *regmap;
    void (*reset)(struct device *dev, bool reset);
};

But there were problems with this approach.

The review feedback told me that my self-rolled reset callback should really
be a reset controller. I looked for ways to pass a handle to a reset controller
via platform data. This has recently been introduced via:

reset_controller_add_lookup()

This binds a client device to a reset controller, without using the devicetree,
so the device can grab its controller via (devm_)reset_control_get*. Great!
But... to make the binding, you have to specify the full device names of the
controllers and client devices. See this example from psc-da850.c:

static struct reset_control_lookup da850_psc0_reset_lookup_table[] = {
    RESET_LOOKUP("da850-psc0", 15, "davinci-rproc.0", NULL),
};

I very quickly found myself in ida_simple_get() hell, trying to second-guess
what the devices I was creating, would be called !

So instead I put the host in DT, then I could easily connect the reset
controller. This also greatly simplified the bridge driver, a lot of boilerplate
would simply disappear.

Suggestions are very welcome :)

Sven
