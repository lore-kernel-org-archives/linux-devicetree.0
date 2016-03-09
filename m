From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: mcp23s08: Add support for mcp23s18.
Date: Wed, 9 Mar 2016 09:50:27 +0700
Message-ID: <CACRpkdbW9quP1_jjcOEubcjdSrt9wmwgDt8p4OJ5ZYH=eUhVAQ@mail.gmail.com>
References: <1456813541-74321-1-git-send-email-preid@electromag.com.au>
	<1456813541-74321-2-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1456813541-74321-2-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 1, 2016 at 1:25 PM, Phil Reid <preid@electromag.com.au> wrote:

> This patch adds support for the mcp23s18 which is very similar to
> the mcp23s17. A couple of control bits are not the same.
> Notable IOCON_HAEN (s17 only) & IOCON_INTCC. Which can be ignored.
>
> Patch changes the following:
> - Add mcp23s18 types.
> - Always set mirror bit if the dts defines mcp23s18. regardless of type.
>   Mirror bit is ignored on 8 bit devices anyway.
> - In mcp23s08_probe use chip.ngpio instead of logic based on type
>   to determine number of gpio lins to increment by. This is set
>   appropiately by the call to mcp23s08_probe_one.
> - Add mcp23s18 to device tree documentation.
> - Remove statement that irqs don't work for spi. They do.
>   Tested with mcp23s18.
>
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Patch applied with Rob's ACK.

Yours,
Linus Walleij
