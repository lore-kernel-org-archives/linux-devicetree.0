From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] ARM: sunxi: Add the missing clocks to the pinctrl nodes
Date: Thu, 20 Oct 2016 15:05:44 +0200
Message-ID: <CACRpkdbATHYQ8k9veqrkpP7RT7C=Cnq8HziZXYTrv_2Nm43UFA@mail.gmail.com>
References: <cover.ed6c19bdf01ae70096f3d96af4805f59ef16f94a.1476868462.git-series.maxime.ripard@free-electrons.com>
 <8e58bedc1d25f7fe94497d6ac123f3d4bbfd4c69.1476868462.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <8e58bedc1d25f7fe94497d6ac123f3d4bbfd4c69.1476868462.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 19, 2016 at 11:15 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> The pin controllers also use the two oscillators for debouncing. Add them
> to the DTs.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please merge this through the ARM SoC tree.

Yours,
Linus Walleij
