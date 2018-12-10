From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V2] iio: magnetometer: mag3110: add optional vdd/vddio
 regulator operation support
Date: Mon, 10 Dec 2018 07:55:19 -0200
Message-ID: <CAOMZO5AJv=DtqSsKKQLX10GQC64NNoWkmYKSs+sM0Jjb8ugFVQ@mail.gmail.com>
References: <1544425869-8188-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544425869-8188-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yongcai Huang <anson.huang@nxp.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Mon, Dec 10, 2018 at 5:17 AM Anson Huang <anson.huang@nxp.com> wrote:

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

In the case of error you should disable the vdd_reg regulator.

> +               }
> +       } else if (data->vddio_reg == ERR_PTR(-EPROBE_DEFER)) {
> +               return -EPROBE_DEFER;
> +       }
> +
>         ret = i2c_smbus_read_byte_data(client, MAG3110_WHO_AM_I);
>         if (ret < 0)
>                 return ret;

and here you should disable vddio_reg.
