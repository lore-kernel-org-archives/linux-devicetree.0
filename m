From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3 v2] clk: ux500: Add device tree bindings for ABx500
 clocks
Date: Mon, 23 Jan 2017 10:01:25 -0600
Message-ID: <20170123160125.ba4c54gin3vky6vq@rob-hp-laptop>
References: <20170120132539.3013-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170120132539.3013-1-linus.walleij@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 20, 2017 at 02:25:39PM +0100, Linus Walleij wrote:
> This adds device tree bindings for the ABx500 clocks on the
> ST-Ericsson platforms.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Indicate that the abx500 clocks need to be in a device tree
>   node under an ABx500 MFD device.
> - Rename the example node to clock-controller.
> ---
>  .../devicetree/bindings/clock/stericsson,abx500.txt  | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/stericsson,abx500.txt

Acked-by: Rob Herring <robh@kernel.org>
