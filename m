From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/8] Bluetooth: hci_h5: Add support for reset GPIO
Date: Sat, 19 Jan 2019 01:13:55 +0800
Message-ID: <CAGb2v665Wsu5dhNi1=-bMmPYP-5nfTamtu0uXVYym+RxzNeN=A@mail.gmail.com>
References: <20190118170232.16142-1-anarsoul@gmail.com> <20190118170232.16142-3-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190118170232.16142-3-anarsoul@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, netdev <netdev@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-bluetooth@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jan 19, 2019 at 1:02 AM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> Some boards (e.g. Pine64 and Pinebook) wire a GPIO to reset pin of
> RTL8723BS

Pine64 / Pinebook don't have the enable pin. One could say that the
enable pin and the reset pin you add here are actually the same thing.

ChenYu

> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  drivers/bluetooth/hci_h5.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
> index 069d1c8fde73..7ead8c3d8657 100644
> --- a/drivers/bluetooth/hci_h5.c
> +++ b/drivers/bluetooth/hci_h5.c
> @@ -107,6 +107,7 @@ struct h5 {
>         const struct h5_vnd *vnd;
>         const char *id;
>
> +       struct gpio_desc *reset_gpio;
>         struct gpio_desc *enable_gpio;
>         struct gpio_desc *device_wake_gpio;
>  };
> @@ -833,6 +834,10 @@ static int h5_serdev_probe(struct serdev_device *serdev)
>         if (IS_ERR(h5->device_wake_gpio))
>                 return PTR_ERR(h5->device_wake_gpio);
>
> +       h5->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +       if (IS_ERR(h5->reset_gpio))
> +               return PTR_ERR(h5->reset_gpio);
> +
>         return hci_uart_register_device(&h5->serdev_hu, &h5p);
>  }
>
> @@ -921,6 +926,9 @@ static void h5_btrtl_open(struct h5 *h5)
>
>         /* The controller needs up to 500ms to wakeup */
>         gpiod_set_value_cansleep(h5->enable_gpio, 1);
> +       /* Take it out of reset */
> +       gpiod_set_value_cansleep(h5->reset_gpio, 0);
> +       msleep(100);
>         gpiod_set_value_cansleep(h5->device_wake_gpio, 1);
>         msleep(500);
>  }
> @@ -928,6 +936,7 @@ static void h5_btrtl_open(struct h5 *h5)
>  static void h5_btrtl_close(struct h5 *h5)
>  {
>         gpiod_set_value_cansleep(h5->device_wake_gpio, 0);
> +       gpiod_set_value_cansleep(h5->reset_gpio, 1);
>         gpiod_set_value_cansleep(h5->enable_gpio, 0);
>  }
>
> --
> 2.20.1
>
