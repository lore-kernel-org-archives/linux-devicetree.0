Return-Path: <robherring2@gmail.com>
Date: Sun, 18 Feb 2018 20:41:05 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 19/21] regulator: fixed/gpio: Update device tree bindings
Message-ID: <20180219024105.twrrqyuxvienvtia@rob-hp-laptop>
References: <20180212131717.27193-1-linus.walleij@linaro.org>
 <20180212131717.27193-20-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180212131717.27193-20-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 12, 2018 at 02:17:15PM +0100, Linus Walleij wrote:
> Deprecate the open drain binding for fixed regulator and indicate
> that we prefer this to be passed in the GPIO phandle flags.
> 
> Clarify that the line inversion semantics for fixed and GPIO
> regulators completely overrides the active low flags in the
> phandle flags.
> 
> Unfortunately this can not be changed to prefer that we pass
> the flags in the phandle: the bindings have been specified and
> deployed such that the presence/absence of this flag and only
> that controls the line inversion semantics. The crucial semantic
> is that the absence of the flag means the core will assume
> the line is active low, which in GPIO terms is an exception,
> as GPIO lines are normally assumed to be active high.
> 
> This special device tree semantic cannot be changed without
> introducing a whole new compatible string for the fixed and
> GPIO regulators, so we just contain the situation.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/regulator/fixed-regulator.txt       | 13 +++++++++++--
>  .../devicetree/bindings/regulator/gpio-regulator.txt        |  4 ++++
>  2 files changed, 15 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
