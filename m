From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 04/22] clocksource: add DT bindings for Cortina Gemini
Date: Mon, 23 Jan 2017 14:02:45 -0600
Message-ID: <20170123200245.4ophr2xm4vforxhn@rob-hp-laptop>
References: <20170122121707.10200-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170122121707.10200-1-linus.walleij@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, openwrt-devel@openwrt.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 22, 2017 at 01:17:07PM +0100, Linus Walleij wrote:
> This adds device tree bindings for the Cortina Systems Gemini
> timer block used in these SoCs.
> 
> Cc: Janos Laube <janos.dev@gmail.com>
> Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>
> Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> clocksource maintainers: please just apply this when you feel
> pleased with it. These portions are functionally orthogonal to
> the series, it is just in a series for context.
> ---
>  .../bindings/timer/cortina,gemini-timer.txt        | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt

Acked-by: Rob Herring <robh@kernel.org>
