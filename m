From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] iio: accell: mma8452: add optional vcc regulator
 operation support
Date: Fri, 7 Dec 2018 08:23:24 -0200
Message-ID: <CAOMZO5AoJ4rxu31gQTLQcVwhuqJdhUOVRsTig0oE2a5vF2QESg@mail.gmail.com>
References: <1544077059-4471-1-git-send-email-Anson.Huang@nxp.com> <1544077059-4471-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544077059-4471-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yongcai Huang <anson.huang@nxp.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, harinath922@gmail.com, Leonard Crestez <leonard.crestez@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, martink@posteo.de, rtresidd@electromag.com.au, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Thu, Dec 6, 2018 at 4:25 AM Anson Huang <anson.huang@nxp.com> wrote:

> @@ -1533,6 +1535,14 @@ static int mma8452_probe(struct i2c_client *client,
>         data->client = client;
>         mutex_init(&data->lock);
>         data->chip_info = match->data;
> +       data->vcc_reg = devm_regulator_get_optional(&client->dev, "vcc");

MMA8452 datasheet shows two power supplies: VDD and VDDIO, so if you
are adding support for the regulators, IMHO it is better to represent
both supplies and with the same name they appear in the datasheet.
