Return-Path: <robherring2@gmail.com>
Date: Mon, 21 Jan 2019 08:33:41 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/6] clk: lochnagar: Add initial binding documentation
Message-ID: <20190121143341.GA10768@bogus>
References: <20190117145858.26659-1-ckeepax@opensource.cirrus.com>
 <20190117145858.26659-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190117145858.26659-2-ckeepax@opensource.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lee.jones@linaro.org, sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, 17 Jan 2019 14:58:54 +0000, Charles Keepax wrote:
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
> Changes since v5:
>  - Add missing 8m fixed clock
> 
> Thanks,
> Charles
> 
>  .../devicetree/bindings/clock/cirrus,lochnagar.txt | 93 ++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
