From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 5/8] pinctrl: Add core support for Aspeed SoCs
Date: Wed, 7 Sep 2016 16:50:54 +0200
Message-ID: <CACRpkdb2ftH5B5VqKW9rPU=LMeWjrfo9jBTP5DKbNYeZAoMC8Q@mail.gmail.com>
References: <20160830075427.11493-1-andrew@aj.id.au> <20160830075427.11493-6-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160830075427.11493-6-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 30, 2016 at 9:54 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> The Aspeed SoCs typically provide more than 200 pins for GPIO and other
> functions. The signal enabled on a pin is determined on a priority
> basis, where a given pin can provide a number of different signal types.
>
> In addition to the priority levels, the Aspeed pin controllers describe
> the signal active on a pin by compound logical expressions involving
> multiple operators, registers and bits. Some difficulty arises as a
> pin's function bit masks for each priority level are frequently not the
> same (i.e. we cannot just flip a bit to change from a high to low
> priority signal), or even in the same register(s). Some configuration
> bits affect multiple pins, while in other cases the signals for a bus
> must each be enabled individually.
>
> Together, these features give rise to some complexity in the
> implementation. A more complete description of the complexities is
> provided in the associated header file.
>
> The patch doesn't implement pinctrl/pinmux/pinconf for any particular
> Aspeed SoC, rather it adds the framework for defining pinmux
> configurations.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Patch applied! It's not getting better than this through iteration, it is better
to get the system up and develop inside the mainline tree from now on.

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1027,6 +1027,7 @@ S:        Maintained
>  F:     arch/arm/mach-aspeed/
>  F:     arch/arm/boot/dts/aspeed-*
>  F:     drivers/*/*aspeed*
> +F:     drivers/pinctrl/aspeed/
>  F:     Documentation/devicetree/bindings/*/*aspeed*

I dropped this hunk of the patch, because:

(A) I didn't merge the glob patch and
(B) the glob covers this driver too, it is a tautology/truism

Yours,
Linus Walleij
