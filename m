Return-Path: <SRS0=rfZI=QO=opensource.cirrus.com=ckeepax@kernel.org>
Date: Thu, 7 Feb 2019 10:51:04 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v7 6/6] pinctrl: lochnagar: Add support for the Cirrus
 Logic Lochnagar
Message-ID: <20190207105104.GB6336@imbe.wolfsonmicro.main>
References: <20190130114128.21083-1-ckeepax@opensource.cirrus.com>
 <20190130114128.21083-6-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190130114128.21083-6-ckeepax@opensource.cirrus.com>
To: lee.jones@linaro.org, sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linus.walleij@linaro.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Jan 30, 2019 at 11:41:28AM +0000, Charles Keepax wrote:
> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform. This driver supports the board
> controller chip on the Lochnagar board.
> 
> Lochnagar provides many pins which can generally be used for an
> audio function such as an AIF or a PDM interface, but also as
> GPIOs.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> 
> No changes since v6.
> 
> Thanks,
> Charles
> 
>  drivers/pinctrl/cirrus/Kconfig             |   10 +
>  drivers/pinctrl/cirrus/Makefile            |    2 +
>  drivers/pinctrl/cirrus/pinctrl-lochnagar.c | 1236 ++++++++++++++++++++++++++++
>  3 files changed, 1248 insertions(+)
>  create mode 100644 drivers/pinctrl/cirrus/pinctrl-lochnagar.c
> 
> +LN2_PIN_MUX(FPGA_GPIO1,    "fgpa-gpio1");
> +LN2_PIN_MUX(FPGA_GPIO2,    "fgpa-gpio2");
> +LN2_PIN_MUX(FPGA_GPIO3,    "fgpa-gpio3");
> +LN2_PIN_MUX(FPGA_GPIO4,    "fgpa-gpio4");
> +LN2_PIN_MUX(FPGA_GPIO5,    "fgpa-gpio5");
> +LN2_PIN_MUX(FPGA_GPIO6,    "fgpa-gpio6");

Apologies for this late spot but there is typo here, these should
of course read fpga not fgpa. I will resend, going to start
sending the sub drivers separately now, since Lee has merged the
MFD cut down on the email traffic for everyone a little.

Thanks,
Charles
