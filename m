Return-Path: <SRS0=L82L=RW=ccbib.org=harald@kernel.org>
From: Harald Geyer <harald@ccbib.org>
Subject: Re: [PATCH V3] regulator: gpio: Reword the binding document
In-reply-to: <20190316202552.21525-1-marek.vasut@gmail.com>
References: <20190316202552.21525-1-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1280.1553004784.1@stardust.g4.wien.funkfeuer.at>
Date: Tue, 19 Mar 2019 15:13:04 +0100
Message-Id: <E1h6FUH-0000Kg-28@stardust.g4.wien.funkfeuer.at>
To: marek.vasut@gmail.com
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

marek.vasut@gmail.com writes:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Reword the binding document to make it clear how the propeties work
> and which properties affect which other properties.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Harald Geyer <harald@ccbib.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-renesas-soc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> V2: - Make "gpios" a mandatory property
>     - Reword "gpio-states" property description
>     - Change "enable-gpio" to "enable-gpios" to match modern DT rules
> V3: - Use gpio-states description from Harald
> Note: The recent gpio-regulator rework caused breakage. While the
>       changes in the gpio-regulator code were according to the DT
>       binding document, they stopped working with older DTs. Make
>       the binding document clearer to prevent such breakage in the
>       future.

Thanks for taking care of this!

Reviewed-by: Harald Geyer <harald@ccbib.org>
