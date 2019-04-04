Return-Path: <SRS0=Z6F2=SG=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <20190316202552.21525-1-marek.vasut@gmail.com>
In-Reply-To: <20190316202552.21525-1-marek.vasut@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2019 12:13:22 +0700
Message-ID: <CACRpkdZNfNOhR=H5=ECVfsc-mDhk1RkovV56p3bUp2-KY0oWWQ@mail.gmail.com>
Subject: Re: [PATCH V3] regulator: gpio: Reword the binding document
Content-Type: text/plain; charset="UTF-8"
To: Mark Vasut <marek.vasut@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, Harald Geyer <harald@ccbib.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sun, Mar 17, 2019 at 3:25 AM <marek.vasut@gmail.com> wrote:

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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for fixing this!

Yours,
Linus Walleij
