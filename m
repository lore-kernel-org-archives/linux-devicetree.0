Return-Path: <robherring2@gmail.com>
Message-ID: <5b9f3f63.1c69fb81.2105.2fc6@mx.google.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/5] clk: lochnagar: Add support for the Cirrus Logic
 Lochnagar
References: <20180905104120.17252-1-ckeepax@opensource.cirrus.com>
 <20180905104120.17252-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180905104120.17252-2-ckeepax@opensource.cirrus.com>
Date: Sun, 16 Sep 2018 18:12:39 -0500
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lee.jones@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 05, 2018 at 11:41:17AM +0100, Charles Keepax wrote:
> From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> 
> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform.
> 
> The Lochnagar can take several input clocks from the host system,
> provides several of its own clock sources, and provides extensive
> routing options for those clocks to be supplied to the attached
> CODEC/Amp device.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/clk/Kconfig                 |   7 +
>  drivers/clk/Makefile                |   1 +
>  drivers/clk/clk-lochnagar.c         | 452 ++++++++++++++++++++++++++++++++++++
>  include/dt-bindings/clk/lochnagar.h |  36 +++

The binding headers should be part of the binding patch and that should 
come first in the series.

>  4 files changed, 496 insertions(+)
>  create mode 100644 drivers/clk/clk-lochnagar.c
>  create mode 100644 include/dt-bindings/clk/lochnagar.h
