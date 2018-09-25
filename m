From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/5] pinctrl: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Tue, 25 Sep 2018 15:20:48 -0500
Message-ID: <20180925202048.GA6227@bogus>
References: <20180905104120.17252-1-ckeepax@opensource.cirrus.com>
 <20180905104120.17252-4-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180905104120.17252-4-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lee.jones@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 05, 2018 at 11:41:19AM +0100, Charles Keepax wrote:
> From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> 
> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform.
> 
> Lochnagar provides many pins which can generally be used for an
> audio function such as an AIF or a PDM interface, but also as
> GPIOs.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/pinctrl/cirrus/Kconfig             |   10 +
>  drivers/pinctrl/cirrus/Makefile            |    2 +
>  drivers/pinctrl/cirrus/pinctrl-lochnagar.c | 1161 ++++++++++++++++++++++++++++
>  drivers/pinctrl/cirrus/pinctrl-lochnagar.h |  115 +++

>  include/dt-bindings/pinctrl/lochnagar.h    |  135 ++++

This belongs with the binding patch.

>  5 files changed, 1423 insertions(+)
>  create mode 100644 drivers/pinctrl/cirrus/pinctrl-lochnagar.c
>  create mode 100644 drivers/pinctrl/cirrus/pinctrl-lochnagar.h
>  create mode 100644 include/dt-bindings/pinctrl/lochnagar.h
