From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Device probing proceeds even when the default pinctrl state is invalid
Date: Thu, 18 Feb 2016 21:07:57 +0100
Message-ID: <CACRpkdamPh3pLetWs_S6b_BFWKDgZwiyTaOTQCJsm3cC=ZzLAA@mail.gmail.com>
References: <CAGkQfmOHgOoFrVyKtB+vpmwqs5s2DnLay9zjaksFj5Rbn+4h0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGkQfmOHgOoFrVyKtB+vpmwqs5s2DnLay9zjaksFj5Rbn+4h0g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Romain Izard <romain.izard.pro@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Linux GPIO List <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 18, 2016 at 11:37 AM, Romain Izard
<romain.izard.pro@gmail.com> wrote:

> The current code for device probing tries to map the default pinctrl
> state (in pinctrl_bind_pins), but is returning 0 or -EDEFER. If there
> is an other error, it is not reported. This means that devices that do
> not have any specified pinctrl state can be probed, which is a correct
> behaviour that should be conserved, but it can also be an issue, as it
> will fail to report any other issue with the specified pinctrl state.
>
> Did I miss something that would explain why all other errors are ignored ?

Yeah we should probably respect a few errors and let some
pass. Please make a patch!

> This also leads to a larger problem, as currently the device tree for
> existing boards may specify invalid pinctrl configurations, but the
> boards look like they work correctly, as long as nothing else tries to
> use the same pins.

Well I guess if you look in the debugfs files it looks crazy does
it not? That is how I verify that the pins get bound right.
Especially in the file pinmux-pins

> Correcting the issue may require a new
> 'strict-mapping' property in the pinctrl node in the device tree,
> otherwise this correction would be an ABI regression.

Bah if the device tree is wrong it is wrong, we certainly do not
expect erroneous device trees that just "happen to work" to
keep working.

> Is this pattern really a good one ? We're moving away from describing
> hardware in here.

I don't understand.

> For an existing example, in the device tree for Atmel's
> SAMA5D2_Xplained board,

Where is this device tree, so I can look at it?

> the mapping for the Ethernet transceiver's IRQ
> line was missing it bias configuration, and thus the pins were not
> reserved for the Ethernet use. I've just send a patch to correct it,
> but breaking Ethernet on kernel upgrade for the boards using the
> previous revisions would be an issue.

Hm, ask the Atmel DT maintainers what to do about this...
Nicolas: how real is this ABI issue?

We have patches bigger issues than this one before though.

> In the current state of things, both devices are probed successfully
> as conflicting pin sets are not recognized as an issue, which means
> that my use case does not work.
>
> Is the direction I'm taking something correct ?

I think so. The device trees should be correct, errors should be
handled.

Yours,
Linus Walleij
