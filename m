From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH net-next v4 1/4] phylib: Add device reset delay support
Date: Thu, 7 Dec 2017 15:52:17 +0100
Message-ID: <CAMuHMdVgWif=1K-S2j1Y39B9yDNvV12sUm7nrFLOP-=ndSYtVA@mail.gmail.com>
References: <20171207144358.3351-1-dev@g0hl1n.net> <20171207144358.3351-2-dev@g0hl1n.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20171207144358.3351-2-dev@g0hl1n.net>
Sender: netdev-owner@vger.kernel.org
To: Richard Leitner <dev@g0hl1n.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fugang Duan <fugang.duan@nxp.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Frank Rowand <frowand.list@gmail.com>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert+renesas@glider.be>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Baruch Siach <baruch@tkos.co.il>, David Wu <david.wu@rock-chips.com>, lukma@denx.de, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Richard Leitner <richard.leitner@skidata.com>
List-Id: devicetree@vger.kernel.org

Hi Richard,

On Thu, Dec 7, 2017 at 3:43 PM, Richard Leitner <dev@g0hl1n.net> wrote:
> --- a/drivers/net/phy/mdio_device.c
> +++ b/drivers/net/phy/mdio_device.c
> @@ -24,6 +24,7 @@
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  #include <linux/unistd.h>
> +#include <linux/delay.h>
>
>  void mdio_device_free(struct mdio_device *mdiodev)
>  {
> @@ -118,8 +119,16 @@ EXPORT_SYMBOL(mdio_device_remove);
>
>  void mdio_device_reset(struct mdio_device *mdiodev, int value)
>  {
> -       if (mdiodev->reset)
> -               gpiod_set_value(mdiodev->reset, value);
> +       unsigned int d;
> +
> +       if (!mdiodev->reset)
> +               return;
> +
> +       gpiod_set_value(mdiodev->reset, value);
> +
> +       d = value ? mdiodev->reset_delay : mdiodev->reset_post_delay;
> +       if (d)
> +               usleep_range(d, d + min_t(unsigned int, d / 10, 100));

Oops, I meant "max_t", not "min_t", else the upper limit can be "d + 0",
which is not what we want.

Sorry, my fault.

Gr{oetje,eeting}s,

                        Geert
