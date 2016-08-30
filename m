From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 6/8] pinctrl: Add pinctrl-aspeed-g4 driver
Date: Tue, 30 Aug 2016 15:34:08 +0930
Message-ID: <CACPK8Xf7pra_v=hhkXe5+n49bd3GSf7Yt3Q=HFROhBV5=kwa3A@mail.gmail.com>
References: <20160819124414.24242-1-andrew@aj.id.au> <20160819124414.24242-7-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160819124414.24242-7-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 19, 2016 at 10:14 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> A subset of the pins and functions are exposed. The selection of
> functions and pins is driven by the development of OpenBMC[1] on the
> AST2400 SoC, particularly around booting the OpenPOWER Palmetto
> development machine.

Looks good to me. I've given them a run on a few different machines.
You've addressed all of issues I had from v1.

>
> [1] https://github.com/openbmc/docs
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

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
>  drivers/pinctrl/aspeed/Kconfig             |    8 +
>  drivers/pinctrl/aspeed/Makefile            |    1 +
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 1231 ++++++++++++++++++++++++++++
>  3 files changed, 1240 insertions(+)
>  create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
