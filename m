From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 2/2] soc: nuvoton: add NPCM LPC BPC driver
Date: Thu, 13 Jun 2019 13:49:42 +0200
Message-ID: <CAK8P3a1YvBoehevVuRHMD71pkA1iDJLrfhvdhup2p+f-33HtzA@mail.gmail.com>
References: <20190610133245.306812-1-tmaimon77@gmail.com> <20190610133245.306812-3-tmaimon77@gmail.com>
 <CAK8P3a0s1fdt2yHVjOXffeKPKkwUyJ7DKCZHHMKjx+3j300ZAQ@mail.gmail.com> <CAP6Zq1jZEUzbB-ZidF2SD24k8iC_uBkXZ9WbtPpOYNCRjRTz3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAP6Zq1jZEUzbB-ZidF2SD24k8iC_uBkXZ9WbtPpOYNCRjRTz3g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Olof Johansson <olof@lixom.net>, gregkh <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Avi Fishman <avifishman70@gmail.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2019 at 11:18 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
>
> Probably the only vendors that will use the snoop will be Nuvoton and Aspeed.
> is it worth to create new snoop common user interface for it,
> if we will develop a new snoop user interface who will be the maintainer?

One or more of you will have to volunteer to maintain the new subsystem.

There are lots of ways this can be structured, and once you have
a maintainer (team), they can decide how to do it, but I'm available
to come up with ideas here.

Generally speaking, you don't need a ton of abstraction. The
drivers/watchdog subsystem could serve as a template there.
This has both models, the old way in which each HW specific
driver uses its own chardev, and the new model in which the
common code sits in a library module, and individual drivers
register to it.

I think the amount of code for two drivers is roughly the same
in either model, but the shared user interface implementation
makes it easier to ensure that the interfaces are in fact
compatible.

The other thing your own framework can do is to provide some
consistency between BMC specific drivers for different
functionality.

>> Maybe we can introduce a drivers/bmc/ (or even drivers/openbmc)
>>
>> that collects all those user interfaces with a thin abstraction layer
>> and one or two hardware specific back-ends?
>
> Sounds good, Maybe we can move the KCS BMC from driver/char/ipmi to the drivers/bmc/?

Good idea. Yes, please.

       Arnd
