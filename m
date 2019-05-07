From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 6/6] pinctrl: meson: g12a: add DS bank value
Date: Tue, 7 May 2019 20:09:44 +0200
Message-ID: <CAFBinCB6beHBKLcmXa-gwiyUrAD1z4tD92RDs9Rnjp=hArKbHw@mail.gmail.com>
References: <20190507115726.23714-1-glaroque@baylibre.com> <20190507115726.23714-7-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507115726.23714-7-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 7, 2019 at 1:57 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>
> add drive-strength bank register and bit value for G12A SoC
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +       /* name  first  last  irq  pullen  pull  dir  out  in  ds */
> +       BANK_DS("Z",    GPIOZ_0,    GPIOZ_15, 12, 27,
> +               4,  0,  4,  0,  12,  0,  13, 0,  14, 0, 5, 0),
> +       BANK_DS("H",    GPIOH_0,    GPIOH_8, 28, 36,
> +               3,  0,  3,  0,  9,  0,  10,  0,  11,  0, 4, 0),
a note for myself (because I keep forgetting this)
"5, 0" stands for:
- the register PAD_DS_REG5A as seen in the public S922X datasheet from
Hardkernel on page 224
- starting at bit 0
