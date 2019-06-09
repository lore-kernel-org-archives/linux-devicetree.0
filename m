From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC next v1 3/5] net: stmmac: use GPIO descriptors in stmmac_mdio_reset
Date: Sun, 9 Jun 2019 23:50:21 +0200
Message-ID: <CACRpkdZCbFiUfW-qOM1Hxuj0e5TC8ViMuiz-VeVjSYP8A9sN3A@mail.gmail.com>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com> <20190609180621.7607-4-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190609180621.7607-4-martin.blumenstingl@googlemail.com>
Sender: netdev-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev <netdev@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 9, 2019 at 8:06 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> Switch stmmac_mdio_reset to use GPIO descriptors. GPIO core handles the
> "snps,reset-gpio" for GPIO descriptors so we don't need to take care of
> it inside the driver anymore.
>
> The advantage of this is that we now preserve the GPIO flags which are
> passed via devicetree. This is required on some newer Amlogic boards
> which use an Open Drain pin for the reset GPIO. This pin can only output
> a LOW signal or switch to input mode but it cannot output a HIGH signal.
> There are already devicetree bindings for these special cases and GPIO
> core already takes care of them but only if we use GPIO descriptors
> instead of GPIO numbers.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

This is in line with how I want the gpiolib to just swallow all quirks,
so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
