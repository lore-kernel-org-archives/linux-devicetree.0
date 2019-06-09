From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC next v1 2/5] gpio: of: parse stmmac PHY reset line specific
 active-low property
Date: Sun, 9 Jun 2019 23:29:08 +0200
Message-ID: <CACRpkdZ4n+nCip-uoqbDvQeT0ZpJUfHVnp-D8qCSKfgJEapM7w@mail.gmail.com>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609180621.7607-3-martin.blumenstingl@googlemail.com>
 <20190609203828.GA8247@lunn.ch> <CAFBinCA1xp5+77DhYMFjX31D3DsaU7d9EqFkWbn+UFFx5LSqEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAFBinCA1xp5+77DhYMFjX31D3DsaU7d9EqFkWbn+UFFx5LSqEw@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev <netdev@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 9, 2019 at 11:21 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> my understanding that of_gpio_flags_quirks (which I'm touching with
> this patch) is supposed to manage similar quirks to what we have in
> stmmac (it also contains some regulator and MMC quirks too).
> however, that's exactly the reason why I decided to mark this as RFC -
> so I'm eager to hear Linus comments on this

The idea with the quirks in gpiolib-of.c is to make device drivers simpler,
and phase them over to ignoring quirks for mistakes done in the early
days of DT standardization. This feature of the gpiolib API is supposed
to make it "narrow and deep": make the generic case simple
and handle any hardware description languages (DT or ACPI or
board files) and quirks (mostly historical) under the hood. Especially
drivers should not need to worry about polarity inversion instead just
grab a GPIO descriptor and play away with it, asserting it as
1 and deasserting it as 0 whether that is the right polarity or not,
the gpiolib should keep track of polarity no matter how that is described,
even with historical weird bools like "snps,active-low" etc.

So I think you are probably doing the right thing here.
This patch is:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
