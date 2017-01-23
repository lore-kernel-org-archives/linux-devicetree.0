From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 06/22] gpio: add DT bindings for Cortina Gemini GPIO
Date: Mon, 23 Jan 2017 14:04:14 -0600
Message-ID: <20170123200414.vmwmcvutdy5goshs@rob-hp-laptop>
References: <20170122121830.10336-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170122121830.10336-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, openwrt-devel@openwrt.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 22, 2017 at 01:18:30PM +0100, Linus Walleij wrote:
> This adds fairly standard DT bindings for the Cortina Systems
> Gemini GPIO controller.
> 
> Cc: Janos Laube <janos.dev@gmail.com>
> Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>
> Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Note to self: just apply this to the GPIO tree when discussion is over.
> ---
>  .../bindings/gpio/cortina,gemini-gpio.txt          | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/cortina,gemini-gpio.txt

Acked-by: Rob Herring <robh@kernel.org>
