From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 02/12] pinctrl: Add core pinctrl support for Aspeed SoCs
Date: Fri, 22 Jul 2016 15:59:58 +0930
Message-ID: <CACPK8XeuPEuc9NgZjyRko86ksrBjtAOai4D=nbzvS7KUHJy=sQ@mail.gmail.com>
References: <1468994313-13538-1-git-send-email-andrew@aj.id.au> <1468994313-13538-3-git-send-email-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1468994313-13538-3-git-send-email-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 20, 2016 at 3:28 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> The Aspeed SoCs provide typically more than 200 pins for GPIO and other
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
> provided in the associated header file in an attempt to justify the
> approach.
>
> Note that the patch doesn't implement pinctrl/pinmux/pinconf for any
> particular SoC, just adds the framework for defining mux configurations
> for any available functions.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  MAINTAINERS                             |   1 +
>  arch/arm/mach-aspeed/Kconfig            |   1 +
>  drivers/pinctrl/Kconfig                 |   1 +
>  drivers/pinctrl/Makefile                |   1 +
>  drivers/pinctrl/aspeed/Kconfig          |   8 +
>  drivers/pinctrl/aspeed/Makefile         |   3 +
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 373 +++++++++++++++++++++
>  drivers/pinctrl/aspeed/pinctrl-aspeed.h | 562 ++++++++++++++++++++++++++++++++
>  8 files changed, 950 insertions(+)
>  create mode 100644 drivers/pinctrl/aspeed/Kconfig
>  create mode 100644 drivers/pinctrl/aspeed/Makefile
>  create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed.c
>  create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed.h
