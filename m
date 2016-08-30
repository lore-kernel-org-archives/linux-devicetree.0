From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 7/8] pinctrl: Add pinctrl-aspeed-g5 driver
Date: Tue, 30 Aug 2016 15:34:11 +0930
Message-ID: <CACPK8XdFTxyUSLphUPagH-u2A3Th8jcCGd6UML3noSehx11oTg@mail.gmail.com>
References: <20160819124414.24242-1-andrew@aj.id.au> <20160819124414.24242-8-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160819124414.24242-8-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

2016-08-19 22:14 GMT+09:30 Andrew Jeffery <andrew@aj.id.au>:
> A small subset of pins and functions are exposed. The selection of pins
> and functions is driven by the development of OpenBMC[1] on the
> AST2500 SoC, particularly around booting the IBM Witherspoon platform.
>
> [1] https://github.com/openbmc/docs
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

As with the g4 driver, this looks good and works fine on the
ast2500evb and witherspoon boards.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>
> Since v1:
>
> * Fix the RMII1 signal descriptor bit
> * Add a number of new mux function and pin definitions
> * Sort the pin, group and function arrays for sanity
> * Add SoC-specific compatible string
>
>  drivers/pinctrl/aspeed/Kconfig             |   8 +
>  drivers/pinctrl/aspeed/Makefile            |   1 +
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 808 +++++++++++++++++++++++++++++
>  3 files changed, 817 insertions(+)
>  create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
