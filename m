From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC next v1 0/5] stmmac: honor the GPIO flags for the PHY reset GPIO
Date: Sun, 9 Jun 2019 23:52:12 +0200
Message-ID: <CACRpkdbOnxZJZ=Lvv0mbnrCg8kPWyeRsBbOa2cUiwjcPnR=4RA@mail.gmail.com>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com> <20190609204510.GB8247@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609204510.GB8247@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, netdev <netdev@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 9, 2019 at 10:45 PM Andrew Lunn <andrew@lunn.ch> wrote:

> Linus can probably create a stable branch with the GPIO changes, which
> David can pull into net-next, and then apply the stmmac changes on
> top.

Sure thing, just tell me what to queue and I'll create an immutable
branch for this that David can pull.

Yours,
Linus Walleij
