From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V12 2/2] pinctrl: max77620: add pincontrol driver for MAX77620/MAX20024
Date: Tue, 24 May 2016 13:53:36 +0200
Message-ID: <CACRpkdagHFegb0HHyshqOZyJLrdpZwMnQvBtsGeZhOB1p9Lgfg@mail.gmail.com>
References: <1463116755-30469-1-git-send-email-ldewangan@nvidia.com>
	<1463116755-30469-4-git-send-email-ldewangan@nvidia.com>
	<CACRpkdZNDEL855=Mruwm4U7eFz-QiuvXuDP83QPOupkpj2Jpkg@mail.gmail.com>
	<57443877.4010106@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57443877.4010106@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 24, 2016 at 1:18 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> In this driver, it is configuration via pinctrl. Here pincontrol and gpio
> driver share same registers.
> Now, as we have the method to configure the open drain bit from the GPIO
> interface, we really dont need to do this from pinctrl framework.

OK good that works too...

> For doing from GPIO framework, the client need to aware that gpio is open
> drain type.
>
> Can we make something that open drain of pins can be provided via some
> common interface like DT of controller based on platforms configuration  and
> client need not to worry about this? For client, it will be simple gpio
> calls.

We have GPIO_OPEN_DRAIN in
include/dt-bindings/gpio/gpio.h
that can be added on the consumer side of the GPIO line
in the DT, it should work (just like GPIO_ACTIVE_LOW for example).

For descriptor tables
include/linux/gpio/machine.h
provides the same mechanism with the flag GPIO_OPEN_DRAIN

Notice that in both cases it is the consumer that specifies that it
needs the line to be set up as open drain, not the controller,
as it is a resource, the consumer needs to request what it needs.

So this can be done already today. Unless there is some bug.

Yours,
Linus Walleij
