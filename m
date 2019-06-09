From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC next v1 2/5] gpio: of: parse stmmac PHY reset line specific
 active-low property
Date: Sun, 9 Jun 2019 23:21:00 +0200
Message-ID: <CAFBinCA1xp5+77DhYMFjX31D3DsaU7d9EqFkWbn+UFFx5LSqEw@mail.gmail.com>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609180621.7607-3-martin.blumenstingl@googlemail.com> <20190609203828.GA8247@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190609203828.GA8247@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, linux-kernel@vger.kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Sun, Jun 9, 2019 at 10:38 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Jun 09, 2019 at 08:06:18PM +0200, Martin Blumenstingl wrote:
> > The stmmac driver currently ignores the GPIO flags which are passed via
> > devicetree because it operates with legacy GPIO numbers instead of GPIO
> > descriptors.
>
> Hi Martin
>
> I don't think this is the reason. I think historically stmmac messed
> up and ignored the flags. There are a number of device tree blobs
> which have the incorrect flag value, but since it was always ignored,
> it did not matter. Then came along a board which really did need the
> flag, but it was too late, it could not be enabled because too many
> boards would break. So the hack was made, and snps,reset-active-low
> was added.
that seems appropriate. I don't know whether you can fetch the GPIO
flags when using legacy GPIO numbers.
so it may also be a mix of your explanation and mine.
in the end it's the same though: stmmac ignores the GPIO flags

> Since snps,reset-active-low is a hack, it should not be in the
> core. Please don't add it to gpiolib-of.c, keep it within stmmac
> driver.
I don't know how to keep backwards compatibility with old .dtb / .dts
when moving this into the stmmac driver again.

let's assume I put the "snps,reset-active-low" inversion logic back into stmmac.
then I need to ignore the flags because some .dts file use the flag
GPIO_ACTIVE_LOW *and* set "snps,reset-active-low" at the same time.
"snps,reset-active-low" would then invert GPIO_ACTIVE_LOW again, which
basically results in GPIO_ACTIVE_HIGH

however, I can't ignore the flags because then I'm losing the
information I need for the newer Amlogic SoCs like open drain / open
source.

so the logic that I need is:
- use GPIO flags from .dtb / .dts
- set GPIO_ACTIVE_LOW in addition to the flags if
"snps,reset-active-low" is set (this is different to "always invert
the output value")

my understanding that of_gpio_flags_quirks (which I'm touching with
this patch) is supposed to manage similar quirks to what we have in
stmmac (it also contains some regulator and MMC quirks too).
however, that's exactly the reason why I decided to mark this as RFC -
so I'm eager to hear Linus comments on this


Martin
