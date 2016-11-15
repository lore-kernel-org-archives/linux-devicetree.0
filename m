From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/2] pinctrl: sunxi: Add support for interrupt debouncing
Date: Tue, 15 Nov 2016 10:23:30 +0100
Message-ID: <CACRpkdYdfEYfmF34mW2kFYFfZtjDQuHSvyUkcZztgUqG9j=jAQ@mail.gmail.com>
References: <cover.fa554eb1146d18ec75bf44863543fec4fa4fd3ae.1479156725.git-series.maxime.ripard@free-electrons.com>
 <d7c3760d37046a4b390b1a7b30bb94b8e1af31a7.1479156725.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <d7c3760d37046a4b390b1a7b30bb94b8e1af31a7.1479156725.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 14, 2016 at 9:53 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> The pin controller found in the Allwinner SoCs has support for interrupts
> debouncing.
>
> However, this is not done per-pin, preventing us from using the generic
> pinconf binding for that, but per irq bank, which, depending on the SoC,
> ranges from one to five.
>
> Introduce a device-wide property to deal with this using a microsecond
> resolution. We can re-use the per-pin input-debounce property for that, so
> let's do it!
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Acked-by: Rob Herring <robh@kernel.org>

Patch applied.

Yours,
Linus Walleij
