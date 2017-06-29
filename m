From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: dac: DS4424: add Maxim DS4422/DS4424 DAC driver support
Date: Thu, 29 Jun 2017 14:47:06 +0200
Message-ID: <CACRpkdbNz9HSBWjQrntMpJDOaaEYKaNgrm6=qzdhiH8rfv+F1g@mail.gmail.com>
References: <20170623230404.2283-1-Ismail.Kose@maximintegrated.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170623230404.2283-1-Ismail.Kose-zxKO94PEStzToO697jQleEEOCMrvLtNR@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ismail Kose <Ismail.Kose-zxKO94PEStzToO697jQleEEOCMrvLtNR@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean-Francois Dagenais <jeff.dagenais-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, gwenhael.goavec-merou-W7CSdorvuhNZroRs9YW3xA@public.gmane.org, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, maxime.roussinbelanger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ihkose-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jun 24, 2017 at 1:04 AM, Ismail Kose
<Ismail.Kose-zxKO94PEStzToO697jQleEEOCMrvLtNR@public.gmane.org> wrote:

> +Optional properties:
> +       - vcc-supply: Power supply us optional. If not defined, driver will ignore it.

*is* optional I guess.

No need to mention the driver.

> +#include <linux/regulator/consumer.h>
(...)
> +       struct regulator *vcc_reg;
> +       const char *vcc_reg_name;
> +       bool regulator_state;

Why do you do this funky stuff?

> +int ds4424_regulator_onoff(struct iio_dev *indio_dev, bool enable)
> +{
> +       struct ds4424_data *data = iio_priv(indio_dev);
> +       int ret = 0;
> +
> +       if (data->vcc_reg == NULL)
> +               return ret;

This should not happen.

You get dummy regulators or stubs if the regulator is not there
and that works just fine.

> +
> +       if (data->regulator_state == PWR_OFF && enable == PWR_ON) {
> +               ret = regulator_enable(data->vcc_reg);
> +               if (ret) {
> +                       pr_err("%s - enable vcc_reg failed, ret=%d\n",
> +                               __func__, ret);
> +                       goto done;
> +               }
> +       } else if (data->regulator_state == PWR_ON && enable == PWR_OFF) {
> +               ret = regulator_disable(data->vcc_reg);
> +               if (ret) {
> +                       pr_err("%s - disable vcc_reg failed, ret=%d\n",
> +                               __func__, ret);
> +                       goto done;
> +               }
> +       }
> +
> +       data->regulator_state = enable;
> +done:
> +       return ret;
> +}

The regulator already has a state and knows if it is on or
off. Why do you insist on having a "regulator state" reinventing
the wheel in the driver?

> +       ret = of_property_read_string(node, "vcc-supply", &data->vcc_reg_name);
> +       if (ret < 0) {
> +               pr_info("DAC vcc-supply is not available in dts\n");
> +               data->vcc_reg_name = NULL;
> +       }

Don't do this. Just try to get the regulator by name and do not try
to be clever about this, the regulator core will give you a dummy supply
if the regulator is not there.

> +       if (data->vcc_reg_name) {

Just skip this check.

> +               data->vcc_reg = devm_regulator_get(&client->dev,
> +                       data->vcc_reg_name);

Just

data->vcc_reg = devm_regulator_get(&client->dev, "vcc");


> +               if (IS_ERR(data->vcc_reg)) {
> +                       ret = PTR_ERR(data->vcc_reg);
> +                       dev_err(&client->dev,
> +                               "Failed to get vcc_reg regulator: %d\n", ret);
> +                       return ret;
> +               }

And keep this.

You will get a dummy or stub working just fine if the regulator is not there.

> +       ret = ds4424_regulator_onoff(indio_dev, PWR_ON);
> +       if (ret < 0) {
> +               pr_err("Unable to turn on the regulator. %s:%d, ret: %d\n",
> +                       __func__, __LINE__, ret);
> +               return ret;
> +       }

I don't think this helper is even needed. Just enable it here.

Disable it on the other paths.

Problem solved.

Yours,
Linus Walleij
