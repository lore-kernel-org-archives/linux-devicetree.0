Return-Path: <SRS0=kAgg=QO=linaro.org=lee.jones@kernel.org>
Date: Thu, 7 Feb 2019 07:49:36 +0000
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 1/6] mfd: lochnagar: Add initial binding documentation
Message-ID: <20190207074936.GB4672@dell>
References: <20190130114128.21083-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190130114128.21083-1-ckeepax@opensource.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, 30 Jan 2019, Charles Keepax wrote:

> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform. This driver supports the board
> controller chip on the Lochnagar board.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Changes since v6:
>  - Correct regulator bindings to match already merged regulator code
> 
> Thanks,
> Charles
> 
>  .../devicetree/bindings/mfd/cirrus,lochnagar.txt   |  68 +++++++++++
>  include/dt-bindings/clk/lochnagar.h                |  26 ++++
>  include/dt-bindings/pinctrl/lochnagar.h            | 132 +++++++++++++++++++++
>  3 files changed, 226 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/cirrus,lochnagar.txt
>  create mode 100644 include/dt-bindings/clk/lochnagar.h
>  create mode 100644 include/dt-bindings/pinctrl/lochnagar.h

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
