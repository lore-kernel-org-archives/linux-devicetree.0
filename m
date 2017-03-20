From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/6] gpio: gemini: augment DT bindings
Date: Mon, 20 Mar 2017 12:16:53 -0500
Message-ID: <20170320171653.3o4sgrwswpcf4fgl@rob-hp-laptop>
References: <20170312232818.26304-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170312232818.26304-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, openwrt-devel@openwrt.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 13, 2017 at 12:28:13AM +0100, Linus Walleij wrote:
> The DT bindings assumed that this IP block was coming from
> Cortina Systems, which turns out not to be true. It is a
> standard IP block from Faraday Technology and also used in the
> Moxa moxart SoC.
> 
> We augment the bindings to cover all existing parts and rename
> it after the IP block. This involves deleting the old Moxa
> bindings that now are contained in this binding.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Jonas Jensen <jonas.jensen@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  ...{cortina,gemini-gpio.txt => faraday,ftgpio010.txt} |  9 ++++++---
>  .../devicetree/bindings/gpio/moxa,moxart-gpio.txt     | 19 -------------------
>  2 files changed, 6 insertions(+), 22 deletions(-)
>  rename Documentation/devicetree/bindings/gpio/{cortina,gemini-gpio.txt => faraday,ftgpio010.txt} (70%)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/moxa,moxart-gpio.txt

Acked-by: Rob Herring <robh@kernel.org>
