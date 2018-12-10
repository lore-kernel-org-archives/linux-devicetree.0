From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V2 2/2] iio: accell: mma8452: add optional vdd/vddio
 regulator operation support
Date: Mon, 10 Dec 2018 12:46:17 -0200
Message-ID: <CAOMZO5DT-cRYpCWShQqE7oX7v262s6K1G=R3PfBHs9RHXiiH6A@mail.gmail.com>
References: <1544426368-16415-1-git-send-email-Anson.Huang@nxp.com> <1544426368-16415-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544426368-16415-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yongcai Huang <anson.huang@nxp.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, rtresidd@electromag.com.au, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Leonard Crestez <leonard.crestez@nxp.com>, martink@posteo.de, linux-iio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 10, 2018 at 5:25 AM Anson Huang <anson.huang@nxp.com> wrote:

> @@ -1533,6 +1536,27 @@ static int mma8452_probe(struct i2c_client *client,
>         data->client = client;
>         mutex_init(&data->lock);
>         data->chip_info = match->data;
> +       data->vdd_reg = devm_regulator_get_optional(&client->dev, "vdd");
> +       if (!IS_ERR(data->vdd_reg)) {
> +               ret = regulator_enable(data->vdd_reg);
> +               if (ret) {
> +                       dev_err(&client->dev, "failed to enable VDD regulator\n");
> +                       return ret;
> +               }
> +       } else if (data->vdd_reg == ERR_PTR(-EPROBE_DEFER)) {
> +               return -EPROBE_DEFER;
> +       }
> +
> +       data->vddio_reg = devm_regulator_get_optional(&client->dev, "vddio");
> +       if (!IS_ERR(data->vddio_reg)) {
> +               ret = regulator_enable(data->vddio_reg);
> +               if (ret) {
> +                       dev_err(&client->dev, "failed to enable VDDIO regulator\n");
> +                       return ret;

As mentioned in your other patch: you should disable the previously
enabled regulator in the error path.
