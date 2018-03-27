From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/3] gpio: Add Spreadtrum EIC driver support
Date: Tue, 27 Mar 2018 15:49:41 +0200
Message-ID: <CACRpkdYa5=0_66LMF+10Dqmzgsgw-sj3=fdJhhuf=5c-7U-YOA@mail.gmail.com>
References: <787c9f115db06390549bfee366b7f70faf312286.1520218279.git.baolin.wang@linaro.org>
 <81071c32c104205af015f20ee63f4cb74eb274a2.1520218279.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <81071c32c104205af015f20ee63f4cb74eb274a2.1520218279.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 5, 2018 at 3:56 AM, Baolin Wang <baolin.wang@linaro.org> wrote:

> The Spreadtrum digital-chip EIC controller has 4 sub-modules: debounce EIC,
> latch EIC, async EIC and sync EIC, and each sub-module can has multiple
> banks and each bank contains 8 EICs.
>
> Each EIC can only be used as input mode, and has the capability to trigger
> interrupts when detecting input signals.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
> Changes since v2:
>  - No updates.

Patch applied.

Yours,
Linus Walleij
