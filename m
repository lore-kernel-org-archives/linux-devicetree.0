From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 2/2] ARM: sunxi: Add the missing clocks to the pinctrl nodes
Date: Wed, 9 Nov 2016 09:30:13 +0800
Message-ID: <CAGb2v67psWrGV+s0BtoexcCGNkAEe=FwdBGCWTRioiT61nC4qw@mail.gmail.com>
References: <cover.61acad25a6fb233e39141b52acd217415281bd73.1478636546.git-series.maxime.ripard@free-electrons.com>
 <dbf6796cb2857e09072d57dc29152c153c2c8f61.1478636546.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <dbf6796cb2857e09072d57dc29152c153c2c8f61.1478636546.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 9, 2016 at 4:24 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The pin controllers also use the two oscillators for debouncing. Add them
> to the DTs.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>

You should also do the R_PIO block for the ones that have them too.
