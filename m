From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] pinctrl: generic: Add output-enable property
Date: Mon, 26 Jun 2017 13:40:50 -0500
Message-ID: <20170626184050.k4fibk5m42f47sug@rob-hp-laptop>
References: <1498125658-14554-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1498125658-14554-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: linus.walleij@linaro.org, andy.shevchenko@gmail.com, dongas86@gmail.com, geert+renesas@glider.be, Chris.Brandt@renesas.com, laurent.pinchart@ideasonboard.com, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 22, 2017 at 12:00:58PM +0200, Jacopo Mondi wrote:
> Add output-enable generic pin configuration property.
> This properties allows enabling/disabling pin's output capabilities
> without actually driving any value on the line.
> 
> ---
> v1->v2:
>  - Expand the property description as suggested by Laurent. I ended up
>    mentioning the in-famous output buffer :)
> 
> One (more) question to GPIO people on:
> +	PCONFDUMP(PIN_CONFIG_OUTPUT_ENABLE, "output enabled", NULL, false),
> 
> I copied this from INPUT_ENABLE where arguments 2 and 3 passed to PCONFDUMP are
> NULL and false even if the property has an argument, used to enable/disable
> the input mode. Is this intended? Should that be turned instead to
> -	PCONFDUMP(PIN_CONFIG_INPUT_ENABLE, "input enabled", NULL, false),
> +	PCONFDUMP(PIN_CONFIG_INPUT_ENABLE, "input enabled", "enabled", true),
> 
> Note that the same applies to most of the properties that have an
> "enable"/"disable" argument. Just to make sure this is done on purpose.
> 
> Thanks
>    j
>  .../devicetree/bindings/pinctrl/pinctrl-bindings.txt      |  2 ++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/pinconf-generic.c                         |  3 +++
>  include/linux/pinctrl/pinconf-generic.h                   | 15 +++++++++++----
>  3 files changed, 16 insertions(+), 4 deletions(-)
