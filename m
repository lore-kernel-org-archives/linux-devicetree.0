From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC next v1 5/5] arm64: dts: meson: g12a: x96-max: fix the
 Ethernet PHY reset line
Date: Sun, 9 Jun 2019 23:17:30 +0200
Message-ID: <CACRpkdYzeiLB7Yuixv6NsnLJoa_FnGKRHHQm=t4gMH34NdFSYA@mail.gmail.com>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609180621.7607-6-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190609180621.7607-6-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Jose Abreu <joabreu@synopsys.com>, Kevin Hilman <khilman@baylibre.com>, Giuseppe CAVALLARO <peppe.cavallaro@st.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "David S. Miller" <davem@davemloft.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 9, 2019 at 8:06 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> The PHY reset line and interrupt line are swapped on the X96 Max
> compared to the Odroid-N2 schematics. This means:
> - GPIOZ_14 is the interrupt line (on the Odroid-N2 it's the reset line)
> - GPIOZ_15 is the reset line (on the Odroid-N2 it's the interrupt line)
>
> Also the GPIOZ_14 and GPIOZ_15 pins are special. The datasheet describes
> that they are "3.3V input tolerant open drain (OD) output pins". This
> means the GPIO controller can drive the output LOW to reset the PHY. To
> release the reset it can only switch the pin to input mode. The output
> cannot be driven HIGH for these pins.
> This requires configuring the reset line as GPIO_OPEN_SOURCE because
> otherwise the PHY will be stuck in "reset" state (because driving the
> pin HIGH seeems to result in the same signal as driving it LOW).

This far it seems all right.

> Switch to GPIOZ_15 for the reset GPIO with the correct flags and drop
> the "snps,reset-active-low" property as this is now encoded in the
> GPIO_OPEN_SOURCE flag.

Open source doesn't imply active low.

We have this in stmmac_mdio_reset():

                gpio_direction_output(data->reset_gpio,
                                      data->active_low ? 1 : 0);
                if (data->delays[0])
                        msleep(DIV_ROUND_UP(data->delays[0], 1000));

                gpio_set_value(data->reset_gpio, data->active_low ? 0 : 1);
                if (data->delays[1])
                        msleep(DIV_ROUND_UP(data->delays[1], 1000));

                gpio_set_value(data->reset_gpio, data->active_low ? 1 : 0);
                if (data->delays[2])
                        msleep(DIV_ROUND_UP(data->delays[2], 1000));

If "snps,reset-active-low" was set it results in the sequence 1, 0, 1
if it is not set it results in the sequence 0, 1, 0.

The high (reset) is asserted by switching the pin into high-z open drain
mode, which happens by switching the line into input mode in some
cases.

I think the real reason it works now is that reset is actually active high.

It makes a lot of sense, since if it resets the device when set as input
(open drain) it holds all devices on that line in reset, which is likely
what you want as most GPIOs come up as inputs (open drain).
A pull-up resistor will ascertain that the devices are in reset.

After power on you need to actively de-assert the reset (to low) for
it to go out of reset.

> Fixes: 51d116557b2044 ("arm64: dts: meson-g12a-x96-max: Add Gigabit Ethernet Support")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Other than the commit message:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
