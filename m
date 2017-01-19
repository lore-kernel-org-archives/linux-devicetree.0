From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] gpio: Support gpio nexus dt bindings
Date: Thu, 19 Jan 2017 10:02:08 +0100
Message-ID: <CACRpkdbU4hjZvK0tOETJe34F1zJ9TBRB4wR9_C+CbHJCJa7s0A@mail.gmail.com>
References: <20170118005038.9216-1-stephen.boyd@linaro.org> <20170118005038.9216-4-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170118005038.9216-4-stephen.boyd@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 18, 2017 at 1:50 AM, Stephen Boyd <stephen.boyd@linaro.org> wrote:

> Platforms like 96boards have a standardized connector/expansion
> slot that exposes signals like GPIOs to expansion boards in an
> SoC agnostic way. We'd like the DT overlays for the expansion
> boards to be written once without knowledge of the SoC on the
> other side of the connector. This avoids the unscalable
> combinatorial explosion of a different DT overlay for each
> expansion board and SoC pair.
>
> Now that we have nexus support in the OF core let's change the
> function call here that parses the phandle lists of gpios to use
> the nexus variant. This allows us to remap phandles and their
> arguments through any number of nexus nodes and end up with the
> actual gpio provider being used.
>
> Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Provided that patches 1 & 2 go in reviewed and merged
by DT/device core people, they can merge this on top as well.

Yours,
Linus Walleij
