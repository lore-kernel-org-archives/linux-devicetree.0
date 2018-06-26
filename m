Return-Path: <robherring2@gmail.com>
Date: Tue, 26 Jun 2018 14:24:19 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: gpio: pca953x: Document interrupts, update
 example
Message-ID: <20180626202419.GA28075@rob-hp-laptop>
References: <20180619172441.20416-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180619172441.20416-1-geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, "H . Nikolaus Schaller" <hns@goldelico.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Jun 19, 2018 at 07:24:41PM +0200, Geert Uytterhoeven wrote:
> The device can optionally supply an interrupt, hence document that.
> 
> Add required GPIO properties to the example (extracted from a patch by
> Wolfram Sang).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Rob
